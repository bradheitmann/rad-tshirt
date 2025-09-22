#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const { spawn } = require('child_process');

/**
 * Return the last n characters of a string (safe for undefined).
 * @param {string|undefined} str Input string
 * @param {number} [n=2000] Max characters to return
 * @returns {string} Tail segment
 */
function tail(str, n = 2000) {
  if (!str) return '';
  return str.length > n ? str.slice(-n) : str;
}

/**
 * RAD v3.0 TSHIRT Protocol Enforcer
 * Loads pre-commit gate configuration and executes checks in order.
 */
class ProtocolEnforcer {
  /**
   * @param {string} [configPath='./pre_commit_gates.json'] Relative path to gates config
   */
  constructor(configPath = './pre_commit_gates.json') {
    const resolved = path.resolve(__dirname, configPath);
    this.config = JSON.parse(fs.readFileSync(resolved, 'utf8'));
  }

  /**
   * Execute a shell command safely with timeout, capturing output and exit code.
   * @param {string} name - Logical check name.
   * @param {string} command - Shell command to run.
   * @param {Object} [opts] - Options.
   * @param {number} [opts.timeoutMs] - Timeout in milliseconds (default 120000).
   * @param {string} [opts.cwd] - Working directory.
   * @param {Object} [opts.env] - Environment variables to merge.
   * @returns {Promise<Object>} Resolves with {name, passed, exitCode, stdoutTail, stderrTail, durationMs}.
   */
  runCheck(name, command, opts = {}) {
    const timeoutMs = opts.timeoutMs ?? 120000;
    return new Promise((resolve) => {
      const start = Date.now();
      // Use login shell for portability; avoids splitting command on spaces/quotes.
      const child = spawn(process.env.SHELL || 'sh', ['-lc', command], {
        cwd: opts.cwd || process.cwd(),
        env: { ...process.env, ...opts.env },
        stdio: ['ignore', 'pipe', 'pipe']
      });

      let stdout = '';
      let stderr = '';
      const timer = setTimeout(() => {
        child.kill('SIGKILL');
      }, timeoutMs);

      child.stdout.on('data', (d) => (stdout += d.toString()));
      child.stderr.on('data', (d) => (stderr += d.toString()));

      child.on('close', (code) => {
        clearTimeout(timer);
        const passed = code === 0;
        resolve({
          name,
          passed,
          exitCode: code,
          stdoutTail: tail(stdout),
          stderrTail: tail(stderr),
          durationMs: Date.now() - start
        });
      });
    });
  }

  /**
   * Run all configured gates in declared order.
   * @returns {Promise<Object>} Result with shape {passed, blocker?, results}.
   */
  async runAll() {
    const order = this.config.execution_order || [];
    const results = [];

    for (const section of order) {
      if (section === 'quality_checks') {
        const qc = this.config.gates.quality_checks;
        if (!qc || qc.enabled === false) continue;
        const required = qc.required || {};
        for (const [key, def] of Object.entries(required)) {
          const r = await this.runCheck(key, def.command);
          results.push(r);
          if (!r.passed && def.blocking) {
            return { passed: false, blocker: key, results };
          }
        }
      }
      // Non-executable gates (cleanup_rules, commit_message) are advisory here
    }

    return { passed: true, results };
  }
}

if (require.main === module) {
  (async () => {
    const engine = new ProtocolEnforcer();
    const out = await engine.runAll();
    if (!out.passed) {
      process.stderr.write(`Pre-commit gates failed at: ${out.blocker}\n`);
      process.exit(1);
    }
    process.stdout.write('All pre-commit gates passed.\n');
  })();
}

module.exports = ProtocolEnforcer;

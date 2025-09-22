# RAD_v3.0_TSHIRT — Template Export Guide

This folder is a self-contained, portable template for RAD v3.0 (TSHIRT). Copy it into any repository to enable the same quality protocol: manifest validation, OMNIVORE gates (1–4), and an opt-in pre-commit enforcement engine.

## What’s inside
- enforcement/: Pre-commit gates engine (blocks on failing gates)
- tools/: Manifest validator
- docs/: Protocol docs
- pre_commit_gates.json: Gate config consumed by the engine

## Quick start (drop-in to another repo)
1) Copy the folder into the target repository:
   - Place `RAD_v3.0_TSHIRT/` at the repo root.

2) Ensure your repo has these npm scripts in package.json (adjust to your setup):
   - test, test:coverage, lint, omnivore:gate1..4
   - Example (abbreviated):
     "scripts": {
       "test": "jest",
       "test:coverage": "jest --coverage",
       "lint": "eslint --ext .js,.ts src/ tests/ bin/",
       "omnivore:gate1": "npm run test -- --testNamePattern='OMNIVORE Gate 1'",
       "omnivore:gate2": "npm run lint",
       "omnivore:gate3": "npm run test:coverage",
       "omnivore:gate4": "node scripts/determinism-check.js"
     }

3) (Optional) Commit hook installation
   - The engine is runnable directly; for pre-commit usage wire it into your git hooks or task runner.

## Validate the template
- Manifest:
  node RAD_v3.0_TSHIRT/tools/validate_manifest.js

- Enforcement engine (runs configured gates):
  node RAD_v3.0_TSHIRT/enforcement/enforcement_engine.js

Expected: "All pre-commit gates passed." when gates are green.

## OMNIVORE gates overview
- Gate 1: Tests (must pass)
- Gate 2: Lint (0 errors; warnings advisory)
- Gate 3: Coverage (global thresholds recommended ≥70%)
- Gate 4: Determinism (must pass)

## Sandbox option (Agent Chat Protocol)
When using the agent chat protocol, you can isolate runtime artifacts by setting an environment variable before running your tooling/tests:

- AGENT_SANDBOX_DIR=/absolute/path/for/protocol

This redirects protocol artifacts (protocol/agents.json, logs/, committees/, discussions/) into that directory.

## Notes
- This template does not require installing extra npm packages by itself; it orchestrates your repo’s existing test/lint/determinism scripts.
- Evidence and backups (if you choose to store them) should live under your repo’s docs/ area (e.g., docs/planning-session/test-results/...).

### TypeScript version advisory (ESLint parser)
If your workspace uses a newer TypeScript than the officially supported range for `@typescript-eslint` in this template, you may see a non-blocking warning (parser support range notice). This does not affect the JS-based gates here. You can:
- Ignore the advisory, or
- Pin TypeScript within the supported range for your ESLint setup, or
- Update `@typescript-eslint/*` to versions compatible with your TS version.

# RAD v3.0 TSHIRT

A portable, minimal-yet-enforced edition of RAD protocols that combines behavioral kernels with BMAD-grade code-level gates.

## What’s inside
- Manifest + validator to keep docs and reality in sync
- Wrapper protocols: HANDOFF, CLEANUP, COMMUNICATION
- Portable pre-commit installer + master hook
- Enforcement engine with real command execution and correct thresholds
- Command menu and a graduated protocol refresher
- Minimal kernel (~1k–1.5k tokens) and a 500‑token handoff capsule
- CI-friendly, soft-gates-first design; attribution included

## Quick start
0) Optional: generate a localized quick start (auto-fills your exact path)
   - sh RAD_v3.0_TSHIRT/scripts/bootstrap-readme.sh
   - Open RAD_v3.0_TSHIRT/README_LOCAL.md for copy/paste
1) Install pre-commit gates (dry run first):
   - sh RAD_v3.0_TSHIRT/scripts/install-precommit.sh --dry-run
   - sh RAD_v3.0_TSHIRT/scripts/install-precommit.sh
2) Validate manifest:
   - node RAD_v3.0_TSHIRT/tools/validate_manifest.js
3) Review commands and refresher:
   - RAD_v3.0_TSHIRT/docs/COMMAND_MENU.md
   - RAD_v3.0_TSHIRT/docs/REFRESH_PROTOCOL.md

---

## Non‑Coder Quick Start — Keep Agent Files in a Safe Folder

This makes all “agent conversation” files go into `RAD_Sandbox/protocol/` so they’re easy to find and delete later. You can skip this if you like; by default, files go into `./protocol/`.

1) What’s a “Terminal” and where do I paste?

- Terminal is the app where you paste commands.
- On macOS: press Command+Space, type "Terminal", press Enter. A black/white window opens.
- In that window, first change into your project folder. Example: type `cd` then drag your project folder into the window and press Enter.
- The steps below work no matter what your project is named.

2) Turn ON the sandbox for this Terminal (copy/paste one):

```bash
# Preferred: use the RAD helper script
source RAD_v3.0_TSHIRT/scripts/sandbox-on.sh
# or one‑liner for a single command (relative path)
AGENT_SANDBOX_DIR="./RAD_Sandbox" echo "Sandbox is set"
```

3) Try a tiny agent flow (optional; works without any special tools)

```bash
# Minimal demo: create two example agent logs so you can see the folder working
mkdir -p RAD_Sandbox/protocol/logs
echo "# Project Manager Activity Log
**Agent:** pm-001
" > RAD_Sandbox/protocol/logs/pm-001.md
echo "# Developer One Activity Log
**Agent:** dev-001
" > RAD_Sandbox/protocol/logs/dev-001.md

# See where files went
ls -la RAD_Sandbox/protocol/logs
```

4) Turn OFF the sandbox (optional):

```bash
source RAD_v3.0_TSHIRT/scripts/sandbox-off.sh
```

Notes
- You don’t have to set the sandbox. If you skip it, compatible tools will write to a local `./protocol/` folder.
- The sandbox path accepts either `RAD_Sandbox` or `RAD_Sandbox/protocol`; the system handles both.
- To verify where files are going without any tool installed:
   - Run: `source RAD_v3.0_TSHIRT/scripts/sandbox-on.sh` (it prints the target folder)
   - Then run the minimal demo above; you’ll see files appear under `RAD_Sandbox/protocol/`

## Notes
- Pre-commit gates map to existing npm scripts (npm test, npm run lint, npm run test:coverage).
- CI should run lint, coverage, manifest validation, and an enforcement dry-run.
- PM may edit docs (.md) but not code (src/**, bin/**)—enforced when target path is provided.

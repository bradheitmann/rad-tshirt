# RAD v3.0 TSHIRT — Localized Quick Start

This file was generated for: aniASCIIme
Project root: /Users/bradleyheitmann/Projects/aniASCIIme

Use these copy/paste commands exactly as shown.

## Step 1 — Open Terminal in your project
- macOS: Command+Space → type "Terminal" → Enter
- Then paste the next commands.

## Step 2 — Turn ON the sandbox (isolates runtime files)

```bash
source RAD_v3.0_TSHIRT/scripts/sandbox-on.sh
# or one-liner
AGENT_SANDBOX_DIR="/Users/bradleyheitmann/Projects/aniASCIIme/RAD_Sandbox" echo "Sandbox is set for aniASCIIme"
```

## Step 3 — Minimal demo (no extra tools required)

```bash
mkdir -p RAD_Sandbox/protocol/logs
printf "# Project Manager Activity Log\n**Agent:** pm-001\n" > RAD_Sandbox/protocol/logs/pm-001.md
printf "# Developer One Activity Log\n**Agent:** dev-001\n" > RAD_Sandbox/protocol/logs/dev-001.md
ls -la RAD_Sandbox/protocol/logs
```

## Step 4 — Turn OFF or Reset (optional)

```bash
source RAD_v3.0_TSHIRT/scripts/sandbox-off.sh
source scripts/reset-sandbox.sh
```

Notes
- This file is safe to commit or ignore; it reflects your local absolute path.
- The main template (README.md) remains portable and brand-agnostic.

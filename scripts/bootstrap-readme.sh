#!/usr/bin/env bash
# Generate a localized README_LOCAL.md with resolved absolute paths and project name
set -euo pipefail
cd "$(dirname "$0")/.."

# TSHIRT_DIR is the template folder; PROJECT_ROOT is its parent repository folder
TSHIRT_DIR="$(pwd)"
PROJECT_ROOT="$(dirname "$TSHIRT_DIR")"
PROJECT_NAME="$(basename "$PROJECT_ROOT")"
OUTPUT_FILE="${TSHIRT_DIR}/README_LOCAL.md"

cat > "$OUTPUT_FILE" <<EOF
# RAD v3.0 TSHIRT — Localized Quick Start

This file was generated for: ${PROJECT_NAME}
Project root: ${PROJECT_ROOT}

Use these copy/paste commands exactly as shown.

## Step 1 — Open Terminal in your project
- macOS: Command+Space → type "Terminal" → Enter
- Then paste the next commands.

## Step 2 — Turn ON the sandbox (isolates runtime files)

\`\`\`bash
source RAD_v3.0_TSHIRT/scripts/sandbox-on.sh
# or one-liner
AGENT_SANDBOX_DIR="${PROJECT_ROOT}/RAD_Sandbox" echo "Sandbox is set for ${PROJECT_NAME}"
\`\`\`

## Step 3 — Minimal demo (no extra tools required)

\`\`\`bash
mkdir -p RAD_Sandbox/protocol/logs
printf "# Project Manager Activity Log\n**Agent:** pm-001\n" > RAD_Sandbox/protocol/logs/pm-001.md
printf "# Developer One Activity Log\n**Agent:** dev-001\n" > RAD_Sandbox/protocol/logs/dev-001.md
ls -la RAD_Sandbox/protocol/logs
\`\`\`

## Step 4 — Turn OFF or Reset (optional)

\`\`\`bash
source RAD_v3.0_TSHIRT/scripts/sandbox-off.sh
source scripts/reset-sandbox.sh
\`\`\`

Notes
- This file is safe to commit or ignore; it reflects your local absolute path.
- The main template (README.md) remains portable and brand-agnostic.
EOF

echo "Generated: $OUTPUT_FILE"

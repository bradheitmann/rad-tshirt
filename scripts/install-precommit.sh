#!/usr/bin/env sh
set -e

DRY_RUN=0
if [ "$1" = "--dry-run" ]; then DRY_RUN=1; fi

# Derive project root from git if available; otherwise from script location
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DERIVED_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
GIT_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || true)"

if [ -n "$GIT_ROOT" ] && [ -d "$GIT_ROOT/.git" ]; then
  ROOT_DIR="$GIT_ROOT"
else
  ROOT_DIR="$DERIVED_ROOT"
fi

HOOK_PATH="$ROOT_DIR/.git/hooks/pre-commit"
MASTER_HOOK="$ROOT_DIR/RAD_v3.0_TSHIRT/enforcement/master_hook"

if [ ! -f "$MASTER_HOOK" ]; then
  echo "RAD: master_hook not found at $MASTER_HOOK" >&2
  # For dry-run, continue to show intent even if master_hook missing
  if [ $DRY_RUN -eq 1 ]; then
    echo "[DRY-RUN] Would install pre-commit hook to $HOOK_PATH (master_hook missing in current workspace)"
    exit 0
  fi
  exit 1
fi

if [ $DRY_RUN -eq 1 ]; then
  if [ ! -d "$ROOT_DIR/.git" ]; then
    echo "[DRY-RUN] Not a git repository at $ROOT_DIR; would install to $HOOK_PATH if .git existed"
  else
    echo "[DRY-RUN] Would install pre-commit hook to $HOOK_PATH"
  fi
  exit 0
fi

if [ ! -d "$ROOT_DIR/.git" ]; then
  echo "RAD: Not inside a git repository at $ROOT_DIR. Aborting." >&2
  exit 1
fi

# Install by copying for portability
cp "$MASTER_HOOK" "$HOOK_PATH"
chmod +x "$HOOK_PATH"

echo "RAD: pre-commit hook installed at $HOOK_PATH"

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
# Prefer master_hook at the project root path, but fall back to script-relative locations
MASTER_HOOK="$ROOT_DIR/RAD_TSHIRT_v4.0/enforcement/master_hook"

# If the master hook isn't at the expected root-relative path, try script-relative fallbacks
if [ ! -f "$MASTER_HOOK" ]; then
  # Candidates: script-relative enforcement folder (if script shipped inside RAD_TSHIRT_v4.0/scripts)
  CAND1="$SCRIPT_DIR/../enforcement/master_hook"
  CAND2="$SCRIPT_DIR/../RAD_TSHIRT_v4.0/enforcement/master_hook"
  if [ -f "$CAND1" ]; then
    MASTER_HOOK="$CAND1"
  elif [ -f "$CAND2" ]; then
    MASTER_HOOK="$CAND2"
  else
    echo "RAD: master_hook not found at $MASTER_HOOK or fallback locations" >&2
    if [ $DRY_RUN -eq 1 ]; then
      echo "[DRY-RUN] Would install pre-commit hook to $HOOK_PATH (master_hook missing in current workspace and fallbacks)"
      exit 0
    fi
    exit 1
  fi
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

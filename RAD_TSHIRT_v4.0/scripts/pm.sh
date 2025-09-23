#!/usr/bin/env sh
# Simple package-manager detector/runner for non-coders
# Usage: pm.sh <command> [args...]

detect_pm() {
  if command -v pnpm >/dev/null 2>&1; then
    echo pnpm
  elif command -v yarn >/dev/null 2>&1; then
    echo yarn
  elif command -v npm >/dev/null 2>&1; then
    echo npm
  else
    echo ""
  fi
}

PM="$(detect_pm)"
if [ -z "$PM" ]; then
  echo "No package manager found. Please install npm, yarn, or pnpm." >&2
  exit 2
fi

cmd="$1"
shift || true

case "$cmd" in
  install)
    if [ "$PM" = "pnpm" ]; then
      pnpm install "$@"
    elif [ "$PM" = "yarn" ]; then
      yarn install "$@"
    else
      npm install "$@"
    fi
    ;;
  test)
    if [ "$PM" = "yarn" ]; then
      yarn test "$@"
    else
      $PM test "$@"
    fi
    ;;
  lint)
    if [ "$PM" = "yarn" ]; then
      yarn lint "$@"
    else
      $PM run lint "$@"
    fi
    ;;
  coverage)
    if [ "$PM" = "yarn" ]; then
      yarn run test:coverage "$@"
    else
      $PM run test:coverage "$@"
    fi
    ;;
  run)
    script="$1"
    shift || true
    if [ -z "$script" ]; then
      echo "Usage: $0 run <script-name> [args...]" >&2
      exit 2
    fi
    if [ "$PM" = "yarn" ]; then
      yarn run "$script" "$@"
    else
      $PM run "$script" "$@"
    fi
    ;;
  *)
    if [ "$PM" = "yarn" ]; then
      yarn run "$cmd" "$@"
    else
      $PM run "$cmd" "$@"
    fi
    ;;
esac

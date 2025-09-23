#!/usr/bin/env bash
set -euo pipefail
# Portable README/guide to PDF via pandoc if available; otherwise graceful fallback with instructions.

ROOT_DIR=$(cd "$(dirname "$0")"/.. && pwd)
OUT_DIR="$ROOT_DIR/pdfs"
mkdir -p "$OUT_DIR"

have() { command -v "$1" >/dev/null 2>&1; }

render() {
  local input="$1"; local output="$2"
  if have pandoc; then
    # Prefer wkhtmltopdf engine if available (no LaTeX needed), else fall back to default which may need pdflatex
    if have wkhtmltopdf; then
      pandoc -s "$input" -t html5 -o "$output" --pdf-engine=wkhtmltopdf \
        -V linkcolor:blue -V colorlinks=true -V margin-left=20mm -V margin-right=20mm
    else
      pandoc -V geometry:margin=1in -V linkcolor:blue -V colorlinks=true \
        -f markdown -t pdf -o "$output" "$input" || {
          echo "pdflatex not found. Options:" >&2
          echo "  1) brew install basictex && sudo tlmgr update --self && sudo tlmgr install scheme-small" >&2
          echo "  2) brew install wkhtmltopdf (then re-run; script prefers wkhtmltopdf when present)" >&2
          exit 2
        }
    fi
    echo "Wrote $output"
  else
    echo "Pandoc not found. Install with: brew install pandoc" >&2
    exit 2
  fi
}

render "$ROOT_DIR/README.md" "$OUT_DIR/README.pdf"
render "$ROOT_DIR/MULTI_AGENT_ORCHESTRATION_MASTERY_for_RAD_TSHIRT_v4.0.md" "$OUT_DIR/MULTI_AGENT_ORCHESTRATION_MASTERY_for_RAD_TSHIRT_v4.0.pdf"

echo "PDFs are in: $OUT_DIR"

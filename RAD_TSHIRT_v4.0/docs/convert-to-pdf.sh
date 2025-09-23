#!/usr/bin/env bash
set -euo pipefail

HTML="$PWD/product-card.html"
OUT="$PWD/RAD_TSHIRT_v4.0-product-card.pdf"

if command -v wkhtmltopdf >/dev/null 2>&1; then
  wkhtmltopdf "$HTML" "$OUT"
  echo "PDF generated: $OUT"
  exit 0
fi

if command -v chrome >/dev/null 2>&1 || command -v google-chrome >/dev/null 2>&1 || command -v /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome >/dev/null 2>&1; then
  CHROME=$(command -v chrome || command -v google-chrome || echo "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome")
  "$CHROME" --headless --disable-gpu --print-to-pdf="$OUT" "$HTML"
  echo "PDF generated via Chrome: $OUT"
  exit 0
fi

echo "Install wkhtmltopdf or have Chrome available to generate PDF"
exit 1

#!/bin/zsh
# Gera o PDF de apresentação a partir do HTML com o Chrome sem interface.
# O Chrome 152 grava o PDF e às vezes não encerra; o script espera o arquivo
# ficar estável e encerra o processo que ele mesmo abriu.
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
HTML="$DIR/auxcode-apresentacao.html"
OUT="${1:-$DIR/../auxcode-apresentacao.pdf}"
URL="file://${HTML// /%20}"
PROFILE="$(mktemp -d)"
rm -f "$OUT"
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless=new --disable-gpu --no-first-run --no-default-browser-check \
  --user-data-dir="$PROFILE" --run-all-compositor-stages-before-draw \
  --no-pdf-header-footer --print-to-pdf="$OUT" "$URL" >/dev/null 2>&1 &
PID=$!
for i in {1..60}; do
  if [ -s "$OUT" ]; then
    A=$(stat -f %z "$OUT"); sleep 2; B=$(stat -f %z "$OUT")
    [ "$A" = "$B" ] && break
  fi
  sleep 1
done
kill "$PID" 2>/dev/null || true
wait "$PID" 2>/dev/null || true
rm -rf "$PROFILE"
[ -s "$OUT" ] || { echo "falhou: PDF não gerado" >&2; exit 1; }
echo "PDF: $OUT ($(stat -f %z "$OUT") bytes)"

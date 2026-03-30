#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
MAIN_TYP="$ROOT_DIR/main.typ"
MAIN_PDF="$ROOT_DIR/main.pdf"
TMP_MAIN_PDF="$ROOT_DIR/.main_compiled.pdf"
FINAL_PDF="$ROOT_DIR/.main_merged.pdf"

APPEND_PDFS=(
  "$ROOT_DIR/fig/20260323_hayashi_jamstecMTG.pdf"
  "$ROOT_DIR/fig/20260323_hirukawa_jamstecMTG.pdf"
)

if ! command -v typst >/dev/null 2>&1; then
  echo "Error: typst command was not found." >&2
  exit 1
fi

echo "[1/3] Compiling Typst -> $TMP_MAIN_PDF"
typst compile "$MAIN_TYP" "$TMP_MAIN_PDF"

for pdf in "${APPEND_PDFS[@]}"; do
  if [[ ! -f "$pdf" ]]; then
    echo "Error: append PDF not found: $pdf" >&2
    rm -f "$TMP_MAIN_PDF" "$FINAL_PDF"
    exit 1
  fi
done

echo "[2/3] Merging PDFs"
if command -v pdfunite >/dev/null 2>&1; then
  pdfunite "$TMP_MAIN_PDF" "${APPEND_PDFS[@]}" "$FINAL_PDF"
elif command -v qpdf >/dev/null 2>&1; then
  qpdf --empty --pages "$TMP_MAIN_PDF" "${APPEND_PDFS[@]}" -- "$FINAL_PDF"
else
  echo "Error: no PDF merge tool found (pdfunite or qpdf)." >&2
  echo "Install one of them, for example: brew install poppler" >&2
  rm -f "$TMP_MAIN_PDF" "$FINAL_PDF"
  exit 1
fi

echo "[3/3] Writing output -> $MAIN_PDF"
mv "$FINAL_PDF" "$MAIN_PDF"
rm -f "$TMP_MAIN_PDF"

echo "Done: created $MAIN_PDF (Typst output + 2 appended PDFs)."

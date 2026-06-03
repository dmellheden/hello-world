#!/usr/bin/env bash
#
# render-invoice.sh — turn a Peppol BIS Billing 3.0 UBL document (Invoice or
# CreditNote) into a standalone HTML file using the official OpenPEPPOL
# stylesheet.
#
# Usage:
#   ./render-invoice.sh <input.xml> [output.html] [language]
#
# Examples:
#   ./render-invoice.sh examples/sales-order-example.xml
#       -> writes examples/sales-order-example.html
#
#   ./render-invoice.sh invoice.xml out.html no
#       -> writes out.html, rendered with Norwegian labels
#
# Requires: Java (for Saxon-HE, bundled in ./lib/saxon-he.jar).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SAXON_JAR="$SCRIPT_DIR/lib/saxon-he.jar"
STYLESHEET="$SCRIPT_DIR/stylesheet-ubl.xslt"

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <input.xml> [output.html] [language]" >&2
  exit 1
fi

INPUT="$1"
OUTPUT="${2:-${INPUT%.*}.html}"
LANGUAGE="${3:-en}"

if [[ ! -f "$INPUT" ]]; then
  echo "Error: input file not found: $INPUT" >&2
  exit 1
fi

java -jar "$SAXON_JAR" \
  -s:"$INPUT" \
  -xsl:"$STYLESHEET" \
  -o:"$OUTPUT" \
  "language=$LANGUAGE"

echo "Wrote $OUTPUT"

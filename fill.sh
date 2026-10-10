#!/bin/sh
# Fills in the contact email and the responsible person's legal name.
# Usage: ./fill.sh "email@example.com" "Full Legal Name"
set -e
[ -n "$1" ] && [ -n "$2" ] || { echo "usage: $0 EMAIL NAME"; exit 1; }
for f in soporte/index.html support/index.html privacidad/index.html privacy/index.html; do
    sed -i '' -e "s|{{EMAIL}}|$1|g" -e "s|{{RESPONSABLE}}|$2|g" "$f"
done
grep -rl "{{" --include="*.html" . && echo "placeholders left" || echo "filled"

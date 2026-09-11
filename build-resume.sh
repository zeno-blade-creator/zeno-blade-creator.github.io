#!/bin/bash
# Build the resume PDFs from resume.html (the single source for the one-page resume).
#
#   resume.pdf        public copy, no phone number — safe to commit and attach to releases
#   resume-phone.pdf  submission copy with the phone number — gitignored, never pushed
#
# The phone number lives in resume.local.env (gitignored); copy resume.local.env.example.
# Uses the locally installed Google Chrome in headless mode. No other dependencies.
set -euo pipefail
cd "$(dirname "$0")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

pages() {
  osascript -l JavaScript -e 'ObjC.import("PDFKit"); function run(a){return $.PDFDocument.alloc.initWithURL($.NSURL.fileURLWithPath(a[0])).pageCount}' "$1" 2>/dev/null
}

render() { # render <html file> <pdf out>
  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
    --print-to-pdf="$PWD/$2" "file://$PWD/$1" 2>/dev/null
  local n; n=$(pages "$PWD/$2")
  echo "Built $2 ($n page(s))"
  [ "$n" = "1" ] || { echo "WARNING: $2 is not one page" >&2; return 1; }
}

render resume.html resume.pdf

if [ -f resume.local.env ]; then
  # shellcheck disable=SC1091
  source resume.local.env
  sed "s|<!--PHONE-->|<span>${PHONE}</span>|" resume.html > .resume-phone.html
  trap 'rm -f .resume-phone.html' EXIT
  render .resume-phone.html resume-phone.pdf
else
  echo "No resume.local.env — skipped the copy with a phone number."
fi

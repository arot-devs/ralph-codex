#!/bin/bash
set -euo pipefail

RALPH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
UNIBOX_DIR="/home/ubuntu/dev/unibox"

if [ ! -d "$UNIBOX_DIR" ]; then
  echo "Unibox repo not found at $UNIBOX_DIR" >&2
  exit 1
fi

# Stage Ralph runner + prompt into the Unibox repo
cp "$RALPH_DIR/ralph.sh" "$UNIBOX_DIR/ralph.sh"
cp "$RALPH_DIR/prompt.md" "$UNIBOX_DIR/prompt.md"
chmod +x "$UNIBOX_DIR/ralph.sh"

# Stage the toy PRD for this example
cp "$RALPH_DIR/example/prd.json" "$UNIBOX_DIR/prd.json"

echo "Ralph staged in $UNIBOX_DIR"
echo "Next: cd $UNIBOX_DIR && ./ralph.sh [max_iterations]"

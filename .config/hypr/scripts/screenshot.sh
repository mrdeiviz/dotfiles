#!/usr/bin/env bash

set -euo pipefail

MODE="${1:-region}"
SCREENSHOT_DIR="${XDG_PICTURES_DIR:-$HOME/Pictures}/Screenshots"
STAMP="$(date +%Y-%m-%d_%H-%M-%S)"
FILE="$SCREENSHOT_DIR/screenshot_${STAMP}.png"

mkdir -p "$SCREENSHOT_DIR"

case "$MODE" in
  region)
    grim -g "$(slurp -d)" - | tee "$FILE" | wl-copy
    ;;
  screen)
    grim - | tee "$FILE" | wl-copy
    ;;
  *)
    echo "Usage: $0 [region|screen]" >&2
    exit 1
    ;;
esac

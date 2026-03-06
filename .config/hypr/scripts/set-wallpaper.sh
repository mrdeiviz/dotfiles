#!/usr/bin/env bash

set -euo pipefail

WALLPAPER="${1:-$HOME/Pictures/wallpapers/minimal-dark-desktop.jpg}"

if [ ! -f "$WALLPAPER" ]; then
  echo "Wallpaper not found: $WALLPAPER" >&2
  exit 1
fi

if ! pgrep -x swww-daemon >/dev/null 2>&1; then
  swww-daemon &
  sleep 1
fi

swww img "$WALLPAPER" \
  --transition-type fade \
  --transition-duration 1.2 \
  --transition-fps 60

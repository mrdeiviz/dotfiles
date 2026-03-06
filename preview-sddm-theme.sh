#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_URL="https://github.com/Keyitdev/sddm-astronaut-theme.git"
PREVIEW_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/sddm-astronaut-theme-preview"
CUSTOM_CONF="$DOTFILES_DIR/sddm/astronaut/deivid-minimal.conf"
CUSTOM_BG="$DOTFILES_DIR/sddm/astronaut/Backgrounds/minimal-dark-login.jpg"
CUSTOM_NAME="deivid-minimal"

if [ ! -f "$CUSTOM_CONF" ]; then
  echo "Missing custom config: $CUSTOM_CONF" >&2
  exit 1
fi

if [ ! -f "$CUSTOM_BG" ]; then
  echo "Missing custom background: $CUSTOM_BG" >&2
  exit 1
fi

if ! command -v sddm-greeter-qt6 >/dev/null 2>&1; then
  echo "sddm-greeter-qt6 is required for preview." >&2
  exit 1
fi

if [ ! -d "$PREVIEW_DIR/.git" ]; then
  git clone --depth 1 "$REPO_URL" "$PREVIEW_DIR"
else
  git -C "$PREVIEW_DIR" pull --ff-only
fi

install -Dm644 "$CUSTOM_CONF" "$PREVIEW_DIR/Themes/${CUSTOM_NAME}.conf"
install -Dm644 "$CUSTOM_BG" "$PREVIEW_DIR/Backgrounds/minimal-dark-login.jpg"
sed -i "s|^ConfigFile=.*|ConfigFile=Themes/${CUSTOM_NAME}.conf|" "$PREVIEW_DIR/metadata.desktop"

sddm-greeter-qt6 --test-mode --theme "$PREVIEW_DIR"

#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_REPO="https://github.com/Keyitdev/sddm-astronaut-theme.git"
THEME_NAME="sddm-astronaut-theme"
THEME_DST="/usr/share/sddm/themes/$THEME_NAME"
CUSTOM_CONF="$DOTFILES_DIR/sddm/astronaut/deivid-minimal.conf"
CUSTOM_NAME="deivid-minimal"
SDDM_CONF_DIR="/etc/sddm.conf.d"
SDDM_THEME_CONF="$SDDM_CONF_DIR/10-theme.conf"
VIRTUALKBD_CONF="$SDDM_CONF_DIR/virtualkbd.conf"
STAMP="$(date +%Y%m%d-%H%M%S)"

if [ ! -f "$CUSTOM_CONF" ]; then
  echo "Missing custom astronaut config: $CUSTOM_CONF" >&2
  exit 1
fi

if ! command -v git >/dev/null 2>&1; then
  echo "git is required." >&2
  exit 1
fi

if [ -d "$THEME_DST" ]; then
  sudo mv "$THEME_DST" "${THEME_DST}.bak-${STAMP}"
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

git clone --depth 1 "$THEME_REPO" "$TMP_DIR/$THEME_NAME"

sudo mkdir -p "$THEME_DST"
sudo cp -r "$TMP_DIR/$THEME_NAME"/. "$THEME_DST"/
sudo cp -r "$THEME_DST/Fonts"/. /usr/share/fonts/
sudo install -Dm644 "$CUSTOM_CONF" "$THEME_DST/Themes/${CUSTOM_NAME}.conf"
sudo sed -i "s|^ConfigFile=.*|ConfigFile=Themes/${CUSTOM_NAME}.conf|" "$THEME_DST/metadata.desktop"

sudo mkdir -p "$SDDM_CONF_DIR"
if [ -f "$SDDM_THEME_CONF" ]; then
  sudo cp "$SDDM_THEME_CONF" "${SDDM_THEME_CONF}.bak-${STAMP}"
fi

sudo tee "$SDDM_THEME_CONF" >/dev/null <<'EOF'
[Theme]
Current=sddm-astronaut-theme
CursorTheme=Bibata-Modern-Ice
Font=JetBrainsMono Nerd Font 11
EOF

sudo tee "$VIRTUALKBD_CONF" >/dev/null <<'EOF'
[General]
InputMethod=qtvirtualkeyboard
EOF

echo "Installed SDDM theme '$THEME_NAME' with preset '${CUSTOM_NAME}'"
echo "Config written to: $SDDM_THEME_CONF"
echo "Preview first with: ./preview-sddm-theme.sh"
echo "Restart SDDM or reboot to apply it."

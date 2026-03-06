#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_NAME="maya"
THEME_SRC="$DOTFILES_DIR/sddm/$THEME_NAME/theme.conf.user"
THEME_DST="/usr/share/sddm/themes/$THEME_NAME/theme.conf.user"
SDDM_CONF_DIR="/etc/sddm.conf.d"
SDDM_THEME_CONF="$SDDM_CONF_DIR/10-theme.conf"

if [ ! -f "$THEME_SRC" ]; then
  echo "Missing SDDM theme override: $THEME_SRC" >&2
  exit 1
fi

sudo install -Dm644 "$THEME_SRC" "$THEME_DST"

sudo mkdir -p "$SDDM_CONF_DIR"
sudo tee "$SDDM_THEME_CONF" >/dev/null <<'EOF'
[Theme]
Current=maya
CursorTheme=Bibata-Modern-Ice
Font=JetBrainsMono Nerd Font 11
EOF

echo "Installed SDDM theme override for '$THEME_NAME'"
echo "Config written to: $SDDM_THEME_CONF"
echo "Reboot or restart SDDM to apply it."

#!/usr/bin/env bash

set -euo pipefail

sudo mkdir -p /etc/sddm.conf.d
sudo tee /etc/sddm.conf.d/10-theme.conf >/dev/null <<'EOF'
[Theme]
Current=maya
CursorTheme=Bibata-Modern-Ice
Font=JetBrainsMono Nerd Font 11
EOF

sudo tee /etc/sddm.conf >/dev/null <<'EOF'
[Theme]
Current=maya
CursorTheme=Bibata-Modern-Ice
Font=JetBrainsMono Nerd Font 11
EOF

echo "SDDM restored to maya."
echo "Restart SDDM or reboot to apply it."

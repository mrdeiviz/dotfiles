#!/usr/bin/env bash

set -euo pipefail

CHROMIUM_DIR="$HOME/.config/chromium"
LOCAL_STATE="$CHROMIUM_DIR/Local State"
PREFERENCES="$CHROMIUM_DIR/Default/Preferences"

if pgrep -x chromium >/dev/null 2>&1; then
  echo "Close Chromium before applying the theme." >&2
  exit 1
fi

if [ ! -f "$LOCAL_STATE" ] || [ ! -f "$PREFERENCES" ]; then
  echo "Chromium profile files not found." >&2
  exit 1
fi

python - <<'PY'
import json
from pathlib import Path

chromium_dir = Path.home() / ".config" / "chromium"
local_state_path = chromium_dir / "Local State"
preferences_path = chromium_dir / "Default" / "Preferences"

theme_value = int("FF7AA2F7", 16)
if theme_value >= 2**31:
    theme_value -= 2**32

for path in (local_state_path, preferences_path):
    data = json.loads(path.read_text())

    browser = data.setdefault("browser", {})
    browser["theme"] = {
        "color_scheme2": 2,
        "color_variant2": 1,
        "user_color2": theme_value,
    }

    if path == local_state_path:
        profile = data.setdefault("profile", {}).setdefault("info_cache", {}).setdefault("Default", {})
        profile["profile_color_seed"] = theme_value

    path.write_text(json.dumps(data, separators=(",", ":")))

print("Chromium theme updated to #7aa2f7")
PY

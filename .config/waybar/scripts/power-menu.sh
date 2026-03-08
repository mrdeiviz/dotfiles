#!/usr/bin/env bash

set -euo pipefail

launcher_theme="$HOME/.config/rofi/config.rasi"

choice="$(
  printf '%s\n' 'Apagar' 'Reiniciar' 'Salir' 'Cancelar' |
    rofi -dmenu \
      -config "$launcher_theme" \
      -p "Power" \
      -mesg "Selecciona una accion"
)"

case "${choice:-}" in
  Apagar)
    systemctl poweroff
    ;;
  Reiniciar)
    systemctl reboot
    ;;
  Salir)
    hyprctl dispatch exit
    ;;
  *)
    exit 0
    ;;
esac

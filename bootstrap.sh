#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

link_config() {
  local name="$1"
  local source="$DOTFILES_DIR/.config/$name"
  local target="$CONFIG_DIR/$name"

  if [ ! -e "$source" ]; then
    echo "Missing source: $source" >&2
    exit 1
  fi

  if [ -L "$target" ]; then
    local current
    current="$(readlink "$target")"
    if [ "$current" = "$source" ]; then
      echo "OK: $target"
      return
    fi

    echo "Symlink already exists and points elsewhere: $target -> $current" >&2
    exit 1
  fi

  if [ -e "$target" ]; then
    echo "Target already exists and is not a symlink: $target" >&2
    exit 1
  fi

  ln -s "$source" "$target"
  echo "Linked: $target -> $source"
}

mkdir -p "$CONFIG_DIR"

link_config "nvim"
link_config "tmux"

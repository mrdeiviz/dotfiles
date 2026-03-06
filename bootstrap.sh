#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
TMUX_PLUGIN_DIR="$HOME/.tmux/plugins/tpm"

link_path() {
  local source="$1"
  local target="$2"

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

link_config() {
  local name="$1"
  link_path "$DOTFILES_DIR/.config/$name" "$CONFIG_DIR/$name"
}

link_home_file() {
  local name="$1"
  link_path "$DOTFILES_DIR/$name" "$HOME/$name"
}

mkdir -p "$CONFIG_DIR"

link_home_file ".bashrc"
link_home_file ".bash_profile"
link_home_file ".zshrc"
link_home_file ".npmrc"

link_config "nvim"
link_config "tmux"
link_config "kitty"
link_config "waybar"
link_config "hypr"

if [ ! -d "$TMUX_PLUGIN_DIR" ]; then
  echo "TPM not found at $TMUX_PLUGIN_DIR"
  echo "Install it with:"
  echo "  git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_DIR"
fi

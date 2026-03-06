#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMUX_PLUGIN_DIR="$HOME/.tmux/plugins/tpm"

install_tpm() {
  if [ -d "$TMUX_PLUGIN_DIR" ]; then
    echo "TPM already installed"
    return
  fi

  git clone https://github.com/tmux-plugins/tpm "$TMUX_PLUGIN_DIR"
}

setup_tmux() {
  if [ ! -x "$TMUX_PLUGIN_DIR/bin/install_plugins" ]; then
    echo "TPM install script not found"
    return
  fi

  if [ -n "${TMUX:-}" ]; then
    tmux source-file "$DOTFILES_DIR/.config/tmux/tmux.conf"
    "$TMUX_PLUGIN_DIR/bin/install_plugins"
    return
  fi

  echo "Open tmux and run:"
  echo "  tmux source-file ~/.config/tmux/tmux.conf"
  echo "  ~/.tmux/plugins/tpm/bin/install_plugins"
}

setup_nvim() {
  nvim --headless "+Lazy! sync" "+MasonToolsInstallSync" "+TSUpdateSync" +qa
}

install_tpm
setup_tmux
setup_nvim

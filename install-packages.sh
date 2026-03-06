#!/usr/bin/env bash

set -euo pipefail

sudo pacman -S --needed \
  base-devel \
  git \
  tmux \
  neovim \
  kitty \
  waybar \
  hyprland \
  hyprpaper \
  wl-clipboard \
  xdg-desktop-portal-hyprland \
  chromium \
  ripgrep \
  fd \
  fzf \
  unzip \
  luarocks \
  go \
  npm \
  stylua \
  shellcheck \
  shfmt \
  lazygit

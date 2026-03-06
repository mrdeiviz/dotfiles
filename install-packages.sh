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
  swww \
  wl-clipboard \
  xdg-desktop-portal-hyprland \
  chromium \
  sddm \
  qt6-svg \
  qt6-virtualkeyboard \
  qt6-multimedia \
  rofi \
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

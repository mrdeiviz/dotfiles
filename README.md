# dotfiles

Este repositorio contiene mi configuracion de:

- Neovim
- tmux
- kitty
- waybar
- hypr
- bash
- zsh
- npm

## Instalacion

Clona el repo en `~/dotfiles` y ejecuta:

```bash
./install-packages.sh
./bootstrap.sh
./post-install.sh
```

El script crea enlaces simbolicos en `~/.config` para:

- `nvim`
- `tmux`
- `kitty`
- `waybar`
- `hypr`

Y tambien enlaza estos archivos en `$HOME`:

- `.bashrc`
- `.bash_profile`
- `.zshrc`
- `.npmrc`

## Paquetes base

En Arch Linux puedes instalar lo necesario para este setup con:

```bash
./install-packages.sh
```

Paquetes principales:

- Shell y utilidades: `git`, `ripgrep`, `fd`, `fzf`, `unzip`
- Editor: `neovim`, `npm`, `luarocks`, `go`, `stylua`, `shellcheck`, `shfmt`
- Terminal: `tmux`, `kitty`, `lazygit`
- Escritorio: `hyprland`, `hyprpaper`, `waybar`, `wl-clipboard`, `xdg-desktop-portal-hyprland`

## Post instalacion

Despues de enlazar los dotfiles puedes ejecutar:

```bash
./post-install.sh
```

El script:

- instala `tpm` si falta
- deja tmux listo para instalar plugins
- sincroniza plugins de Neovim
- ejecuta Mason y Treesitter en modo headless

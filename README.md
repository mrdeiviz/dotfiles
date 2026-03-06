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
./bootstrap.sh
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

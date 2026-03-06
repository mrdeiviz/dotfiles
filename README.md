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

## Login Screen

Para SDDM uso `sddm-astronaut-theme` con un preset propio encima. Hazlo en dos pasos:

```bash
./preview-sddm-theme.sh
./install-sddm-theme.sh
```

El script:

- clona `sddm-astronaut-theme`
- instala un preset custom `deivid-minimal.conf`
- fija `sddm-astronaut-theme` como tema actual de SDDM
- configura fuente y cursor del greeter

Dependencias recomendadas para SDDM:

- `sddm`
- `qt6-svg`
- `qt6-virtualkeyboard`
- `qt6-multimedia`

`preview-sddm-theme.sh` no toca tu configuracion del sistema; solo abre `sddm-greeter-qt6 --test-mode` con el preset custom.

Si alguna vez el login grafico falla, vuelve rapido a un tema seguro con:

```bash
./restore-sddm-safe.sh
```

## Wallpapers

Mantengo dos variantes del mismo fondo:

- escritorio: `/home/deivid/Pictures/wallpapers/minimal-dark-unsplash.jpg`
- login: `/home/deivid/Pictures/wallpapers/minimal-dark-login.jpg`

La del login es una version mas oscura para que el formulario de SDDM tenga mejor contraste.

En SDDM esa imagen se copia dentro del propio theme durante la instalacion para que el usuario `sddm` pueda leerla.

En escritorio uso `swww`, no `hyprpaper`.

Hyprland arranca:

- `swww-daemon`
- `~/.config/hypr/scripts/set-wallpaper.sh`

## Chromium

No versiono el perfil completo de Chromium, pero si dejo un script para aplicar el color del tema:

```bash
./apply-chromium-theme.sh
```

El script:

- exige que Chromium este cerrado
- aplica el azul principal `#7aa2f7`
- actualiza el color del perfil local

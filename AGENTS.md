# AGENTS.md

Personal Linux dotfiles for a Sway (Wayland) desktop. Not a software project — no build, test, or lint.

## Repo structure

Each top-level directory mirrors `~/.config/<app>` (or `~/.fonts`, `~/.themes`). The layout:

```
<app>/
  .config/<app>/   ← actual config file(s)
```

When copying files, use `stow` or manually copy from inside the `.config/` subtree, not the top-level dir.

## Stack

- **Compositor:** Sway (Wayland) — `sway/.config/sway/config`
- **Bar:** Waybar — `waybar/.config/waybar/`
- **Terminal:** Alacritty — `alacritty/.config/alacritty/`
- **Launcher:** Rofi (combi mode) — `rofi/.config/rofi/config.rasi`
- **Notifications:** Dunst — `dunst/.config/dunst/dunstrc`
- **Editor:** Neovim — `nvim/.config/nvim/init.lua`
- **Night light:** Gammastep (Finnish coords: 61.06°N, 28.19°E) — `gammastep/.config/gammastep/config.ini`
- **System info:** Fastfetch — `fastfetch/.config/fastfetch/config.jsonc`

## Conventions

- **Theme:** Kanagawa dark across everything. Alacritty imports `vague.toml` from its own config dir.
- **Font:** Lilex Nerd Font (proportional + mono variants in `fonts/.fonts/`).
- **Keyboard:** Finnish layout (`xkb_layout "fi"` in sway config).
- **Leader key:** Space (set in neovim init.lua).
- **Waybar** is launched via `bar swaybar_command waybar` in sway config — not as an exec.

## Gotchas

- Sway config includes `/etc/sway/config.d/*` at the end — system-level overrides may apply.
- Wallpaper path in sway config is `~/dotfiles/wallpapers/flower_wallpaper.png` — this repo must live at `~/dotfiles`.
- Neovim plugin lockfile is at `nvim/.config/nvim/nvim-pack-lock.json` — pin versions when adding plugins.

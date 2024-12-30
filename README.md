# 💥 Wezterm Status Bar

A simple and minimalist status bar for Wezterm that displays tabs and extra
information when the terminal is in full screen.

![](https://github.com/Townk/statusbar.wezterm/blob/933e8452498b93a540372d63ee37f02e9ced609e/assets/Wezterm%20Status%20Bar.png)

## ✨ Features

- ⌨️ **Non-fancy tabs**: Simple text-based with long names truncated;
- 🖼️ **Modes**: Visual representation of current terminal modes, including the
  leader key, and non-default workspaces;
- 🚀 **Important information when it maters**: When the terminal is in _full
  screen mode_, displays the battery level, WiFi connection state, and Date and
  Time;

## ⚡️ Requirements

- **Wezterm** >= 20241119;

## 📦 Installation

Use the built-in plugin manager from Wezterm.

Add the following in your `~/.config/wezterm/wezterm.lua`:

```lua
local wezterm = require 'wezterm'

-- Get the `config` object for your configuration
local config = wezterm.config_builder()

-- Use the plugin
local statusbar = wezterm.plugin.require 'https://github.com/Townk/statusbar.wezterm'
statusbar.apply_to_config(config)
```

## ⚙️ Configuration

The `apply_to_config` function accepts an optional argument that you can use to
tweak the Status Bar behavior.

The plugin comes with the following defaults:

```lua
statusbar.apply_to_config(config, {
    tabs = {
        hide_on_single_tab = false,
        max_width = 35,
        truncation_point = 0.4,
    },
    icons = {
        battery = {
            charging = {
                wezterm.nerdfonts.md_battery_charging_outline, -- 󰢟 > 0
                wezterm.nerdfonts.md_battery_charging_low, -- 󱊤 > 5
                wezterm.nerdfonts.md_battery_charging_medium, -- 󱊥 > 40%
                wezterm.nerdfonts.md_battery_charging_high, -- 󱊦 > 90%
            },
            discharging = {
                wezterm.nerdfonts.md_battery_outline, -- 󰂎
                wezterm.nerdfonts.md_battery_low, -- 󱊡 > 5
                wezterm.nerdfonts.md_battery_medium, -- 󱊢 > 40%
                wezterm.nerdfonts.md_battery_high, -- 󱊣 > 90%
            },
        },
        mode = {
            command = wezterm.nerdfonts.md_apple_keyboard_command, -- 󰘳,
            workspace = wezterm.nerdfonts.md_collage, -- 󰙀,
            search = wezterm.nerdfonts.fa_search, -- ,
            copy = wezterm.nerdfonts.md_content_copy, -- 󰆏,
        },
        tabs = {
            dir = wezterm.nerdfonts.md_folder_open, -- 󰝰
            home = wezterm.nerdfonts.md_home, -- 󰋜
            process = wezterm.nerdfonts.md_run, -- 󰜎
            tab = wezterm.nerdfonts.md_tab, -- 󰓩
        },
        time = {
            calendar = wezterm.nerdfonts.md_calendar_clock, -- 󰃰 date and time
        },
        wifi = {
            active = wezterm.nerdfonts.md_wifi, -- 󰖩 on
            inactive = wezterm.nerdfonts.md_wifi_strength_off_outline, -- 󰤮 off
        },
    },
    key_tables = {
        command = {
            label = 'Command',
            icon = M.icons.mode.command,
        },
        workspace = {
            icon = M.icons.mode.workspace,
        },
        search_mode = {
            label = 'Search',
            icon = M.icons.mode.search,
        },
        copy_mode = {
            label = 'Copy',
            icon = M.icons.mode.copy,
        },
    },
})
```

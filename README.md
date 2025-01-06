# 💥 Wezterm Status Bar

[![WezTerm](https://img.shields.io/badge/WezTerm-%237e56c2?style=for-the-badge&logo=data:image/svg%2bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB3aWR0aD0iNTUuMDEwODE1bW0iIGhlaWdodD0iNTVtbSIgdmlld0JveD0iMCAwIDU1LjAxMDgxNCA1NSI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJhIj48c3RvcCBvZmZzZXQ9IjAiIHN0b3AtY29sb3I9IiMyYjM4M2YiLz48c3RvcCBvZmZzZXQ9IjEiIHN0b3AtY29sb3I9IiMxNzIwMjQiLz48L2xpbmVhckdyYWRpZW50PjxsaW5lYXJHcmFkaWVudCB4bGluazpocmVmPSIjYSIgaWQ9ImIiIHgxPSI2Ni4wOTU2MTIiIHgyPSI2Ni4wOTU2MTIiIHkxPSI0My42NzY4NDYiIHkyPSI5OC4xMTI4MDEiIGdyYWRpZW50VW5pdHM9InVzZXJTcGFjZU9uVXNlIi8+PC9kZWZzPjxwYXRoIGZpbGw9InVybCgjYikiIGQ9Ik00OC42NTY2MTIgNDMuMjA3MTE1aDMzYTExIDExIDQ1IDAgMSAxMSAxMXYzM2ExMSAxMSAxMzUgMCAxLTExIDExaC0zM2ExMSAxMSA0NSAwIDEtMTEtMTF2LTMzYTExIDExIDEzNSAwIDEgMTEtMTF6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtMzcuNjU2NjEyIC00My4yMDcxMTUpIi8+PGcgc3R5bGU9ImxpbmUtaGVpZ2h0OjEuMjU7LWlua3NjYXBlLWZvbnQtc3BlY2lmaWNhdGlvbjomcXVvdDtPcGVyYXRvciBNb25vJnF1b3Q7Ij48cGF0aCBmaWxsPSIjNGU0OWVlIiBkPSJNNDcuMDc5MjUgNjYuOTA2OTcyYzAtMS4yNDc0MjMgMS4yNDc0MjMtMi4wMTUwNjggNC4yNzAwMjQtMi4wMTUwNjhsLTEuMDA3NTM0IDUuNTE3NDQ3Yy0xLjg3MTEzNC0xLjI0NzQyMy0zLjI2MjQ5LTIuMzk4ODktMy4yNjI0OS0zLjUwMjM3OXptOC4wNjAyNyAxMy42MjU2OTRjMCAxLjI5NTQwMS0xLjI5NTQwMSAyLjE1OTAwMS00LjI3MDAyNCAyLjMwMjkzNWwxLjA1NTUxMS01Ljg1MzI5MmMxLjg3MTEzNSAxLjI0NzQyMyAzLjIxNDUxMyAyLjM1MDkxMiAzLjIxNDUxMyAzLjU1MDM1N3ptLTUuMjc3NTU4IDExLjk5NDQ1LjkxMTU3OC01LjQyMTQ5MWM3LjI0NDY0OC0uNjcxNjkgMTAuMDc1MzM4LTMuNTk4MzM1IDEwLjA3NTMzOC02LjgxMjg0OCAwLTMuMzEwNDY4LTQuMDMwMTM1LTUuOTAxMjY5LTcuNzI0NDI2LTguMTU2MjI1bDEuMzQzMzc5LTcuMTAwNzE1YzEuNTM1Mjg5LjE0MzkzNCAzLjM1ODQ0Ni40MzE4MDEgNS41MTc0NDcuODYzNjAxbC42MjM3MTEtNC45NDE3MTNjLTEuNjMxMjQ1LS4yMzk4ODktMy4xNjY1MzUtLjMzNTg0NS00LjYwNTg2OS0uNDMxODAxbDEuMTAzNDktNS4yNzc1NTgtNC43NDk4MDItLjA0Nzk4LS45MTE1NzkgNS4zNzM1MTNjLTcuMjQ0NjQ3LjU3NTczNC0xMC4wNzUzMzcgMy41OTgzMzUtMTAuMDc1MzM3IDYuODEyODQ3IDAgMy4yNjI0OTEgNC4wMzAxMzUgNS43NTczMzYgNy43MjQ0MjUgNy45MTYzMzdsLTEuMzQzMzc4IDcuNDM2NTU5Yy0xLjcyNzIwMS0uMDk1OTYtMy44MzgyMjQtLjM4MzgyMi02LjI4NTA5Mi0uODE1NjIzbC0uOTU5NTU2IDQuOTQxNzE0YzIuMDYzMDQ2LjIzOTg4OSAzLjk4MjE1OC4zODM4MjIgNS43MDkzNTguNDMxOGwtMS4wNTU1MTEgNS4xODE2MDJ6bTMxLjI3MTAzLTMuNzkwMjQ2aDUuMzczNTEzYy42NzE2ODktNS42MTM0MDMgMS42MzEyNDUtMTYuOTM2MTYzIDIuMjU0OTU3LTI5Ljc0NjIzNWgtNS4xMzM2MjVjLS4xNDM5MzMgMy4wMjI2MDEtLjY3MTY4OSAyMS4wMTQyNzUtLjg2MzYgMjIuNTAxNTg3aC0uMTQzOTM0Yy0xLjI5NTQtNC44NDU3NTctMi4zNTA5MTItOC43Nzk5MzctMy42NDYzMTItMTMuNTc3NzE3aC0yLjkyNjY0NmMtMS4yNDc0MjMgNC43OTc3OC0yLjExMTAyMyA4LjM5NjExNS0zLjQwNjQyNCAxMy41Nzc3MTdoLS4xOTE5MTFjLS4xNDM5MzMtMS40ODczMTItLjk1OTU1Ni0xOS40Nzg5ODYtMS4wNTU1MTEtMjIuNTAxNTg3aC01LjMyNTUzNmMuNjIzNzExIDEyLjgxMDA3MiAxLjUzNTI5IDI0LjEzMjgzMiAyLjIwNjk3OSAyOS43NDYyMzVINzMuNTUyNWwzLjY5NDI5LTE0LjI0OTQwNnoiIGFyaWEtbGFiZWw9IiRXIiBmb250LWZhbWlseT0iT3BlcmF0b3IgTW9ubyIgZm9udC1zaXplPSI0Ny45Nzc4IiBmb250LXdlaWdodD0iNDAwIiBzdHlsZT0iLWlua3NjYXBlLWZvbnQtc3BlY2lmaWNhdGlvbjomcXVvdDtPcGVyYXRvciBNb25vJnF1b3Q7IiB0cmFuc2Zvcm09Im1hdHJpeCguODQwNTEyMDUgMCAwIC44NDQyMzYxOSAtMjYuMDI3NzgzIC0zNC44NTg0NTE2KSIvPjwvZz48L3N2Zz4=)](https://wezfurlong.org/wezterm)
[![Lua](https://img.shields.io/badge/Lua-%23f8f8f8?style=for-the-badge&logo=lua&logoColor=%2302027d)](https://www.lua.org)

A simple and minimalist status bar for Wezterm that displays tabs and extra
information when the terminal is in full screen.

![](https://github.com/Townk/statusbar.wezterm/blob/main/assets/Wezterm%20Status%20Bar.png)

![](https://github.com/Townk/statusbar.wezterm/blob/main/assets/status-bar-leader-key.png)

![](https://github.com/Townk/statusbar.wezterm/blob/main/assets/status-bar-search.png)

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

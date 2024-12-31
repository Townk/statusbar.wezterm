-- SPDX-License-Identifier: MIT
-- Copyright © 2024 Thiago Alves

local wezterm = require 'wezterm'

---Returns a strings representing a status segment.
---@param color Color
---@param text string
---@return string
local function format_segment(color, text)
  local fg = color:darken(0.8)
  if color:contrast_ratio(fg) < 3.8 then
    fg = color:lighten(0.6)
  end
  return wezterm.format {
    { Background = { Color = color } },
    { Foreground = { Color = fg } },
    { Text = ' ' .. text .. ' ' },
  }
end

---@class StatusBarSegment
---@field config Config
---@field status_config StatusBarConfig
local M = {}

---Returns a Color object representing the given `key_table`.
---@param key_table string
---@return Color
function M.mode_color(key_table)
  local active_table = M.status_config.key_tables[key_table]
  if not active_table or key_table == 'workspace' then
    return wezterm.color.parse(M.config.colors.tab_bar.inactive_tab.bg_color):darken(0.2)
  end
  return wezterm.color.parse(active_table.color)
end

---Status segment that displays the current terminal's mode.
---@param window Window
---@param key_table string
---@param color Color
---@return string
function M.mode(window, key_table, color)
  local label
  local active_table = M.status_config.key_tables[key_table]
  local ws_name = window:active_workspace()
  if not active_table or (key_table == 'workspace' and ws_name == 'default') then
    return ''
  end
  if key_table == 'workspace' then
    label = ws_name
  else
    label = active_table.label or key_table
  end
  if active_table.icon then
    label = active_table.icon .. ' ' .. label
  end
  return format_segment(color, label)
end

---Display the computer's battery level with an icon and the percentual of
---energy left.
---@param color Color
---@return string
function M.battery(color)
  local battery = wezterm.battery_info()[1]
  local percent = ''
  local icon = ''

  if battery.state == 'Full' then
    percent = '100%'
    icon = M.status_config.icons.battery.charging[4]
  else
    local percent_value = math.floor(battery.state_of_charge * 100 + 0.5)
    percent = percent_value .. '%'
    if percent_value >= 90 then
      icon = M.status_config.icons.battery[string.lower(battery.state)][4]
    elseif percent_value >= 40 then
      icon = M.status_config.icons.battery[string.lower(battery.state)][3]
    elseif percent_value > 5 then
      icon = M.status_config.icons.battery[string.lower(battery.state)][2]
    else
      icon = M.status_config.icons.battery[string.lower(battery.state)][1]
    end
  end
  return format_segment(color, percent .. ' ' .. icon)
end

---Display the date and time.
---@param color Color
---@return string
function M.time(color)
  return format_segment(
    color,
    M.status_config.icons.time.calendar .. ' ' .. wezterm.strftime '%a %b %-e %-l:%M%P'
  )
end

---Display the WiFi status with an icon.
---@param color Color
---@return string
function M.wifi(color)
  local wifi = M.status_config.icons.wifi.inactive
  local output = io.popen "ifconfig en0 | awk '/status:/{print $2}'"
  if output then
    local line = output:read '*line'
    output:close()
    wifi = M.status_config.icons.wifi[line]
  end
  return format_segment(color, wifi .. ' ')
end

---Construct the right side of the status bar with all of its segments.
---@param window Window
---@return string
function M.build_right_status(window)
  local status_mode = ''
  if window:leader_is_active() then
    status_mode = 'command'
  else
    status_mode = window:active_key_table()
    if not status_mode then
      status_mode = 'workspace'
    end
  end

  local colors = wezterm.color.gradient(
    { colors = { M.mode_color(status_mode), M.config.colors.tab_bar.background } },
    4
  )
  local dimen = window:get_dimensions()
  local bg1, bg2, bg3
  if dimen.is_full_screen then
    bg1 = colors[1]
    bg2 = colors[2]
    bg3 = colors[3]
  else
    bg3 = colors[1]
  end

  local status = M.mode(window, status_mode, bg3)
  if dimen.is_full_screen then
    status = status .. M.battery(bg2) .. M.wifi(bg2) .. M.time(bg1)
  end
  return status
end

---This function should be passed to the `update-status` hook of Wezterm so it
---can display an updated status bar.
---@param window Window
---@param _ Pane
function M.update_status(window, _)
  window:set_left_status ''
  window:set_right_status(M.build_right_status(window))
end

return M

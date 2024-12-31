-- SPDX-License-Identifier: MIT
-- Copyright © 2024 Thiago Alves

local wezterm = require 'wezterm'
local utils = require("statusbar.utils")

---@class StatusBarTab
---@field status_config StatusBarConfig
local M = {}

---@param path string
---@return string
local function basename(path)
  local base_path, _ = string.gsub(path, '(.*[/\\])(.*)', '%2')
  return base_path
end

---@param path string
---@return string
local function convert_home_dir(path)
  local cwd = path
  local home = os.getenv 'HOME'
  cwd = cwd:gsub('^' .. home, '~')
  if cwd == '' then
    return path
  end
  return cwd
end

---@param path string
---@return string
local function convert_useful_path(path)
  local cwd = convert_home_dir(path)
  return basename(cwd)
end

---@param title string
---@param max_length number
---@param truncation_point number?
---@return string
local function truncated_title(title, max_length, truncation_point)
  local length = #title
  if length <= max_length then
    return title
  end

  if not truncation_point then
    truncation_point = 0.5
  elseif truncation_point < 0 then
    truncation_point = 0
  elseif truncation_point > 1 then
    truncation_point = 1
  end

  local ellipsis
  if truncation_point == 0 then
    ellipsis = '… '
  elseif truncation_point == 1 then
    ellipsis = ' …'
  else
    ellipsis = ' … '
  end
  local ellipsis_length = #ellipsis

  local prefix_length = math.floor((max_length - ellipsis_length) * truncation_point + 0.5)
  local suffix_length = (max_length - ellipsis_length) - prefix_length
  local left = ''
  if prefix_length > 0 then
    left = wezterm.truncate_right(title, prefix_length)
  end
  local right = ''
  if suffix_length > 0 then
    right = wezterm.truncate_left(title, suffix_length)
  end

  return left .. ellipsis .. right
end

---@param path string
---@return boolean
local function is_dir(path)
  local f = io.open(path, 'r')
  if f then
    local _, _, code = f:read(1)
    f:close()
    return code == 21
  end
  return false
end

---@return string
function M.create_tab_title(tab)
  local max_length = M.status_config.tabs.max_width - 7
	local pane_info = utils.parse_pane_title(tab.active_pane.title)
  local title
  local user_title = tab.active_pane.user_vars.panetitle or tab.tab_title
  if user_title ~= nil and #user_title > 0 then
    title = M.status_config.icons.tabs.tab .. ' ' .. user_title
  else
    title = basename(tab.active_pane.foreground_process_name)
    if title == '' then
      local dir = pane_info.cwd
      local home_dir = os.getenv 'HOME'
      if dir:sub(1, 1) == '~' then
        dir = home_dir .. dir:sub(2)
      end

      if pane_info.host then
        dir = convert_useful_path(dir)
        title = M.status_config.icons.pane_host.ssh .. ' ' .. dir
      else
        local dir_read = is_dir(dir)
        if dir_read then
          dir = convert_useful_path(dir)
          if dir == '~' then
            title = M.status_config.icons.tabs.home .. ' ' .. dir
          else
            title = M.status_config.icons.tabs.dir .. ' ' .. dir
          end
        else
          title = M.status_config.icons.tabs.process .. ' ' .. dir
        end
      end
    else
      title = M.status_config.icons.tabs.process .. ' ' .. title
    end
  end

  if pane_info.copy_derivate_mode and M.status_config.key_tables.copy_mode.icon then
    title = title .. ' ' .. M.status_config.icons.mode.copy
  end

  return tab.tab_index + 1
    .. ' '
    .. truncated_title(title, max_length, M.status_config.tabs.truncation_point)
end

function M.format_tab_title(tab, _, _, cfg, hover, _)
  local title = M.create_tab_title(tab)

  local solid_right_arrow = utf8.char(0x258c)
  local edge_background = cfg.colors.tab_bar.background
  local background = cfg.colors.tab_bar.inactive_tab.bg_color
  local foreground = cfg.colors.tab_bar.inactive_tab.fg_color
  if tab.is_active then
    background = cfg.colors.tab_bar.active_tab.bg_color
    foreground = cfg.colors.tab_bar.active_tab.fg_color
  elseif hover then
    background = cfg.colors.tab_bar.inactive_tab_hover.bg_color
    foreground = cfg.colors.tab_bar.inactive_tab_hover.fg_color
  end
  local edge_foreground = background

  return {
    { Attribute = { Intensity = 'Bold' } },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = ' ' .. title .. ' ' },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = solid_right_arrow },
    { Attribute = { Intensity = 'Normal' } },
  }
end

return M

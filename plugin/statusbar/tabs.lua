-- SPDX-License-Identifier: MIT
-- Copyright © 2024 Thiago Alves

---@type Wezterm
local wezterm = require("wezterm")
local utils = require("statusbar.utils")

---@class StatusBarTab
---@field status_config StatusBarConfig
local M = {}

---@param tab any
---@param active_key_table string?
---@return string
function M.create_tab_title(tab, active_key_table)
	local max_length = M.status_config.tabs.max_width - 5
	local pane_info = utils.parse_pane_title(tab.active_pane.title, active_key_table)
	local title
	local user_title = tab.tab_title or tab.active_pane.user_vars.panetitle
  -- wezterm.log_info('* * * DEBUG * * * :: user_title=', user_title)
	if user_title ~= nil and #user_title > 0 then
		title = M.status_config.icons.tabs.tab .. " " .. user_title
	else
		title = utils.basename(tab.active_pane.foreground_process_name)
		if title == "" then
			local dir = pane_info.cwd
			local home_dir = os.getenv("HOME")
			if dir:sub(1, 1) == "~" then
				dir = home_dir .. dir:sub(2)
			end

			if pane_info.host then
				dir = utils.basename(utils.resolve_home_dir(dir))
				title = M.status_config.icons.pane_host.ssh .. " " .. dir
			else
				local dir_read = utils.is_dir(dir)
				if dir_read then
          dir = utils.basename(utils.resolve_home_dir(dir))
					if dir == "~" then
						title = M.status_config.icons.tabs.home .. " " .. dir
					else
						title = M.status_config.icons.tabs.dir .. " " .. dir
					end
				else
					title = M.status_config.icons.tabs.process .. " " .. dir
				end
			end
		else
			title = M.status_config.icons.tabs.process .. " " .. title
		end
	end

	if pane_info.mode then
		if pane_info.mode == "copy" and M.status_config.key_tables.copy_mode.icon then
			title = title .. " " .. M.status_config.icons.mode.copy
		elseif pane_info.mode == "search" and M.status_config.key_tables.search_mode.icon then
			title = title .. " " .. M.status_config.icons.mode.search
		end
	end

	return tab.tab_index + 1 .. " " .. utils.truncated_text(title, max_length, M.status_config.tabs.truncation_point)
end

function M.format_tab_title(tab, _, _, cfg, hover, _)
  -- local window = wezterm.gui.gui_window_for_mux_window(tab.window_id)
  local window = nil
  local active_key_table = nil
  if window then
    active_key_table = window:active_key_table()
  end
	local title = M.create_tab_title(tab, active_key_table)
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
		{ Attribute = { Intensity = "Bold" } },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title .. " " },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = solid_right_arrow },
		{ Attribute = { Intensity = "Normal" } },
	}
end

return M

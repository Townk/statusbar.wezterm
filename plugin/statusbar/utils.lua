-- SPDX-License-Identifier: MIT
-- Copyright © 2024 Thiago Alves

local M = {}

---@class StatusBarPaneHostInfo
---@field username string
---@field hostname string

---@class StatusBarPaneInfo
---@field cwd string
---@field host StatusBarPaneHostInfo?
---@field copy_derivate_mode boolean

---@param title string?
---@return StatusBarPaneInfo?
function M.parse_pane_title(title)
	if not title or title == "" then
		return nil
	end

	---@type StatusBarPaneHostInfo
	local host = nil
	local copy_mode = false
	local _, _, target, dir = title:find("([^:]+):%s*(.*)")
	if target == "Copy mode" then
		copy_mode = true
		_, _, target, dir = dir:find("([^:]+):%s*(.*)")
	end
	if target and dir then
		local _, _, username, hostname = target:find("([^@]+)@(.*)")
		if username and hostname then
			host = {
				username = username,
				hostname = hostname,
			}
		end
	else
		dir = title
	end
	return {
		cwd = dir,
		host = host,
		copy_derivate_mode = copy_mode,
	}
end

return M

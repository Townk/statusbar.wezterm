local M = {}

function M.apply_to_config(config)
  config.tab_bar_at_bottom = true
  config.use_fancy_tab_bar = false
  config.hide_tab_bar_if_only_one_tab = false
  config.tab_max_width = 35
  config.tab_and_split_indices_are_zero_based = false

end

return M

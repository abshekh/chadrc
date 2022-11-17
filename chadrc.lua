local M = {}

-- Path to overriding theme and highlights files
local themes = require "custom.overidden_themes"
local highlights = require "custom.highlights"

-- custom global vars
vim.g.border_style       = "rounded"
vim.g.disable_formatting = {}

M.ui = {
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark",
  changed_themes = themes,
  hl_override = highlights.override,
  hl_add = highlights.add,
  -- transparency = true,
}

M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M

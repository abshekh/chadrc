-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

M.override = {
  Comment = {
    italic = true,
  },
  NormalFloat = {
    bg = "none"
  },
  FloatBorder = {
    fg = "grey"
  }
}

-- M.add = {
--   NvimTreeOpenedFolderName = { fg = "green", bold = true, italic = true },
--   NvimTreeOpenedFile = { fg = "teal", bold = true, italic = true },
-- }

return M

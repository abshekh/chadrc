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
  },
}

M.add = {
  LspInfoBorder = {
    fg = "grey"
  },
  DiffText = {
    bold = true,
    bg = "red",
    fg = "darker_black"
  },
}


return M

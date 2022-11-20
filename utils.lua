local M = {}

M.border = function(hl_name)
  if vim.g.border_style == "single" then
    return {
      { "┌", hl_name },
      { "─", hl_name },
      { "┐", hl_name },
      { "│", hl_name },
      { "┘", hl_name },
      { "─", hl_name },
      { "└", hl_name },
      { "│", hl_name },
    }
  else
    return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
    }
  end
end


return M

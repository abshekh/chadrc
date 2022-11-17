local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
    "c",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    "haskell-language-server",
  },
  ui = {
    border = vim.g.border_style,
  }
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = false,
  },

  update_focused_file = {
    enable = true,
    update_root = false
  },
  view = {
    mappings = {
      custom_only = false,
      list = require("custom.mappings.nvimtree").setup,
    },
  },
}

local function border(hl_name)
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

M.cmp = function()
  local cmp = require "cmp"
  return {
    window = {
      completion = {
        border = border "CmpBorder",
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = border "CmpBorder",
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
    },
    mapping = require("custom.mappings.cmp").setup(cmp),
  }
end

M.telescope = function()
  local actions = require "telescope.actions"
  return {
    defaults = {
      mappings = require("custom.mappings.telescope").setup(actions),
    },
  }
end


M.packer = {
  display = {
    open_fn = function()
      return require("packer.util").float {
        border = vim.g.border_style
      }
    end,
    prompt_border = vim.g.border_style,
  },
}

return M

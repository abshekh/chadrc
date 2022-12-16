local M = {}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",

    -- web dev stuff
    -- "css-lsp",
    -- "html-lsp",
    "typescript-language-server",
    -- "deno",

    -- "haskell-language-server",
  },
  ui = {
    border = vim.g.border_style,
  }
}

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

M.cmp = function()
  local cmp = require "cmp"
  return {
    window = {
      completion = {
        border = require("custom.utils").border "CmpBorder",
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
      documentation = {
        border = require("custom.utils").border "CmpBorder",
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
    pickers = {
      buffers = {
        initial_mode = "normal",
        mappings = require("custom.mappings.telescope").buffer_setup(actions),
      },
      git_branches = {
        initial_mode = "normal",
      },
      -- terms = require("custom.mappings.telescope").terms_setup(actions),
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

M.gitsigns = {
  preview_config = {
    border = vim.g.border_style,
    style = "minimal",
    relative = "cursor",
  },
}

M.statusline = {
  statusline = {
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.modules"
      local fn = vim.fn
      local sep_style = vim.g.statusline_sep_style
      local separators = (type(sep_style) == "table" and sep_style)
          or require("nvchad_ui.icons").statusline_separators[sep_style]
      local sep_l = separators["left"]
      local sep_r = separators["right"]
      return {
        -- cursor_position = function()
        --   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        --
        --   -- lets store current logs
        --   local cp = st_modules.cursor_position()
        --
        --   return cp .. line .. ":" .. (col + 1)
        -- end,
        cwd = function()
          local dir_icon = "%#St_cwd_icon#" .. " "
          local dir_name = "%#St_cwd_text#" .. " " .. fn.fnamemodify(fn.expand("%:p:h"), ":~:.") .. " "
          return (vim.o.columns > 85 and ("%#St_cwd_sep#" .. sep_l .. dir_icon .. dir_name)) or ""
        end
      }
    end
  }
}

return M

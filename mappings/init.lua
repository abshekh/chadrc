local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local M = {}

M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
  i = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
  v = {
    ["<leader>/"] = "",
  },
}

M.general = {
  i = {
    -- go to  beginning and end
    ["<C-b>"] = { "<ESC>^i", "beginning of line" },
    ["<C-e>"] = { "<End>", "end of line" },
  },

  n = {
    -- save
    ["<C-s>"] = { "<CMD> w <CR>", "save file" },

    -- Copy all
    ["<C-c>"] = { "<CMD> %y+ <CR>", "copy whole file" },

    -- new buffer
    ["<leader>b"] = { "<CMD> enew <CR>", "new buffer" },

    -- quickfix list
    ["<C-q>"] = { "<CMD>call QuickFixToggle() <CR>", "quickfix toggle" },
    ["]q"]    = { "<CMD>cnext<CR>", "quickfix next" },
    ["[q"]    = { "<CMD>cprev<CR>", "quickfix next" },

    ["<C-w>m"] = { "<CMD>tabedit %<CR>", "maximize" },

    ["gf"] = { "gF", "go to file" },

    ["<C-Up>"]    = { "<CMD>resize +2<CR>", "resize window up" },
    ["<C-Down>"]  = { "<CMD>resize -2<CR>", "resize window down" },
    ["<C-Left>"]  = { "<CMD>vertical resize -2<CR>", "resize window left" },
    ["<C-Right>"] = { "<CMD>vertical resize +2<CR>", "resize window right" },

    ["<leader>gg"] = { "<CMD>DiffviewOpen<CR>", "open diffview" },
  },

  t = { ["<ESC>"] = { termcodes "<C-\\><C-N>", "escape terminal mode" } },

  v = {
    ["<"] = { "<gv", "outdent" },
    [">"] = { ">gv", "indent" },
  },

  -- x = {
  -- },
  c = {
    ["<C-j>"] = { "<C-n>", "next suggetion" },
    ["<C-k>"] = { "<C-p>", "previous suggestion" },
    ["<C-h>"] = { "<Up>", "previous command" },
    ["<C-l>"] = { "<Down>", "next command" },
  }
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    -- pick buffers via numbers
    ["<Bslash>"] = { "<CMD> TbufPick <CR>", "Pick buffer" },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.lspconfig = require("custom.mappings.lsp").lspconfig_mappings
M.nvimtree = require("custom.mappings.nvimtree").mappings
M.telescope = require("custom.mappings.telescope").mappings

M.nvterm = {
  plugin = true,

  t = {
    -- toggle in terminal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
  },

  n = {
    -- toggle in normal mode
    ["<A-i>"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },

    ["<A-h>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    ["<A-v>"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    -- new

    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}

M.whichkey = {
  plugin = true,

  n = {
    ["<leader>wK"] = {
      function()
        vim.cmd "WhichKey"
      end,
      "which-key all keymaps",
    },
    ["<leader>wk"] = {
      function()
        local input = vim.fn.input "WhichKey: "
        vim.cmd("WhichKey " .. input)
      end,
      "which-key query lookup",
    },
  },
}

M.blankline = {
  plugin = true,

  n = {
    ["<leader>cc"] = {
      function()
        local ok, start = require("indent_blankline.utils").get_current_context(
          vim.g.indent_blankline_context_patterns,
          vim.g.indent_blankline_use_treesitter_scope
        )

        if ok then
          vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
          vim.cmd [[normal! _]]
        end
      end,

      "Jump to current_context",
    },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    -- Navigation through hunks
    ["]c"] = {
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },

    ["[c"] = {
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },

    -- Actions
    -- ["<leader>rh"] = {
    --   function()
    --     require("gitsigns").reset_hunk()
    --   end,
    --   "Reset hunk",
    -- },

    -- ["<leader>ph"] = {
    --   function()
    --     require("gitsigns").preview_hunk()
    --   end,
    --   "Preview hunk",
    -- },

    ["<leader>gB"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },

    -- ["<leader>td"] = {
    --   function()
    --     require("gitsigns").toggle_deleted()
    --   end,
    --   "Toggle deleted",
    -- },
  },
}

return M

local overrides = require "custom.plugins.overrides"

return {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.plugins.lspconfig").setup()
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },

  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },

  ["wbthomason/packer.nvim"] = {
    override_options = overrides.packer,
  },

  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsigns,
  },
  ["nvim-lua/plenary.nvim"] = { rm_default_opts = true },

  ["NvChad/ui"] = {
    override_options = overrides.statusline
  },

  -- Install a plugin
  ["tpope/vim-fugitive"] = {},
  ["sindrets/diffview.nvim"] = {
    after = "plenary.nvim",
    config = function()
      require "custom.plugins.diffview"
    end,
  },
  ["kdheepak/lazygit.nvim"] = {
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1
    end
  },
  -- ["ldelossa/nvim-ide"] = {
  --   after = "ui",
  --   config = function ()
  --     local _, ide = pcall(require, "ide")
  --     ide.setup {}
  --   end
  -- },
  ['ldelossa/buffertag'] = {
    after = "ui",
    config = function ()
      local _, buffertag = pcall(require, "buffertag")
      buffertag.setup {
        border = vim.g.border_style,
      }
    end
  },
  -- ["~/dev/lua/natural"] = {
  --   config = function ()
  --     require("natural").setup {}
  --   end
  -- },

  -- Utilities
  ["junegunn/vim-easy-align"] = {},
  ["dhruvasagar/vim-table-mode"] = {},

  -- lsp, dap
  ["simrat39/rust-tools.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.rust-tools"
    end,
  },
  ["purescript-contrib/purescript-vim"] = {}, -- purescript highlighliting
  ["mfussenegger/nvim-jdtls"] = {
    after = "nvim-lspconfig",
  },
  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-lspconfig",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

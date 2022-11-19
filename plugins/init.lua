local overrides = require "custom.plugins.overrides"

return {

  -- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
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

  -- Install a plugin
  ["tpope/vim-fugitive"] = { },
  ["sindrets/diffview.nvim"] = {
    after = "plenary.nvim",
    config = function()
      require "custom.plugins.diffview"
    end,
  },


  -- Utilities
  ["junegunn/vim-easy-align"] = { },
  ["dhruvasagar/vim-table-mode"] = { },

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

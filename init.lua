local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

require("custom.commands")
vim.g.border_style = "rounded"
vim.g.disable_formatting = {}

vim.opt.timeout = false -- don't timeout on pressing leader key

-- run this to symlink the ftplugin
-- ln -s ~/.config/nvim/lua/custom/ftplugin/ ~/.config/nvim

require("custom.commands")
require("custom.autocmds")
-- ❯ ln -s ~/.config/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

-- # if [ -n "$nvim_listen_address" ]; then #   alias nvim=nvr -cc tabnew --remote-wait +'set bufhidden=wipe'
-- # fi
-- # if [ -n "$NVIM_LISTEN_ADDRESS" ]; then
-- #     export VISUAL="nvr -cc tabnew --remote-wait +'set bufhidden=wipe'"
-- #     export EDITOR="nvr -cc tabnew --remote-wait +'set bufhidden=wipe'"
-- # else
-- #     export VISUAL="nvim"
-- #     export EDITOR="nvim"
-- # fi
-- vim.cmd [[
-- if has('nvim') && executable('nvr')
--   " let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
--   let $GIT_EDITOR = "nvr -cc tabe --remote-wait +'set bufhidden=wipe'"
-- endif
-- ]]
-- if vim.fn.executable("nvr") == 1 then
--   vim.env.GIT_EDITOR = "nvr -cc tabe --remote-wait +'set bufhidden=wipe'"
-- end

-- :set diffopt+=vertical
local set          = vim.opt
set.title          = false
set.wrap           = false
set.timeout        = false -- don't timeout on pressing leader key
set.relativenumber = true -- Show relative numberline
set.swapfile       = false -- Disable use of swapfile for the buffer
set.writebackup    = false -- Disable making a backup before overwriting a file
set.undofile       = true -- Enable persistent undo
set.foldmethod     = "expr" -- auto folds based on exprs
set.foldexpr       = "nvim_treesitter#foldexpr()" -- create folds based on treesitter
set.foldlevel      = 99
set.foldlevelstart = 99
set.foldenable     = false
set.foldtext       = [[substitute(getline(v:foldstart),'\\\\t',repeat('\\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
set.fillchars      = set.fillchars + 'diff:╱' + 'fold: '
set.shell          = "/bin/zsh" -- set zsh as shell for integrated terminal
vim.cmd [[ autocmd User TelescopePreviewerLoaded setlocal wrap ]] -- wrap telescope
vim.cmd [[ autocmd FileType * set formatoptions-=o ]] -- don't continue the comment

vim.keymap.set("n", "<leader>gd", "<cmd>terminal lazygit<cr>")


-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("TermOpen", {
--   pattern = ".*lazygit",
--   command = function()
--     pcall(vim.keymap.del, 't', '<ESC>')
--   end,
-- })


-- vim.cmd [[ 
--   augroup neovim_lazygit
--       autocmd!
--       autocmd TermOpen *:lazygit startinsert
--       autocmd TermClose *:lazygit call feedkeys("i")
--   augroup END
-- ]]

-- run this to symlink the ftplugin
-- ln -s ~/.config/nvim/lua/custom/ftplugin/ ~/.config/nvim

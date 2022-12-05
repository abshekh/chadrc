require("custom.commands")
require("custom.autocmds")

vim.cmd [[
if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif
]]

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
-- set.shell          = "/bin/zsh" -- set zsh as shell for integrated terminal
vim.cmd [[ autocmd User TelescopePreviewerLoaded setlocal wrap ]] -- wrap telescope
vim.cmd [[ autocmd FileType * set formatoptions-=o ]] -- don't continue the comment

-- run this to symlink the ftplugin
-- ln -s ~/.config/nvim/lua/custom/ftplugin/ ~/.config/nvim

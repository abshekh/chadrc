-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- local cmd = vim.api.nvim_create_autocmd
local create_command = vim.api.nvim_create_user_command


local function woman()
  local telescope_builtin_status_ok, telescope_builtin = pcall(require, "telescope.builtin")
  if not telescope_builtin_status_ok then
    return
  end
  telescope_builtin.man_pages({ previewer = false })

end


local function preview_notes()
  local telescope_builtin_status_ok, telescope_builtin = pcall(require, "telescope.builtin")
  if not telescope_builtin_status_ok then
    return
  end
  telescope_builtin.find_files({ previewer = false, cwd = "~/notes/" })

end

create_command("Woman", woman, { desc = "Man Pages" })
create_command("Notes", preview_notes, { desc = "Search Notes" })
create_command("MYVIMRC", ":e $MYVIMRC", { desc = "Edit Neovim Config" })
create_command("CDC", ":cd %:p:h", { desc = "Change Global dir to current file" })
create_command("LDC", ":cd %:p:h", { desc = "Change Local dir to current file" })
create_command("Vterm", ":vsp | term", { desc = "Terminal in vertical split" })
create_command("Sterm", ":9sp | term", { desc = "Terminal in horizontal split" })
create_command("Nomodifiable", ":set noma", { desc = "Set no modifiable" })
create_command("Modifiable", ":set ma", { desc = "Set modifiable" })
-- create_command("Bufname", ":keepalt file", { desc = "Rename buffer" })
create_command("Filetype", ":set filetype", { desc = "Set filetype" })
-- command! -nargs=1 MyCommand call s:MyFunc(myParam)
create_command("CopyBufferFilepath", "let @+ = expand('%:p')", { desc = "Copy Buffer Filepath" })
create_command("TodoCapture", ":5sp ~/notes/todo.md", { desc = "Write to todo.md" })
create_command("WorkCapture", ":5sp ~/notes/work/work.md", { desc = "Write to work.md" })

vim.cmd [[  
	:command -nargs=1 Bufname keepalt file <args>
	:command -nargs=1 Type set filetype <args>

  function! NewScratchTab(...)
      tabnew
      execute printf('set filetype=%s', a:1)
  endfunction

	:command -nargs=1 Scratch call NewScratchTab(<f-args>)

  au BufNewFile,BufRead *.log  :setl ft=log
  au BufNewFile,BufRead *.purs :setl ft=purescript
  autocmd BufEnter,BufRead * normal zR

]]


vim.cmd [[  
  function! CopyMessages(...)
      execute printf('redir @+')
      execute printf('%smessage', a:1)
      execute printf('redir END')
  endfunction

	:command -nargs=1 CopyMessages call CopyMessages(<f-args>)
]]

vim.cmd [[ 
  augroup neovim_terminal
      autocmd!
      " Enter Terminal-mode (insert) automatically
      autocmd TermOpen * startinsert
      " Disables number lines on terminal buffers
      autocmd TermOpen * :set nonumber norelativenumber
      " allows you to use Ctrl-c on terminal window
      autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
      autocmd TermClose zsh call feedkeys("i")
  augroup END
]]

-- autocmd BufReadPost,FileReadPost * normal zR
-- au BufNewFile,BufRead *.log :setl ft=json



-- local api = vim.api
-- local M = {}
-- -- function to create a list of commands and convert them to autocommands
-- -------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
--     for group_name, definition in pairs(definitions) do
--         api.nvim_command('augroup '..group_name)
--         api.nvim_command('autocmd!')
--         for _, def in ipairs(definition) do
--             local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
--             api.nvim_command(command)
--         end
--         api.nvim_command('augroup END')
--     end
-- end
--
--
-- local autoCommands = {
--     -- other autocommands
--     open_folds = {
--         {"BufReadPost,FileReadPost", "*", "normal zR"}
--     }
-- }
--
-- M.nvim_create_augroups(autoCommands)
--
-- return M

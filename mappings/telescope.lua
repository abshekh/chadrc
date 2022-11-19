local M = {}

local function getVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg "v"
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

M.mappings = {
  plugin = true,
  n = {
    -- find
    ["<leader><leader>"] = { "<CMD> Telescope find_files <CR>", "find files" },
    ["<leader>/"] = { "<CMD> Telescope live_grep <CR>", "live grep" },
    ["<leader>,"] = { "<CMD> Telescope buffers <CR>", "find buffers" },
    ["<leader><"] = { "<CMD> Telescope terms <CR>", "find terminals" },

    -- git
    ["<leader>gm"] = { "<CMD> Telescope git_commits <CR>", "git commits" },
    ["<leader>gs"] = { "<CMD> Telescope git_status <CR>", "git status" },
    ["<leader>gb"] = { "<CMD> Telescope git_branches <CR>", "git branches" },
    ["<leader>j"]  = { "<CMD> Telescope jumplist <CR>", "jumplist" },

    ["<leader>'"] = { "<CMD> Telescope resume <CR>", "telescope resume last command" }
  },
  v = {
    ["<leader>/"] = {
      function()
        local text = getVisualSelection()
        require("telescope.builtin").live_grep { default_text = text }
      end,
      "live grep",
    },
  },
}

M.setup = function(actions)
  return {
    i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-l>"] = actions.cycle_history_next,
      ["<C-h>"] = actions.cycle_history_prev,
      ["<C-c>"] = actions.close,
      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,
      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,
      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
      ["<PageUp>"] = actions.results_scrolling_up,
      ["<PageDown>"] = actions.results_scrolling_down,
      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      -- ["<C-n>"] = actions.cycle_history_next,
      -- ["<C-p>"] = actions.cycle_history_prev,
      -- ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
      -- ["<C-l>"] = actions.complete_tag,
    },

    n = {
      ["<esc>"] = actions.close,
      ["<CR>"] = actions.select_default,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,
      ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      ["j"] = actions.move_selection_next,
      ["k"] = actions.move_selection_previous,
      ["<C-l>"] = actions.cycle_history_next,
      ["<C-h>"] = actions.cycle_history_prev,
      ["<Down>"] = actions.move_selection_next,
      ["<Up>"] = actions.move_selection_previous,
      ["gg"] = actions.move_to_top,
      ["G"] = actions.move_to_bottom,
      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
      ["<PageUp>"] = actions.results_scrolling_up,
      ["<PageDown>"] = actions.results_scrolling_down,
      ["?"] = actions.which_key,
      -- ["H"] = actions.move_to_top,
      -- ["M"] = actions.move_to_middle,
      -- ["L"] = actions.move_to_bottom,
      -- ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
    },
  }
end

M.buffer_setup = function(actions)
  return {
    initial_mode = "normal",
    mappings = {
      i = {
        ["<C-d>"] = actions.delete_buffer,
      },
      n = {
        ["dd"] = actions.delete_buffer,
      },
    },
  }
end

-- M.terms_setup = function(actions)
--   return {
--     initial_mode = "normal",
--     mappings = {
--       i = {
--         ["<C-d>"] = actions.delete_buffer,
--       },
--       n = {
--         ["dd"] = actions.delete_buffer,
--       },
--     },
--   }
-- end

return M

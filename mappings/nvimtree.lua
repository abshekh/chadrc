local M = {}

M.setup = {
  { key = { "l", "<CR>", "o" }, action = "edit" },
  { key = "h", action = "close_node" },
  { key = "v", action = "vsplit" },
  { key = "?", action = "toggle_help" },
  { key = { "<C-]>", "<2-RightMouse>", "." }, action = "cd" },
}

M.mappings = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<CMD> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<CMD> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

-- map("n", "<leader>ft", ":NvimTreeToggle<CR>", opts)
-- map("n", "<leader>ff", "<cmd>NvimTreeFocus<cr>", opts)

return M

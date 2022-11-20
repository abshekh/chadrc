local present, rust_tools = pcall(require, "rust-tools")

if not present then
  return
end

local lsp_opts = require("custom.plugins.lspconfig").getOpts()

local opts = {
  tools = {
    inlay_hints = {
      auto = false,
      only_current_line = false,
      show_parameter_hints = false,
    },
    hover_actions = {
      border = require("custom.utils").border("FloatBorder")
    },
  },
  server = {
    on_attach = lsp_opts.on_attach,
    capabilities = lsp_opts.capabilities,
  }
}

rust_tools.setup(opts)

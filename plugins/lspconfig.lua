local M = {}

M.getOpts = function()
  local core_on_attach = require("plugins.configs.lspconfig").on_attach
  local capabilities = require("plugins.configs.lspconfig").capabilities

  local on_attach = function(client, bufnr)
    core_on_attach(client, bufnr)
    if vim.g.disable_formatting[client.name] then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    else
      client.server_capabilities.documentFormattingProvider = true
      client.server_capabilities.documentRangeFormattingProvider = true
      require("custom.mappings.lsp")
          .lspconfig_conditional_mapping
          .format(client, bufnr)
    end
  end
  return {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end


M.setup = function()

  local lspconfig = require "lspconfig"

  vim.diagnostic.config {
    update_in_insert = false,
    virtual_text = false,
    float = {
      border = vim.g.border_style,
      focusable = true,
      style = "minimal",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
    { border = vim.g.border_style })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
    { border = vim.g.border_style })


  local servers = require "custom.lsp-servers"
  for _, lsp in ipairs(servers) do
    local settings_present, server_settings = pcall(require, "custom.lsp-servers.settings." .. lsp)
    if settings_present then
      local updated_opts = vim.tbl_deep_extend("force",
        server_settings,
        M.getOpts())
      lspconfig[lsp].setup(updated_opts)
    else
      lspconfig[lsp].setup(M.getOpts())
    end
  end

end

return M

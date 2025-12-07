local nvlsp = require("nvchad.configs.lspconfig")
nvlsp.defaults()

local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities

-- Lua
vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {})

-- C/C++
vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  on_init = on_init,
})

-- Python
vim.lsp.enable('pyright')
vim.lsp.config('pyright', {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {"python"},
})

-- CMake
vim.lsp.enable('cmake')
vim.lsp.config('cmake', {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {"cmake"},
  init_options = {
    buildDirectory = "build"
  },
  single_file_spport = true
})

-- JSON
vim.lsp.enable('jsonls')
local cp = vim.lsp.protocol.make_client_capabilities()
cp.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config('jsonls', {
  capabilities = cp,
})

-- PowerShell
vim.lsp.enable('powershell_es')
vim.lsp.config('powershell_es', {
  bundle_path = 'D:/Program Files/PowerShellEditorServices',
  shell = 'powershell.exe',
})

-- Bash
vim.lsp.enable('bashls')
vim.lsp.config('bashls', {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
})


local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local util = require'lspconfig.util'

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}

lspconfig.cmake.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"cmake"},
  init_options = {
    buildDirectory = "build"
  },
  root_dir = function(pattern)
    local cwd = vim.loop.cwd()
    local root = util.root_pattern('CMakePresets.json', 'CTestConfig.cmake', '.git', 'build', 'cmake')(pattern)

    -- prefer cwd if root is a descendant
    return util.path.is_descendant(cwd, root) and cwd or root
  end,
  single_file_spport = true
}

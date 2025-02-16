local nvlsp = require("nvchad.configs.lspconfig")
nvlsp.defaults()

local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities

local lspconfig = require("lspconfig")
local util = lspconfig.util

-- lua-language-server
lspconfig.lua_ls.setup{

}

-- C/C++
lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  on_init = on_init,
}

-- Python
lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = {"python"},
}

-- CMake
lspconfig.cmake.setup {
  on_attach = on_attach,
  on_init = on_init,
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

-- JSON
local cp = vim.lsp.protocol.make_client_capabilities()
cp.textDocument.completion.completionItem.snippetSupport = true
lspconfig.jsonls.setup {
  capabilities = cp,
}

-- PowerShell
lspconfig.powershell_es.setup {
  bundle_path = 'C:\\Users\\Александр\\AppData\\Local\\PowerShellEditorServices',
  shell = 'powershell.exe',
}

-- Bash
lspconfig.bashls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

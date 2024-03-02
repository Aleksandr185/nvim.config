
require 'nvim-treesitter.install'.compilers = { "clang" }

local plugins = {
  -- null-ls (formatting)
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.config.null-ls"
    end,
  },

  -- mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lsp servers
        "clangd",
        "lua-language-server",
        "pyright",

        -- dap ( codelldb or vscode-cpptools)
        "codelldb",
        "debugpy",

        -- linter
        "flake8",

        -- formats
        "clang-format",
        "black",

      }
    }
  },

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.config.lspconfig"
    end,
  },

  -- debug adapter
  {
    "mfussenegger/nvim-dap",
    config = function (_, _)
      require("core.utils").load_mappings("dap")
    end
  },

  -- translate between dap adapter names and mason.nvim package names (e.g. python <-> debugpy)
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },

  -- dap ui
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },

  -- better escape
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function ()
      require("better_escape").setup()
    end,
  },

  {
    "NvChad/nvcommunity",
    {
      import = "nvcommunity.git.diffview"
    },
    {
      import = "nvcommunity.git.neogit"
    },
  },

}

return plugins

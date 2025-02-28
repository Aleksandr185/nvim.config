local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    opts = require "configs.nvimtree",
  },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- nvim-nio: A library for asynchronous IO in Neovim, inspired by the asyncio library in Python.
  -- The library focuses on providing both common asynchronous primitives and asynchronous APIs for Neovim's core.
  {
    "nvim-neotest/nvim-nio"
  },

  -- neodev.nvim: Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  {
    "folke/neodev.nvim",
    opts = {}
  },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix", -- classic, modern helix
      icons = {
        separator = "",
      },
    },
  },

  -- nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- debug adapter
  {
    "mfussenegger/nvim-dap",
    -- config = function (_, _)
    --   require("core.utils").load_mappings("dap")
    -- end
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

  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "cpp",
        "python",
        "bash",
        "cmake",
        "json",

      },
      auto_install = true,
    },
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
      require "configs.lint"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },

}

return plugins

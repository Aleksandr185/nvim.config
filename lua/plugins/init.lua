local local_repo_path = nil

local has_local_repo, local_repo = pcall(require,"local_repo")
if has_local_repo and local_repo then
  local_repo_path = require("local_repo").plugins
end

print("local repo path: " .. local_repo_path)

function isDevelop ()
  if local_repo then
      return "true"
  end

  return nil
end

function dirPath (plugin)
  if local_repo then
      return local_repo_path .. plugin
  end

  return nil
end

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
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  -- better escape
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    opts = {}
  },

  {
    "nvchad/nvcommunity",
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
    "rcarriga/nvim-notify",
    lazy = false,
    config = function(_, _)
      vim.notify = require('notify')
    end
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
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
    dev = isDevelop(),
    dir = dirPath("nvim-treesitter/nvim-treesitter")
  },

  {
    'L3MON4D3/LuaSnip',
    dev = isDevelop(),
    dir = dirPath("L3MON4D3/LuaSnip")
  },


  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = require "configs.gitsigns",
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require "configs.lint"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    opts = {}
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    -- config = function()
    --   require("leap").add_default_mappings(true)
    -- end,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = "Trouble"
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {}
  },

  -- Git branch viewer
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },

  -- Markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true,
    cmd = { "RenderMarkdown"},
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}

return plugins

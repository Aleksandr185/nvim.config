
local has_local_repo, local_repo = pcall(require,"local_repo")

print("local repo: " .. tostring(local_repo))
print("has local repo: " .. tostring(has_local_repo))

if has_local_repo and local_repo then
  print("local repo found")
  local_repo = {}
  local_repo["lazy"] = require("local_repo").lazy
else
  print("local repo not found")
  local_repo = {}
  local_repo["lazy"] = "https://github.com/folke/lazy.nvim.git"
end

print("repo path: " .. local_repo["lazy"])
  

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = local_repo["lazy"]
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
vim.schedule(function()
  require "mappings"
end)

vim.o.guifont='JetBrainsMono NFM:h11'

require("lint").linters_by_ft = {
  cmake = {"cmakelint"},
  python = {"pflake8"},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

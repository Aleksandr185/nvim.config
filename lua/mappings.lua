require "nvchad.mappings"


-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>db", "<cmd>:DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line"} )
map("n", "<leader>dr", ":DapContinue <CR>", { desc = "Start or continue the debugger"} )

map("n", "<leader>td", ":TodoTelescope <CR>", { desc = "telescope TODO list"} )
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Gitsigns
local wk = require("which-key")
wk.add(
  {
    {"<leader>gs", group = "Gitsigns", icon = ""},
    {"<leader>gsd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "gitsigns toggle deleted", mode = "n", icon = ""},
    {"<leader>gsw", "<cmd>Gitsigns toggle_word_diff<CR>", desc = "gitsigns toggle word diff", mode = "n", icon = ""},
    {"<leader>gsl", "<cmd>Gitsigns toggle_linehl<CR>", desc = "gitsigns toggle line highlight", mode = "n", icon = ""},
    {"<leader>gss", "<cmd>Gitsigns toggle_signs<CR>", desc = "gitsigns toggle signs", mode = "n", icon = ""},
    {"<leader>gsn", "<cmd>Gitsigns toggle_numhl<CR>", desc = "gitsigns toggle number highlight", mode = "n", icon = ""},
    {"<leader>gsb", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "gitsigns toggle current line blame", mode = "n", icon = ""}
  }
)

-- Leap (current window)
map({'n', 'x', 'o'}, 's', '<Plug>(leap)')

wk.add(
  {
    {"<leader>rm", group = "RenderMarkdown"},
    {"<leader>rmy", "<cmd>RenderMarkdown buf_enable <CR>", desc = "RenderMarkdown buff On"},
    {"<leader>rmn", "<cmd>RenderMarkdown buf_disable <CR>", desc = "RenderMarkdown buff Off"},
    {"<leader>rmt", "<cmd>RenderMarkdown buf_toggle <CR>", desc = "RenderMarkdown buff toggle"},
  }
)

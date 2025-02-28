require "nvchad.mappings"


-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>db", "<cmd>:DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line"} )
map("n", "<leader>dr", ":DapContinue <CR>", { desc = "Start or continue the debugger"} )

map("n", "<leader>td", ":TodoTelescope <CR>", { desc = "telescope TODO list"} )
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

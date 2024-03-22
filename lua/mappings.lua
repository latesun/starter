require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "tt", "<cmd> SymbolsOutline <CR>", { desc = "Toggle tagbar" })
map("n", "f", "<cmd> HopChar1 <CR>", { desc = "Easy motion with a char" })
map("n", "ss", "<cmd> HopChar2 <CR>", { desc = "Easy motion with two chars" })
map("n", "*", "*<cmd> lua require('hlslens').start() <CR>")
map("n", "#", "#<cmd> lua require('hlslens').start() <CR>")
map("n", "g*", "g*<cmd> lua require('hlslens').start() <CR>")
map("n", "g#", "g#<cmd> lua require('hlslens').start() <CR>")

map({ "n", "i", "v" }, "<leader>w", "<cmd> w <CR><ESC>")
map({ "n", "i", "v" }, "<leader>wa", "<cmd> wa <CR><ESC>")
map("n", "<leader>l", "<cmd> Lazy <CR>")
map("n", "<leader>m", "<cmd> Mason <CR>")
map("n", "<leader>k", "<cmd> Interestingwords --toggle <CR>")
map("n", "<leader>K", "<cmd> Interestingwords --remove_all <CR>")
map("n", "<leader>a", "<cmd> Dashboard <CR>")
map("n", "<leader>td", "<cmd> TodoTelescope <CR>", { desc = "Display todolist" })

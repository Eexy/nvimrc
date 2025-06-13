vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)



local conform = require "conform"
vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")
vim.keymap.set("n", "<C-a>h", "<C-w>h")
vim.keymap.set("n", "<C-a>l", "<C-w>l")
vim.keymap.set("n", "<F3>", conform.format)
vim.keymap.set("n", "gd", "<C-]>")
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)

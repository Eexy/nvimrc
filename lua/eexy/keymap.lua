vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", "<cmd>:Oil --float<Cr>")



local conform = require "conform"
vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")
vim.keymap.set("n", "<C-a>h", "<C-w>h")
vim.keymap.set("n", "<C-a>l", "<C-w>l")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "gd", "<C-]>")
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
vim.keymap.set("n", "<S-l>", "<cmd>:bnext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>:bprevious<CR>")

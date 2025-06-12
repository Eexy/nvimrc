vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)



vim.keymap.set("n", "<leader>w", "<cmd>:w<CR>")
vim.keymap.set("n", "<F3>", vim.lsp.buf.format)
vim.keymap.set("n", "gd", "<C-]>")
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)

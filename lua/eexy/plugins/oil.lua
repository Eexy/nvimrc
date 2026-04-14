return {
    'stevearc/oil.nvim',
    lazy = false,
    config = function()
        require("oil").setup()
        vim.keymap.set("n", "<leader>pv", "<cmd>:Oil<Cr>")
    end
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    main = "nvim-treesitter",
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    },
    config = function()
        require("nvim-treesitter").install({
            "vimdoc", "javascript", "typescript", "c", "lua", "rust",
            "jsdoc", "bash", "markdown", "markdown_inline",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(ev)
                local ok = pcall(vim.treesitter.start, ev.buf)
                if ok then
                    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })

        require("nvim-treesitter-textobjects").setup({
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                },
            },
        })

        vim.treesitter.language.register("templ", "templ")
    end
}

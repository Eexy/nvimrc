return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
        require("fzf-lua").setup({
            "hide"
        })

        local builtin = require("fzf-lua")

        -- search file in directory
        -- search file in directory
        vim.keymap.set('n', '<leader>ff', builtin.files, {})
        -- search file that are tracked by git
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        --search word under cursor
        vim.keymap.set('n', '<leader>fw', builtin.grep_cword)
        vim.keymap.set('n', '<leader>fv', builtin.grep_visual)


        -- search for gitignore files
        vim.keymap.set("n", "<leader>fi", function()
            local opts = {
                -- The command to run, which lists ignored files
                --
                fd_opts = [[ --type f --no-ignore --hidden --exclude node_modules --exclude .git]],
                -- Show the path relative to the git root
            }
            -- Call the generic Telescope finder with our command
            builtin.files(opts)
        end)


        vim.keymap.set('n', "<leader>fb", builtin.buffers, {})
        vim.keymap.set('n', "<leader>fy", builtin.lsp_document_symbols, {})
        vim.keymap.set('n', "<leader>fwy", builtin.lsp_workspace_symbols, {})
        vim.keymap.set('n', "<leader>fm", builtin.marks)
        vim.keymap.set('n', "<leader>fx", builtin.diagnostics_document)
        vim.keymap.set('n', "<leader>fwx", builtin.diagnostics_workspace)


        -- open input and search with telescope
        vim.keymap.set('n', '<leader>fs', builtin.live_grep)
    end
}

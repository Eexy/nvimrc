return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local actions = require("telescope.actions")
        local utils = require("telescope.utils")

        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<S-v>"] = actions.select_vertical,
                        ["<S-x>"] = actions.select_horizontal,
                    }
                },
            },
            pickers = {
                find_files = {
                    find_command = { 'fd', '--type', 'f' },
                }
            }
        })

        local builtin = require('telescope.builtin')

        -- search file in directory
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        -- search file that are tracked by git
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        --search word under cursor
        vim.keymap.set('n', '<leader>fw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        -- search for gitignore files
        vim.keymap.set("n", "<leader>fi", function()
            local opts = {
                -- The command to run, which lists ignored files
                --
                find_command = { 'fd', '--type', 'f', '--no-ignore', '--hidden' },
                -- Show the path relative to the git root
            }
            -- Call the generic Telescope finder with our command
            builtin.find_files(opts)
        end)


        vim.keymap.set('n', "<leader>fb", builtin.buffers, {})
        vim.keymap.set('n', "<leader>fy", builtin.lsp_document_symbols, {})
        vim.keymap.set('n', "<leader>fwy", builtin.lsp_workspace_symbols, {})
        vim.keymap.set('n', "<leader>fm", builtin.marks)

        -- open input and search with telescope
        vim.keymap.set('n', '<leader>fs', builtin.live_grep)
    end
}

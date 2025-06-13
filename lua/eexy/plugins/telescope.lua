return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local actions = require("telescope.actions")

        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<S-v>"] = actions.select_vertical,
                        ["<S-x>"] = actions.select_horizontal,

                    }
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

        vim.keymap.set('n', "<leader>fb", builtin.buffers, {})
        vim.keymap.set('n', "<leader>fm", builtin.marks)

        -- open input and search with telescope
        vim.keymap.set('n', '<leader>fs', function()
            builtin.grep_string()
        end)
    end
}

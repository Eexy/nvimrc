return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        picker = {
            -- your picker configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    config = function()
        local snacks = require('snacks')

        vim.keymap.set('n', '<leader>ff', snacks.picker.files, { desc = 'Snacks find files' })
        vim.keymap.set('n', '<leader>fb', snacks.picker.buffers, { desc = 'Snscks buffers' })
        vim.keymap.set('n', '<leader>fl', snacks.picker.lines, { desc = 'Snscks buffers' })
        vim.keymap.set('n', '<leader>fs', snacks.picker.grep_word, { desc = 'Snack find word undercursor' })
        vim.keymap.set('n', '<leader>fw', snacks.picker.grep, { desc = 'Snack live grep' })
        vim.keymap.set('n', '<leader>gy', snacks.picker.lsp_symbols, { desc = 'Snack symbols' })
        vim.keymap.set('n', '<leader>gr', snacks.picker.lsp_references, { desc = 'Snack reference' })
        vim.keymap.set('n', '<leader>gt', snacks.picker.lsp_type_definitions, { desc = 'Snack type implementation' })
        vim.keymap.set('n', '<leader>fi', function()
            snacks.picker.files({
                hidden = true,
                ignored = true
            })
        end, { desc = 'Snacks find hidden files' })

        -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        -- vim.keymap.set('n', '<leader>fwb', builtin.current_buffer_fuzzy_find,
        --     { desc = 'Telescope search in current buffer' })
    end

}

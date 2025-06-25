return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettier", "biome", stop_after_first = true },
                typescript = { "prettier", "biome", stop_after_first = true },
                vue = { "prettier", "biome", stop_after_first = true },
                markdown = { "prettier", "biome", stop_after_first = true },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            formatters = {
                prettier = {
                    prepend_args = {
                        "--print-width",
                        "80",
                        "--tab-width",
                        "4",
                        "--config-precedence",
                        "prefer-file",
                    }
                }
            }

        })
        local conform = require("conform")
        vim.keymap.set("n", "<F3>", function() conform.format({ async = true, lsp_fallback = true }) end)
    end
}

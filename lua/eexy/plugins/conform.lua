return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettierd", "prettier", "biome", stop_after_first = true },
                json = { "prettierd", "prettier", "biome", stop_after_first = true },
                typescript = { "prettierd", "prettier", "biome", stop_after_first = true },
                vue = { "prettierd", "prettier", "biome", stop_after_first = true },
                markdown = { "prettierd", "prettier", "biome", stop_after_first = true },
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

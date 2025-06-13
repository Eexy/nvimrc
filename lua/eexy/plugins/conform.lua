return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettierd", "prettier", "biome", stop_after_first = true },
                typescript = { "prettierd", "prettier", "biome", stop_after_first = true },
                vue = { "prettierd", "prettier", "biome", stop_after_first = true },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end
}

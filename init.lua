require("eexy")

vim.lsp.enable('lua-language-server')
vim.lsp.enable('typescript-language-server')
vim.lsp.enable('biome')
vim.lsp.enable('tailwind-language-server')
vim.lsp.enable('vscode-eslint-language-server')
vim.lsp.enable('rust-analyzer')
vim.lsp.enable('marksman')
vim.lsp.enable('gopls')

local vue_language_server_path = vim.fn.stdpath('data') ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}

vim.lsp.config('vtsls', {
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    vue_plugin,
                },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

vim.lsp.enable('vue-language-server')
vim.lsp.enable('vtsls')

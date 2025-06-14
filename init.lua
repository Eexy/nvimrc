require("eexy")

vim.lsp.config("lua-language-server", {
    on_attach = function()
        print("hello lua")
    end,
})

vim.lsp.config("typescript-language-server", {
    on_attach = function()
        print("hello TS")
    end,
})

vim.lsp.config('vue-language-server', {
    on_attach = function()
        print("hello vue")
    end,
})


vim.lsp.config('tailwind-language-server', {
    on_attach = function()
        print("hello tailwind")
    end,
})


vim.lsp.config('biome', {
    on_attach = function()
        print("hello biome")
    end,
})

vim.lsp.config('vscode-eslint-language-server', {
    on_attach = function()
        print("hello eslint")
    end,
})


vim.lsp.enable('lua-language-server')
vim.lsp.enable('typescript-language-server')
vim.lsp.enable('vue-language-server')
vim.lsp.enable('biome')
vim.lsp.enable('tailwind-language-server')
vim.lsp.enable('vscode-eslint-language-server')

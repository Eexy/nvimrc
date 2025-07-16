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


vim.lsp.config('pyright', {
    on_attach = function()
        print("hello pyright")
    end,
})


vim.lsp.config('clangd', {
    on_attach = function()
        print("hello clangd")
    end,
})




vim.lsp.config('biome', {
    on_attach = function()
        print("hello biome")
    end,
})


vim.lsp.config('marksman', {
    on_attach = function()
        print("hello marksman")
    end,
})

vim.lsp.config('vscode-eslint-language-server', {
    on_attach = function()
        print("hello eslint")
    end,
})


vim.lsp.config('rust-analyzer', {
    on_attach = function()
        print("hello rust")
    end,
})


vim.lsp.enable('lua-language-server')
vim.lsp.enable('typescript-language-server')
vim.lsp.enable('vue-language-server')
vim.lsp.enable('biome')
vim.lsp.enable('tailwind-language-server')
vim.lsp.enable('vscode-eslint-language-server')
vim.lsp.enable('rust-analyzer')
vim.lsp.enable('marksman')
vim.lsp.enable('pyright')

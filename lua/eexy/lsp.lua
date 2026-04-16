local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
    '/vue-language-server' .. '/node_modules/@vue/language-server'

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

local lsp_dir = vim.fn.stdpath('config') .. '/lsp'
for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
    local name = file:match('(.+)%.lua$')
    if name then
        if name == 'vue-language-server' then
            vim.lsp.enable({ 'vtsls', 'vue-language-server' })
        elseif name ~= 'vtsls' then
            vim.lsp.enable(name)
        end
    end
end

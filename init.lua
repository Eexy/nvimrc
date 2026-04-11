require("eexy")

vim.filetype.add({
  pattern = {
    ['%.gitlab%-ci%.ya?ml'] = 'yaml.gitlab',
    ['.*docker%-compose%.ya?ml'] = 'yaml.docker-compose',
        ['.*docker%-compose%..*%.ya?ml'] = 'yaml.docker-compose',
  },
})

vim.lsp.enable('lua-language-server')
vim.lsp.enable('tailwind-language-server')
vim.lsp.enable('vscode-eslint-language-server')
vim.lsp.enable('rust-analyzer')
vim.lsp.enable('gitlab-ci-ls')
vim.lsp.enable('docker-compose-language-service')

local vue_language_server_path = vim.fn.stdpath('data') ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
    name = '@vue/typescript-plugin',
    location = vue_language_server_path,
    languages = { 'vue' },
    configNamespace = 'typescript',
}

vim.lsp.config(
    'vtsls', {
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
 }
)

-- vim.lsp.enable('typescript-language-server')
vim.lsp.enable('vtsls')
vim.lsp.enable('vue-language-server')

if vim.env.ZELLIJ ~= nil then 
    vim.fn.system({"zellij", "action", "switch-mode", "locked"})
end

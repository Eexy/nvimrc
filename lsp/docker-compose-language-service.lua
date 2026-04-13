vim.filetype.add({
  pattern = {
    ['.*docker%-compose%.ya?ml'] = 'yaml.docker-compose',
    ['.*docker%-compose%..*%.ya?ml'] = 'yaml.docker-compose',
  },
})

---@type vim.lsp.Config
return {
  cmd = { 'docker-compose-langserver', '--stdio' },
  filetypes = { 'yaml.docker-compose' },
  root_markers = { 'docker-compose.yaml', 'docker-compose.yml', 'compose.yaml', 'compose.yml' },
}

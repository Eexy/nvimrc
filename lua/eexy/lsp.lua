local lsp_dir = vim.fn.stdpath('config') .. '/lsp'
for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
    local name = file:match('(.+)%.lua$')
    if name then
        vim.lsp.enable(name)
    end
end

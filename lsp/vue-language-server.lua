---@brief
---
--- https://github.com/vuejs/language-tools/tree/master/packages/language-server
---
--- The official language server for Vue
---
--- It can be installed via npm:
--- ```sh
--- npm install -g @vue/language-server
--- ```
---
--- The language server only supports Vue 3 projects by default.
--- For Vue 2 projects, [additional configuration](https://github.com/vuejs/language-tools/blob/master/extensions/vscode/README.md?plain=1#L19) are required.
---
--- The Vue language server works in "hybrid mode" that exclusively manages the CSS/HTML sections.
--- You need the `vtsls` server with the `@vue/typescript-plugin` plugin to support TypeScript in `.vue` files.
--- See `vtsls` section and https://github.com/vuejs/language-tools/wiki/Neovim for more information.
---
--- NOTE: Since v3.0.0, the Vue Language Server [no longer supports takeover mode](https://github.com/vuejs/language-tools/pull/5248).

---@type vim.lsp.Config
return {
    cmd = { 'vue-language-server', '--stdio' },
    filetypes = { 'vue' },
    root_markers = { 'package.json' },
    on_init = function(client)
        ---@param _ lsp.ResponseError
        ---@param result any
        ---@param context lsp.HandlerContext
        client.handlers['tsserver/request'] = function(_, result, context)
            -- retries are per-request so multiple concurrent requests don't exhaust a shared counter
            local retries = 0

            local function try()
                local ts_client = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'ts_ls' })[1]
                    or vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })[1]
                    or vim.lsp.get_clients({ bufnr = context.bufnr, name = 'typescript-tools' })[1]

                if not ts_client then
                    if retries <= 50 then
                        retries = retries + 1
                        vim.defer_fn(try, 100)
                    else
                        vim.notify(
                            'Could not find `ts_ls`, `vtsls`, or `typescript-tools` lsp client required by `vue_ls`.',
                            vim.log.levels.ERROR
                        )
                    end
                    return
                end

                local param = unpack(result)
                local id, command, payload = unpack(param)
                ts_client:exec_cmd({
                    title = 'vue_request_forward',
                    command = 'typescript.tsserverRequest',
                    arguments = { command, payload },
                }, { bufnr = context.bufnr }, function(_, r)
                    local response_data = { { id, r and r.body } }
                    ---@diagnostic disable-next-line: param-type-mismatch
                    client:notify('tsserver/response', response_data)
                end)
            end

            try()
        end
    end,
}

if vim.env.ZELLIJ ~= nil then
    vim.fn.system({ "zellij", "action", "switch-mode", "locked" })
end

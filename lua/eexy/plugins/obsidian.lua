return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    event = {
        "BufReadPre ~/Documents/vault/*.md",
        "BufNewFile ~/Documents/vault/*.md",
    },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        'saghen/blink.cmp'
        -- see above for full list of optional dependencies ☝️
    },
    ---@module 'obsidian'
    ---@type obsidian.config
    config = function()
        require("obsidian").setup({

            workspaces = {
                {
                    name = "personal",
                    path = "~/Documents/vault",
                },
            },

            completion = {
                blink = true,
            },
            picker = {
                name = "telescope.nvim"
            },
            disable_frontmatter = true,
        })
    end
}

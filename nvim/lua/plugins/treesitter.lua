return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local treesitter_settings = require("nvim-treesitter.configs")
        treesitter_settings.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                -- Default parsers
                "cpp",
                "dockerfile",
            },
            sync_install = false,
            auto_install = false,
            highlight = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
            },
        })
    end,
}

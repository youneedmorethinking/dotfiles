return {
    "catppuccin/nvim",
    config = function()
        local catppuccin = require("catppuccin")
        catppuccin.setup({})
        vim.cmd("colorscheme catppuccin-mocha")
    end,
}

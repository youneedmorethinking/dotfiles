return {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
        open_mapping = [[<C-\>]],
    },
    keys = {
        {
            [[<C-\>]],
            "<cmd>ToggleTerm<CR>",
            desc = "Open a terminal",
            silent = true,
        },
    },
}

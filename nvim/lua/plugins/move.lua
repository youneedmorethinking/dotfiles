return {
    "fedepujol/move.nvim",
    opts = {},
    keys = {
        {
            "<C-j>",
            ":MoveLine(1)<CR>",
            desc = "Move the current line down",
            silent = true,
        },
        {
            "<C-k>",
            ":MoveLine(-1)<CR>",
            desc = "Move the current line up",
            silent = true,
        },
        {
            "<C-j>",
            ":MoveBlock(1)<CR>",
            mode = "v",
            desc = "Move the block down",
            silent = true,
        },
        {
            "<C-k>",
            ":MoveBlock(-1)<CR>",
            mode = "v",
            desc = "Move the block up",
            silent = true,
        },
    },
}

return {
    "lewis6991/gitsigns.nvim",
    opts = function()
        local wk = require("which-key")
        return {
            on_attach = function()
                wk.add({
                    {
                        "<leader>hn",
                        ":Gitsigns next_hunk<CR>",
                        desc = "Go to next hunk.",
                    },
                    {
                        "<leader>hp",
                        ":Gitsigns prev_hunk<CR>",
                        desc = "Go to previous hunk.",
                    },
                    {
                        "<leader>hs",
                        ":Gitsigns stage_hunk<CR>",
                        desc = "Stage hunk",
                    },
                    {
                        "<leader>hr",
                        ":Gitsigns reset_hunk<CR>",
                        desc = "Reset hunk",
                    },
                    {
                        "<leader>hu",
                        ":Gitsigns undo_stage_hunk<CR>",
                        desc = "Undo staging the hunk",
                    },
                    {
                        "<leader>bs",
                        ":Gitsigns stage_buffer<CR>",
                        desc = "Stage current buffer",
                    },
                    {
                        "<leader>br",
                        ":Gitsigns reset_buffer<CR>",
                        desc = "Reset current buffer",
                    },
                    {
                        "<leader>tb",
                        ":Gitsigns toggle_current_line_blame<CR>",
                        desc = "Toggle information about line",
                    },
                })
            end,
        }
    end,
}

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        {
            "s1n7ax/nvim-window-picker",
            version = "2.*",
            opts = {
                autoselect_one = false,
                include_current = false,
                filter_rules = {
                    bo = {
                        filetype = { "neo-tree", "neo-tree-popup", "notify" },
                        buftype = { "terminal", "quickfix" },
                    },
                },
                other_win_hl_color = "#e35e4f",
            },
        },
    },
    opts = {
        source_selector = {
            winbar = true,
        },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
    },
    keys = {
        {
            "<leader>nf",
            ":Neotree toggle<CR>",
            desc = "Open the filesystem",
            silent = true,
        },
        {
            "<leader>nb",
            ":Neotree toggle buffers<CR>",
            desc = "Open the list of opened buffers",
            silent = true,
        },
        {
            "<leader>ng",
            ":Neotree toggle git_status<CR>",
            desc = "Open the list of git changes in root directory",
            silent = true,
        },
    },
}

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>ff",
            "<cmd>Telescope find_files<CR>",
            desc = "Telescope find files",
        },
        {
            "<leader>fw",
            "<cmd>Telescope live_grep<CR>",
            desc = "Telescope live grep",
        },
        {
            "<leader>fb",
            "<cmd>Telescope buffers<CR>",
            desc = "Find among open buffers",
        },
        {
            "<leader>fh",
            "<cmd>Telescope help_tags<CR>",
            desc = "Telescope find tags",
        },
        {
            "<leader>fgb",
            "<cmd>Telescope git_branches<CR>",
            desc = "Telescope find git branches",
        },
        {
            "<leaderfgc",
            "<cmd>Telescope git_commits<CR>",
            desc = "Telescope find git commits",
        },
        {
            "<leader>fgs",
            "<cmd>Telescope git_status<CR>",
            desc = "Telescope find git status",
        },
        {
            "<leader>fls",
            "<cmd>Telescope lsp_document_cymnols<CR>",
            desc = "Telescope find LSP document symbols",
        },
    },
}

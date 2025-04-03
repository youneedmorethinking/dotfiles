return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        return {
            sections = {
                lualine_b = { "branch", "diff" },
                lualine_c = {
                    "lsp_status",
                    {
                        "diagnostics",
                        sources = { "nvim_diagnostic" },
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = " ",
                        },
                    },
                },
                lualine_x = {},
                lualine_y = { "filetype" },
                lualine_z = { "progress", "%l:%c" },
            },
            tabline = {
                lualine_a = { "buffers" },
                lualine_z = { "tabs" },
            },
        }
    end,
}

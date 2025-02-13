return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        local clients_lsp = function()
            local bufnr = vim.api.nvim_get_current_buf()
            local clients = vim.lsp.buf_get_clients(bufnr)
            if next(clients) == nil then
                return ""
            end
            local c = {}
            for _, client in pairs(clients) do
                table.insert(c, client.name)
            end
            return "\u{f085} " .. table.concat(c, "|")
        end
        return {
            refresh = {
                statusline = 100,
                tabline = 1000,
                winbar = 1000,
            },
            sections = {
                lualine_b = { "branch", "diff" },
                lualine_c = {
                    clients_lsp,
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

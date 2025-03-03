return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")
        local mason_path = vim.fn.stdpath("data") .. "/mason/bin/"
        local function has_formatter_config(formatter_name, config_files)
            local current_file = vim.fn.expand("%:p")
            if current_file == "" then
                return false
            end
            local dir = vim.fn.fnamemodify(current_file, ":h")
            while dir ~= "/" do
                for _, config_file in ipairs(config_files) do
                    local config_path = dir .. "/" .. config_file
                    if vim.fn.filereadable(config_path) == 1 then
                        return true
                    end
                end
                local parent_dir = vim.fn.fnamemodify(dir, ":h")
                if parent_dir == dir then
                    break
                end
                dir = parent_dir
            end
            return false
        end
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                conform.format({ bufnr = args.buf })
            end,
        })
        conform.setup({
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "astyle" },
                cpp = { "astyle" },
            },
            formatters = {
                stylua = {
                    command = mason_path .. "stylua",
                    args = function(self, ctx)
                        if
                            has_formatter_config("stylua", {
                                ".stylua.toml",
                                "stylua.toml",
                            })
                        then
                            return {
                                "--search-parent-directories",
                                "$FILENAME",
                            }
                        else
                            return {
                                "--column-width=80",
                                "--indent-type=Spaces",
                                "--indent-width=4",
                                "--line-endings=Unix",
                                "$FILENAME",
                            }
                        end
                    end,
                    stdin = false,
                },
                astyle = {
                    command = "/usr/bin/astyle",
                    args = function()
                        if has_formatter_config("astyle", { ".astylerc" }) then
                            return {
                                "--project="
                                    .. vim.fn.findfile(".astylerc", ".;"),
                                "$FILENAME",
                            }
                        else
                            return {
                                "--suffix=none",
                                "--style=kr",
                                "--max-code-length=80",
                                "--break-after-logical",
                                "--pad-oper",
                                "--pad-comma",
                                "--pad-include",
                                "--pad-header",
                                "--unpad-brackets",
                                "--squeeze-ws",
                                "--align-pointer=name",
                                "--align-reference=name",
                                "$FILENAME",
                            }
                        end
                    end,
                    stdin = false,
                },
            },
        })
    end,
}

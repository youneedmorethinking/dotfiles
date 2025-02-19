return {
    "stevearc/conform.nvim",
    config = function()
        local conform = require("conform")
        local mason_path = vim.fn.stdpath("data") .. "/mason/bin/"
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
                python = {
                    "autopep8",
                    "isort",
                },
                asm = { "asmfmt" },
            },
            formatters = {
                stylua = {
                    command = mason_path .. "stylua",
                    args = {
                        "--indent-type=Spaces",
                        "$FILENAME",
                    },
                    stdin = false,
                },
                astyle = {
                    command = "/usr/bin/astyle",
                    args = {
                        "--style=kr",
                        "--max-code-length=80",
                        "--break-after-logical",
                        "--suffix=none",
                        "$FILENAME",
                    },
                    stdin = false,
                },
                autopep8 = {
                    coomand = mason_path .. "autopep8",
                    args = {
                        "-a",
                        "$FILENAME",
                    },
                    stdin = false,
                },
                isort = {
                    command = mason_path .. "isort",
                    args = { "$FILENAME" },
                    stdin = false,
                },
                asmfmt = {
                    command = mason_path .. "asmfmt",
                    args = { "-w", "$FILENAME" },
                    stdin = false,
                },
            },
        })
    end,
}

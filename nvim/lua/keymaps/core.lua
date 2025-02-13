local wk = require("which-key")

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        wk.add({
            {
                "<leader>rn",
                "<cmd>lua vim.lsp.buf.rename()<CR>",
                cond = function()
                    return client.supports_method("textDocument/rename")
                end,
                desc = "Rename via LSP",
            },
            {
                "<leader>gd",
                "<cmd>lua vim.lsp.buf.definition()<CR>",
                cond = function()
                    return client.supports_method("textDocument/definitinon")
                end,
                desc = "Go to definition via LSP",
            },
            {
                "<leader>gD",
                "<cmd>lua vim.lsp.buf.declaration()<CR>",
                cond = function()
                    return client.supports_method("textDocument/declaration")
                end,
                desc = "Go to declaration via LSP",
            },
            {
                "<leader>gi",
                "<cmd>lua vim.lsp.buf.implementation()<CR>",
                cond = function()
                    return client.supports_method("textDocument/implementation")
                end,
                desc = "Go to implementation via LSP",
            },
            {
                "<leader>sh",
                "<cmd>lua vim.lsp.buf.hover()<CR>",
                cond = function()
                    return client.supports_method("textDocument/hover")
                end,
                desc = "Show the LSP hover",
            },
            {
                "<leader>dn",
                "<cmd>lua vim.diagnostic.goto_next()<CR>",
                desc = "Go to next LSP diagnostics",
            },
            {
                "<leader>dp",
                "<cmd>lua vim.diagnostic.goto_prev()<CR>",
                desc = "Go to previous LSP diagnostics",
            },
        })
    end,
})

wk.add({
    {
        "<leader>[",
        ":bp<CR>",
        desc = "Go to next buffer",
    },
    {
        "<leader>]",
        ":bn<CR>",
        desc = "Go to previous buffer",
    },
    {
        "<leader>;",
        ":bd<CR>",
        desc = "Delete the current buffer",
    },
})

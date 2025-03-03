return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
                "/home/mark/.local/share/nvim/mason/bin/clangd",
                "--function-arg-placeholders=false",
            },
        })
    end,
}

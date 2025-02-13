-- Enable the relative line numeration
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse support and set focus on cursor
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Ignore the register on search, highlight results and don't ignore register if capital letters
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = false

-- Set mapleader
vim.g["mapleader"] = " "

-- Tabulation settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Use the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Set the autocomplete of files
vim.opt.fixeol = false

-- Built-in NeoVim's autocomplete
vim.opt.completeopt = "menuone,noselect"

-- Don't comment new lines when go with commented line
vim.cmd("autocmd BufEnter * set fo-=c fo-=r fo-=o")

-- Set default showmode
vim.opt.showmode = false

-- Set number of autocomplete options
vim.opt.pumheight = 5

-- Set block-cursor in all modes
vim.cmd("set guicursor=n-v-c-i:block")

-- Diagnostic messages
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
        },
    },
})

-- Set statusline settings
vim.cmd("set laststatus=2")

-- Built-in spell check
vim.opt.spell = false
vim.opt.spelllang = "en,ru"

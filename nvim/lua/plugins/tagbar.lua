return {
    "preservim/tagbar",
    -- dependence: ctags.
    init = function()
        local wk = require("which-key")
        wk.add({
            {
                "<leader>t",
                ":TagbarToggle<CR>",
                desc = "Open a tagbar buffer.",
            },
        })
    end,
}

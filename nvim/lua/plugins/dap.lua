return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            opts = {},
            dependencies = { "nvim-neotest/nvim-nio" },
            keys = {
                {
                    "<leader>dui",
                    function()
                        require("dapui").toggle()
                    end,
                    desc = "Toggle dapui",
                },
            },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "🛑", texthl = "", linehl = "", numhl = "" }
            )
            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = "/home/mark/.local/share/nvim/mason/bin/OpenDebugAD7",
            }
            dap.configurations.c = {
                {
                    name = "Launch file (cpptools gdb)",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = true,
                    args = function()
                        local args_str = vim.fn.input("Input args: ")
                        if args_str == "" then
                            return {}
                        else
                            return vim.split(args_str, " ")
                        end
                    end,
                    symbolLoadInfo = {
                        loadAll = false,
                    },
                },
            }
            dap.configurations.cpp = dap.configurations.c

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
        end,
        keys = {
            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                desc = "Launch new debug session or run to the next breakpoint",
            },
            {
                "<leader><F5>",
                function()
                    require("dap").terminate()
                end,
                desc = "Terminate debug session",
            },
            {
                "<F10>",
                function()
                    require("dap").step_over()
                end,
                desc = "Do the step over during debugging",
            },
            {
                "<F11>",
                function()
                    require("dap").step_into()
                end,
                desc = "Do the step into during debugging",
            },
            {
                "<leader>dro",
                function()
                    require("dap").repl.open()
                end,
                desc = "Open the dap-repl",
            },
        },
    },
    {
        "Weissle/persistent-breakpoints.nvim",
        opts = {
            load_breakpoints_event = { "BufReadPost" },
        },
        keys = {
            {
                "<F9>",
                function()
                    require("persistent-breakpoints.api").toggle_breakpoint()
                end,
                desc = "Set or delete the saved breakpoint",
            },
            {
                "<leader><F9>",
                function()
                    require("persistent-breakpoints.api").clear_all_breakpoints()
                end,
                desc = "Clear all saved breakpoints in current buffer",
            },
        },
    },
}

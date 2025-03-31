return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "igorlfs/nvim-dap-view",
            opts = {
                winbar = {
                    sections = {
                        "console",
                        "watches",
                        "exceptions",
                        "breakpoints",
                        "threads",
                        "repl",
                    },
                },
            },
            keys = {
                {
                    "<leader>dw",
                    function()
                        require("dap-view").toggle(true)
                    end,
                    desc = "Toggle dap-view window",
                },
            },
        },
        config = function()
            local dap = require("dap")
            local dv = require("dap-view")
            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "🛑", texthl = "", linehl = "", numhl = "" }
            )
            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
            }

            local default_configs = {
                cpptools = {
                    {
                        name = "Default launch file",
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
                },
            }

            local function load_debug_config(adapter_type)
                local config_file = vim.fn.input(
                    "Input JSON's filename: ",
                    vim.fn.getcwd() .. "/",
                    "file"
                )
                if vim.fn.filereadable(config_file) == 1 then
                    local config =
                        vim.fn.json_decode(vim.fn.readfile(config_file))
                    return config
                else
                    return default_configs[adapter_type]
                end
            end

            dap.configurations.c = load_debug_config("cpptools")
            dap.configurations.cpp = dap.configurations.c

            dap.listeners.before.attach["dap-view-config"] = function()
                dv.open()
            end
            dap.listeners.before.launch["dap-view-config"] = function()
                dv.open()
            end
            dap.listeners.before.event_terminated["dap-view-config"] = function()
                dv.close()
            end
            dap.listeners.before.event_exited["dap-view-config"] = function()
                dv.close()
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

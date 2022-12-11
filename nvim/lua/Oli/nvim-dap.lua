--
-- using nvim-dap-go can remove vscode-go extension
-- local dap = require("dap")
--
-- dap.adapters.go = {
--   type = 'executable';
--   command = 'node';
--   args = {'/home/oliver/GitRepositories/clone-git/vscode-go/dist/debugAdapter.js'};
-- }
-- dap.configurations.go = {
--   {
--     type = 'go';
--     name = 'Debug';
--     request = 'launch';
--     showLog = false;
--     program = "${file}";
--     dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
--   },
-- }
--
-- require("dapui").setup()
--
-- dapui auto-starts when dap starts
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- -- debug for C, Cpp, Rust
-- -- not completed
-- dap.adapters.codelldb = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = 13000 -- 💀 Use the port printed out or specified with `--port`
-- }
--
-- dap.configurations.cpp = {
--   {
--     name = "Launch file",
--     type = "codelldb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = true,
--   },
-- }
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp

-- debug for Golang
require('dap-go').setup()

require("dapui").setup()

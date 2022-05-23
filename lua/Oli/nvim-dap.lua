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

require('dap-go').setup()
require("dapui").setup()


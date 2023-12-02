local M = {
  "rcarriga/nvim-dap-ui",
  enabled = false,
  -- event = "VeryLazy",
  ft = { "go" },
  dependencies = {
    "mfussenegger/nvim-dap",
  },
}

function M.config()
  -- nvim-dap settings.
  -- local dap = require("dap")
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })

  -- vim.keymap.set("n", "<leader>dk", function()
  --   require("dap").continue()
  -- end)
  -- vim.keymap.set("n", "<leader>dl", function()
  --   require("dap").run_last()
  -- end)
  -- vim.keymap.set("n", "<leader>db", function()
  --   require("dap").toggle_breakpoint()
  -- end)

  -- nvim-dap-ui settings.
  require("dapui").setup()
end

return M

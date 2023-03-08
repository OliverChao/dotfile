local M = {
  "j-hui/fidget.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  event = "BufReadPre",
}

function M.config()
  require("fidget").setup({
    window = { blend = 50 },
    text = { spinner = "dots" },
  })
end

return M

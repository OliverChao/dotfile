local M = {
  "j-hui/fidget.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  event = "BufReadPre",
}

function M.config()
  require("fidget").setup({})
end

return M

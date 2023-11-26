local M = {
  "j-hui/fidget.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  event = "BufReadPre",
}

function M.config()
  require("fidget").setup({
    notification = {
      window = {
        winblend = 50,
        border = "none",
      },
    },
    logger = {
      -- disable logger
      level = vim.log.levels.OFF,
    },
  })
end

return M

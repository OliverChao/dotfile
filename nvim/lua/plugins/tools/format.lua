local M = {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  ft = { "lua", "go", "rust", "cpp", "c" },
  -- keys = { { '<leader>ef', '<cmd>GuardFmt<cr>', desc = 'Format current file.' } },
}

function M.config()
  require("conform").setup({
    format_on_save = {
      lsp_fallback = true,
      timeout_ms = 500,
    },
    format_after_save = {
      lsp_fallback = true,
    },
    log_level = vim.log.levels.ERROR,
    notify_on_error = true,
    formatters_by_ft = {
      lua = { "stylua" },
      go = {
        formatters = { "gofumpt", "goimports" },
        run_all_formatters = true,
      },
      rust = {
        formatters = { "rustfmt" },
      },
      cpp = { "clang_format" },

      -- Conform will use the first available formatter in the list
      javascript = { "prettier_d", "prettier" },
      -- Formatters can also be specified with additional options
      python = {
        formatters = { "isort", "black" },
        -- Run formatters one after another instead of stopping at the first success
        run_all_formatters = true,
      },
      json = {
        formatters = { "jq" },
      },
      ["*"] = { "trim_whitespace" },
    },
  })
end

return M
-- neoformat
-- return {
--   {
--     "sbdchd/neoformat",
--     ft = { "go", "rust", "cpp", "sh", "lua", "python" },
--     init = function()
--       -- neoformater
--       vim.g.neoformat_only_msg_on_error = 1
--       vim.g.neoformat_cpp_clangformat = {
--         exe = "clang-format",
--         -- args = { "-style=llvm" },
--         -- args = { "-style=Google" },
--         -- args = { '-style=microsoft' }
--         args = { "-style='{BasedOnStyle: Google, DerivePointerAlignment: false}'" },
--       }
--       -- neoformater
--       vim.cmd([[
--             augroup fmt
--               autocmd!
--               autocmd BufWritePre *.go Neoformat goimports | Neoformat gofumpt
--               autocmd BufWritePre *.rs Neoformat rustfmt
--               " autocmd BufWritePre *.c Neoformat clangformat
--               autocmd BufWritePre *.cpp Neoformat clangformat
--               autocmd BufWritePre *.cc Neoformat clangformat
--               autocmd BufWritePre *.sh Neoformat
--               autocmd BufWritePre *.lua Neoformat
--               autocmd BufWritePre *.py Neoformat
--             augroup END
--
--             let g:neoformat_only_msg_on_error = 1
--             ]])
--     end,
--   },
-- }

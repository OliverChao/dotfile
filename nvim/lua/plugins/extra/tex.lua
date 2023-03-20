return {
  {
    "lervag/vimtex",
    ft = { "tex" },
    config = function()
      -- vimtex
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_syntax_conceal_disable = 1
      -- hide warnings
      vim.g.vimtex_quickfix_open_on_warning = 0
    end,
  },
}

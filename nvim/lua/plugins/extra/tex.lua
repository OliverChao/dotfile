return {
  {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
      -- vimtex
      -- vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_view_method = "skim"
      -- Value 1 allows forward search after every successful compilation
      vim.g.vimtex_view_skim_sync = 1
      -- Value 1 allows change focus to skim after command `:VimtexView` is given
      -- vim.g.vimtex_view_skim_activate = 1
      --
      --
      -- maxos fails to support zathura
      -- vim.g.latex_view_general_viewer = "zathura"

      vim.gvimtex_quickfix_mode = 0

      vim.g.vimtex_syntax_conceal_disable = 1
      -- hide warnings
      vim.g.vimtex_quickfix_open_on_warning = 0

      vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull",
        "Overfull",
      }
    end,
  },
}

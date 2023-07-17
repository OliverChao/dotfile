return {
  {
    "phaazon/hop.nvim",
    lazy = "VeryLazy",
    keys = {
      -- all window search
      {
        "f",
        "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.START })<cr>",
        mode = { "n", "x" },
      },

      -- current line search
      {
        "t",
        "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>",
        mode = { "n", "x" },
      },

      -- go to lines
      {
        "<space>l",
        "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.START })<cr>",
        mode = { "n", "x" },
      },
    },
    config = true,
  },
}

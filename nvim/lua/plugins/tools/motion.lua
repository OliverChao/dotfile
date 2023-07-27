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

  { -- not used; hop works fine
    "folke/flash.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "<Space>l", mode = { "n", "x", "o" }, function()
        require("flash").jump({
          search = {
            mode = "search",
            max_length = 0,
          },
          label = { after = { 0, 0 } },
          pattern = "^",
          mode = {
          }
        })
      end },
      { "f",     mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "F",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,     desc = "Toggle Flash Search" },
    },
  },
}

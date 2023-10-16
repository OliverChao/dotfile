return {
  {
    "preservim/tagbar",
    -- ft = { "markdown", "go", "lua", "rust" },
    cmd = "TagbarToggle",
    keys = {
      { "<F4>", "<cmd>TagbarToggle<CR>" },
    },
    init = function()
      -- tagbar
      vim.g.tagbar_width = 30
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = {
      "SymbolsOutline",
      "SymbolsOutlineOpen",
      "SymbolsOutlineClose",
    },
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      highlight_hovered_item = true,
      show_guides = true,
      auto_preview = false,
      position = "right",
      relative_width = true,
      width = 25,
      auto_close = false,
    },
    -- config = function()
    --     require("symbols-outline").setup()
    -- end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}

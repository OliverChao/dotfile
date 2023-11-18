return {
  -- {
  --   "preservim/tagbar",
  --   -- ft = { "markdown", "go", "lua", "rust" },
  --   cmd = "TagbarToggle",
  --   keys = {
  --     { "<F4>", "<cmd>TagbarToggle<CR>" },
  --   },
  --   init = function()
  --     -- tagbar
  --     vim.g.tagbar_width = 30
  --   end,
  -- },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>cs", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Options for outline guides which help show tree hierarchy of symbols
      guides = {
        enabled = true,
        markers = {
          -- It is recommended for bottom and middle markers to use the same number
          -- of characters to align all child nodes vertically.
          bottom = "╰",
          middle = "├",
          vertical = "│",
        },
      },
      preview_window = {
        border = "rounded",
      },
      keymaps = {
        fold = "h",
        unfold = "h",
        fold_toggle = "l",
        hover_symbol = "p",
      },
      symbols = {
        icons = {
          File = { icon = "󰈔", hl = "@text.uri" },
          Module = { icon = "󰆧", hl = "@namespace" },
          Namespace = { icon = "󰅪", hl = "@namespace" },
          Package = { icon = "󰏗", hl = "@namespace" },
          Class = { icon = "𝓒", hl = "@type" },
          Method = { icon = "ƒ", hl = "@method" },
          Property = { icon = "", hl = "@method" },
          Field = { icon = "󰆨", hl = "@field" },
          Constructor = { icon = "", hl = "@constructor" },
          Enum = { icon = "ℰ", hl = "@type" },
          Interface = { icon = "󰜰", hl = "@type" },
          Function = { icon = "󰊕", hl = "@function" },
          Variable = { icon = "", hl = "@constant" },
          Constant = { icon = "", hl = "@constant" },
          String = { icon = "𝓐", hl = "@string" },
          Number = { icon = "#", hl = "@number" },
          Boolean = { icon = "⊨", hl = "@boolean" },
          Array = { icon = "󰅪", hl = "@constant" },
          Object = { icon = "⦿", hl = "@type" },
          Key = { icon = "", hl = "@type" },
          Null = { icon = "NULL", hl = "@type" },
          EnumMember = { icon = "", hl = "@field" },
          Struct = { icon = "𝓢", hl = "@type" },
          Event = { icon = "🗲", hl = "@type" },
          Operator = { icon = "+", hl = "@operator" },
          TypeParameter = { icon = "𝙏", hl = "@parameter" },
          Component = { icon = "󰅴", hl = "@function" },
          Fragment = { icon = "󰅴", hl = "@constant" },
          TypeAlias = { icon = " ", hl = "@type" },
          Parameter = { icon = " ", hl = "@parameter" },
          StaticMethod = { icon = " ", hl = "@function" },
          Macro = { icon = " ", hl = "@macro" },
        },
      },
    },
  },
  -- {
  --   "simrat39/symbols-outline.nvim",
  --   enabled = false,
  --   cmd = {
  --     "SymbolsOutline",
  --     "SymbolsOutlineOpen",
  --     "SymbolsOutlineClose",
  --   },
  --   keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  --   opts = {
  --     highlight_hovered_item = true,
  --     show_guides = true,
  --     auto_preview = false,
  --     position = "right",
  --     relative_width = true,
  --     width = 25,
  --     auto_close = false,
  --   },
  --   -- config = function()
  --   --     require("symbols-outline").setup()
  --   -- end,
  -- },
  {
    "stevearc/aerial.nvim",
    cmd = {
      "AerialToggle",
    },
    keys = { { "<leader>aa", "<cmd>AerialToggle<cr>", desc = "Symbols Outline" } },
    opts = {
      filter_kind = false,
      -- backends = { "lsp", "treesitter" },
    },
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
}

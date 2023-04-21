return {
  {
    "yanskun/gotests.nvim",
    cmd = { "GoTests", "GoTestsAll" },
    config = function()
      require("gotests").setup()
    end,
  },
  {
    -- go implement tool
    "edolphin-ydf/goimpl.nvim",
    dir = "~/dotfile/nvim/lua/local/goimpl.nvim/",
    dev = true,

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
    keys = {
      {
        "<leader>im",
        [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
        { noremap = true, silent = true },
        desc = "Golang impl",
      },
    },
    config = function()
      require("telescope").load_extension("goimpl")
    end,
  },
}

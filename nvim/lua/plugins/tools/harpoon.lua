return {
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    -- enabled = false,
    keys = {
      {
        "<leader>ma",
        function()
          require("harpoon.mark").add_file()
          vim.notify("Harpoon Mark File")
        end,
      },
      {
        "<leader>mm",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("harpoon").setup()
      require("telescope").load_extension("harpoon")
    end,
  },
}

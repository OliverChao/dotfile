return {
  {
    "ThePrimeagen/harpoon",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("harpoon").setup()
      require("telescope").load_extension("harpoon")
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    enabled = false,
    dependencies = {
      -- you'll need at least one of these
      { "nvim-telescope/telescope.nvim" },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end,
  },
  {
    -- not used
    "ahmedkhalf/project.nvim",
    enabled = false,
    config = function()
      require("project_nvim").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
  {
    -- vscode winbar, not needed, nvim-navic is enough
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    enabled = false,
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },
  {
    "narutoxy/silicon.lua",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local silicon = require("silicon")
      silicon.setup({})
      -- Generate image of lines in a visual selection
      vim.keymap.set("v", "<Leader>sv", function()
        silicon.visualise_api()
      end)
      -- Generate image of a whole buffer, with lines in a visual selection highlighted
      vim.keymap.set("v", "<Leader>sb", function()
        silicon.visualise_api({ to_clip = true, show_buf = true })
      end)
      -- Generate visible portion of a buffer
      vim.keymap.set("n", "<Leader>sv", function()
        silicon.visualise_api({ to_clip = true, visible = true })
      end)
      -- Generate current buffer line in normal mode
      vim.keymap.set("n", "<Leader>sb", function()
        silicon.visualise_api({ to_clip = true })
      end)
    end,
  },
}

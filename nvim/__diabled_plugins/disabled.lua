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
    opts = { -- configurations go here
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
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        go = { "golangcilint" },
      }
    end,
  },
  {
    "gaoDean/autolist.nvim",
    enabled = false,
    ft = {
      "markdown",
      "tex",
      "plaintex",
    },
    config = function()
      local autolist = require("autolist")
      autolist.setup()
      autolist.create_mapping_hook("i", "<CR>", autolist.new)
      autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
      autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
      autolist.create_mapping_hook("n", "o", autolist.new)
      autolist.create_mapping_hook("n", "O", autolist.new_before)
      autolist.create_mapping_hook("n", ">>", autolist.indent)
      autolist.create_mapping_hook("n", "<<", autolist.indent)
      autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
      autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
      vim.api.nvim_create_autocmd("TextChanged", {
        pattern = "*",
        callback = function()
          vim.cmd.normal({ autolist.force_recalculate(nil, nil), bang = false })
        end,
      })
    end,
  },
}

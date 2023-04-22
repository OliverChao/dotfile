--  ╭──────────────────────────────────────╮
--  │          Plugins for Golang          │
--  ╰──────────────────────────────────────╯
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
    -- dir = "~/dotfile/nvim/lua/local/goimpl.nvim/",
    -- dev = true,

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
  {
    -- golang debug
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    ft = "go",
    config = function()
      require("dap-go").setup({
        -- Additional dap configurations can be added.
        -- dap_configurations accepts a list of tables where each entry
        -- represents a dap configuration. For more details do:
        -- :help dap-configuration
        dap_configurations = {
          {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        -- delve configurations
        delve = {
          -- time to wait for delve to initialize the debug session.
          -- default to 20 seconds
          initialize_timeout_sec = 20,
          -- a string that defines the port to start delve debugger.
          -- default to string "${port}" which instructs nvim-dap
          -- to start the process in a random available port
          port = "${port}",
        },
      })
    end,
  },
}

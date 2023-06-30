return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("util").on_attach(function(client, buffer)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    -- opts = {
    --   separator = " ",
    --   highlight = true,
    --   depth_limit = 5,
    --   icons = {
    --     File = "󰈙 ",
    --     Module = " ",
    --     Namespace = "󰌗 ",
    --     Package = " ",
    --     Class = "󰌗 ",
    --     Method = "󰆧 ",
    --     Property = " ",
    --     Field = " ",
    --     Constructor = " ",
    --     Enum = "󰕘",
    --     Interface = "󰕘",
    --     Function = "󰊕 ",
    --     Variable = "󰆧 ",
    --     Constant = "󰏿 ",
    --     String = "󰀬 ",
    --     Number = "󰎠 ",
    --     Boolean = "◩ ",
    --     Array = "󰅪 ",
    --     Object = "󰅩 ",
    --     Key = "󰌋 ",
    --     Null = "󰟢 ",
    --     EnumMember = " ",
    --     Struct = "󰌗 ",
    --     Event = " ",
    --     Operator = "󰆕 ",
    --     TypeParameter = "󰊄 ",
    --   },
    -- },
  },
}

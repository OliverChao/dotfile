local M = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  vim.keymap.set("n", "<c-f>", "<cmd>NeoTreeFocusToggle<cr>", { desc = "neo-tree focus toggle" })
  vim.keymap.set("n", "<c-d>", "<cmd>NeoTreeFloatToggle<cr>", { desc = "neo-tree float toggle" })

  vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

  vim.g.neo_tree_remove_legacy_commands = 1
  require("neo-tree").setup({
    popup_border_style = "rounded",
    window = {
      -- position = "float",
      width = 25,
      mappings = {
        ["<space>"] = "none",
        ["<cr>"] = "focus_preview",
        ["l"] = "open",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "",
        highlight = "NeoTreeFileIcon",
      },
    },
    filesystem = {
      -- follow_current_file = true,
      window = {
        mappings = {
          ["I"] = "toggle_hidden",
          ["H"] = "none",
        },
      },
    },
  })
end

return M

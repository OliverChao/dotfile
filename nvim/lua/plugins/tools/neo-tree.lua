local M = {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
  end,
}

function M.config()
  vim.keymap.set("n", "<c-f>", "<cmd>Neotree focus toggle left<cr>", { desc = "neo-tree focus toggle" })
  vim.keymap.set("n", "<c-d>", "<cmd>Neotree float toggle reveal<cr>", { desc = "neo-tree float toggle" })

  vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
  vim.fn.sign_define("DiagnosticSignHint", { text = " ", texthl = "DiagnosticSignHint" })

  require("neo-tree").setup({
    popup_border_style = "rounded",
    window = {
      -- position = "float",
      width = 25,
      mappings = {
        ["<space>"] = "none",
        ["<cr>"] = "open",
        ["l"] = "open",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["e"] = "expand_all_nodes",
        ["<ESC>"] = "close_window",
      },
    },
    default_component_configs = {
      indent = {
        indent_marker = "│",
        last_indent_marker = "╰",
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
      git_status = {
        symbols = {
          -- Change type
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "", -- this can only be used in the git_status source
          renamed = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "◌",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },

    filesystem = {
      -- follow_current_file = true,
      hijack_netrw_behavior = "open_current",
      window = {
        mappings = {
          ["I"] = "toggle_hidden",
          ["H"] = "none",
          -- Open file without losing sidebar focus
          ["o"] = function(state)
            state.commands["open"](state)
            vim.cmd("Neotree reveal")
          end,
          ["w"] = "system_open",
          ["/"] = false,
          ["f"] = "fuzzy_finder",
          ["[c"] = "prev_git_modified",
          ["]c"] = "next_git_modified",
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          -- macos:
          -- vim.api.nvim_command("silent !open -g " .. path)
          -- Linux: open file in default application
          vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
        end,
      },
    },
  })
end

return M

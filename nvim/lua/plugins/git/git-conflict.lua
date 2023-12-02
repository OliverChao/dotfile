local M = {
  "akinsho/git-conflict.nvim",
  -- enabled = false,
  -- event = "BufReadPre",
  cmd = {
    "GitConflictRefresh",
  },
  -- keys = {
  --   { "[x", "<Plug>(git-conflict-prev-conflict)" },
  --   { "]x", "<Plug>(git-conflict-next-conflict)" },
  --   { "<leader>c1", "<Plug>(git-conflict-ours)", desc = "[git-conflict] select ours" },
  --   { "<leader>c2", "<Plug>(git-conflict-theirs)", desc = "[git-conflict] select theirs" },
  --   { "<leader>c3", "<Plug>(git-conflict-both)", desc = "[git-conflict] select both" },
  --   { "<leader>c0", "<Plug>(git-conflict-none)", desc = "[git-conflict] select none" },
  -- },
  opts = {
    default_mappings = false, -- disable buffer local mapping created by this plugin
    default_commands = true, -- disable commands created by this plugin
    disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
    list_opener = "copen", -- command or function to open the conflicts list
    highlights = { -- They must have background color, otherwise the default color will be used
      incoming = "DiffAdd",
      current = "DiffAdd",
      -- current = "DiffText",
    },
  },
}

function M.config(_, opts)
  require("git-conflict").setup(opts)
  vim.keymap.set("n", "<leader>c1", "<Plug>(git-conflict-ours)")
  vim.keymap.set("n", "<leader>c2", "<Plug>(git-conflict-theirs)")
  vim.keymap.set("n", "<leader>c3", "<Plug>(git-conflict-both)")
  vim.keymap.set("n", "<leader>c0", "<Plug>(git-conflict-none)")
  vim.keymap.set("n", "[x", "<Plug>(git-conflict-prev-conflict)")
  vim.keymap.set("n", "]x", "<Plug>(git-conflict-next-conflict)")
end

return M

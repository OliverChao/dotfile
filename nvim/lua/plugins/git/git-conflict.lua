local M = {
  "akinsho/git-conflict.nvim",
  event = "BufReadPre",
  keys = {
    { "[x", "<Plug>(git-conflict-prev-conflict)" },
    { "]x", "<Plug>(git-conflict-next-conflict)" },
    { "<leader>c1", "<Plug>(git-conflict-ours)", desc = "[git-conflict] select ours" },
    { "<leader>c2", "<Plug>(git-conflict-theirs)", desc = "[git-conflict] select theirs" },
    { "<leader>c3", "<Plug>(git-conflict-both)", desc = "[git-conflict] select both" },
    { "<leader>c0", "<Plug>(git-conflict-none)", desc = "[git-conflict] select none" },
  },
}

function M.config()
  require("git-conflict").setup({
    default_mappings = false, -- disable buffer local mapping created by this plugin
    default_commands = true, -- disable commands created by this plugin
    disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
    highlights = { -- They must have background color, otherwise the default color will be used
      -- incoming = 'DiffText',
      incoming = "DiffAdd",
      current = "DiffAdd",
    },
  })
end

return M

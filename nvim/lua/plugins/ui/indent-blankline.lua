local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPost",
}

-- version 3
function M.config()
  vim.cmd([[
    highlight BoldFont guifg=#8A8A8A guisp=#d3d3d3
  ]])

  require("ibl").setup({
    indent = {
      char = "¦",
    },
    scope = {
      enabled = true,
      char = "¦",
      show_start = false,
      show_end = false,
      highlight = {
        "BoldFont",
      },
    },
  })

  -- version 2 configuration
  -- require("ibl").setup({
  --   char = "¦",
  --   -- char = "┊",
  --   -- char = "│",
  --   context_char = "¦",
  --   space_char_blankline = " ",
  --   show_first_indent_level = false,
  --   filetype_exclude = {
  --     "startify",
  --     "dashboard",
  --     "dotooagenda",
  --     "log",
  --     "fugitive",
  --     "gitcommit",
  --     "packer",
  --     "vimwiki",
  --     -- "markdown",
  --     "json",
  --     "txt",
  --     "vista",
  --     "help",
  --     "todoist",
  --     "NvimTree",
  --     "peekaboo",
  --     "git",
  --     "TelescopePrompt",
  --     "undotree",
  --     "flutterToolsOutline",
  --     "", -- for all buffers without a file type
  --   },
  --   buftype_exclude = { "terminal", "nofile" },
  --   show_trailing_blankline_indent = true,
  --   show_current_context = true,
  --   show_current_context_start = false,
  --   context_patterns = {
  --     "class",
  --     "function",
  --     "method",
  --     "block",
  --     "list_literal",
  --     "selector",
  --     "^if",
  --     "^table",
  --     "if_statement",
  --     "while",
  --     "for",
  --   },
  -- })
end

return M

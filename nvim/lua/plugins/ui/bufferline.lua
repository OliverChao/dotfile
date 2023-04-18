local M = {
  "akinsho/bufferline.nvim",
  version = "v3.*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- 'famiu/bufdelete.nvim',
  },
  lazy = false,
}

function M.config()
  vim.keymap.set("n", "<A-1>", function()
    require("bufferline").go_to_buffer(1)
  end, {})
  vim.keymap.set("n", "<A-2>", function()
    require("bufferline").go_to_buffer(2)
  end, {})
  vim.keymap.set("n", "<A-3>", function()
    require("bufferline").go_to_buffer(3)
  end, {})
  vim.keymap.set("n", "<A-4>", function()
    require("bufferline").go_to_buffer(4)
  end, {})
  vim.keymap.set("n", "<A-5>", function()
    require("bufferline").go_to_buffer(5)
  end, {})
  vim.keymap.set("n", "<A-6>", function()
    require("bufferline").go_to_buffer(6)
  end, {})
  vim.keymap.set("n", "<A-7>", function()
    require("bufferline").go_to_buffer(7)
  end, {})
  vim.keymap.set("n", "<A-8>", function()
    require("bufferline").go_to_buffer(8)
  end, {})
  vim.keymap.set("n", "<A-9>", function()
    require("bufferline").go_to_buffer(9)
  end, {})
  -- vim.keymap.set('n', '<A-s>', '<Cmd>BufferLinePick<CR>', { silent = true })
  vim.keymap.set("n", "<A-n>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
  vim.keymap.set("n", "<A-p>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
  vim.keymap.set("n", "<A-q>", "<Cmd>bp<cr>:bd #<cr>", {})
  -- pin and close unpin
  vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<cr>", {})
  vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<cr>", {})

  --
  vim.opt.termguicolors = true
  require("bufferline.groups").builtin.pinned:with({ icon = "" })
  require("bufferline").setup({
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      -- numbers = "both", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      numbers = "none",
      close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      -- close_command = function(bufnum)
      --     require('bufdelete').bufdelete(bufnum, true)
      -- end,
      right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
      left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      -- NOTE: this plugin is designed with this icon in mind,
      -- and so changing this is NOT recommended, this is intended
      -- as an escape hatch for people who cannot bear it for whatever reason
      -- indicator_icon = '▎',
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
        -- remove extension from markdown files for example
        if buf.name:match("%.md") then
          return vim.fn.fnamemodify(buf.name, ":t:r")
        end
      end,
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
      -- diagnostics = false | "nvim_lsp" | "coc",
      -- some bugs in show errors info
      diagnostics = false,
      -- diagnostics_update_in_insert = false,
      diagnostics_update_in_insert = true,
      ---@diagnostic disable-next-line: unused-local
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "(" .. count .. ")"
      end,
      offsets = {
        -- {
        --   filetype = "NvimTree",
        --   text = "File Explorer",
        --   padding = 0,
        -- },
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          -- text_align = "left",
        },
      },
      show_buffer_icons = true,
      -- show_buffer_close_icons = true,
      show_buffer_close_icons = false,
      show_close_icon = false,
      -- show_close_icon = false,
      show_tab_indicators = true,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = true,
      always_show_bufferline = true,
      -- add custom logic
    },
    highlights = {
      fill = {
        -- the same with the background
        -- guifg = '#1d2021',
        bg = "#1d2021",
      },
      -- separator = {
      --     guifg = '#1d2021',
      --     guibg = '#1d2021',
      -- },
    },
  })
end

return M

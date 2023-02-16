local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
}

function M.config()
  require("gitsigns").setup({
    signs = {
      add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      untracked = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    -- signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    -- keymaps = {
    --   -- Default keymap options
    --   noremap = true,
    --
    --   ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"},
    --   ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"},
    --
    --   -- ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
    --   -- ['v <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
    --   -- ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
    --   -- ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
    --   -- ['v <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
    --   -- ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
    --   -- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
    --   -- ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
    --   -- ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',
    --   -- -- 自定义
    --   -- ['n <leader>gd'] = '<cmd>Gitsigns diffthis<cr>',
    --   -- ['n <leader>gw'] = '<cmd>Gitsigns toggle_word_diff<cr>',
    --   -- ['n <leader>gp'] = '<cmd>Gitsigns preview_hunk<CR>',
    --   --
    --   -- -- Text objects
    --   -- ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
    --   -- ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
    -- },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    -- current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 200,
      ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
      relative_time = true,
    },
    current_line_blame_formatter = function(name, blame_info, opts)
      if blame_info.author == name then
        blame_info.author = "You"
      end
      local text
      if blame_info.author == "Not Committed Yet" then
        text = blame_info.author
      else
        local date_time
        if opts.relative_time then
          date_time = require("gitsigns.util").get_relative_time(tonumber(blame_info["author_time"]))
        else
          date_time = os.date("%Y-%m-%d", tonumber(blame_info["author_time"]))
        end
        text = string.format(
          "%s%s, %s - %s",
          blame_info.author,
          blame_info.author_mail,
          date_time,
          -- os.date(
          --      '%Y-%m-%d',
          --      tonumber(blame_info['author_time'])),
          blame_info.summary
        )
      end
      return { { "           " .. text, "GitSignsCurrentLineBlame" } }
    end,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    yadm = {
      enable = false,
    },

    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end

      -- Navigation
      map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
      map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

      -- Actions
      -- map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
      -- map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
      -- map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
      -- map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
      -- map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
      -- map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
      -- map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
      -- map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
      -- map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
      -- map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
      -- map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
      -- map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
      -- map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

      -- Text object
      map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
      map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
  })
end

return M

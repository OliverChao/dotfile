local M = {
  "akinsho/toggleterm.nvim",
  cmd = {
    "ToggleTerm",
    "ToggleTermToggleAll",
    "TermExec",
    "ToggleTermSendVisualSelection",
  },
  keys = {
    { "<A-t>", "<Cmd>ToggleTerm<CR>", mode = { "n", "t" } },
    -- { "<leader>rr", "<CMD>lua _GO_RUN()<CR>", mode = { "n" } },
  },
}

function M.config()
  local status_ok, toggleterm = pcall(require, "toggleterm")
  if not status_ok then
    return
  end

  toggleterm.setup({
    size = function(term)
      if term.direction == "horizontal" then
        return 10
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    -- open_mapping = [[<c-/>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    -- shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "rounded", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      winblend = 3,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    winbar = {
      enabled = true,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  })

  local Terminal = require("toggleterm.terminal").Terminal

  -- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.cmd("startinsert!")
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    -- on_close = function(term)
    --   vim.cmd("Closing terminal")
    -- end,
  })

  function _LAZYGIT_TOGGLE()
    lazygit:toggle()
  end

  local go_run = Terminal:new({
    cmd = "go run .",
    -- hidden = true,
    close_on_exit = false,
    on_close = function()
      vim.notify("close terminal")
    end,
    on_exit = function()
      vim.notify("exit terminal")
    end,
  })

  function _GO_RUN()
    go_run:toggle()
  end
end

return M

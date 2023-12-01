local M = {
  "nvim-telescope/telescope.nvim",
  version = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "xiyaowong/telescope-emoji.nvim" },
    -- {
    --   "OliverChao/telescope-find-pickers.nvim",
    --   -- dir = "~/dotfile/nvim/lua/local/telescope-find-pickers.nvim/",
    --   -- dev = true,
    -- },
    {
      "OliverChao/telescope-picker-list.nvim",
      -- dir = "~/dotfile/nvim/lua/local/telescope-picker-list.nvim/",
      -- dev = true,
    },
    { "benfowler/telescope-luasnip.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },

    { "nvim-telescope/telescope-project.nvim" },
    { "rcarriga/nvim-notify" },
    -- { "ahmedkhalf/project.nvim" },
  },
  -- lazy = true,
  cmd = "Telescope",
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      {},
    },
    {
      "<leader>fl",
      function()
        require("telescope.builtin").live_grep()
      end,
      {},
    },
    { "<leader>fg", "<cmd>Telescope grep_string search=<cr>", {} },
    {
      "<leader>bb",
      function()
        require("telescope.builtin").buffers()
      end,
      {},
    },
    {
      "<leader>fm",
      function()
        require("telescope.builtin").marks()
      end,
      {},
    },
    {
      "<leader>f:",
      function()
        require("telescope.builtin").command_history()
      end,
      {},
    },
    {
      "<leader>f/",
      function()
        require("telescope.builtin").search_history()
      end,
      {},
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").registers()
      end,
      {},
    },
    {
      "<leader>fn",
      function()
        require("telescope.builtin").resume()
      end,
      {},
    },
    {
      "<leader>fh",
      function()
        require("telescope").extensions.picker_list.picker_list()
      end,
    },
    { "<leader>fp", "<cmd>Telescope project display_type=full<CR>", {} },
  },
}

function M.config()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    return
  end

  local actions = require("telescope.actions") -- only support linux
  -- telescope.load_extension "media_files"
  -- require('telescope').extensions.dap.configurations()

  telescope.setup({
    defaults = {

      prompt_prefix = "> ",
      selection_caret = " ",
      -- path_display = { "smart" },
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      -- sorting_strategy = "ascending",
      layout_strategy = "horizontal",

      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          -- prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      winblend = 0,
      color_devicons = true,
      -- use_less = true,
      -- set_env = { ["COLORTERM"] = "gruvbox" }, -- default = nil,
      -- file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      dynamic_preview_title = true,
      results_title = false,

      mappings = {
        i = {
          -- ["<C-n>"] = false,
          -- ["<C-p>"] = false,
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-e>"] = actions.close,
          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,

          ["<CR>"] = actions.select_default,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          -- ["<C-t>"] = actions.select_tab,
          ["<C-t>"] = false,

          ["PageUp"] = actions.preview_scrolling_up,
          ["PageDown"] = actions.preview_scrolling_down,
          ["<C-u>"] = false,
          ["<C-d>"] = false,
          -- ["<C-u>"] = actions.preview_scrolling_up,
          -- ["<C-d>"] = actions.preview_scrolling_down,
          -- ["<PageUp>"] = actions.results_scrolling_up,
          -- ["<PageDown>"] = actions.results_scrolling_down,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          ["<C-l>"] = false,
          -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
          -- ["<c-t>"] = trouble.open_with_trouble,
        },

        n = {
          ["<esc>"] = actions.close,
          ["q"] = actions.close,
          ["<CR>"] = actions.select_default,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          -- ["<C-t>"] = actions.select_tab,
          ["<C-t>"] = false,

          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["<c-j>"] = actions.move_selection_next,
          ["<c-k>"] = actions.move_selection_previous,
          ["H"] = actions.move_to_top,
          ["M"] = actions.move_to_middle,
          ["L"] = actions.move_to_bottom,

          ["<Down>"] = actions.move_selection_next,
          ["<Up>"] = actions.move_selection_previous,
          ["gg"] = actions.move_to_top,
          ["G"] = actions.move_to_bottom,

          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-d>"] = actions.preview_scrolling_down,

          ["PageUp"] = actions.preview_scrolling_up,
          ["PageDown"] = actions.preview_scrolling_down,
          -- ["<PageUp>"] = actions.results_scrolling_up,
          -- ["<PageDown>"] = actions.results_scrolling_down,

          ["?"] = actions.which_key,
          -- ["<c-t>"] = trouble.open_with_trouble,
        },
      },
    },
    pickers = {
      -- Default configuration for builtin pickers goes here:
      -- picker_name = {
      --   picker_config_key = value,
      --   ...
      -- } Now the picker_config_key will be applied every time you call this
      -- builtin picker
      colorscheme = { theme = "dropdown" },
      marks = { theme = "dropdown" },
      commands = { theme = "dropdown" },
      command_history = { theme = "dropdown" },
      search_history = { theme = "dropdown" },
      registers = { theme = "dropdown" },
      buffers = {
        theme = "dropdown",
        mappings = { i = { ["<c-d>"] = "delete_buffer" }, n = { ["dd"] = "delete_buffer" } },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      project = {
        theme = "dropdown",
        order_by = "asc",
        search_by = "title",
        sync_with_nvim_tree = true, -- default false
      },
      -- find_picker extensions
      picker_list = {
        opts = {
          project = { display_type = "full" },
          emoji = require("telescope.themes").get_dropdown({}),
          luasnip = require("telescope.themes").get_dropdown({}),
          notify = require("telescope.themes").get_dropdown({}),
        },
        excluded_pickers = {
          "fzf",
          "picker_list",
          "fd",
        },
        user_pickers = {
          {
            "todo-comments",
            function()
              vim.cmd([[TodoTelescope theme=dropdown]])
            end,
          },
          {
            "urlview local",
            function()
              vim.cmd([[UrlView]])
            end,
          },
          {
            "urlview lazy",
            function()
              vim.cmd([[UrlView lazy]])
            end,
          },
          {
            "harpoon",
            function()
              vim.cmd([[Telescope harpoon marks]])
            end,
          },
        },
      },
    },
  })
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("emoji")
  -- require('telescope').load_extension('bookmarks')
  require("telescope").load_extension("luasnip")
  require("telescope").load_extension("file_browser")
  -- require('telescope').load_extension('projects')
  require("telescope").load_extension("project")
  require("telescope").load_extension("notify")
  -- picker_list must be the last one
  require("telescope").load_extension("picker_list")
end

return M

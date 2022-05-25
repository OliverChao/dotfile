-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "",
    ignored = "◌",
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

local mapping_list = {
  { key = "v", action =  "vsplit" },
  { key = "s", action =  "split" },
  { key = "h", action =  "cd" },
  { key = "o", action =  "system_open" },

  { key = {"<CR>", "l", "<2-LeftMouse>"}, action = "edit" },
  { key = "e",                        action = "edit_in_place" },
  -- { key = {"O"},                          action = "edit_no_picker" },
  { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
  -- { key = "<C-v>",                        action = "vsplit" },
  -- { key = "<C-x>",                        action = "split" },
  -- NOTE: currently need no tab <25-05-22, Oliver> --
  -- { key = "<C-t>",                        action = "tabnew" },
  -- { key = "<",                            action = "prev_sibling" },
  -- { key = ">",                            action = "next_sibling" },
  { key = "P",                            action = "parent_node" },
  { key = "<BS>",                         action = "close_node" },
  { key = "<Tab>",                        action = "preview" },
  -- { key = "K",                            action = "first_sibling" },
  -- { key = "J",                            action = "last_sibling" },
  { key = "I",                            action = "toggle_git_ignored" },
  -- { key = "H",                            action = "toggle_dotfiles" },
  { key = "J",                            action = "toggle_dotfiles" },
  { key = "R",                            action = "refresh" },
  { key = "a",                            action = "create" },
  { key = "d",                            action = "remove" },
  { key = "D",                            action = "trash" },
  { key = "r",                            action = "rename" },
  { key = "<C-r>",                        action = "full_rename" },
  { key = "x",                            action = "cut" },
  { key = "c",                            action = "copy" },
  { key = "p",                            action = "paste" },
  { key = "y",                            action = "copy_name" },
  { key = "Y",                            action = "copy_path" },
  { key = "gy",                           action = "copy_absolute_path" },
  { key = "[c",                           action = "prev_git_item" },
  { key = "]c",                           action = "next_git_item" },
  { key = "-",                            action = "dir_up" },
  -- { key = "s",                            action = "system_open" },
  -- NOTE: f & F conflict with hop.nvim <25-05-22, Oliver> --
  -- { key = "f",                            action = "live_filter" },
  -- { key = "F",                            action = "clear_live_filter" },
  { key = "q",                            action = "close" },
  { key = "g?",                           action = "toggle_help" },
  { key = "W",                            action = "collapse_all" },
  -- NOTE: use fzf or telescope please <25-05-22, Oliver> --
  -- { key = "S",                            action = "search_node" },
  { key = "<C-k>",                        action = "toggle_file_info" },
  { key = ".",                            action = "run_file_command" },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
nvim_tree.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = true,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 25,
    height = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
	-- NOTE: Mapping here <25-05-22, Oliver> --
    mappings = {
	  custom_only = true,
	  list = mapping_list,
	  -- custom_only = false,
	  -- list = {
		-- { key = {"<CR>", "l", "<2-LeftMouse>"}, cb = tree_cb("edit") },
		-- { key = "v", cb = tree_cb("vsplit") },
		-- { key = "s", cb = tree_cb("split") },
		-- { key = "h", cb = tree_cb "cd" },
		-- { key = "o", cb = tree_cb("system_open") },
	  -- },
  }
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      git = false,
      profile = false,
    },
  },
} -- END_DEFAULT_OPTS


-- default mappings
-- local list = {
--   { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
--   { key = "<C-e>",                        action = "edit_in_place" },
--   { key = {"O"},                          action = "edit_no_picker" },
--   { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
--   { key = "<C-v>",                        action = "vsplit" },
--   { key = "<C-x>",                        action = "split" },
--   { key = "<C-t>",                        action = "tabnew" },
--   { key = "<",                            action = "prev_sibling" },
--   { key = ">",                            action = "next_sibling" },
--   { key = "P",                            action = "parent_node" },
--   { key = "<BS>",                         action = "close_node" },
--   { key = "<Tab>",                        action = "preview" },
--   { key = "K",                            action = "first_sibling" },
--   { key = "J",                            action = "last_sibling" },
--   { key = "I",                            action = "toggle_git_ignored" },
--   { key = "H",                            action = "toggle_dotfiles" },
--   { key = "R",                            action = "refresh" },
--   { key = "a",                            action = "create" },
--   { key = "d",                            action = "remove" },
--   { key = "D",                            action = "trash" },
--   { key = "r",                            action = "rename" },
--   { key = "<C-r>",                        action = "full_rename" },
--   { key = "x",                            action = "cut" },
--   { key = "c",                            action = "copy" },
--   { key = "p",                            action = "paste" },
--   { key = "y",                            action = "copy_name" },
--   { key = "Y",                            action = "copy_path" },
--   { key = "gy",                           action = "copy_absolute_path" },
--   { key = "[c",                           action = "prev_git_item" },
--   { key = "]c",                           action = "next_git_item" },
--   { key = "-",                            action = "dir_up" },
--   { key = "s",                            action = "system_open" },
--   { key = "f",                            action = "live_filter" },
--   { key = "F",                            action = "clear_live_filter" },
--   { key = "q",                            action = "close" },
--   { key = "g?",                           action = "toggle_help" },
--   { key = "W",                            action = "collapse_all" },
--   { key = "S",                            action = "search_node" },
--   { key = "<C-k>",                        action = "toggle_file_info" },
--   { key = ".",                            action = "run_file_command" }
-- }

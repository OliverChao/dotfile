local M = {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
}

local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1
    if not directory then
        return
    end
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

function M.config()

    -- INFO: ## nvim-tree
    vim.keymap.set('n', '<C-n>', function()
        if vim.bo.buftype == 'prompt' then
            return
        end
        require('nvim-tree.api').tree.toggle()
    end)

    local mapping_list = {
        { key = "v", action = "vsplit" },
        { key = "s", action = "split" },
        { key = "h", action = "cd" },
        { key = "o", action = "system_open" },

        { key = { "<CR>", "l", "<2-LeftMouse>" }, action = "edit" },
        { key = "e", action = "edit_in_place" },
        -- { key = {"O"},                          action = "edit_no_picker" },
        { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
        -- { key = "<C-v>",                        action = "vsplit" },
        -- { key = "<C-x>",                        action = "split" },
        -- NOTE: currently need no tab <25-05-22, Oliver> --
        -- { key = "<C-t>",                        action = "tabnew" },
        -- { key = "<",                            action = "prev_sibling" },
        -- { key = ">",                            action = "next_sibling" },
        { key = "P", action = "parent_node" },
        { key = "<BS>", action = "close_node" },
        { key = "<Tab>", action = "preview" },
        -- { key = "K",                            action = "first_sibling" },
        -- { key = "J",                            action = "last_sibling" },
        { key = "I", action = "toggle_git_ignored" },
        -- { key = "H",                            action = "toggle_dotfiles" },
        { key = "J", action = "toggle_dotfiles" },
        { key = "R", action = "refresh" },
        { key = "a", action = "create" },
        { key = "d", action = "remove" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = "<C-r>", action = "full_rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "[c", action = "prev_git_item" },
        { key = "]c", action = "next_git_item" },
        { key = "-", action = "dir_up" },
        -- { key = "s",                            action = "system_open" },
        -- NOTE: f & F conflict with hop.nvim <25-05-22, Oliver> --
        -- { key = "f",                            action = "live_filter" },
        -- { key = "F",                            action = "clear_live_filter" },
        { key = "q", action = "close" },
        { key = "g?", action = "toggle_help" },
        { key = "W", action = "collapse_all" },
        -- NOTE: use fzf or telescope please <25-05-22, Oliver> --
        -- { key = "S",                            action = "search_node" },
        { key = "<C-k>", action = "toggle_file_info" },
        { key = ".", action = "run_file_command" },
    }

    require 'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
        auto_reload_on_write = true,
        create_in_closed_folder = false,
        disable_netrw = false,
        hijack_cursor = false,
        hijack_netrw = true,
        hijack_unnamed_buffer_when_opening = false,
        sort_by = "name",
        update_cwd = false,
        reload_on_bufenter = false,
        respect_buf_cwd = false,
        view = {
            width = 25,
            hide_root_folder = false,
            side = "left",
            preserve_window_proportions = false,
            number = false,
            relativenumber = false,
            signcolumn = "yes",
            mappings = {
                custom_only = true,
                list = mapping_list,
            },
            float = {
                enable = false,
                open_win_config = {
                    relative = "editor",
                    border = "rounded",
                    width = 30,
                    height = 30,
                    row = 1,
                    col = 1,
                },
            },
        },
        renderer = {
            add_trailing = false,
            group_empty = false,
            highlight_git = false,
            highlight_opened_files = "none",
            root_folder_modifier = ":~",
            indent_markers = {
                enable = false,
                icons = {
                    corner = "└ ",
                    edge = "│ ",
                    none = "  ",
                },
            },
            icons = {
                webdev_colors = true,
                git_placement = "before",
                padding = " ",
                symlink_arrow = " ➛ ",
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "",
                        deleted = "",
                        ignored = "◌",
                    },
                },
            },
            special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        },
        hijack_directories = {
            enable = true,
            auto_open = true,
        },
        update_focused_file = {
            enable = false,
            update_cwd = false,
            ignore_list = {},
        },
        ignore_ft_on_setup = {},
        system_open = {
            cmd = "",
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
            use_system_clipboard = true,
            change_dir = {
                enable = true,
                global = false,
                restrict_above_cwd = false,
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
        live_filter = {
            prefix = "[FILTER]: ",
            always_show_folders = true,
        },
        log = {
            enable = false,
            truncate = false,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                diagnostics = false,
                git = false,
                profile = false,
            },
        },
    } -- END_DEFAULT_OPTS
end

return M

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"
-- only support linux
-- telescope.load_extension "media_files"
-- require('telescope').extensions.dap.configurations()

telescope.setup {
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
        -- border = {},
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- borderchars = {
        --   prompt = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
        --   results = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
        --   preview = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
        -- },
        -- borderchars = {
        --   prompt = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
        --   results = { ' ', '▐', '▄', '▌', '▌', '▐', '▟', '▙' };
        --   preview = { '▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙' };
        -- },
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
                ["<C-n>"] = false,
                ["<C-p>"] = false,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-e>"] = actions.close,
                --
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

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
                ["<C-l>"] = actions.complete_tag,
                -- ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                -- ["<c-t>"] = trouble.open_with_trouble,
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                -- ["?"] = actions.which_key,
                -- ["<c-t>"] = trouble.open_with_trouble,
            },

        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
        --   media_files = {
        --     -- filetypes whitelist
        --     -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        --     filetypes = { "png", "webp", "jpg", "jpeg" },
        --     find_cmd = "rg", -- find command (defaults to `fd`)
        --   },
    },
}
require('telescope').load_extension('fzf')

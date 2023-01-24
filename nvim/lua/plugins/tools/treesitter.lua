local M = {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    -- event = "BufReadPost",
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'RRethy/nvim-treesitter-textsubjects',
        'nvim-treesitter/playground',
    },
}

function M.config()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
        return
    end

    configs.setup({
        -- ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = { "go", "rust", "vim", "lua", "help" },
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = { "" }, -- List of parsers to ignore installing
        highlight = {
            -- use_languagetree = true,
            enable = true, -- false will disable the whole extension
            -- disable = { "css", "html" }, -- list of language that will be disabled
            disable = { "css" }, -- list of language that will be disabled
            additional_vim_regex_highlighting = false,
        },
        autopairs = {
            enable = true,
        },
        indent = { enable = false, disable = { "yaml", "python", "css" } },
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
        autotag = {
            enable = true,
            disable = { "xml" },
        },
        rainbow = {
            enable = true,
            colors = {
                "Gold",
                "Orchid",
                "DodgerBlue",
                -- "Cornsilk",
                -- "Salmon",
                -- "LawnGreen",
            },
            disable = { "html" },
        },
        playground = {
            enable = true,
        },

        textobjects = {
            select = {
                enable = true,

                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]]"] = "@function.outer",
                },
                -- goto_next_end = {
                --   ["]M"] = "@function.outer",
                --   ["]["] = "@class.outer"
                -- },
                goto_previous_start = {
                    ["[["] = "@function.outer",
                },
                -- goto_previous_end = {
                --   ["[M"] = "@function.outer",
                --   ["[]"] = "@class.outer"
                -- }
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>sn"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>sN"] = "@parameter.inner",
                },
            },

        },
        textsubjects = {
            enable = true,
            -- prev_selection = ',', -- (Optional) keymap to select the previous selection
            keymaps = {
                ['.'] = 'textsubjects-smart',
                -- [';'] = 'textsubjects-container-outer',
                -- ['i;'] = 'textsubjects-container-inner',
            },
        },
    })
end

return M

return {

    { ---- colorscheme.
        "sainnhe/gruvbox-material",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
            vim.o.background = "dark"

            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_better_performance = 1
            vim.g.gruvbox_material_diagnostic_text_highlight = 1
            vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
            vim.g.gruvbox_material_sign_column_background = 'none'
            vim.cmd([[  
            colorscheme gruvbox-material 
            ]])

            vim.cmd([[ 
            " 颜色方案, 参考 AGou 方案
            hi Comment cterm=NONE ctermfg=245 gui=NONE guifg=#928374
            hi GitSignsCurrentLineBlame ctermfg=245 gui=italic guifg=#928374

            " 如果喜欢可以吧 一些特殊关键字 设为斜体
            " hi TSKeyword ctermfg=167 gui=italic guifg=#ea6962
            " hi TSKeywordFunction ctermfg=167 gui=italic guifg=#ea6962
            " hi TSConditional ctermfg=167 gui=italic guifg=#ea6962
            hi TSKeyword ctermfg=167 guifg=#ea6962
            hi TSKeywordFunction ctermfg=167 guifg=#ea6962
            hi TSConditional ctermfg=167 guifg=#ea6962
            hi TreesitterContext ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#3c3836
            " hi InclineNormal ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
            hi lualine_c_inactive ctermfg=223 ctermbg=237 gui=italic guifg=#ddc7a1 guibg=#3c3836
            hi Pmenu ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021
            " lsp hover cololrscheme
            hi FloatBorder  ctermfg=142 guifg=#a9b665 guibg=#1E2021
            hi NormalFloat ctermfg=223 ctermbg=237 guifg=#ddc7a1 guibg=#1E2021

            " symbol-outline
            " hi FocusedSymbol guifg=#ea6962

            " Spectre
            hi SpectreReplace guibg=#e41749
            ]])

            -- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
            -- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

            -- go tree-sitter highlight
            vim.cmd([[
            autocmd FileType go hi @type.definition ctermfg=1
            ]])

        end
    },
    {
        -- Yep
        "catppuccin/nvim", name = "catppuccin",
        -- lazy = true,
        opts = {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            no_italic = true,
        },
    },
    {
        -- Yep
        'rmehri01/onenord.nvim',
    },
    {
        'rose-pine/neovim', name = 'rose-pine',
        -- lazy = true,
        opts = {
            --- @usage 'main' | 'moon'
            dark_variant = 'main',
            bold_vert_split = false,
            dim_nc_background = false,
            disable_background = false,
            disable_float_background = false,
            disable_italics = true,

        },
    },
    {
        -- Yep
        'folke/tokyonight.nvim',
        lazy = true,
        opts = function()
            return {
                style = "night",
                transparent = true,
                styles = {
                    comments = { italic = false },
                    keywords = { italic = false },
                    functions = {},
                    variables = {},
                    sidebars = "transparent",
                    floats = "transparent",
                },
                sidebars = {
                    "qf",
                    "vista_kind",
                    "terminal",
                    "spectre_panel",
                    "startuptime",
                    "Outline",
                    "NvimTree",
                },
                on_highlights = function(hl, c)
                    hl.CursorLineNr = { fg = c.orange, bold = true }
                    hl.LineNr = { fg = c.orange, bold = true }
                    hl.LineNrAbove = { fg = c.fg_gutter }
                    hl.LineNrBelow = { fg = c.fg_gutter }
                    -- local prompt = "#2d3149"
                    -- hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
                    -- hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
                    -- hl.TelescopePromptNormal = { bg = prompt }
                    -- hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
                    -- hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
                    -- hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
                    -- hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
                end,
            }
        end
    },
    {
        -- black & white
        "mcchrish/zenbones.nvim",
        lazy = true,
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = {
            "rktjmp/lush.nvim",
        }
    },
    {
        -- green
        "sainnhe/everforest",
        lazy = true,
        config = function()
            -- https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
            vim.o.background = "dark"

            vim.g.everforest_background = 'hard'
            vim.g.everforest_better_performance = 1
            vim.g.everforest_diagnostic_text_highlight = 1
            vim.g.everforest_diagnostic_virtual_text = "colored"
            vim.g.everforest_sign_column_background = 'none'
        end
    },
}

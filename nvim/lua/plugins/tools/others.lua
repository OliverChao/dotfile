return {
    {
        'norcalli/nvim-colorizer.lua',
        event = "BufReadPre",
        config = function() require 'colorizer'.setup() end
    },
    {
        "skywind3000/asyncrun.vim",
        -- ft = { "go", "lua", "rust" },
        cmd = { "AsyncRun", "AsyncStop", "AsyncReset" },
        init = function()
            vim.g.asyncrun_open = 6
            vim.g.asyncrun_stdin = 1
        end
    },
    {
        "preservim/tagbar",
        -- ft = { "markdown", "go", "lua", "rust" },
        cmd = "TagbarToggle",
        keys = {
            { "<F4>", "<cmd>TagbarToggle<CR>" }
        },
        init = function()
            -- tagbar
            vim.g.tagbar_width = 30
        end
    },
    {
        "mg979/vim-visual-multi",
        -- lazy = false,
        event = "BufReadPre",
        init = function()
            vim.cmd([[
            " let g:VM_mouse_mappings = 1
            let g:VM_theme = 'ocean'
            let g:VM_highlight_matches = 'underline'

            let g:VM_maps = {}
            let g:VM_maps['Find Under']         = '<A-f>'           
            let g:VM_maps['Find Subword Under'] = '<A-f>'           
            " let g:VM_maps['Select All']         = '<A-a>'
            let g:VM_maps['Select h']           = '<A-Left>'
            let g:VM_maps['Select l']           = '<A-Right>'
            let g:VM_maps['Add Cursor Up']      = '<A-e>'
            let g:VM_maps['Add Cursor Down']    = '<A-d>'
            let g:VM_maps['Add Cursor At Pos']  = '<A-z>'
            " let g:VM_maps['Add Cursor At Word'] = '<A-g>'
            let g:VM_maps['Remove Region']      = 'q'
            ]])
        end
    },
    {
        'mbbill/undotree',
        cmd = "UndotreeToggle",
        keys = {
            { "<F5>", "<cmd>UndotreeToggle<CR>", { silent = true, noremap = true } }
        },
        init = function()
            vim.g.undotree_WindowLayout = 3
        end
    },
    {
        'godlygeek/tabular',
        cmd = "Tabularize",
    },
    {
        'voldikss/vim-floaterm',
        init = function()
            -- vim-floaterm
            vim.g.floaterm_keymap_toggle = '<Leader>t'
            vim.g.floaterm_width = 0.9
            vim.g.floaterm_height = 0.9
        end
    },
    {
        "sbdchd/neoformat",
        ft = { "go", "rust", "cpp", "sh" },
        init = function()
            -- neoformater
            vim.g.neoformat_only_msg_on_error = 1
            vim.g.neoformat_cpp_clangformat = {
                exe = 'clang-format',
                args = { '-style=llvm' }
                -- args = { '-style=microsoft' }
            }
            -- neoformater
            vim.cmd([[
            augroup fmt
              autocmd!
              autocmd BufWritePre *.go Neoformat goimports | Neoformat gofumpt
              autocmd BufWritePre *.rs Neoformat rustfmt
              autocmd BufWritePre *.cpp Neoformat clangformat 
              autocmd BufWritePre *.sh Neoformat
            augroup END

            let g:neoformat_only_msg_on_error = 1
            ]])
        end
    },
    {
        "LudoPinelli/comment-box.nvim",
        cmd = { "CBlbox", "CBclbox", "CBcbox", "CBccbox", "CBalbox", "CBaclbox", "CBacbox", "CBaccbox" },
        config = function()
            require('comment-box').setup({
                doc_width = 50, -- width of the document
                box_width = 30, -- width of the boxes
                line_width = 50, -- width of the lines
            })
        end
    },
    {
        'nvim-pack/nvim-spectre',
        cmd = "Spectre",
        config = function()
            --  ╭──────────────────────────────────────────────────────────╮
            --  │ https://github.com/nvim-pack/nvim-spectre#customize      │
            --  ╰──────────────────────────────────────────────────────────╯
            vim.cmd([[
            hi SpectreReplace guibg=#e41749
            ]])
            require('spectre').setup({
                line_sep_start = '╭─────────────────────────────────────────────',
                result_padding = '│ ',
                line_sep       = '╰─────────────────────────────────────────────',
                highlight      = {
                    ui = "String",
                    search = "DiffText",
                    replace = "SpectreReplace"
                },
            })
        end

    },
    {
        "danymat/neogen",
        cmd = "Neogen",
        config = function()
            require('neogen').setup({
                snippet_engine = "luasnip",
                enabled = true, --if you want to disable Neogen
                input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
            })
        end
    },
    {
        -- extends %
        'andymass/vim-matchup',
        setup = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    },
}

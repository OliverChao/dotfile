return {
    { "folke/lazy.nvim", version = false },
    { ---- colorscheme.
        "sainnhe/gruvbox-material",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- https://github.com/sainnhe/gruvbox-material/blob/master/doc/gruvbox-material.txt
            vim.o.termguicolors = true
            vim.o.background = "dark"

            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_better_performance = 1
            vim.g.gruvbox_material_diagnostic_text_highlight = 1
            vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
            vim.g.gruvbox_material_sign_column_background = 'none'
            vim.cmd([[  
            colorscheme gruvbox-material 
            ]])
        end
    },
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function() vim.g.startuptime_tries = 10 end
    },
    {
        "sbdchd/neoformat",
        ft = { "go", "rust", "cpp", "sh" },
        config = function()
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
        'norcalli/nvim-colorizer.lua',
        event = "VeryLazy",
    },
    {
        "skywind3000/asyncrun.vim",
        ft = { "go", "lua", "rust" }
    },
    {
        "preservim/tagbar",
        ft = { "markdown", "go", "lua", "rust" },
        config = function()
            -- tagbar
            vim.g.tagbar_width = 30
            vim.cmd([[
            let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                    \ 'p:package',
                    \ 'i:imports:1',
                    \ 'c:constants',
                    \ 'v:variables',
                    \ 't:types',
                    \ 'n:interfaces',
                    \ 'w:fields',
                    \ 'e:embedded',
                    \ 'm:methods',
                    \ 'r:constructor',
                    \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                    \ 't' : 'ctype',
                    \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                    \ 'ctype' : 't',
                    \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
            \ }
            ]])
        end
    },
    {
        "mg979/vim-visual-multi",
        lazy = false,
        config = function()
            -- " ========= vim-visual-multi settings ==========
            vim.cmd([[
            let g:VM_maps = {}
            let g:VM_maps['Find Under']         = '<F2>'           " replace C-n
            let g:VM_maps['Find Subword Under'] = '<F2>'           " replace visual C-n
            ]])
            vim.g.VM_mouse_mappings = 1
            vim.g.VM_highlight_matches = 'underline'
            vim.g.VM_theme = 'iceblue'
            vim.keymap.set('n', '<CR>', '<CR>', {})
        end
    },
    {
        'mbbill/undotree',
    },
    {
        'preservim/tagbar'
    },
    {
        'godlygeek/tabular'
    },
    {
        'voldikss/vim-floaterm'
    },
    {
        'lervag/vimtex'
    },
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        config = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" }
    },
    {
        'plasticboy/vim-markdown',
    }
}

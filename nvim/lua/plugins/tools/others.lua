return {
    {
        'norcalli/nvim-colorizer.lua',
        event = "VeryLazy",
        config = function() require 'colorizer'.setup() end
    },
    {
        "skywind3000/asyncrun.vim",
        ft = { "go", "lua", "rust" },
        config = function()
            vim.g.asyncrun_open = 6
            vim.g.asyncrun_stdin = 1
        end
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
    -- {
    --     "mg979/vim-visual-multi",
    --     lazy = false,
    --     config = function()
    --         -- " ========= vim-visual-multi settings ==========
    --         vim.cmd([[
    --         let g:VM_maps = {}
    --         let g:VM_maps['Find Under']         = '<F2>'           " replace C-n
    --         let g:VM_maps['Find Subword Under'] = '<F2>'           " replace visual C-n
    --         ]])
    --         vim.g.VM_mouse_mappings = 1
    --         vim.g.VM_highlight_matches = 'underline'
    --         vim.g.VM_theme = 'iceblue'
    --         vim.keymap.set('n', '<CR>', '<CR>', {})
    --     end
    -- },
    {
        'mbbill/undotree', config = function() vim.g.undotree_WindowLayout = 3 end
    },
    {
        'godlygeek/tabular'
    },
    { 'voldikss/vim-floaterm', },
    {
        "sbdchd/neoformat",
        ft = { "go", "rust", "cpp", "sh" },
        config = function()
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
}

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
}

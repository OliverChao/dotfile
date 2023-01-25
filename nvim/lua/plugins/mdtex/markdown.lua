return {
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        config = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_conceal = 0
            vim.g.tex_conceal = ""
            vim.g.vim_markdown_math = 1
            vim.g.vim_markdown_conceal_code_blocks = 0

            vim.g.mkdp_auto_close = 0
            vim.g.madp_theme = 'dark'
        end,
        ft = { "markdown" },
    },
    {
        'plasticboy/vim-markdown',
        ft = { "markdown" }
    },
    {
        'askfiy/nvim-picgo',
        ft = { "markdown" },
        config = function() require('nvim-picgo').setup {} end
    }

}

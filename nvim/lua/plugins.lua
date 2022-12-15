local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require('packer')
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
    }
}
return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    -- " ========= colorscheme here. ==========
    use 'sainnhe/gruvbox-material'
    -- " ========= appearence/performance here. ==========
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'dstein64/vim-startuptime'
    use 'nathom/filetype.nvim'
    use 'lewis6991/impatient.nvim'
    use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }
    use 'arkav/lualine-lsp-progress'

    -- " ========= useful tools here. ==========
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    --
    -- use 'itchyny/vim-cursorword'
    -- use 'nyngwang/murmur.lua'
    -- use 'xiyaowong/nvim-cursorword'
    use 'yamatsum/nvim-cursorline'

    use { 'kevinhwang91/nvim-hlslens', commit = "e820ce6" }
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    }
    use 'mg979/vim-visual-multi'
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use 'mbbill/undotree'
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'xiyaowong/telescope-emoji.nvim'
    use 'dhruvmanila/telescope-bookmarks.nvim'
    use 'keyvchan/telescope-find-pickers.nvim'
    use 'benfowler/telescope-luasnip.nvim'
    use 'stevearc/dressing.nvim'

    use 'preservim/tagbar'

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use 'lewis6991/gitsigns.nvim'

    use 'windwp/nvim-autopairs'

    use 'godlygeek/tabular'
    use { "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }
    -- use {
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- }
    use { 'plasticboy/vim-markdown',
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }
    use { 'askfiy/nvim-picgo',
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
        config = function()
            require('nvim-picgo').setup {}
        end }
    use 'voldikss/vim-floaterm'

    use 'rlue/vim-barbaric'

    use 'kylechui/nvim-surround'

    use 'mattn/webapi-vim'

    use 'sbdchd/neoformat'

    use 'kevinhwang91/promise-async'
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
    use {
        "danymat/neogen",
        requires = "nvim-treesitter/nvim-treesitter",
        -- Uncomment next line if you want to follow only stable versions
        tag = "*"
    }
    use 'kevinhwang91/nvim-bqf'

    use 'lukas-reineke/indent-blankline.nvim'

    use 'norcalli/nvim-colorizer.lua'

    -- " ========= programming tools here. ==========
    use 'williamboman/mason.nvim'
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
    }
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- use 'simrat39/rust-tools.nvim'
    use 'numToStr/Comment.nvim'

    use 'lervag/vimtex'
    use 'skywind3000/asyncrun.vim'

    use 'mfussenegger/nvim-dap'
    use 'leoluz/nvim-dap-go'
    use 'rcarriga/nvim-dap-ui'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

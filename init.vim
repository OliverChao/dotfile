" Plugin Section
call plug#begin("~/.vim/plugged")


" ========= colorscheme here. ==========
Plug 'sainnhe/gruvbox-material'
"
" ========= appearence/performance here. ==========
"
Plug 'nvim-lualine/lualine.nvim'
Plug 'dstein64/vim-startuptime'
" -- Speed up neovim
Plug 'nathom/filetype.nvim'
Plug 'lewis6991/impatient.nvim'
" Plug 'SmiteshP/nvim-gps'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
" -- show lsp progress in lualine
Plug 'arkav/lualine-lsp-progress'

" Plug 'max397574/better-escape.nvim'

" ========= useful tools here. ==========
"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
" -- quick select if, af...
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" -- show same words using underline
Plug 'itchyny/vim-cursorword'
" -- show search numbers
Plug 'kevinhwang91/nvim-hlslens'
" -- quick jump 
Plug 'phaazon/hop.nvim'
" -- docs: https://github.com/mg979/vim-visual-multi
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" -- files tree
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
" -- undotree 
Plug 'mbbill/undotree'
" -- todo, fix, warn...
Plug 'folke/todo-comments.nvim'
"
" -- using telescope instead of fzf
" Plug '~/.fzf'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
"
" -- search everyting
" Annabelle deeply into unknown regions using the power of the moon.
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'xiyaowong/telescope-emoji.nvim'
Plug 'dhruvmanila/telescope-bookmarks.nvim'
Plug 'keyvchan/telescope-find-pickers.nvim'
Plug 'benfowler/telescope-luasnip.nvim'
" Plug 'nvim-telescope/telescope-ui-select.nvim'
" -- great input&select ui
Plug 'stevearc/dressing.nvim'

Plug 'preservim/tagbar'

" -- git tools 
" Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'
Plug 'lewis6991/gitsigns.nvim'

" Plug 'tpope/vim-abolish'
"
Plug 'windwp/nvim-autopairs'

" -- tabular: 
" format tabular: https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'
"
" -- markdown tools
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'plasticboy/vim-markdown'

" -- better inner terminal
Plug 'voldikss/vim-floaterm'
" Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" -- auto switch input methods
Plug 'rlue/vim-barbaric'

" -- support surround ops
Plug 'kylechui/nvim-surround'

" -- webapi;
Plug 'mattn/webapi-vim'

" -- a formater; 
Plug 'sbdchd/neoformat'

" -- fold
Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
"
" -- quick annotation
Plug 'danymat/neogen'

" -- better quickfix window
Plug 'kevinhwang91/nvim-bqf'

" -- show indent line
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

" -- for picgo image bed
Plug 'askfiy/nvim-picgo'

" ========= programming tools here. ==========
" -- lsp-installer
Plug 'williamboman/mason.nvim'
" -- lsp & cmp configs
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
" Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig' 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
"
" -- a performant UI
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
"
" -- snippets
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" Plug 'honza/vim-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'smjonas/snippet-converter.nvim'

" -- quickly comment
" Plug 'preservim/nerdcommenter'
Plug 'numToStr/Comment.nvim'

" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'rust-lang/rust.vim'

" Plug 'simrat39/rust-tools.nvim'
Plug 'lervag/vimtex'
" -- async run a command
Plug 'skywind3000/asyncrun.vim'

" -- debug tools
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'

" Plug 'folke/trouble.nvim'
call plug#end()

lua require('core')

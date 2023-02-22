return {
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "skywind3000/asyncrun.vim",
    -- ft = { "go", "lua", "rust" },
    cmd = { "AsyncRun", "AsyncStop", "AsyncReset" },
    init = function()
      vim.g.asyncrun_open = 6
      vim.g.asyncrun_stdin = 1
    end,
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
    end,
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = {
      { "<F5>", "<cmd>UndotreeToggle<CR>", { silent = true, noremap = true } },
    },
    init = function()
      vim.g.undotree_WindowLayout = 3
    end,
  },
  {
    "godlygeek/tabular",
    cmd = "Tabularize",
  },
  {
    "voldikss/vim-floaterm",
    init = function()
      -- vim-floaterm
      vim.g.floaterm_keymap_toggle = "<Leader>t"
      vim.g.floaterm_width = 0.9
      vim.g.floaterm_height = 0.9
    end,
  },
  {
    "sbdchd/neoformat",
    ft = { "go", "rust", "cpp", "sh", "lua" },
    init = function()
      -- neoformater
      vim.g.neoformat_only_msg_on_error = 1
      vim.g.neoformat_cpp_clangformat = {
        exe = "clang-format",
        args = { "-style=llvm" },
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
              autocmd BufWritePre *.lua Neoformat
            augroup END

            let g:neoformat_only_msg_on_error = 1
            ]])
    end,
  },
  {
    "LudoPinelli/comment-box.nvim",
    cmd = { "CBlbox", "CBclbox", "CBcbox", "CBccbox", "CBalbox", "CBaclbox", "CBacbox", "CBaccbox" },
    config = function()
      require("comment-box").setup({
        doc_width = 50, -- width of the document
        box_width = 30, -- width of the boxes
        line_width = 50, -- width of the lines
      })
    end,
  },
  {
    -- search and repalce in all files
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    config = function()
      --  ╭──────────────────────────────────────────────────────────╮
      --  │ https://github.com/nvim-pack/nvim-spectre#customize      │
      --  ╰──────────────────────────────────────────────────────────╯
      vim.cmd([[
            hi SpectreReplace guibg=#e41749
            ]])
      require("spectre").setup({
        line_sep_start = "╭─────────────────────────────────────────────",
        result_padding = "│ ",
        line_sep = "╰─────────────────────────────────────────────",
        highlight = {
          ui = "String",
          search = "DiffText",
          replace = "SpectreReplace",
        },
      })
    end,
  },
  {
    -- quickly generate descriptions
    "danymat/neogen",
    cmd = "Neogen",
    config = function()
      require("neogen").setup({
        snippet_engine = "luasnip",
        enabled = true, --if you want to disable Neogen
        input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
      })
    end,
  },
  {
    -- extends %
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      -- vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
      -- vim.g.matchup_matchparen_offscreen = { method = "status" }
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    opts = { use_diagnostic_signs = true },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    },
  },
  {
    "xiyaowong/nvim-cursorword",
    lazy = false,
    init = function()
      vim.g.cursorword_disable_filetypes = { "alpha" }
      vim.g.cursorword_disable_at_startup = false
      vim.g.cursorword_min_width = 3
      vim.g.cursorword_max_width = 100
    end,
    config = function()
      vim.cmd([[
                hi default CursorWord cterm=underline gui=underline
            ]])
    end,
  },
  {
    "phaazon/hop.nvim",
    lazy = "VeryLazy",
    keys = {
      -- all window search
      {
        "f",
        "<cmd> lua require'hop'.hint_char1({ hint_position = require'hop.hint'.HintPosition.START })<cr>",
        mode = { "n", "x" },
      },

      -- current line search
      {
        "t",
        "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<cr>",
        mode = { "n", "x" },
      },

      -- go to lines
      {
        "<space>l",
        "<cmd> lua require'hop'.hint_lines({ hint_position = require'hop.hint'.HintPosition.START })<cr>",
        mode = { "n", "x" },
      },
    },
    config = true,
  },
  {
    "kylechui/nvim-surround",
    event = "BufReadPost",
    opts = {
      keymaps = {
        insert = "<C-g>s",
        insert_line = "<C-g>S",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
        delete = "ds",
        change = "cs",
      },
    },
  },
  {
    "rmagatti/goto-preview",
    opts = {
      width = 100,
      default_mappings = false,
      border = "rounded",
    },
    keys = {
      { "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>" },
      { "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>" },
      { "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>" },
    },
  },
  {
    -- split and join using treesitter
    "Wansmer/treesj",
    keys = {
      { "<space>m", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
      { "<space>j", "<cmd>TSJJoin<cr>", desc = "Join" },
      { "<space>s", "<cmd>TSJSplit<cr>", desc = "Split" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    -- structural search and replace
    "cshuaimin/ssr.nvim",
    keys = {
      {
        "<leader>sr",
        function()
          require("ssr").open()
        end,
        mode = { "n", "x" },
        desc = "Structural Replace",
      },
    },
  },
  {
    -- auto-change input method
    "h-hg/fcitx.nvim",
    lazy = false,
  },
  {
    -- zen-mode
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    dependencies = {
      "folke/twilight.nvim",
    },
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        alacritty = { enabled = false, font = "14" },
      },
      -- callback when the Zen window opens
      on_open = function()
        -- close matchup popup
        vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
      end,
      on_close = function()
        -- restart matchup popup
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
    -- keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "segeljakt/vim-silicon",
    cmd = {
      "Silicon",
    },
    init = function()
      -- vim.g.silicon = {
      --   theme = "OneHalfDark",
      --   font = "JetBrainsMonoNL Nerd Font Mono",
      --   background = "#2C2C2C",
      --   -- window-controls = false,
      -- }
      vim.cmd([[
      let g:silicon = {
        \   'theme':              'OneHalfDark',
        \   'font':               'JetBrainsMonoNL Nerd Font Mono',
        \   'background':         '#1c1e24',
        \   'pad-horiz':                 80,
        \   'pad-vert':                  100,
        \   'round-corner':          v:true,
        \   'window-controls':       v:false,
        \ }
      ]])
    end,
  },
}

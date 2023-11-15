local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  dependencies = {
    { "williamboman/mason.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },

    -- { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    {
      "folke/neodev.nvim",
      -- enabled = false,
      config = true,
    },
  },
}

function M.config()
  -- INFO: nvim lsp !!! 👻👻👻
  -- nvim lsp doc: https://neovim.io/doc/user/lsp.html nvim-lspconfig: https://github.com/neovim/nvim-lspconfig
  -- nvim-lspconfig wiki: https://github.com/neovim/nvim-lspconfig/wiki
  --
  --
  -- Lsp log level
  vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

  local nvim_lsp = require("lspconfig")

  local opts = { noremap = true, silent = true }

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  ---@diagnostic disable-next-line: unused-local
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    vim.keymap.set("n", "<space>a", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions <CR>", opts)
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    vim.keymap.set({ "n", "i", "v" }, "<A-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.keymap.set("n", "<leader>ac", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end)

    -- 使用 lsp 显示当前光标处高亮，移动光标消除高亮
    -- https://neovim.io/doc/user/lsp.html#lsp-buf
    vim.keymap.set("n", "<C-h>", "<Cmd>lua vim.lsp.buf.document_highlight()<CR>", opts)
    vim.api.nvim_create_autocmd("CursorMoved", { callback = vim.lsp.buf.clear_references })
    -- vim.cmd([[
    -- hi LspReferenceText guibg=#2E94B9
    -- hi LspReferenceRead guibg=#2E94B9
    -- hi LspReferenceWrite guibg=#2E94B9
    -- ]])
    -- NOTE: Inlay Hint
    -- vim.lsp.inlay_hint(bufnr, true)
  end

  -- nvim-cmp supports additional completion capabilities
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities()
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  -- -------------------- general settings -- --------------------
  vim.fn.sign_define(
    "DiagnosticSignError",
    { texthl = "DiagnosticSignError", text = "✘", numhl = "DiagnosticSignError" }
  )
  vim.fn.sign_define(
    "DiagnosticSignWarn",
    { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" }
  )
  vim.fn.sign_define(
    "DiagnosticSignHint",
    { texthl = "DiagnosticSignHint", text = "➤", numhl = "DiagnosticSignHint" }
  )
  -- vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = " 𝓲", numhl = "DiagnosticSignInfo" })
  --
  -- vim.diagnostic.config({
  --     signs = true,
  --     update_in_insert = false,
  --     underline = true,
  --     severity_sort = true,
  --     virtual_text = true,
  -- })

  -- lsp UI customization:
  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
  --

  -- local handlers = {
  --     ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
  --     ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
  --     ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
  --         { virtual_text = true }),
  -- }

  -- global
  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
  ---@diagnostic disable-next-line: duplicate-set-field, redefined-local
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    opts.max_width = 100
    opts.max_height = 23
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end

  -- LSP configuration
  nvim_lsp["gopls"].setup({
    -- handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern(".git", "go.mod"),
    settings = {
      gopls = {
        gofumpt = true,
        usePlaceholders = true,
        completeUnimported = true,
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        staticcheck = true,
      },
    },
    -- init_options = {
    --   usePlaceholders = true,
    --   completeUnimported = true,
    --
    --   -- gopls hints
    --   -- https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
    --   hints = {
    --     assignVariableTypes = true,
    --     compositeLiteralFields = true,
    --     compositeLiteralTypes = true,
    --     constantValues = true,
    --     functionTypeParameters = true,
    --     parameterNames = true,
    --     rangeVariableTypes = true,
    --   },
    -- },
    -- settings = {
    --   gopls = {
    --     gofumpt = true,
    --   },
    -- },
  })

  nvim_lsp["rust_analyzer"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  })

  nvim_lsp["clangd"].setup({
    on_attach = on_attach,
    filetypes = { "c", "cpp" },
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--query-driver=/usr/bin/g++",
      "--background-index",
      "--log=verbose",
    },
  })

  nvim_lsp["pyright"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- cmd = {
    --     server_binaries["pyright"],
    --     "--stdio",
    -- }
  })

  local runtime_path = vim.split(package.path, ";")
  local lus_ls_settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  }
  nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
    settings = lus_ls_settings,
    capabilities = capabilities,
  })

  -- nvim_lsp["marksman"].setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   -- cmd = {
  --   --     server_binaries["marksman"],
  --   -- }
  -- })
end

return M

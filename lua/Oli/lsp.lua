local nvim_lsp = require("lspconfig")
-- local configs = require 'lspconfig/configs'
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>a', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ac', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

-- -------------------- general settings -- -------------------- ✗
-- vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = " ", numhl = "DiagnosticSignError"})
-- vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = " ❢", numhl = "DiagnosticSignWarn" })
-- vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = " ", numhl = "DiagnosticSignHint" })
-- vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = " 𝓲", numhl = "DiagnosticSignInfo" })
-- vim.diagnostic.config({
--     signs = true,
--     update_in_insert = false,
--     underline = true,
--     severity_sort = true,
--     virtual_text = true,
-- })
--
--
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
-- local servers = { 'gopls', 'rust_analyzer'}
-- local servers = { 'gopls' }

-- use identified dir to store lsp servers
local server_root = "/home/oliver/.lsp-server/bin"
-- local server_binaries = {
--     rust_analyzer = server_root .. "/rust-analyzer",
--     clangd = server_root .. "/clangd",
--     pyright = server_root .. "/pyright-langserver",
--     sumneko_lua = server_root .. "/lua-language-server",
--     -- texlab = server_root .. "/texlab/texlab",
-- }

nvim_lsp['gopls'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = nvim_lsp.util.root_pattern('.git', 'go.mod'),
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
    },
    settings = {
        gopls = {
            gofumpt = true
        }
    }
})

nvim_lsp['rust_analyzer'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- cmd = {
    --     server_binaries["rust_analyzer"],
    -- },
})

nvim_lsp['clangd'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- cmd = {
    --     server_binaries["clangd"],
    -- }
})

nvim_lsp['pyright'].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- cmd = {
    --     server_binaries["pyright"],
    --     "--stdio",
    -- }
})

nvim_lsp['sumneko_lua'].setup({
    on_attach = on_attach,
    -- cmd = {
    --     server_binaries["sumneko_lua"],
    -- },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = {
                    "vim",
                },
                neededFileStatus = {
                    ["codestyle-check"] = "Any",
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
--
--
-- --------------------------------------------------
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--   })
-- end

-- for _, lsp in pairs(servers) do
--   require('lspconfig')[lsp].setup {
--     on_attach = on_attach,
--     flags = {
--       -- This will be the default in neovim 0.7+
--       debounce_text_changes = 150,
--     }
--   }
-- end

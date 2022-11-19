local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local luasnip = require("luasnip")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/luasnip" })


cmp.setup({
    enabled = function()
        if require("cmp.config.context").in_treesitter_capture("comment") == true
            or require("cmp.config.context").in_syntax_group("Comment")
        then
            return false
        else
            return true
        end
    end,

    preselect = cmp.PreselectMode.Item,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local lspkind_icons = {
                Text = "",
                Method = "",
                Function = "",
                Constructor = "",
                Field = "ﰠ",
                Variable = "",
                Class = "ﴯ",
                Interface = "",
                Module = "",
                Property = "ﰠ",
                Unit = "塞",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "פּ",
                Event = "",
                Operator = "",
                TypeParameter = " ",
                Robot = "ﮧ",
                Smiley = "ﲃ",
                Note = " ",

            }
            local meta_type = vim_item.kind
            -- load lspkind icons
            vim_item.kind = lspkind_icons[vim_item.kind] .. ""
            if entry.source.name == "cmp_tabnine" then
                vim_item.kind = lspkind_icons["Robot"]
                -- vim_item.kind_hl_group = "CmpItemKindTabnine"
            end

            if entry.source.name == "emoji" then
                vim_item.kind = lspkind_icons["Smiley"]
                vim_item.kind_hl_group = "CmpItemKindEmoji"
            end

            if entry.source.name == "look" then
                vim_item.kind = lspkind_icons["Note"]
                -- vim_item.kind_hl_group = "CmpItemKindEmoji"
            end
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = meta_type,
                path = "[Path]",
                luasnip = "[LuaSnip]",
                cmp_tabnine = "[TN]",
                emoji = "[Emoji]",
                look = "[Dict]",
            })[entry.source.name]

            return vim_item
        end,
    },
    mapping = {
        -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- ["<C-b>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- ["<C-f>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- ["<C-d>"] = cmp.mapping(function()
        --     cmp.close()
        -- end, { "i", "s" }),
        ["<C-n>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end,
        ["<C-p>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            -- cmp.close()
        }),
        ["<Tab>"] = function(fallback) -- see GH-231, GH-286
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end,
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     elseif has_words_before() then
        --         cmp.complete()
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
        --
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),
    },
    -- You can set mappings if you want
    -- mapping = insert_map,
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp"},
        -- { name = "cmp_tabnine", priority = 90 },
        { name = "luasnip"},
        -- { name = "path", priority = 99 },
        { name = "buffer"},
        -- { name = "emoji", priority = 50 },
        { name = "nvim_lsp_signature_help", priority = 50 },
        -- {
        --     name = "look",
        --     keyword_length = 5,
        --     max_item_count = 5,
        --     option = {
        --         convert_case = true,
        --         loud = true,
        --         --dict = '/usr/share/dict/words'
        --     },
        -- },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      -- preselect = cmp.PreselectMode.Item,
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    -- ghost_text 用了之后preview box 就无法正常使用了.
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
})

-- cmp.setup.filetype({ "TelescopePrompt" }, {
--     sources = {},
-- })
-- cmp.setup.filetype({ "vim", "markdown" }, {
--     sources = {
--         {
--             name = "look",
--             keyword_length = 5,
--             max_item_count = 5,
--             option = {
--                 convert_case = true,
--                 loud = true,
--                 --dict = '/usr/share/dict/words'
--             },
--         },
--     },
-- })

 cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
 cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

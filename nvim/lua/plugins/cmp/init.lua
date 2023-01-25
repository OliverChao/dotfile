local M = {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        'hrsh7th/cmp-cmdline',
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "saadparwaiz1/cmp_luasnip",
        'L3MON4D3/LuaSnip',
    },
}

function M.config()
    -- nvim-cmp 和 luasnip 高度配合, 放在一起配置
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
        return
    end
    -- nvim-cmp
    vim.o.completeopt = 'menuone,noinsert,noselect'
    -- Avoid showing extra messages when using completion
    vim.opt.shortmess:append('c')


    -- NOTE: ==== 设置不同节点不同表示(当前主题下颜色没有用处, 只用符号标记)
    -- https://github.com/L3MON4D3/LuaSnip/wiki/Nice-Configs#hint-node-type-with-virtual-text
    local types = require("luasnip.util.types")
    local luasnip = require("luasnip")
    -- 具体的配置参数: https://github.com/L3MON4D3/LuaSnip#config
    luasnip.config.setup({
        history = false,
        -- NOTE: 设置了region_check_events 在进入InsertMode的时候会删除snippets
        -- 这或许可以防止光标乱跳, 但是, 又或许不设置可以更好的使用? 目前设置.
        region_check_events = "InsertEnter",
        update_events = "TextChanged,TextChangedI",
        delete_check_events = "TextChanged,TextChangedI",
        -- 不同的节点 现实不同的符号, 当前主题颜色不会显示区别, 使用符号判断
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = { { "▼", "GruvboxOrange" } }
                }
            },
            [types.insertNode] = {
                active = {
                    virt_text = { { "●", "GruvboxBlue" } }
                }
            }
        },
    })

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/vs_snippets" })
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/luasnippets/" })
    -- require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/vs_snippets" })
    -- require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })


    cmp.setup({
        enabled = function()
            if vim.bo.buftype == 'prompt' then
                return false
            end

            if require("cmp.config.context").in_treesitter_capture("comment") == true
                or require("cmp.config.context").in_syntax_group("Comment")
            then
                return false
            else
                return true
            end
        end,

        preselect = cmp.PreselectMode.Item,
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
            -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            -- ["<C-y>"] = cmp.config.disable,
            -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            -- ["<C-b>"] = cmp.config.disable,
            -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            -- ["<C-f>"] = cmp.config.disable,
            ["<C-e>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            -- ["<C-d>"] = cmp.mapping(function()
            --     cmp.close()
            -- end, { "i", "s" }),
            ["<C-n>"] = cmp.mapping(function(fallback)
                if vim.bo.buftype == 'prompt' then
                    fallback()
                    return
                end
                if luasnip.choice_active() then
                    luasnip.change_choice(1)
                elseif cmp.visible() then
                    cmp.select_next_item()
                    -- elseif has_words_before() then
                    --     cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-p>"] = cmp.mapping(function(fallback)
                if vim.bo.buftype == 'prompt' then
                    fallback()
                    return
                end
                if luasnip.choice_active() then
                    luasnip.change_choice(-1)
                elseif cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<CR>"] = cmp.mapping.confirm({
                select = true,
                -- cmp.close()
            }),

            ["<c-s>"] = cmp.mapping(function(fallback)
                if luasnip.choice_active() then
                    require("luasnip.extras.select_choice")()
                else
                    fallback()
                end
            end, { "i", "s" }),

            -- ["zz"] = cmp.mapping(function(fallback)
            --     if luasnip.expandable() then
            --         luasnip.expand()
            --     else
            --         fallback()
            --     end
            -- end, { "i", "s" }),

            ["<c-j>"] = cmp.mapping(function(fallback)
                -- if luasnip.in_snippet() and luasnip.jumpable(1) then
                --     luasnip.jump(1)
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            -- -- can use <c-j> as the expand and jump trigger together
            -- ["<c-j>"] = cmp.mapping(function(fallback)
            --     if luasnip.expand_or_jumpable() then
            --         luasnip.expand_or_jump()
            --     else
            --         fallback()
            --     end
            -- end, { "i", "s" }),
            ["<c-k>"] = cmp.mapping(function(fallback)
                if luasnip.in_snippet() and luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                    -- 使用<c-j>进行jump,Tab只作为选择;<c-i>是Tab的映射,并且改不了
                    -- elseif luasnip.expand_or_jumpable() then
                    --     luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                    -- elseif luasnip.jumpable(-1) then
                    --     luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        -- the order of your sources matter (by default). That gives them priority
        -- you can configure:
        --      keyword_length
        --      priority
        --      max_item_count
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "path", priority = 99 },
            { name = "buffer", keyword_length = 3 },
            { name = "nvim_lsp_signature_help", priority = 50 },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        -- ghost_text; 与 coplit 等代码AI排斥
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
            {
                name = 'cmdline',
                option = {
                    ignore_cmds = { 'Man', '!' }
                }
            }
        })
    })
end

return M

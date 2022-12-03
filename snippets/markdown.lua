local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial
local events = require("luasnip.util.events")

local snippets = {
    -- Tag plug in hexo
    ls.s(
        { trig = "tag", name = "tag", dscr = "hexo tag plug" },
        fmt([[
            <{type} class="note note-{tagtype}">{content}</{type1}>
        ]], {
            type1   = rep(1),
            type    = ls.c(1,
                {
                    ls.t("p"),
                    ls.t("span")
                }
            ),
            tagtype = ls.c(2, {
                ls.t("primary"),
                ls.t("secondary"),
                ls.t("success"),
                ls.t("danger"),
                ls.t("warning"),
                ls.t("info"),
                ls.t("light")
            }),
            content = ls.i(0, "标签")
        })
    ),
    -- checkbox
    ls.s(
        { trig = "checkbox" },
        fmta([[
        {% cb <text>, <checked>, <incline> %}
    ]]   , {
            text = ls.i(0, "text"),
            checked = ls.i(1, "false"),
            incline = ls.i(2, "false")
        })
    )
}

ls.add_snippets("markdown", snippets)

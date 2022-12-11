local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial
local events = require("luasnip.util.events")

local snippets = {
    -- inline math
    ls.s("ma", { ls.t("$"), ls.i(0), ls.t("$") }),
    -- Tag plug in hexo
    ls.s(
        { trig = "tag", name = "tag", dscr = "hexo tag plug" },
        {
            ls.c(1, {
                fmta([[
                {% <note> <type> %}
                <content>
                {% endnote %}
                ]], {
                    note = ls.i(1, "note"),
                    type = ls.c(2, {
                        ls.t("primary"),
                        ls.t("secondary"),
                        ls.t("success"),
                        ls.t("danger"),
                        ls.t("warning"),
                        ls.t("info"),
                        ls.t("light")
                    }),
                    content = ls.i(3, "content"),
                }),
                fmta([[
                {% <label> <type> @<content> %}
                ]], {
                    label = ls.i(1, "label"),
                    type = ls.c(2, {
                        ls.t("primary"),
                        ls.t("secondary"),
                        ls.t("success"),
                        ls.t("danger"),
                        ls.t("warning"),
                        ls.t("info"),
                        ls.t("light")
                    }),
                    content = ls.i(3, "content"),
                })
            })
        }
    ),
    ls.s(
        { trig = "tag2", name = "tag", dscr = "hexo tag plug" },
        fmt([[
            <{type} class="{note} {note2}-{tagtype}">{content}</{type1}>
        ]], {
            type1   = rep(1),
            type    = ls.c(1,
                {
                    ls.t("p"),
                    ls.t("span")
                }
            ),
            note    = ls.f(function(args)
                if args[1][1] == "p" then
                    return "note"
                elseif args[1][1] == "span" then
                    return "label"
                else
                    return "no-label"
                end
            end, { 1 }),
            note2   = ls.f(function(args)
                if args[1][1] == "p" then
                    return "note"
                elseif args[1][1] == "span" then
                    return "label"
                else
                    return "no-label"
                end
            end, { 1 }),
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
    ),
    -- 灵茶每日一题tea
    ls.s(
        { trig = "lingtea", dscr = "灵茶每日一题模板" },
        fmt([[
        {}
        categories:
        - 每日一茶

        {{% note primary %}}
        题目链接: [Atcoder/Codeforces]() | [灵茶代码]()
        {{% endnote %}}

        ## 题目大意

        ```txt

        ```
        **输入**:
        ```txt

        ```
        **输出**:

        **样例**:

        ## 题解

        ## 编程技巧

        ## 代码
        <details>
        <summary>代码</summary>


        </details>
        ]], { ls.i(0) })
    ),
    -- Leetcode 每日一题
    ls.s(
        { trig = "lctea", dscr = "leetcode 每日一题模板" },
        fmt([[
        {}
        categories:
        - Leetcode

        {{% note primary %}}
        [题目链接]({}) | [第 {} 场{}周赛]({}) | [Q{}]({}) | 难度:{}
        {{% endnote %}}

        <details>
        <summary>题目描述</summary>


        </details>


        ## 题目解析

        ## 代码

        ## 总结
        ]], {
            ls.i(0),
            ls.i(1),
            ls.i(2),
            ls.c(3, { ls.t("单"), ls.t("双") }),
            ls.i(4),
            ls.c(5, { ls.t("3"), ls.t("4") }),
            ls.i(6),
            ls.i(7),
        })
    )
}

ls.add_snippets("markdown", snippets)

local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local extras = require "luasnip.extras"
local fmt = extras.fmt
local m = extras.m
local l = extras.l
local postfix = require "luasnip.extras.postfix".postfix


local function reused_func(_, _, user_arg1)
    return user_arg1
end

ls.add_snippets("all", {
    s("ternary", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
    }),
    s("trigger", {
        i(1, "First jump"),
        t(" :: "),
        sn(2, {
            i(1, "Second jump"),
            t " : ",
            i(2, "Third jump")
        })
    }),
    s("trig", {
        i(1),
        f(
            function(args, snip, user_arg_1) return user_arg_1 .. args[1][1] end,
            { 1 },
            { user_args = { "Will be appended to text from i(0)" } }
        ),
        i(0)
    }),
    s("trig2", {
        f(reused_func, {}, { user_args = { "text " } }),
        f(reused_func, {}, { user_args = { "different text" } }),
    }),
    s({ trig = "b(%d)", regTrig = true },
        f(function(args, snip) return "Captured Text: " .. snip.captures[1] .. "."
        end, {})
    ),
    s("trig3", {
        i(1, "text_of_first "),
        i(2, { "first_line_of_second", "second_line_of_second" }),
        f(function(args, snip)
            --here
            return " end"
        end, { 2, 1 })
    }),
    s("trig4", {
        i(1, "text_of_first "),
        i(2, { "first_line_of_second", "second_line_of_second", "" }),
        f(
        -- order is 2,1, not 1,2!!
            function(args, snip) return args[1][1] .. " " .. args[1][2] .. args[2][1] .. " end" end,
            { 2, 1 }
        )
    }),
    s("trig5", {
        i(1, " text_of_first "),
        i(2, { " first_line_of_second ", " second_line_of_second " }),
        f(function(args, snip)
            return args[1][1] .. args[1][2] .. args[2][1]
        end, { ai[2], ai[1] })
    }),
    postfix(".br", {
        f(function(_, parent)
            return "[" .. parent.snippet.env.POSTFIX_MATCH .. "]"
        end, {}),
    }),
    postfix(".append", {
        d(1, function(_, parent)
            a = parent.snippet.env.POSTFIX_MATCH
            b = a .. " = " .. "append(" .. a .. ", "
            return sn(nil, { t(b), i(1), t(")") })
        end)
    }),
    postfix(".brd", {
        d(1, function(_, parent)
            return sn(nil, { t("[" .. parent.env.POSTFIX_MATCH .. "]"), i(1), t("googogog") })
        end)
    }),
    s("trig6", c(1, {
        t("Ugh boring, a text node"),
        i(nil, "At least I can edit something now..."),
        f(function(args) return "Still only counts as text!!" end, {})
    }))
})

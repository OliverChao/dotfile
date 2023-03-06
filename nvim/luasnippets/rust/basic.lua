local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  -- auto finish turbofish
  ls.s(
    { trig = "(::)<", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmt(
      [[
      {}<{}>
      ]],
      { f(function(_, snip)
        return snip.captures[1]
      end), i(0) }
    )
  ),
}

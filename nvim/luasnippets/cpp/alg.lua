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
  ls.s(
    { trig = "bisearch", name = "Binary Search", dscr = "binary search just as same as Golang's" },
    fmt(
      [[
        template <typename Compare>
        int search({} n, Compare cmp) {{
          {} l = 0, r = n;
          while (l < r) {{
            auto mid = l + ((r - l) >> 1);
            if (cmp(mid)) {{
              r = mid;
            }} else {{
              l = mid + 1;
            }}
          }}
          return l;
        }}
      ]],
      { ls.c(1, {
        ls.t("int"),
        ls.t("long long"),
      }), rep(1) }
    ),
    { condition = line_begin }
  ),
}

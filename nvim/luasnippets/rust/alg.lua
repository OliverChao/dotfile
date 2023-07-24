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
  -- binary search just like golang
  ls.s(
    { trig = "bisearch", name = "Binary Search", dscr = "binary search just as same as Golang" },
    fmt(
      [[
        // search the first TRUE condition 
        fn search<F>(n: {}, f: F) -> {}
        where
            F: Fn({}) -> bool,
          {{
            let (mut l, mut r) = (0, n);
            while l < r {{
                let mid = l + ((r - l) >> 1);
                if f(mid) {{
                    r = mid;
                }} else {{
                    l = mid + 1;
                }}
            }}
            l
        }}
      ]],
      { ls.c(1, {
        ls.t("usize"),
        ls.t("i64"),
      }), rep(1), rep(1) }
    ),
    { condition = line_begin }
  ),
}

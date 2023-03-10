local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial
local events = require("luasnip.util.events")

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  -- main function
  ls.s({ trig = "main", name = "Main", dscr = "create a main function" }, fmta("func main() {\n\t<>\n}", ls.i(0))),
  -- min function
  ls.s(
    { trig = "min" },
    fmt(
      [[
        func min(a, b {}) {} {{
            if a > b {{
                return b
            }}
            return a
        }}
    ]],
      { ls.i(1, "int"), rep(1) }
    ),
    { condition = line_begin }
  ),
  -- max function
  ls.s(
    { trig = "max" },
    fmt(
      [[
        func max(a, b {}) {} {{
            if a < b {{
                return b
            }}
            return a
        }}
    ]],
      { ls.i(1, "int"), rep(1) }
    ),
    { condition = line_begin }
  ),
  ls.s(
    { trig = "abs" },
    fmt(
      [[
        {}
        func abs(a {}) {} {{
            if a < 0 {{
                return -a
            }}
            return a
        }}
    ]],
      { ls.i(0), ls.i(1, "int"), rep(1) }
    ),
    { condition = line_begin }
  ),
  -- fmt.Println("")
  ls.s("fn", fmt("fmt.Println({})", { ls.i(1, '""') })),
  -- method
  ls.s(
    "meth",
    fmta(
      [[
    func (<receiver> <type>) <method>(<s1>) <s2> {
        <finally>
    }
    ]],
      {
        receiver = ls.i(1, "receiver"),
        type = ls.i(2, "type"),
        method = ls.i(3, "method"),
        s1 = ls.i(4),
        s2 = ls.i(5),
        finally = ls.i(0),
      }
    ),
    { condition = line_begin }
  ),
  -- if key in a map
  ls.s(
    { trig = "om", name = "om", dscr = "if a key in a map" },
    fmta("if <v>, ok := <map>[<key>]; <con> {\n\t<f>\n}", {
      v = ls.i(1, "v"),
      map = ls.i(2, "map"),
      key = ls.i(3, "key"),
      con = ls.c(4, {
        ls.t("ok"),
        ls.t("!ok"),
        ls.sn(nil, {
          ls.t("ok&&"),
          ls.i(1),
        }),
      }),
      f = ls.i(0),
    }),
    { condition = line_begin }
  ),
}

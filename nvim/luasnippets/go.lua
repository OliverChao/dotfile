local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial
local events = require("luasnip.util.events")

local init = {
  -- init
  ls.s(
    "init",
    fmta(
      [[
        package main

        import "fmt"
        <>
        func main() {
            fmt.Println("nvim gogogo")
        }
    ]],
      { ls.i(0) }
    )
  ),
}

local basic = {
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
    )
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
    )
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
    )
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
    )
  ),
  -- if key in a map
  ls.s(
    { trig = "om", name = "om", dscr = "if a key in a map" },
    fmta("if <v>, ok := map[<key>]; <con> {\n\t<f>\n}", {
      v = ls.i(1, "v"),
      key = ls.i(2, "key"),
      con = ls.c(3, {
        ls.t("ok"),
        ls.t("!ok"),
        ls.sn(nil, {
          ls.t("ok&&"),
          ls.i(1),
        }),
      }),
      f = ls.i(0),
    })
  ),
}

local ds = {
  -- heap for go
  ls.s(
    { trig = "heap", name = "Heap", dscr = "create a heap" },
    fmt(
      [[
                {finally}
                type node struct{{ i, cost int }}
                type hp []node
                func (h hp) Len() int              {{ return len(h) }}
                func (h hp) Less(i, j int) bool    {{ return h[i].cost {max_heap} h[j].cost }} // > means maximum heap
                func (h hp) Swap(i, j int)         {{ h[i], h[j] = h[j], h[i] }}
                func (h *hp) Push(v interface{{}}) {{ *h = append(*h, v.(node)) }}
                func (h *hp) Pop() (v interface{{}}) {{ a := *h; *h, v = a[:len(a)-1], a[len(a)-1]; return }}
        ]],
      {
        max_heap = ls.i(1, { ">" }),
        finally = ls.i(0),
      }
    )
  ),
  -- string hash
  ls.s(
    { trig = "stringhash", dscr = "ceate a string hash" },
    fmt(
      [[
        hash := func(s string) {{
            // 注意：由于哈希很容易被卡，能用其它方法实现尽量用其它方法
            const prime uint64 = 1e8 + 7
            powP := make([]uint64, len(s)+1) // powP[i] = prime^i
            powP[0] = 1
            preHash := make([]uint64, len(s)+1) // preHash[i] = hash(s[:i]) 前缀哈希
            for i, b := range s {{
                powP[i+1] = powP[i] * prime
                preHash[i+1] = preHash[i]*prime + uint64(b) // 本质是秦九韶算法
            }}

            // 计算子串 s[l:r] 的哈希   0<=l<=r<=len(s)
            // 空串的哈希值为 0
            subHash := func(l, r int) uint64 {{ return preHash[r] - preHash[l]*powP[r-l] }}
            _ = subHash
        }}
    ]],
      {}
    )
  ),
}

local math = {
  -- combination
  ls.s(
    { trig = "combination", name = "combination", dscr = "combination number" },
    fmt(
      [[
                {finally}
                const mod int64 = {mod} 
                const mx int = {max}     // max length
                F := [mx + 1]int64{{1}}
                for i := 1; i <= mx; i++ {{
                    F[i] = F[i-1] * int64(i) % mod
                }}
                pow := func(x, n int64) int64 {{
                    // x %= mod
                    res := int64(1)
                    for ; n > 0; n >>= 1 {{
                        if n&1 == 1 {{
                            res = res * x % mod
                        }}
                        x = x * x % mod
                    }}
                    return res
                }}
                invF := [...]int64{{mx: pow(F[mx], mod-2)}}
                for i := mx; i > 0; i-- {{
                    invF[i-1] = invF[i] * int64(i) % mod
                }}
                // 求组合数 C(n, k)
                C := func(n, k int) int64 {{
                    if k < 0 || k > n {{
                        return 0
                    }}
                    return F[n] * invF[k] % mod * invF[n-k] % mod
                }}
                // 求排列数 P(n, k)
                P := func(n, k int) int64 {{
                    if k < 0 || k > n {{
                        return 0
                    }}
                    return F[n] * invF[n-k] % mod
                }}
        ]],
      {
        mod = ls.i(1, { "1e9+7" }),
        max = ls.i(2, { "1e6" }),
        finally = ls.i(0),
      }
    )
  ),
}

ls.add_snippets("go", init)
ls.add_snippets("go", basic)
ls.add_snippets("go", ds)
ls.add_snippets("go", math)

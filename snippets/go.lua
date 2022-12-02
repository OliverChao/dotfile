local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial
local events = require("luasnip.util.events")

local snippets = {
    -- main function
    ls.s(
        { trig = "main", name = "Main", dscr = "create a main function" },
        fmta("func main() {\n\t<>\n}", ls.i(0))
    ),
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
        ]]   ,
            {
                max_heap = ls.i(1, { ">" }),
                finally = ls.i(0),
            }
        )
    ),
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
        ]]   ,
            {
                mod = ls.i(1, { "1e9+7" }),
                max = ls.i(2, { "1e6" }),
                finally = ls.i(0),
            }
        )
    ),
}

ls.add_snippets("go", snippets)

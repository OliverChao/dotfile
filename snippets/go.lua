local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial
local events = require("luasnip.util.events")

local snippets = {
    ls.s(
        { trig = "main", name = "Main", dscr = "create a main function" },
        fmta("func main() {\n\t<>\n}", ls.i(0))
    ),
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
}

ls.add_snippets("go", snippets)

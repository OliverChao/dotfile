local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial
local events = require("luasnip.util.events")

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
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
    ),
    { condition = line_begin } -- set condition in the `opts` table
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
    ),
    { condition = line_begin } -- set condition in the `opts` table
  ),
  -- init a list context
  ls.s(
    { trig = "list_context", name = "ListContext", dscr = "init list context for cp" },
    fmt(
      [[
type ListNode struct {{
	Val  int
	Next *ListNode
}}

func constuctList(a []int) *ListNode {{
	hair := &ListNode{{}}
	p := hair
	for _, v := range a {{
		p.Next = &ListNode{{Val: v}}
		p = p.Next
	}}
	return hair.Next
}}

func printList(head *ListNode) {{
	for ; head != nil; head = head.Next {{
		fmt.Printf("%d -> ", head.Val)
	}}
	fmt.Println("NULL")
}}
  ]],
      {}
    )
  ),
}

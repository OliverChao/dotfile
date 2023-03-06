local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  ls.s(
    { trig = "primeFactors", dscr = "get prime factores" },
    fmt(
      [[
	primeFactors := func(n int) {{
		p := []int{{}}
		for i := 2; i*i <= n; i++ {{
			if n%i == 0 {{
				// do something
				p = append(p, i)
				for n%i == 0 {{
					n /= i
				}}
			}}
		}}
		if n > 1 {{
			// do something
			p = append(p, n)
		}}
	}}
	_ = primeFactors
  ]],
      {}
    ),
    { condition = line_begin } -- set condition in the `opts` table
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
  ]],
      {
        mod = ls.i(1, { "1e9+7" }),
        max = ls.i(2, { "1e6" }),
        finally = ls.i(0),
      }
    ),
    { condition = line_begin } -- set condition in the `opts` table
  ),
}

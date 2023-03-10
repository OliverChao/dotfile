local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local ai = require("luasnip.nodes.absolute_indexer")
local partial = require("luasnip.extras").partial
local events = require("luasnip.util.events")

local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {
  -- init a go file
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
    ),
    { condition = line_begin }
  ),
  -- init a ACM go file
  ls.s(
    "cf",
    fmta(
      [[
      package main

      import (
          "bufio"
          . "fmt"
          "io"
          "os"
      )

      func <run>(_r io.Reader, _w io.Writer) {
          in := bufio.NewReader(_r)
          out := bufio.NewWriter(_w)
          defer out.Flush()

          <f>
          var t int
          var n int
          for Fscan(in, &t); t  0; t-- {
          }
      }

      func main() {
          <run2>(os.Stdin, os.Stdout)
      }
  ]],
      {
        run = ls.i(1, "run"),
        run2 = rep(1),
        f = ls.i(0),
      }
    ),
    { condition = line_begin }
  ),
}

local lsp = require("plugins.lsp.lspconfig")
local mason = require("plugins.lsp.mason")
local fidget = require("plugins.lsp.fidget")
local navic = require("plugins.lsp.nvim-navic")

local misc = require("plugins.lsp.misc")
return {
  lsp,
  mason,
  fidget,
  navic,

  misc,
}

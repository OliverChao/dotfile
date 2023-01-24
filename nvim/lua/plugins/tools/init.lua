local hop = require("plugins.tools.hop")
local autopairs = require("plugins.tools.autopairs")
local comment = require("plugins.tools.comment")
local nvim_surround = require("plugins.tools.nvim-surround")
local hlslens = require("plugins.tools.hlslens")
local todo_comment = require("plugins.tools.todo-comments")
local cursorline = require("plugins.tools.nvim-cursorline")
local nvim_tree = require("plugins.tools.nvim-tree")
local toggleterm = require("plugins.tools.toggleterm")

local treesitter = require("plugins.tools.treesitter")

local others = require("plugins.tools.others")

return {
    hop,
    autopairs,
    comment,
    nvim_surround,
    hlslens,
    todo_comment,
    cursorline,
    nvim_tree,
    toggleterm,

    treesitter,

    others,
}

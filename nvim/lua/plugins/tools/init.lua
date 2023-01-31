local autopairs = require("plugins.tools.autopairs")
local comment = require("plugins.tools.comment")
local todo_comment = require("plugins.tools.todo-comments")
local nvim_tree = require("plugins.tools.nvim-tree")
local ufo = require("plugins.tools.nvim-ufo")
local toggleterm = require("plugins.tools.toggleterm")
local neoscroll = require("plugins.tools.neoscroll")

local treesitter = require("plugins.tools.treesitter")

local others = require("plugins.tools.others")

return {
    { "folke/lazy.nvim", version = false },
    autopairs,
    comment,
    todo_comment,
    nvim_tree,
    ufo,
    toggleterm,
    neoscroll,

    treesitter,

    others,
}

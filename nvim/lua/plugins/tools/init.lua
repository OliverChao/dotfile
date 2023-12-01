local autopairs = require("plugins.tools.autopairs")
local comment = require("plugins.tools.comment")
local todo_comment = require("plugins.tools.todo-comments")
-- local nvim_tree = require("plugins.tools.nvim-tree")
local neo_tree = require("plugins.tools.neo-tree")
local ufo = require("plugins.tools.nvim-ufo")
local toggleterm = require("plugins.tools.toggleterm")
local neoscroll = require("plugins.tools.neoscroll")
local outline = require("plugins.tools.outline")
local motion = require("plugins.tools.motion")
local format = require("plugins.tools.format")
local gpt = require("plugins.tools.chatgpt")
local harpoon = require("plugins.tools.harpoon")

local others = require("plugins.tools.others")

return {
  { "folke/lazy.nvim", version = false },
  autopairs,
  comment,
  todo_comment,
  -- nvim_tree,
  neo_tree,
  ufo,
  toggleterm,
  neoscroll,
  outline,
  motion,
  format,
  gpt,
  harpoon,

  others,
}

require('impatient')
require('Oli.nvim-hlslens')
require('Oli.nvim-treesitter')
require('Oli.nvim-tree')
require('Oli.nvim-todo-comments')
require('Oli.nvim-hop')
require('Oli.nvim-bufferline')
require('Oli.nvim-lualine')
require('Oli.nvim-autopairs')

require('Oli.nvim-dap')


-- ================= GPS ================
require("nvim-gps").setup({
  icons = {
	["class-name"] = ' ',      -- Classes and class-like objects
	["function-name"] = ' ',   -- Functions
	["method-name"] = ' ',     -- Methods (functions inside class-like objects)
	["container-name"] = '⛶ ',  -- Containers (example: lua tables)
	["tag-name"] = '炙',         -- Tags (example: html tags)
	["object-name"] = ' ',
  }
})

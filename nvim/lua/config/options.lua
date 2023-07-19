--  ╭────────────────────────────────────────────────╮
--  │                  Nvim Options                  │
--  ╰────────────────────────────────────────────────╯
-- INFO: filetype and syntax (and several) are enabled by default in nvim.
--" see: https://neovim.io/doc/user/vim_diff.html#nvim-defaults

vim.g.mapleader = ","

vim.o.termguicolors = true

vim.o.compatible = false
vim.o.autoindent = true
vim.o.autowrite = true
vim.o.autoread = true
vim.o.ruler = true
vim.o.smartindent = true
vim.o.lazyredraw = true
vim.o.number = true
vim.o.wrap = true

-- Maximum height of the popup menu
vim.o.pumheight = 15
-- Use ripgrep as grep tool
vim.o.grepprg = "rg --vimgrep --no-heading"
vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"

vim.o.cmdheight = 1
vim.o.report = 0
vim.o.relativenumber = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes:1"
vim.o.hlsearch = true

vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true

vim.o.mouse = "nvi"
vim.o.mousehide = true
vim.o.splitright = true

vim.o.updatetime = 250

vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

vim.wo.cursorline = true

vim.cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
]])
--
vim.o.fileencoding = "uft-8"
vim.o.termencoding = "uft-8"
vim.o.encoding = "utf-8"

vim.o.foldmethod = "indent"
vim.o.foldnestmax = 3
vim.o.foldenable = false
vim.o.foldlevel = 100

-- forbid some providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Faster scrolling
vim.o.lazyredraw = true

-- Decrease redraw time
vim.o.redrawtime = 100

vim.o.guifont = "JetBrainsMonoNL Nerd Font Mono:h15"

if vim.g.neovide then
  vim.keymap.set("i", "<c-space>", "", {})
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_remember_window_size= true
  vim.g.neovide_fullscreen = true

  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_no_idle = true
  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_input_macos_alt_is_meta = true
  -- vim.g.neovide_transparency = 0.9
end

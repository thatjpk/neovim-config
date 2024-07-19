-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- righteous indention
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- 80 columns
vim.opt.colorcolumn = "80" -- visual ruler
vim.opt.textwidth = 80 -- width set for 'gw'

-- spellin
vim.opt.spell = true

-- TODO:
-- jwt commands
-- j and k move within a line when wrapped?
--   (old config used up/down for this and left j/k move between lines the
--   traditional way.)
-- enter-to-save
-- shift-tab to cycle splits
-- try golang stuff
-- try python stuff
-- F6 line num toggle (none, rel, abs)
-- shop color schemes (also, use color scheme color for 80 col ruler)
-- git gutter?  there has to be a lazyvim thing installed for this?
-- make split borders more visible

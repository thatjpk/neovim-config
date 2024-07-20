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

-- cursor column color
vim.opt.cursorcolumn = true

-- spellin
vim.opt.spell = true

-- TODOs:

-- disable the merged clipboard thing
--     - This config puts everything that lands in the default vim register
--       into the system clipboard.  It's honestly worse than when they're
--       separate because your system clipboard gets clobbered by every little
--       thing in vim (e.g., normal mode 'x', 'ciw', etc.)
-- jwt commands
-- j and k move within a line when wrapped?
--   (old config used up/down for this and left j/k move between lines the
--   traditional way.)
-- enter-to-save
-- shift-tab to cycle splits
-- F6 line num toggle (none, rel, abs)
-- shop color schemes (also, use color scheme color for 80 col ruler)
-- git gutter?  there has to be a lazyvim thing installed for this?
-- make split borders more visible
-- Language setups for:
--     - json
--     - yaml
--     - markdown
--     - terraform
--     - toml
--     - helm?
--     - docker
-- debuggers?  or just lean on vscode for that? lazygit?
-- init.lua that plays nice with vscode?
--

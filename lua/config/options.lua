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
-- TODO set color from theme?

-- cursor column color
vim.opt.cursorcolumn = true
-- TODO set color from theme?

-- spellin
vim.opt.spell = true

-- use the unnamed register as the default for yanks and cuts, like stock vim.
-- lazyvim's default is to use a register that syncs with the system clipboard,
-- which is annoying when every little action in vim clobbers the system
-- clipboard. Using the `"+` register will put stuff into the system clipboard,
-- and using the normal OS paste in the terminal can insert stuff from the
-- system clipboard.
vim.opt.clipboard = ""

-- TODOs:

-- jwt commands
-- j and k move within a line when wrapped?
--   (old config used up/down for this and left j/k move between lines the
--   traditional way.)
-- enter-to-save
-- shift-tab to cycle splits
-- F6 line num toggle (none, rel, abs)
-- shop color schemes (also, use color scheme color for 80 col ruler)
-- git gutter?  there has to be a lazyvim thing installed for this?
-- lazygit?
-- make split borders more visible
-- Language setups for:
--     - yaml
--         - helm?
--         - docker compose?
--     - terraform
-- debuggers?  or just lean on vscode for that?
-- init.lua that plays nice with vscode?
--

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- righteous indention
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- 80 columns
vim.opt.colorcolumn = "80,120" -- visual rulers
vim.opt.textwidth = 80 -- width set for 'gw'
-- TODO set color from theme?

-- cursor column color
vim.opt.cursorcolumn = true
-- TODO set color from theme?

-- spellin
vim.opt.spell = true

-- don't autoformat on save... i've got this under control.
vim.g.autoformat = false

-- use the unnamed register as the default for yanks and cuts, like stock vim.
-- lazyvim's default is to use a register that syncs with the system clipboard,
-- which is annoying when every little action in vim clobbers the system
-- clipboard. Using the `"+` register will put stuff into the system clipboard,
-- and using the normal OS paste in the terminal can insert stuff from the
-- system clipboard.
vim.opt.clipboard = ""

-- disable the hiding of quotes in stuff like JSON and Markdown text
vim.opt.conceallevel = 0

-- shortcuts for stuff like:
--  - base64 encode/decode,
--  - json formatting
--  - jwt decode
--  - other stuff
-- these all operate on the whole buffer.
--
-- required commands:
--   - jq (https://jqlang.github.io/jq/)
--   - base64 (usually in coreutils package)
--   - jwt (https://github.com/mike-engel/jwt-cli)
--
-- run the buffer through jq to make it pretty
vim.api.nvim_create_user_command("Jqp", ":set ft=json | %!jq --indent 4", {})

-- run the buffer through jq to compact it
vim.api.nvim_create_user_command("Jqc", ":set ft=json | %!jq -c", {})

-- encode buffer into base64
vim.api.nvim_create_user_command("B64e", ":set ft=txt | %!base64 --wrap=0", {})

-- decode buffer as base64
vim.api.nvim_create_user_command("B64d", ":set ft=txt | %!base64 --decode", {})

-- decode the buffer as a jwt
vim.api.nvim_create_user_command("Jwtd", ":%!jwt decode --json -", {})

-- decode the buffer as a jwt and run the json through jq to make it pretty
vim.api.nvim_create_user_command("Jwtdp", function()
    vim.cmd("Jwtd")
    vim.cmd("Jqp")
end, {})

-- decode the buffer as a jwt and run the json through jq to compact it
vim.api.nvim_create_user_command("Jwtdc", function()
    vim.cmd("Jwtd")
    vim.cmd("Jqpc")
end, {})

-- assuming a buffer containing a decoded jwt, replace the buffer with just the
-- token's subject (pretty)
vim.api.nvim_create_user_command("Jwtsub", function ()
    vim.cmd("%!jq '.payload.sub'")
    vim.cmd("Jqp")
end, {})

-- assuming a buffer containing a decoded jwt, replace the buffer with an
-- encoded (but signed with secret "bogus") jwt.
-- TODO: Add a version of this that can read a secret from a file or env var.
vim.api.nvim_create_user_command("Jwte", function ()
    vim.cmd("%!jq '.payload'")
    vim.cmd("Jqc")
    vim.cmd("%!jwt encode --alg HS256 --no-iat --secret bogus -")
end, {})

-- convert an ffmpeg filter to a python format string that subs the the = and ,
-- out for placeholders (don't ask why)
vim.api.nvim_create_user_command("FffToPy", function ()
    vim.cmd("%!sed 's/=/{eq}/g' | sed 's/,/{co}/g'")
end, {})

-- do the opposite of FffToPy (again, don't ask why)
vim.api.nvim_create_user_command("PyToFff", function ()
    vim.cmd("%!sed 's/{eq}/=/g' | sed 's/{co}/,/g'")
end, {})


-- os-specific stuff ----------------------------------------------------------
require("config.os.loader") -- provides the Platform table for the os
if Platform == nil then
    vim.notify("Unable to determine platform, OS-specific config unavailable.")
    return
end

-- commands for dealing with the system clipboard
vim.api.nvim_create_user_command(
    "Pbcopy", -- also "Pbc" works
    Platform.copy_to_clipboard,
    {} -- This copies the whole buffer to the clipboard.
)
vim.api.nvim_create_user_command(
    "Pbpaste", -- also "Pbp" works
    Platform.paste_from_clipboard,
    {} -- This replaces the whole buffer with the clipboard contents.
)

-- TODOs:

-- j and k move within a line when wrapped?
--   (old config used up/down for this and left j/k move between lines the
--   traditional way.)
-- enter-to-save
-- shift-tab to cycle splits
-- F6 line num toggle (none, rel, abs)
-- shop color schemes (also, use color scheme color for 80 col ruler)
-- git diffs
-- make split borders more visible
-- Language setups for:
--     - yaml
--         - helm?
--         - docker compose?
--     - terraform
-- debuggers?  or just lean on vscode for that?
-- init.lua that plays nice with vscode?
--

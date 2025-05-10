-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


-- Disable all of Snacks' stupid animations, added in LazyVim 13.x+
vim.g.snacks_animate = false

-- righteous indention
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- 80 columns are all you need
vim.opt.colorcolumn = "80,120" -- visual rulers
vim.opt.textwidth = 80 -- width set for 'gw'
-- TODO set color from theme?

-- cursor column
vim.opt.cursorcolumn = false
-- TODO set color from theme?

-- cursor behavior
vim.opt.guicursor = table.concat({
    -- Blink in all modes
    "a:blinkwait0-blinkoff300-blinkon300",
    -- Vertical bar cursor in insert-ish modes
    "i-ci-ve:ver20",
    -- Horizontal underline cursor for replace-ish modes
    "r-cr-o:hor20",
    -- (Block cursor is default in all other modes, like normal)
}, ",")

-- speellin
vim.opt.spell = false

-- don't autoformat on save... i've got this under control.
vim.g.autoformat = false

-- completion
-- (see lua/plugins/blink.lua)

-- use the unnamed register as the default for yanks and cuts, like stock vim.
-- lazyvim's default is to use a register that syncs with the system clipboard,
-- which is annoying when every little action in vim clobbers the system
-- clipboard. Using the `"+` register will put stuff into the system clipboard,
-- and using the normal OS paste in the terminal can insert stuff from the
-- system clipboard.
vim.opt.clipboard = ""

-- disable the hiding of quotes in stuff like JSON and Markdown text
vim.opt.conceallevel = 0

-- don't automatically hard-wrap stuff as you type it
vim.opt.wrap = false

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
-- encoded jwt.  signed with secret "bogus" unless you set JWT_SECRET in the
-- environment.  7d expiration.
vim.api.nvim_create_user_command("Jwte", function ()
    local days_to_expire = tonumber(os.getenv("JWT_EXPR_DAYS") or "7")
    local jwt_secret = os.getenv("JWT_SECRET") or "bogus"
    local command =
        "%!jwt encode "
        .."--exp +"..days_to_expire.."d "
        .."--alg HS256 "
        .."--no-iat "
        ..'--secret "'..jwt_secret..'" '
        .."-"

    -- extract the payload because the `jwt encode` command writes its own
    -- headers
    vim.cmd("%!jq '.payload'")
    -- strip out the existing expiration value because the `jwt encode` command
    -- will use it instead of whatever we pass in via the `--exp` option.
    vim.cmd("%!jq 'del(.exp)' -c")

    -- WARNING: Setting this debug envvar will cause the command, including the
    -- signing secret, to be printed to notifications in the editor.
    -- local command_debug = os.getenv("JWTE_DEBUG") or false
    -- if command_debug then
    --     print(command)
    -- end
    vim.cmd(command)
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

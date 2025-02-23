-- Config for Copilot.lua 
-- 
-- (Lua re-impl of GitHub/Copilot.vim)
--

-- TODO:
-- - Figure out how to configure this for corp gh copilot at work, and ollama
-- for personal?  I guess maybe just don't load copilot.lua on personal
-- machines?

return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
        suggestion = {
            enabled = not vim.g.ai_cmp,
            auto_trigger = true,
            keymap = {
                accept = false, -- handled by nvim-cmp / blink.cmp
                next = "<M-]>",
                prev = "<M-[>",
            },
        },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            help = true,
        },
    },
}

-- Config for blink.cmp
-- (Code completion plugin, https://github.com/Saghen/blink.cmp)

return {
    "saghen/blink.cmp",
    opts = {
        keymap = {
            -- Swap the default accept binding (enter) for ctrl+enter so I can
            -- hard-wrap comments in peace.
            ['<CR>'] = {},
            ['<C-CR>'] = {"select_and_accept"}
        },
        completion = {
            menu = {
                -- Automatically show the completion menu while typing
                -- (force open with ctrl+space)
                auto_show = true
            },
            ghost_text = {
                -- Don't show the first completion option ahead of the cursor
                -- (This would maybe be more useful but the current color scheme
                -- renders the ghost text illegible.)
                enabled = false
            },
        },
        sources = {
            default = {
                "lsp",
                "path",
                "snippets",
                "buffer",
                "codecompanion",  -- complete the / and @ commands in chat
            },
            providers = {
                codecompanion = {
                    -- Have to add this because codecompanion's automatic
                    -- provider registation with blink is (was?) busted.  See
                    -- https://github.com/olimorris/codecompanion.nvim/issues/597
                    name = "CodeCompanion",
                    module = "codecompanion.providers.completion.blink",
                },
            },
        },
    },
}


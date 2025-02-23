-- Config for codecompanion.nvim
--
-- https://github.com/olimorris/codecompanion.nvim
--
-- Other keymaps cheat sheet:
-- `ga` - Accept inline edit in diff mode
-- `gr` - Reject inline edit in diff mode
--
-- Commands cheat sheet: Just use `/` or `@` and blink.cmp should complete the
-- commands that provide context and permissions to the LLM assistant.
--
-- TODO:
-- - Figure out how to configure this for corp gh copilot at work, and ollama
-- for personal?
-- - Actually where is copilot specified in this?

return {
    {
        "olimorris/codecompanion.nvim",
        opts = function()
            local options = require("codecompanion.config")
            local user = vim.env.USER or "User"

            options.strategies.chat.roles = {
                llm = "  CodeCompanion",
                user = "  " .. user,
            }

            options.strategies.chat.keymaps.close.modes = {
                n = "q",
                i = "<Esc>",
            }
            options.strategies.chat.keymaps.stop.modes.n = "<Esc>"
            options.strategies.chat.keymaps.send.modes.n = "<CR>"

            return options
        end,

        keys = {
            { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
            { "<leader>ai", "<cmd>CodeCompanion<cr>", mode = "n", desc = "Inline prompt (CodeCompanion)" },
            { "<leader>ac", "<cmd>CodeCompanionChat<cr>", mode = "n", desc = "Open Chat (CodeCompanion)" },
            { "<leader>ap", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Prompt Actions (CodeCompanion)" },
        },
    },
}

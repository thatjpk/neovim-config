-- Configuration for disabling stock LazyVim plugins

return {
    -- No tabs
    { "akinsho/bufferline.nvim", enabled = false },

    -- No welcome screen thing
    -- Dashboard plugin prior to LazyVim 13.x:
    { "nvimdev/dashboard-nvim", enabled = false },
    -- Dashboard in LazyVim 13.x+ switched to this thing:
    { "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },

    -- No auto completed quotes, brackets, parens, etc
    -- Actually I changed my mind
    { "echasnovski/mini.pairs", enabled = true },
}

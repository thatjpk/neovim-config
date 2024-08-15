-- Lua editor config
--
-- For now, this is just for making nvim config editing nicer, without much
-- consideration for actual Lua application development.

return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true)
                            },

                            -- I see it a lot in other folks' configs, but
                            -- adding the workspace.library thing above makes
                            -- the "Undefined global: vim" warnings go away.
                            --
                            -- diagnostics = { globals = { "vim", } },
                        },
                    },
                },
            },
        },
    },
}



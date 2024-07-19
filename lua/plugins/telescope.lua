-- Config for telescope.nvim

return {
    "nvim-telescope/telescope.nvim",

    opts = {
        defaults = {
            -- Set up some patterns that filter certain files
            -- out of the file search results.
            file_ignore_patterns = {
                -- git stuff
                ".git/",

                -- python stuff
                "__pycache__",
                ".venv/",
                ".mypy_cache/",
            },
        },
    },
}

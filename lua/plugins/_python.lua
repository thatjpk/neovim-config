-- Python development config
-- Based on the recommended setup from https://www.lazyvim.org/extras/lang/python

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff_lsp"

-- Check if tools are installed on the system
-- These are all external commands that have to be on the $PATH to work.
local pyright_available = vim.fn.executable("pyright") == 1
local ruff_available = vim.fn.executable("ruff") == 1
local pylsp_available = vim.fn.executable("pylsp") == 1

local pycodestyle_ignored = {
    -- "E501", -- "line too long"
    "E266", -- "too many leading  # for block comment"
    "W503", -- "line break before binary operator"
}
local max_line_len = 120

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "ninja", "rst" } },
    },
    { "nvim-neotest/neotest-python", opts = nil },
    { "mfussenegger/nvim-dap", opts = nil },
    -- { "mfussenegger/nvim-dap-python", opts = {} },
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.auto_brackets = opts.auto_brackets or {}
            table.insert(opts.auto_brackets, "python")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = { enabled = pyright_available },
                ruff = { enabled = ruff_available },
                pylsp = {
                    enalbed = pylsp_available,
                    settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = {
                                    ignore = pycodestyle_ignored,
                                    maxLineLength = max_line_len,
                                },
                            },
                        },
                    },
                },
            },
        },
    },
}

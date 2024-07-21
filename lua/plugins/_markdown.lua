-- Markdown authoring config
-- Based on the recommended setup from https://www.lazyvim.org/extras/lang/markdown

-- requires `markdownlint-cli2` and `markdown-toc` to be on the $PATH.
-- these are both available in homebrew.
local markdownlint_cli2_available = vim.fn.executable("markdownlint-cli2") == 1
local markdown_toc_available = vim.fn.executable("markdown-toc") == 1

local mason_opts_ensure_installed = {}
if markdownlint_cli2_available then
    table.insert(mason_opts_ensure_installed, "markdownlint-cli2")
end
if markdown_toc_available then
    table.insert(mason_opts_ensure_installed, "markdown-toc")
end
local mason_opts = {}
if #mason_opts_ensure_installed > 0 then
    mason_opts["ensure_installed"] = mason_opts_ensure_installed
end

return {
    {
        "williamboman/mason.nvim",
        opts = mason_opts,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                marksman = {},
            },
        },
    },
}

-- Docker development config
-- Based on the recommended setup from https://www.lazyvim.org/extras/lang/docker

-- requires `hadolint` command on $PATH, this is available on homebrew.
local hadolint_available = vim.fn.executable("hadolint") == 1
local mason_opts = {}
if hadolint_available then
    mason_opts = { ensure_installed = { "hadolint" } }
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = { ensure_installed = { "dockerfile" } },
    },
    {
        "williamboman/mason.nvim",
        opts = mason_opts,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                dockerls = {},
                docker_compose_language_service = {},
            },
        },
    },
}

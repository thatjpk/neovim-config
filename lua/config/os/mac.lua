-- Linux-specific nvim options

Platform = {}

function Platform:paste_from_clipboard()
    vim.cmd(":%!pbpaste")
end

function Platform:copy_to_clipboard()
    vim.cmd(":w !pbcopy")
end

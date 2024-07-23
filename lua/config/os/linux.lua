-- Linux-specific nvim options

Platform = {}

function Platform:paste_from_clipboard()
    vim.cmd(":%!xclip -sel clip -o")
end

function Platform:copy_to_clipboard()
    vim.cmd(":w !xclip -sel clip")
end

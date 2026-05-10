local nmap = function(stroke, command)
    vim.keymap.set('n', stroke, command)
end

local imap = function(stroke, command)
    vim.keymap.set('i', stroke, command)
end

return {
    imap=imap,
    nmap=nmap,
}

local function map(mode, stroke, command)
    vim.keymap.set(mode, stroke, command)
end

local nmap = function(stroke, command)
    map('n', stroke, command)
end

local imap = function(stroke, command)
    map('i', stroke, command)
end

local vmap = function(stroke, command)
    map('v', stroke, command)
end

return {
    imap=imap,
    nmap=nmap,
    vmap=vmap,
}

local util = require('utility')
local keys = require('keys')

require('toggleterm').setup({
    shell = function()
        if util.is_windows() then
            return 'pwsh.exe'
        end

        if vim.fn.executable('fish') then
            return 'fish'
        end

        return vim.o.shell
    end
})

keys.nmap('<F12>', '<CMD>ToggleTerm direction=float<CR>')
keys.tmap('<F12>', '<CMD>ToggleTerm<CR>')
keys.tmap('<C-ESC>', [[<C-\><C-n>]])

local Terminal = require('toggleterm.terminal').Terminal

local function register_custom_term(executable, mapping)
    local the_term = Terminal:new({ cmd = executable, hidden = true, direction = 'float' })
    keys.nmap(mapping, function() the_term:toggle() end)
end

register_custom_term('lazygit', '<space>lg')
register_custom_term('btm', '<space>bb')

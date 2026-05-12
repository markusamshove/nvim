local keys = require('keys')
local M = {}

M.set_build_command = function(command)
    keys.nmap('<space>rb', function()
        require('toggleterm').exec(command)
    end)
end

M.set_test_command = function(command)
    keys.nmap('<space>rt', function()
        require('toggleterm').exec(command)
    end)
end

return M

local nmap = require('keys').nmap

local mini_extra = require('mini.extra')
local mini_pick = require('mini.pick')
local mini_diff = require('mini.diff')

nmap('<space>gh', mini_diff.toggle_overlay)
nmap(',<space>', '<CMD>set nohlsearch<CR>')
nmap('<space>ff', mini_pick.builtin.files)
nmap('<C-e>', mini_pick.builtin.buffers)
nmap('<space>fg', mini_extra.pickers.git_files)
nmap('<space>fl', mini_pick.builtin.grep_live)
nmap('<space>td', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end)
nmap('<space>1', '<CMD>Oil --float<CR>')
nmap('<space>q', '<CMD>bd<CR>')
nmap(',ct', function() require('mini.trailspace').trim() end)
nmap('<space>rn', ":%s/\\<<C-r><C-w>\\>//gc<left><left><left>")
nmap('<F3>', function() mini_diff.goto_hunk('next', {}) end)
nmap('<S-F3>', function() mini_diff.goto_hunk('prev', {}) end)

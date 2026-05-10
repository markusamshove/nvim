local nmap = require('keys').nmap
local imap = require('keys').imap

local mini_extra = require('mini.extra')
local mini_pick = require('mini.pick')
local mini_diff = require('mini.diff')

nmap('<space>gh', mini_diff.toggle_overlay)
nmap(',<space>', '<CMD>set nohlsearch<CR>')
nmap('<space>ff', mini_pick.builtin.files)
nmap('<space>fg', mini_extra.pickers.git_files)
nmap('<space>fh', mini_pick.builtin.grep_live)

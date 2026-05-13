-- https://github.com/bash-lsp/bash-language-server
vim.lsp.enable('bashls')

local nmap = require('keys').nmap

nmap("<space>x", "<CMD>!chmod +x %<CR>")
nmap("<space><S-x>", "<CMD>term '%:p'<CR>")

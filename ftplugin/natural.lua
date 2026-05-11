local lopt = vim.opt_local

lopt.expandtab = true
lopt.softtabstop = 2

local util = require('utility')

local java_path = os.getenv('JAVA_HOME') .. '/bin/java'
local natls_path = util.get_user_home() .. '/dev/natls/libs/natls/build/libs/natls.jar'

vim.lsp.config('natls', {
    cmd = { java_path, '-jar', natls_path },
    filetypes = { 'natural' },
    root_dir = function(buf, on_dir)
        on_dir(vim.fs.root(buf, { '.natural', '_naturalBuild' }))
    end,
    init_options = {
        completion = {
            qualify = false,
        },
    },
})

vim.lsp.enable('natls')
util.register_autoformat()

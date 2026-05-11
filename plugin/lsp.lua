local nmap = require('keys').nmap
local imap = require('keys').imap
local vmap = require('keys').vmap

local mini_extra = require('mini.extra')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        -- local buffer = args.buf
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)
        if client and client.name == 'jdtls' then
            client.server_capabilities.semanticTokensProvider = nil
        end

        nmap('gd', function() mini_extra.pickers.lsp({scope = 'definition'}) end)
        imap('<C-k>', vim.lsp.buf.signature_help)
        nmap('gr', function() mini_extra.pickers.lsp({scope = 'references'}) end)

        -- diagnostics current buffer
        nmap(',6', function() mini_extra.pickers.diagnostic({scope = 'current'}) end)
        -- diagnostics LSP workspace
        nmap(',7', function() mini_extra.pickers.diagnostic({scope = 'all'}) end)

        nmap(',d', function() vim.diagnostic.open_float() end)

        nmap('<space>ft', function() mini_extra.pickers.lsp({scope = 'workspace_symbol_live'}) end)
        nmap('<space>m', function() mini_extra.pickers.lsp({scope = 'document_symbol'}) end)

        nmap('<space>rn', vim.lsp.buf.rename)
        nmap('<F2>', function() vim.diagnostic.jump({count = 1, float = true}) end)
        nmap('<S-F2>', function() vim.diagnostic.jump({count = -1, float = true}) end)

        nmap('<A-CR>', function() vim.lsp.buf.code_action() end)
        vmap('<A-CR>', function() vim.lsp.buf.code_action() end)
    end
})

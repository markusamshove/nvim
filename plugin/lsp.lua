local nmap = require('keys').nmap
local imap = require('keys').imap
local vmap = require('keys').vmap

local mini_extra = require('mini.extra')

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        -- local buffer = args.buf
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)

        -- Disable jdtls semantic highlighting
        if client and client.name == 'jdtls' then
            client.server_capabilities.semanticTokensProvider = nil
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            vim.lsp.inlay_hint.enable(true)
        end

        nmap('gd', function() mini_extra.pickers.lsp({ scope = 'definition' }) end)
        nmap('gi', function() mini_extra.pickers.lsp({ scope = 'implementation' }) end)
        imap('<C-k>', vim.lsp.buf.signature_help)
        nmap('gr', function() mini_extra.pickers.lsp({ scope = 'references' }) end)

        -- diagnostics current buffer
        nmap('<space>6', function() mini_extra.pickers.diagnostic({ scope = 'current' }) end)
        -- diagnostics LSP workspace
        nmap('<space>7', function() mini_extra.pickers.diagnostic({ scope = 'all' }) end)

        nmap('<space>d', function() vim.diagnostic.open_float() end)
        nmap('<space>ti', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)

        nmap('<space>ft', function() mini_extra.pickers.lsp({ scope = 'workspace_symbol_live' }) end)
        nmap('<space>m', function() mini_extra.pickers.lsp({ scope = 'document_symbol' }) end)

        nmap('<space>rn', vim.lsp.buf.rename)
        nmap('<F2>', function() vim.diagnostic.jump({ count = 1, float = true }) end)
        nmap('<S-F2>', function() vim.diagnostic.jump({ count = -1, float = true }) end)

        nmap('<A-CR>', function() vim.lsp.buf.code_action() end)
        vmap('<A-CR>', function() vim.lsp.buf.code_action() end)

        nmap('<space>rf', vim.lsp.buf.format)
        vmap('<space>rf', vim.lsp.buf.format) -- this formats only the selection
    end
})

vim.api.nvim_create_autocmd("InsertEnter", {
    desc = "Disable lsp.inlay_hint when in insert mode",
    callback = function(args)
        local filter = { bufnr = args.buf }
        local inlay_hint = vim.lsp.inlay_hint
        if inlay_hint.is_enabled(filter) then
            inlay_hint.enable(false, filter)
            vim.api.nvim_create_autocmd("InsertLeave", {
                once = true,
                desc = "Re-enable lsp.inlay_hint when leaving insert mode",
                callback = function()
                    inlay_hint.enable(true, filter)
                end,
            })
        end
    end,
})

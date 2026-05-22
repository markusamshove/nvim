vim.api.nvim_command("autocmd BufEnter *.NS7 :setlocal filetype=natural")
vim.api.nvim_command("autocmd BufEnter *.NSC :setlocal filetype=natural")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

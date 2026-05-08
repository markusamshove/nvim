vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/sdhrt/codesandbox-theme.nvim' },
  { src = 'https://github.com/nvim-mini/mini.statusline' },
  { src = 'https://github.com/nvim-mini/mini.nvim' },
}

vim.cmd.colorscheme('codesandbox')

require('mini.git').setup()
require('mini.statusline').setup()

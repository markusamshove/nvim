vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/sdhrt/codesandbox-theme.nvim' },
  { src = 'https://github.com/nvim-mini/mini.extra' },
  { src = 'https://github.com/nvim-mini/mini.statusline' },
  { src = 'https://github.com/nvim-mini/mini-git' },
  { src = 'https://github.com/nvim-mini/mini.diff' },
  -- { src = 'https://github.com/nvim-mini/mini.snippets' },
  { src = 'https://github.com/nvim-mini/mini.completion' },
  { src = 'https://github.com/nvim-mini/mini.icons' },
  { src = 'https://github.com/nvim-mini/mini.pick' },
}

vim.cmd.colorscheme('codesandbox')

require('mini.extra').setup()
require('mini.pick').setup()
require('mini.icons').setup()
require('mini.completion').setup()
require('mini.git').setup()
require('mini.diff').setup()
require('mini.statusline').setup()

local opt = vim.opt
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.scrolloff = 10 -- Always have this much lines below the cursor
opt.splitright = true -- Prefer splitting to the right
opt.splitbelow = true -- Prefer splitting to the bottom
opt.belloff = "all"
opt.swapfile = false
opt.foldlevel = 0
opt.foldmethod = "marker"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function ()
  opt.clipboard = "unnamedplus"
end)

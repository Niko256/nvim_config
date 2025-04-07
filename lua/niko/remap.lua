-- Set space as the leader key
vim.g.mapleader = " "

-- Toggle NvimTree file explorer with leader+q
vim.api.nvim_set_keymap('n', '<leader>q', ':NvimTreeToggle<CR>', { noremap = true, silent = true})

-- Cycle through windows with leader+l 
vim.keymap.set('n', '<leader>l', '<C-w>w')

-- Navigate to start of line with H
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true, silent = true })

-- Navigate to end of line with J
vim.api.nvim_set_keymap('n', 'J', '$', { noremap = true, silent = true })

-- Yank from cursor to end of line with Y
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })

-- Delete from cursor to end of line with D
vim.api.nvim_set_keymap('n', 'D', 'd$', { noremap = true, silent = true })

-- Move current line up with leader+k
vim.api.nvim_set_keymap('n', '<leader>k', ':m .-2<CR>==', { noremap = true, silent = true })

-- Move current line down with leader+j
vim.api.nvim_set_keymap('n', '<leader>j', ':m .+1<CR>==', { noremap = true, silent = true })


-- LSP keybindings:

-- Go to definition with Alt+g
vim.api.nvim_set_keymap('n', '<A-g>', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

-- Find references with Alt+s
vim.api.nvim_set_keymap('n', '<A-s>', ':lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })

-- Rename symbol with Alt+r
vim.api.nvim_set_keymap('n', '<A-r>', ':lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })

-- Show diagnostics with Alt+a
vim.api.nvim_set_keymap('n', '<A-a>', ':lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })

-- Show hover information with Alt+l
vim.api.nvim_set_keymap('n', '<A-l>', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- Format code in normal mode with Ctrl+n
vim.api.nvim_set_keymap('n', '<C-n>', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

-- Format code in visual mode with Ctrl+n
vim.api.nvim_set_keymap('v', '<C-n>', ':lua vim.lsp.buf.format({ async = true })<CR>', { noremap = true, silent = true })

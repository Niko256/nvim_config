vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.clipboard:append("unnamedplus")


vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.g.mapleader = " "


vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.cmd('highlight Normal guibg=#02020b')
        vim.cmd('highlight NonText guibg=#02020b')
    end,
})

vim.cmd([[
autocmd BufWritePost *.rs silent! !rustfmt %
]])

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")
        vim.cmd.highlight("NormalNC guibg=NONE ctermbg=NONE")
        vim.cmd.highlight("SignColumn guibg=NONE ctermbg=NONE")
        vim.cmd.highlight("LineNr guibg=NONE ctermbg=NONE")
        vim.cmd.highlight("EndOfBuffer guibg=NONE ctermbg=NONE")
    end,
})

vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")
vim.cmd.highlight("NormalNC guibg=NONE ctermbg=NONE")
vim.cmd.highlight("SignColumn guibg=NONE ctermbg=NONE")
vim.cmd.highlight("LineNr guibg=NONE ctermbg=NONE")
vim.cmd.highlight("EndOfBuffer guibg=NONE ctermbg=NONE")

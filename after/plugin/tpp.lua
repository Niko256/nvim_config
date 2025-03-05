vim.cmd([[
  augroup filetypedetect
    autocmd BufNewFile,BufRead *.tpp set filetype=cpp
  augroup END
]])


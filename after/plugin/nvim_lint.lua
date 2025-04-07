require('lint').linters_by_ft = {
  cpp = {'clangtidy'},
  c = {'clangtidy'},
}

vim.api.nvim_exec([[
  augroup linter
    autocmd!
    autocmd BufWritePost <buffer> lua require('lint').try_lint()
  augroup end
]], false)


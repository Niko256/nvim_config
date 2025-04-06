local ok, ferris = pcall(require, 'ferris')
if not ok then
  vim.notify("Ferris.nvim not installed! Run :PackerSync", vim.log.levels.ERROR)
  return
end

ferris.setup({})

local mappings = {
  ['<leader>em'] = { 'expand_macro', 'Expand Macro' },
  ['<leader>jl'] = { 'join_lines', 'Join Lines' },
  ['<leader>ct'] = { 'open_cargo_toml', 'Open Cargo.toml' },
  ['<leader>dc'] = { 'open_documentation', 'Open Docs' },
  ['<leader>hi'] = { 'view_hir', 'View HIR' },
  ['<leader>mi'] = { 'view_mir', 'View MIR' },
  ['<leader>ml'] = { 'view_memory_layout', 'Memory Layout' },
  ['<leader>st'] = { 'view_syntax_tree', 'Syntax Tree' }
}

for key, map in pairs(mappings) do
  local method, desc = map[1], map[2]
  vim.keymap.set('n', key, function()
    local ok, fn = pcall(require, 'ferris.methods.'..method)
    if ok then
      fn()
    else
      vim.notify("Ferris: Method '"..method.."' not found", vim.log.levels.ERROR)
    end
  end, { noremap = true, silent = true, desc = 'Ferris: '..desc })
end

vim.notify("Ferris.nvim: Keymaps configured")

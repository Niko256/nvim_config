require('neogen').setup({
    snippet_engine = "luasnip",
    
    input_after_comment = true,
    
    languages = {
        cpp = {
            template = {
                annotation_convention = "doxygen", 
                doxygen = {
                    func = "/**\n * @brief ${brief_description}\n * \n" ..
                          " * @details ${detailed_description}\n" ..
                          " * \n" ..
                          " * @param ${parameters}\n" ..
                          " * @return ${return_description}\n" ..
                          " */",
                    class = "/**\n * @class ${class_name}\n" ..
                           " * @brief ${brief_description}\n" ..
                           " * \n" ..
                           " * ${detailed_description}\n" ..
                           " */"
                }
            }
        },
    }
})

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<Leader>nf', function()
    require('neogen').generate({
        type = 'func',
        template = {
            use_default = false, -- Отключаем стандартные шаблоны
            cpp = {
                func = "/**\n * @brief \n * \n * @param \n * @return \n */"
            }
        }
    })
end)

vim.api.nvim_set_keymap("n", "<Leader>nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)

vim.api.nvim_set_keymap("n", "<Leader>nd", ":lua require('neogen').generate()<CR>", opts)

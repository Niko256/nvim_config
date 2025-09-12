local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
    end
end

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'rust_analyzer', 'clangd', 'lua_ls' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = lsp_capabilities,
                on_attach = on_attach,
            })
        end,

        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                capabilities = lsp_capabilities,
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT'
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = {
                                vim.env.VIMRUNTIME,
                            }
                        }
                    }
                }
            })
        end,

        rust_analyzer = function()
            require('rust-tools').setup({
                server = {
                    on_attach = on_attach,
                    capabilities = lsp_capabilities,
                    settings = {
                        ["rust-analyzer"] = {
                            diagnostics = {
                                enable = true,
                                disabled = { "unresolved-proc-macro" },
                                experimental = { enable = true },
                            },
                            inlayHints = {
                                enable = true,
                            },
                        }
                    }
                },
                tools = {
                    hover_actions = { auto_focus = true },
                    inlay_hints = { auto = true },
                },
            })
        end,

        clangd = function()
            require('lspconfig').clangd.setup({
                capabilities = lsp_capabilities,
                on_attach = on_attach,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=never",
                    "--fallback-style=llvm",
                    "--enable-config",
                },
                settings = {
                    clangd = {
                        fallbackFlags = { "-std=c++23" },
                        diagnostics = { enable = true }
                    }
                }
            })
        end,
    }
})

vim.keymap.set('n', '<leader>j', vim.lsp.buf.format, opts)

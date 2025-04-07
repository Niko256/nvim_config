require('navigator').setup({
  debug = false,
  width = 0.75,
  height = 0.3,
  preview_height = 0.35,
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  default_mapping = false,

  ts_fold = {
    enable = false,
    max_lines_scan_comments = 20,
    disable_filetypes = { 'help', 'guihua', 'text' },
  },

  icons = {
    code_action_icon = "🏏",
    diagnostic_head = '🐛',
  },

  mason = true,

  keymaps = {
    {key = "gr", func = require('navigator.reference').async_ref, desc = "Show async references"},
    {key = "<Leader>gr", func = require('navigator.reference').reference, desc = "Show references and context"},
    {key = "gD", func = vim.lsp.buf.declaration, desc = "Go to declaration"},
    {key = "gd", func = require('navigator.definition').definition, desc = "Go to definition"},
    {key = "gi", func = vim.lsp.buf.implementation, desc = "Go to implementation"},
    {key = "gt", func = require('navigator.definition').type_definition, desc = "Go to type definition"},
    {key = "g0", func = require('navigator.symbols').document_symbol, desc = "Document symbols"},
    {key = "gW", func = require('navigator.workspace').workspace_symbol_fuzzy, desc = "Workspace symbol fuzzy finder"},
    {key = "<Leader>fm", mode = 'n', func = require('navigator.formatting').format, desc = "Format buffer"},
    {key = "<Leader>fm", mode = 'v', func = require('navigator.formatting').range_format, desc = "Format selection"},
    {key = "K", func = vim.lsp.buf.hover, desc = "Hover documentation"},
    {key = "<Space>ca", func = require('navigator.codeAction').code_action, desc = "Code action"},
    {key = "<Space>rn", func = require('navigator.rename').rename, desc = "Rename symbol"},
    {key = "]d", func = require('navigator.diagnostics').goto_next, desc = "Next diagnostic"},
    {key = "[d", func = require('navigator.diagnostics').goto_prev, desc = "Previous diagnostic"},
    {key = "gL", func = require('navigator.diagnostics').show_diagnostics, desc = "Line diagnostics"},
    {key = "gG", func = require('navigator.diagnostics').show_buf_diagnostics, desc = "Buffer diagnostics"},
    {key = "<Leader>gt", func = require('navigator.treesitter').buf_ts, desc = "Treesitter document symbols"},
    {key = "<Leader>gT", func = require('navigator.treesitter').bufs_ts, desc = "Treesitter symbols for all buffers"},
    {key = "<Leader>ct", func = require('navigator.ctags').ctags, desc = "CTags symbol search"},
    {key = "<Leader>cg", func = require('navigator.ctags').generate, desc = "Generate CTags"},
    {key = "<Leader>gi", func = require('navigator.hierarchy').incoming_calls, desc = "Incoming calls"},
    {key = "<Leader>go", func = require('navigator.hierarchy').outgoing_calls, desc = "Outgoing calls"},
    {key = "<Leader>dt", func = require('navigator.diagnostics').toggle_diagnostics, desc = "Toggle diagnostics"},
    {key = "<Leader>k", func = require('navigator.reference').toggle_reference, desc = "Toggle reference highlight"},
    {key = "<Space>wa", func = require('navigator.workspace').add_workspace_folder, desc = "Add workspace folder"},
    {key = "<Space>wr", func = require('navigator.workspace').remove_workspace_folder, desc = "Remove workspace folder"},
    {key = "<Space>wl", func = require('navigator.workspace').list_workspace_folders, desc = "List workspace folders"},
  },

  lsp = {
    enable = true,
    format_on_save = true,
    format_options = { async = false },
    disable_format_cap = {"sqlls", "lua_ls", "gopls"},

    diagnostic = {
      underline = true,
      virtual_text = true,
      update_in_insert = false,
    },

    servers = {'cmake', 'ltex'},

    gopls = {
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,
      settings = { gopls = { gofumpt = false } }
    },

    lua_ls = {
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false }
        }
      }
    },

    rust_analyzer = {
      root_dir = function(fname)
        local patterns = { 'Cargo.toml', 'rust-project.json', '.git' }
        for _, pattern in ipairs(patterns) do
          local found = vim.fn.glob(vim.fn.fnamemodify(fname, ':h') .. '/' .. pattern)
          if found ~= '' then
            return vim.fn.fnamemodify(found, ':h')
          end
        end
        return vim.fn.fnamemodify(fname, ':h')
      end,
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
          checkOnSave = { command = "clippy" }
        }
      }
    },

    sqls = {
      on_attach = function(client, bufnr)
        client.server_capabilities.execute_command = true
        require('sqls').setup({ picker = 'telescope' })
      end,
      settings = { cmd = { 'sqls', '-config', '$HOME/.config/sqls/config.yml' } }
    },

    clangd = {
      cmd = {
        'clangd',
        '--background-index',
        '--suggest-missing-includes',
        '--clang-tidy',
        '--header-insertion=iwyu'
      },
      filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cc' },
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end
    }
  }
})

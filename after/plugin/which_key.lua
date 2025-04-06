return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500 
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true, 
        registers = true, 
        spelling = { enabled = true, suggestions = 20 },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      window = {
        border = "rounded",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
      },
      layout = {
        spacing = 3,
      },
      ignore_missing = true,
    })

    wk.register({
      ["<leader>"] = {
        f = {
          name = "+file",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          g = { "<cmd>Telescope git_files<cr>", "Git Files" },
          r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
          s = { "<cmd>w<cr>", "Save File" },
        },

        b = {
          name = "+buffer",
          b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
          d = { "<cmd>bd<cr>", "Delete Buffer" },
          n = { "<cmd>bn<cr>", "Next Buffer" },
          p = { "<cmd>bp<cr>", "Previous Buffer" },
        },

        s = {
          name = "+search",
          s = { "<cmd>Telescope live_grep<cr>", "Grep Text" },
          w = { "<cmd>Telescope grep_string<cr>", "Word Under Cursor" },
          h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
        },

        g = {
          name = "+git",
          s = { "<cmd>Git<cr>", "Status" },
          c = { "<cmd>Git commit<cr>", "Commit" },
          p = { "<cmd>Git push<cr>", "Push" },
          l = { "<cmd>Git pull<cr>", "Pull" },
        },

        l = {
          name = "+lsp",
          d = { vim.lsp.buf.definition, "Go to Definition" },
          D = { vim.lsp.buf.declaration, "Go to Declaration" },
          i = { vim.lsp.buf.implementation, "Go to Implementation" },
          r = { vim.lsp.buf.references, "References" },
          k = { vim.lsp.buf.hover, "Hover" },
          a = { vim.lsp.buf.code_action, "Code Action" },
          R = { vim.lsp.buf.rename, "Rename" },
          f = { vim.lsp.buf.format, "Format" },
        },
      },

      ["v"] = {
        ["<leader>"] = {
          l = {
            name = "+lsp",
            a = { vim.lsp.buf.range_code_action, "Range Code Action" },
            f = { vim.lsp.buf.range_formatting, "Range Format" },
          },
        },
      },
    })

    wk.register({
      ["g"] = {
        d = { vim.lsp.buf.definition, "Go to Definition" },
        D = { vim.lsp.buf.declaration, "Go to Declaration" },
      },
      ["["] = {
        d = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
      },
      ["]"] = {
        d = { vim.diagnostic.goto_next, "Next Diagnostic" },
      },
    })
  end
}

vim.notify = require("notify")

require("notify").setup({
  stages = "fade_in_slide_out", 
  timeout = 3000,              
  background_colour = "#1a1b26",
  max_width = 80,              
  render = "wrapped-compact",         
})

vim.keymap.set("n", "<leader>e", function()
  local line = vim.fn.line(".") - 1
  local diagnostics = vim.diagnostic.get(0, { lnum = line })
  
  if #diagnostics == 0 then
    vim.notify("No diagnostics here", "INFO")
    return
  end

  vim.notify(diagnostics[1].message, "ERROR", {
    title = "LSP Error",
    timeout = 4000,
  })
end, { desc = "Show current error in notify" })


vim.keymap.set("n", "<leader>te", function()
  require("telescope.builtin").diagnostics({
    severity_limit = "ERROR",
    previewer = false,
    attach_mappings = function(_, map)
      map("i", "<CR>", function(prompt_bufnr)
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)
        
        local source = selection.value.source or "Unknown source"
        local title = source .. " (line " .. selection.lnum .. ")"
        
        vim.notify(selection.value.message, "ERROR", {
          title = title,
          timeout = false,
        })
      end)
      return true
    end,
  })
end, { desc = "Telescope: Find errors and show in notify" })

require("echo").setup({
    events = {
        BufRead = { path = "builtin:EXPAND", amplify = 1.0 },
        BufWrite = { path = "builtin:SUCCESS_2", amplify = 1.0 },
        CursorMovedI = { path = "builtin:BUTTON_3", amplify = 0.45 },
        ExitPre = { path = "builtin:COMPLETE_3", amplify = 1.0 },
    }
})

require("telescope").register_extension("echo")

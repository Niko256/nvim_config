local neoscroll = require('neoscroll')

local scroll_config = {
  ctrl_u = { duration = 250 },
  ctrl_d = { duration = 250 },
  ctrl_b = { duration = 450 },
  ctrl_f = { duration = 450 },
  scroll_up = { move_cursor = false, duration = 100 },
  scroll_down = { move_cursor = false, duration = 100 },
  zt = { half_win_duration = 250 },
  zz = { half_win_duration = 250 },
  zb = { half_win_duration = 250 },
}

local keymap = {
  ["<A-u>"] = function() neoscroll.ctrl_u(scroll_config.ctrl_u) end,  -- Alt+u
  ["<A-d>"] = function() neoscroll.ctrl_d(scroll_config.ctrl_d) end,  -- Alt+d
  ["<A-b>"] = function() neoscroll.ctrl_b(scroll_config.ctrl_b) end,  -- Alt+b
  ["<A-f>"] = function() neoscroll.ctrl_f(scroll_config.ctrl_f) end,  -- Alt+f
  ["<A-y>"] = function() neoscroll.scroll(-0.1, scroll_config.scroll_up) end,  -- Alt+y
  ["<A-e>"] = function() neoscroll.scroll(0.1, scroll_config.scroll_down) end, -- Alt+e
  ["zt"]    = function() neoscroll.zt(scroll_config.zt) end,
  ["zz"]    = function() neoscroll.zz(scroll_config.zz) end,
  ["zb"]    = function() neoscroll.zb(scroll_config.zb) end,
}

local modes = { 'n', 'v', 'x' }
for key, func in pairs(keymap) do
  vim.keymap.set(modes, key, func)
end

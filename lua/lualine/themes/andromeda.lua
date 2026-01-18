-- Andromeda theme for lualine
-- Author: Ivan Duran
-- Upstream: https://github.com/idr4n/andromeda.nvim
-- License: MIT

local colors = require("andromeda.colors").setup({})

return {
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
    b = { fg = colors.green, bg = colors.bg_visual },
    c = { fg = colors.fg_gutter, bg = colors.bg_highlight },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
    b = { fg = colors.green, bg = colors.bg_visual },
    c = { fg = colors.fg_gutter, bg = colors.bg_highlight },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.green, gui = "bold" },
    b = { fg = colors.green, bg = colors.bg_visual },
    c = { fg = colors.fg_gutter, bg = colors.bg_highlight },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
    b = { fg = colors.green, bg = colors.bg_visual },
    c = { fg = colors.fg_gutter, bg = colors.bg_highlight },
  },
  command = {
    a = { fg = colors.bg, bg = colors.magenta, gui = "bold" },
    b = { fg = colors.green, bg = colors.bg_visual },
    c = { fg = colors.fg_gutter, bg = colors.bg_highlight },
  },
  terminal = {
    a = { fg = colors.bg, bg = colors.magenta, gui = "bold" },
    b = { fg = colors.green, bg = colors.bg_visual },
    c = { fg = colors.fg_gutter, bg = colors.bg_highlight },
  },
  inactive = {
    a = { fg = colors.fg_gutter, bg = colors.bg },
    b = { fg = colors.fg_gutter, bg = colors.bg },
    c = { fg = colors.fg_gutter, bg = colors.bg },
  },
}

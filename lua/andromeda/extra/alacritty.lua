local M = {}

local Util = require("andromeda.util")

---@param colors ColorScheme
---@param ext_name string
function M.template(colors, ext_name)
  -- Additional terminal-specific colors
  local extra_colors = {
    cursor = "#ffffff",
    sel_background = "#3a3e4b", -- bg_visual
  }

  colors = Util.convert_colors_to_upper(vim.tbl_extend("force", colors, extra_colors))
  local vars = vim.tbl_extend("force", colors, { name = ext_name })

  return Util.render_template(
    [[
# Andromeda Colors for %{name}

# Default colors
[colors.primary]
background = "%{bg}"
foreground = "%{fg}"

[colors.cursor]
cursor     = "%{cursor}"
text       = "%{bg}"

[colors.selection]
background = "%{sel_background}"
text       = "%{fg}"

[colors.normal]
black      = "%{terminal.black}"
red        = "%{terminal.red}"
green      = "%{terminal.green}"
yellow     = "%{terminal.yellow}"
blue       = "%{terminal.blue}"
magenta    = "%{terminal.magenta}"
cyan       = "%{terminal.cyan}"
white      = "%{terminal.white}"

[colors.bright]
black      = "%{terminal.black_bright}"
red        = "%{terminal.red_bright}"
green      = "%{terminal.green_bright}"
yellow     = "%{terminal.yellow_bright}"
blue       = "%{terminal.blue_bright}"
magenta    = "%{terminal.magenta_bright}"
cyan       = "%{terminal.cyan_bright}"
white      = "%{terminal.white_bright}"
]],
    vars
  )
end

return M

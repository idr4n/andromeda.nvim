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
palette = 0=%{terminal.black}
palette = 1=%{terminal.red}
palette = 2=%{terminal.green}
palette = 3=%{terminal.yellow}
palette = 4=%{terminal.blue}
palette = 5=%{terminal.magenta}
palette = 6=%{terminal.cyan}
palette = 7=%{terminal.white}
palette = 8=%{terminal.black_bright}
palette = 9=%{terminal.red_bright}
palette = 10=%{terminal.green_bright}
palette = 11=%{terminal.yellow_bright}
palette = 12=%{terminal.blue_bright}
palette = 13=%{terminal.magenta_bright}
palette = 14=%{terminal.cyan_bright}
palette = 15=%{terminal.white_bright}
background = %{bg}
foreground = %{fg}
cursor-color = %{cursor}
selection-background = %{sel_background}
selection-foreground = %{fg}
]],
    vars
  )
end

return M

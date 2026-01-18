local M = {}

local Util = require("andromeda.util")

---@param colors ColorScheme
---@param ext_name string
function M.template(colors, ext_name)
  -- Additional terminal-specific colors
  local extra_colors = {
    cursor = "#ffffff",
    sel_background = "#3a3e4b", -- bg_visual
    active_tab_background = Util.blend_fg(colors.bg, 0.85),
  }

  colors = Util.convert_colors_to_upper(vim.tbl_extend("force", colors, extra_colors))
  local vars = vim.tbl_extend("force", colors, { name = ext_name })

  return Util.render_template(
    [[
## name: andromeda
## license: MIT
## author: Ivan Duran
## upstream: https://github.com/idr4n/andromeda.nvim

background              %{bg}
foreground              %{fg}
cursor                  %{cursor}

selection_background    %{sel_background}
selection_foreground    %{fg}

color0                  %{terminal.black}
color1                  %{terminal.red}
color2                  %{terminal.green}
color3                  %{terminal.yellow}
color4                  %{terminal.blue}
color5                  %{terminal.magenta}
color6                  %{terminal.cyan}
color7                  %{terminal.white}

color8                  %{terminal.black_bright}
color9                  %{terminal.red_bright}
color10                 %{terminal.green_bright}
color11                 %{terminal.yellow_bright}
color12                 %{terminal.blue_bright}
color13                 %{terminal.magenta_bright}
color14                 %{terminal.cyan_bright}
color15                 %{terminal.white_bright}

# Tabs
tab_bar_background      none
active_tab_background   %{active_tab_background}
active_tab_foreground   %{fg}
inactive_tab_background %{bg}
inactive_tab_foreground %{fg_gutter}
]],
    vars
  )
end

return M

local Util = require("andromeda.util")

local M = {}

---@param opts andromeda.Config
---@return ColorScheme
function M.setup(opts)
  opts = opts or {}

  -- Base Andromeda color palette
  ---@class Palette
  local palette = {
    none = "NONE",

    -- Background scale
    bg = "#23262e",
    bg_highlight = "#2f323c",
    bg_visual = "#3a3e4b",
    bg_search = "#464959",

    -- Foreground scale
    fg_dark = "#606064",
    fg_gutter = "#81898F",
    fg = "#d5ced9",

    -- Accent colors
    cyan = "#00e8c6",
    pink = "#ff00aa",
    purple = "#c74ded",
    orange = "#f39c12",
    yellow = "#ffe66d",
    magenta = "#f92672",
    blue = "#7cb7ff",
    red = "#ee5d43",
    green = "#96e072",

    -- Semantic colors
    error = "#ee5d43",
    warning = "#ff7700",
    info = "#47eae0",
    hint = "#47eae0",

    -- Git colors
    git_add = "#00ff77",
    git_change = "#47eae0",
    git_delete = "#ff0038",
  }

  -- Set util background/foreground for blending
  Util.bg = palette.bg
  Util.fg = palette.fg

  -- Computed colors
  ---@class ColorScheme: Palette
  local colors = palette

  -- Border colors
  colors.border = palette.bg_search
  colors.border_highlight = Util.blend(palette.cyan, 0.8, palette.bg)

  -- Additional background variants
  colors.bg_dark = Util.darken(palette.bg, 0.8)
  colors.bg_popup = colors.bg_highlight
  colors.bg_statusline = colors.bg
  colors.fg_search = palette.fg

  -- Background variants based on style options
  if opts.styles and opts.styles.sidebars == "transparent" then
    colors.bg_sidebar = colors.none
  elseif opts.styles and opts.styles.sidebars == "normal" then
    colors.bg_sidebar = colors.bg
  else
    colors.bg_sidebar = colors.bg_highlight
  end

  if opts.styles and opts.styles.floats == "transparent" then
    colors.bg_float = colors.none
  elseif opts.styles and opts.styles.floats == "normal" then
    colors.bg_float = colors.bg
  else
    colors.bg_float = colors.bg_highlight
  end

  -- Diff colors (blended versions for better visibility)
  ---@class DiffColors
  colors.diff = {
    add = Util.blend(colors.git_add, 0.15, colors.bg),
    delete = Util.blend(colors.git_delete, 0.15, colors.bg),
    change = Util.blend(colors.git_change, 0.15, colors.bg),
    text = Util.blend(colors.git_change, 0.3, colors.bg),
  }

  -- Git sign colors
  ---@class GitColors
  colors.git = {
    add = colors.git_add,
    change = colors.git_change,
    delete = colors.git_delete,
    ignore = colors.fg_dark,
  }

  -- Terminal colors (16 ANSI colors)
  ---@class TerminalColors
  colors.terminal = {
    black = colors.bg,
    black_bright = colors.fg_dark,
    red = colors.red,
    red_bright = Util.brighten(colors.red),
    green = colors.green,
    green_bright = Util.brighten(colors.green),
    yellow = colors.yellow,
    yellow_bright = Util.brighten(colors.yellow),
    blue = colors.blue,
    blue_bright = Util.brighten(colors.blue),
    magenta = colors.magenta,
    magenta_bright = Util.brighten(colors.magenta),
    cyan = colors.cyan,
    cyan_bright = Util.brighten(colors.cyan),
    white = colors.fg,
    white_bright = colors.bg_visual,
  }

  -- Handle transparent background
  if opts.transparent then
    colors.bg = colors.none
    colors.bg_sidebar = colors.none
    colors.bg_float = colors.none
  end

  -- Call user customization hook
  if opts.on_colors then
    opts.on_colors(colors)
  end

  return colors
end

return M

local Util = require("andromeda.util")

local M = {}

M.url = "https://github.com/nvim-neo-tree/neo-tree.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  local dark = opts.styles.sidebars == "transparent" and c.none or Util.blend_bg(c.bg_sidebar, 0.8)
  -- stylua: ignore
  return {
    NeoTreeDimText              = { fg = c.fg_gutter },
    NeoTreeFileName             = { fg = c.fg },
    NeoTreeDirectoryIcon        = { fg = c.blue },
    NeoTreeGitModified          = { fg = c.orange },
    NeoTreeGitStaged            = { fg = c.green },
    NeoTreeGitUntracked         = { fg = c.magenta },
    NeoTreeNormal               = { fg = c.fg, bg = c.bg_sidebar },
    NeoTreeNormalNC             = { fg = c.fg, bg = c.bg_sidebar },
    NeoTreeTabActive            = { fg = c.blue, bg = c.bg_dark, bold = true },
    NeoTreeTabInactive          = { fg = c.fg_dark, bg = dark },
    NeoTreeTabSeparatorActive   = { fg = c.blue, bg = c.bg_dark },
    NeoTreeTabSeparatorInactive = { fg = c.bg, bg = dark },
    NeoTreeCursorLine           = { bg = opts.styles.sidebars == "transparent" and c.bg_visual or c.bg_highlight },
    NeoTreeWinSeparator         = { fg = opts.styles.sidebars == "dark" and c.bg or c.border, bg = opts.styles.sidebars == "transparent" and c.none or c.bg },
  }
end

return M

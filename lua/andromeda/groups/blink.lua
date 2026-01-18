local M = {}

M.url = "https://github.com/saghen/blink.cmp"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    BlinkCmpMenu            = { fg = c.fg, bg = c.bg_float },
    BlinkCmpMenuBorder      = "FloatBorder",
    BlinkCmpDoc             = { fg = c.fg, bg = c.bg_float },
    BlinkCmpDocBorder       = "FloatBorder",
    BlinkCmpMenuSelection   = { bg = c.bg_highlight },
    BlinkCmpLabelDetail     = { fg = c.fg_gutter },
    BlinkCmpLabelDescription = { fg = c.fg_gutter },
  }
end

return M

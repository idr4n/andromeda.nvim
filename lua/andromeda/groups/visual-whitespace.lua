local M = {}

M.url = "https://github.com/mcauley-penney/visual-whitespace.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  return {
    VisualNonText = { fg = c.fg_gutter, bg = c.bg_visual },
  }
end

return M

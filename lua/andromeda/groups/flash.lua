local M = {}

M.url = "https://github.com/folke/flash.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    FlashBackdrop = "InvNormal",
    FlashCurrent  = "IncSearch",
    FlashMatch    = "Search",
    FlashLabel    = { fg = c.bg_highlight, bg = c.pink },
  }
end

return M

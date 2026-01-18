local M = {}

M.url = "https://github.com/folke/which-key.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey          = { fg = c.blue },
    WhichKeyGroup     = { fg = c.fg },
    WhichKeyDesc      = { fg = c.fg },
    WhichKeySeparator = { fg = c.fg_gutter },
    WhichKeyNormal    = { bg = c.bg_sidebar },
    WhichKeyValue     = { fg = c.fg },
  }
end

return M

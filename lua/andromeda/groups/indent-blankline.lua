local M = {}

M.url = "https://github.com/lukas-reineke/indent-blankline.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    IndentBlanklineChar        = { fg = c.bg_highlight },
    IndentBlanklineContextChar = { fg = c.bg_search },
  }
end

return M

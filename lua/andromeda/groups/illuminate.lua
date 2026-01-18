local M = {}

M.url = "https://github.com/RRethy/vim-illuminate"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    IlluminatedWordRead  = { bg = c.bg_highlight },
    IlluminatedWordText  = { bg = c.bg_highlight },
    IlluminatedWordWrite = { bg = c.bg_highlight },
    illuminatedCurWord   = { bg = c.bg_highlight },
    illuminatedWord      = { bg = c.bg_highlight },
  }
end

return M

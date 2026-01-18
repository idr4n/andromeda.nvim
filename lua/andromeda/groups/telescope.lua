local M = {}

M.url = "https://github.com/nvim-telescope/telescope.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    TelescopeBorder        = "FloatBorder",
    TelescopeMatching      = "Title",
    TelescopeTitle         = "Title",
    TelescopePromptCounter = { fg = c.bg_search },
    TelescopeResultsNormal = { fg = c.fg },
  }
end

return M

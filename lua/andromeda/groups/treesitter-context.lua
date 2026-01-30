local M = {}

M.url = "https://github.com/nvim-treesitter/nvim-treesitter-context"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    TreesitterContext       = { bg = opts.transparent and c.none or c.bg },
    TreesitterContextBottom = { bg = c.none, underline = true, sp = c.cyan },
  }
end

return M

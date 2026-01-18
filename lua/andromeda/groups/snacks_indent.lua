local M = {}

M.url = "https://github.com/folke/snacks.nvim/blob/main/docs/indent.md"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    SnacksIndent      = { fg = c.bg_highlight, nocombine = true },
    SnacksIndentScope = { fg = c.magenta, nocombine = true },
  }
end

return M

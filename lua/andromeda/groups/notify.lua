local M = {}

M.url = "https://github.com/rcarriga/nvim-notify"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  --stylua: ignore
  return {
    NotifyBackground = { fg = c.fg, bg = c.bg },
    NotifyINFOIcon   = { fg = c.info },
    NotifyINFOTitle  = { fg = c.info },
  }
end

return M

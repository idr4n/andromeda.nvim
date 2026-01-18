local M = {}

M.url = "https://github.com/HiPhish/rainbow-delimiters.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    RainbowDelimiterBlue   = { fg = c.blue },
    RainbowDelimiterCyan   = { fg = c.cyan },
    RainbowDelimiterGreen  = { fg = c.green },
    RainbowDelimiterOrange = { fg = c.orange },
    RainbowDelimiterRed    = { fg = c.red },
    RainbowDelimiterViolet = { fg = c.purple },
    RainbowDelimiterYellow = { fg = c.yellow },
  }
end

return M

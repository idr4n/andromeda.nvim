local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    LazyButton        = { fg = c.bg_search },
    LazyButtonActive  = { fg = c.cyan },
    LazyNormal        = { fg = c.fg, bg = c.bg_highlight },
    LazySpecial       = { fg = c.cyan },
    LazyLocal         = { fg = c.pink },
    LazyDir           = { fg = c.cyan },
    LazyUrl           = { fg = c.cyan },
    LazyValue         = { fg = c.fg },
    LazyReasonCmd     = { fg = c.blue },
    LazyReasonEvent   = { fg = c.blue },
    LazyReasonFt      = { fg = c.blue },
    LazyReasonImport  = { fg = c.blue },
    LazyReasonKeys    = { fg = c.blue },
    LazyReasonPlugin  = { fg = c.bg_search },
    LazyReasonRuntime = { fg = c.blue },
    LazyReasonSource  = { fg = c.bg_search },
    LazyReasonStart   = { fg = c.blue },
  }
end

return M

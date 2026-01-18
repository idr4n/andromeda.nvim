local M = {}

M.url = "https://github.com/williamboman/mason.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    MasonError                     = { fg = c.git.delete },
    MasonHeader                    = { fg = c.cyan, bg = c.bg_highlight },
    MasonHeaderSecondary           = { fg = c.pink },
    MasonHighlight                 = { fg = c.cyan },
    MasonHighlightBlock            = { fg = c.cyan },
    MasonHighlightBlockBold        = { fg = c.pink, bg = c.bg_highlight },
    MasonHighlightBlockBoldSecondary = { fg = c.pink, bg = c.bg_highlight },
    MasonHighlightBlockSecondary   = { fg = c.cyan },
    MasonHighlightSecondary        = { fg = c.cyan },
    MasonMuted                     = { fg = c.fg_gutter },
    MasonMutedBlock                = { fg = c.bg_search },
    MasonMutedBlockBold            = { fg = c.fg_gutter },
    MasonNormal                    = { fg = c.fg, bg = c.bg_highlight },
  }
end

return M

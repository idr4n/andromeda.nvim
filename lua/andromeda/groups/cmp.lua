local M = {}

M.url = "https://github.com/hrsh7th/nvim-cmp"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    CmpDocumentation       = { fg = c.fg, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },
    CmpGhostText           = { fg = c.fg_dark },
    CmpItemAbbr            = { fg = c.fg, bg = c.none },
    CmpItemAbbrDeprecated  = { fg = c.fg_gutter, bg = c.none, strikethrough = true },
    CmpItemAbbrMatch       = { fg = c.magenta, bg = c.none },
    CmpItemAbbrMatchFuzzy  = { fg = c.magenta, bg = c.none },
    CmpItemKindCodeium     = { fg = c.cyan, bg = c.none },
    CmpItemKindCopilot     = { fg = c.cyan, bg = c.none },
    CmpItemKindSupermaven  = { fg = c.cyan, bg = c.none },
    CmpItemKindDefault     = { fg = c.fg_dark, bg = c.none },
    CmpItemKindTabNine     = { fg = c.cyan, bg = c.none },
    CmpItemMenu            = { fg = c.fg_gutter, bg = c.none },
  }

  require("andromeda.groups.kinds").kinds(ret, "CmpItemKind%s")
  return ret
end

return M

local M = {}

M.url = "https://github.com/folke/noice.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  local ret = {
    NoiceCmdlineIconInput          = { fg = c.fg },
    NoiceCmdlineIconLua            = { fg = c.blue },
    NoiceCmdlinePopupBorderInput   = { fg = c.yellow },
    NoiceCmdlinePopupBorderLua     = { fg = c.blue },
    NoiceCmdlinePopupTitleInput    = { fg = c.yellow },
    NoiceCmdlinePopupTitleLua      = { fg = c.blue },
    NoiceCompletionItemKindDefault = { fg = c.fg_dark, bg = c.none },
  }
  require("andromeda.groups.kinds").kinds(ret, "NoiceCompletionItemKind%s")
  return ret
end

return M

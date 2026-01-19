local M = {}

M.url = "https://github.com/nvim-tree/nvim-tree.lua"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    NvimTreeFolderIcon   = { bg = c.none, fg = c.blue },
    NvimTreeGitDeleted   = { fg = c.git.delete },
    NvimTreeGitDirty     = { fg = c.git.change },
    NvimTreeGitNew       = { fg = c.git.add },
    NvimTreeImageFile    = { fg = c.fg },
    NvimTreeIndentMarker = { fg = c.bg_search },
    NvimTreeNormal       = { fg = c.fg, bg = c.bg_sidebar },
    NvimTreeNormalNC     = { fg = c.fg, bg = c.bg_sidebar },
    NvimTreeNormalFloat  = { fg = c.fg, bg = c.bg_sidebar },
    NvimTreeOpenedFile   = { bg = c.bg_highlight },
    NvimTreeRootFolder   = { fg = c.blue, bold = true },
    NvimTreeSpecialFile  = { fg = c.purple, underline = true },
    NvimTreeSymlink      = { fg = c.blue },
    NvimTreeCursorLine   = { bg = opts.styles.sidebars == "transparent" and c.bg_visual or c.bg_highlight },
    NvimTreeWinSeparator = { fg = opts.styles.sidebars == "dark" and c.bg_sidebar or c.border, bg = c.bg_sidebar },
  }
end

return M

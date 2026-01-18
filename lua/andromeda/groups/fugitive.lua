local M = {}

M.url = "https://github.com/tpope/vim-fugitive"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    diffAdded              = { fg = c.git.add },
    diffRemoved            = { fg = c.git.delete },
    diffSubname            = { fg = c.fg },
    gitcommitComment       = { fg = c.bg_search },
    gitcommitDiscardedFile = { fg = c.bg_search },
    gitcommitDiscardedType = { fg = c.bg_search },
    gitcommitHeader        = { fg = c.cyan },
    gitcommitOnBranch      = { fg = c.pink },
    gitcommitSelectedFile  = { fg = c.cyan },
    gitcommitSelectedType  = { fg = c.cyan },
    gitcommitUntrackedFile = { fg = c.red },
  }
end

return M

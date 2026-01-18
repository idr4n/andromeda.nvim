local M = {}

M.url = "https://github.com/ThePrimeagen/harpoon"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- stylua: ignore
  return {
    HarpoonBorder = "FloatBorder",
    HarpoonWindow = "Title",
  }
end

return M

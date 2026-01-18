local config = require("andromeda.config")

local M = {}

---@param opts? andromeda.Config
function M.load(opts)
  opts = require("andromeda.config").extend(opts)
  vim.o.background = "dark"
  return require("andromeda.theme").setup(opts)
end

M.setup = config.setup

return M

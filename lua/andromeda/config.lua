local M = {}

---@class andromeda.Config
M.defaults = {
  transparent = false, -- Transparent background
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim

  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    floats = "normal", -- "dark" | "transparent" | "normal"
    sidebars = "normal", -- "dark" | "transparent" | "normal"
  },

  --- Override specific color groups to use other groups or a hex color
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- Override specific highlights to use other groups or a hex color
  ---@param highlights table<string, table>
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,

  ---@type table<string, boolean|{enabled:boolean}>
  plugins = {
    -- set to false to manually enable plugins
    all = true,
    -- add any plugins that you want to disable
    -- telescope = false,
  },
}

---@type andromeda.Config?
M.options = nil

---@param options? andromeda.Config
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? andromeda.Config
function M.extend(opts)
  local base = M.options or M.defaults
  return opts and vim.tbl_deep_extend("force", {}, base, opts) or base
end

setmetatable(M, {
  __index = function(_, k)
    if k == "options" then
      return M.defaults
    end
  end,
})

return M

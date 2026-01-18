local Util = require("andromeda.util")

local M = {}

-- Plugin registry mapping plugin names to group modules
-- stylua: ignore
M.plugins = {
  ["blink.cmp"]                 = "blink",
  ["bufferline.nvim"]           = "bufferline",
  ["flash.nvim"]                = "flash",
  ["gitsigns.nvim"]             = "gitsigns",
  ["glance.nvim"]               = "glance",
  ["harpoon"]                   = "harpoon",
  ["indent-blankline.nvim"]     = "indent-blankline",
  ["lazy.nvim"]                 = "lazy",
  ["mason.nvim"]                = "mason",
  ["mini.icons"]                = "mini_icons",
  ["mini.pick"]                 = "mini_pick",
  ["mini.tabline"]              = "mini_tabline",
  ["neo-tree.nvim"]             = "neo-tree",
  ["netrw"]                     = "netrw",
  ["noice.nvim"]                = "noice",
  ["nvim-cmp"]                  = "cmp",
  ["nvim-notify"]               = "notify",
  ["nvim-tree.lua"]             = "nvim-tree",
  ["nvim-treesitter-context"]   = "treesitter-context",
  ["rainbow-delimiters.nvim"]   = "rainbow-delimiters",
  ["render-markdown.nvim"]      = "render-markdown",
  ["telescope.nvim"]            = "telescope",
  ["snacks.indent"]             = "snacks_indent",
  ["snacks.picker"]             = "snacks_picker",
  ["vim-fugitive"]              = "fugitive",
  ["vim-gitgutter"]             = "gitsigns",  -- Use same gitsigns module
  ["vim-illuminate"]            = "illuminate",
  ["vim-signify"]               = "gitsigns",  -- Use same gitsigns module
  ["visual-whitespace.nvim"]    = "visual-whitespace",
  ["which-key.nvim"]            = "which-key",
}

function M.get_group(name)
  return require("andromeda.groups." .. name)
end

---@param colors ColorScheme
---@param opts andromeda.Config
function M.get(name, colors, opts)
  local mod = M.get_group(name)
  return mod.get(colors, opts)
end

---@param colors ColorScheme
---@param opts andromeda.Config
function M.setup(colors, opts)
  local groups = {
    base = true,
    kinds = true,
    semantic_tokens = true,
    treesitter = true,
  }

  if opts.plugins.all then
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  end

  -- manually enable/disable plugins
  for plugin_name, group in pairs(M.plugins) do
    local use = opts.plugins[plugin_name]
    if use == nil then
      use = opts.plugins[group]
    end
    if use ~= nil then
      if type(use) == "table" then
        use = use.enabled
      end
      groups[group] = use or nil
    end
  end

  -- merge highlights
  local ret = {}
  for group in pairs(groups) do
    for k, v in pairs(M.get(group, colors, opts)) do
      ret[k] = v
    end
  end

  -- Resolve style tables to individual properties
  Util.resolve(ret)

  opts.on_highlights(ret, colors)

  return ret
end

return M

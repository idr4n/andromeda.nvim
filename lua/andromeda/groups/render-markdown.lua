local Util = require("andromeda.util")

local M = {}

M.url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"

---@param c ColorScheme
---@param opts table
function M.get(c, opts)
  -- Rainbow colors for headings
  local rainbow = { c.blue, c.yellow, c.green, c.cyan, c.purple, c.magenta }
  
  -- stylua: ignore
  local ret = {
    RenderMarkdownBullet     = { fg = c.blue },
    RenderMarkdownCode       = { bg = c.bg_highlight },
    RenderMarkdownDash       = { fg = c.orange },
    RenderMarkdownTableHead  = { fg = c.red },
    RenderMarkdownTableRow   = { fg = c.blue },
    RenderMarkdownCodeInline = "@markup.raw.markdown_inline"
  }

  for i, color in ipairs(rainbow) do
    ret["RenderMarkdownH" .. i .. "Bg"] = { bg = Util.blend_bg(color, 0.1) }
    ret["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
  end

  return ret
end

return M

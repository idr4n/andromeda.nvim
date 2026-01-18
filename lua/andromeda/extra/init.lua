local M = {}

local extras = {
  alacritty = {
    name = "Alacritty",
    file_ext = "toml",
  },
  ghostty = {
    name = "Ghostty",
    file_ext = nil,
  },
  kitty = {
    name = "Kitty",
    file_ext = "conf",
  },
}

local function is_valid_plugin_dir()
  local cwd = vim.fn.getcwd()
  local plugin_path = cwd .. "/lua/andromeda"
  return vim.fn.isdirectory(plugin_path) == 1
end

local function create_extra_files()
  if not is_valid_plugin_dir() then
    vim.notify("Warning: Current directory must contain lua/andromeda", vim.log.levels.WARN)
    return
  end

  for extra_key, extra_config in pairs(extras) do
    -- Create directory if it doesn't exist
    local dir_path = "extras/" .. extra_key
    vim.fn.mkdir(dir_path, "p")

    -- Get colors for the theme
    local colors = require("andromeda.colors").setup({})

    -- Get the extra template function
    local template = require("andromeda.extra." .. extra_key).template

    -- Generate content from template
    local content = template(colors, extra_config.name)

    -- Create file
    local file_name = string.format("%s/andromeda", dir_path)
      .. (extra_config.file_ext and "." .. extra_config.file_ext or "")

    local file = io.open(file_name, "w")
    if file then
      file:write(content)
      file:close()
      vim.notify(string.format("Created %s", file_name), vim.log.levels.INFO)
    end
  end
end

function M.setup()
  create_extra_files()
  vim.notify("Terminal theme files generated successfully!", vim.log.levels.INFO)
end

return M

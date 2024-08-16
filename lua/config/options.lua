-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local is_windows = function()
  local is_windows_p = false
  if vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1 then
    is_windows_p = true
  end
  return is_windows_p
end

local set_shell = function()
  local is_windows_p = is_windows()
  local has_pwsh_p = vim.fn.executable("pwsh")
  if is_windows_p and has_pwsh_p then
    vim.o.shell = "pwsh"
  end
end
set_shell()

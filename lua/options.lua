require "nvchad.options"

vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_create_user_command('EditMappings', 'edit ~/AppData/Local/nvim/lua/mappings.lua', {})
vim.api.nvim_create_user_command('EditOptions', 'edit ~/AppData/Local/nvim/lua/options.lua', {})
vim.api.nvim_create_user_command('EditWezterm', 'edit ~/.config/wezterm/wezterm.lua', {})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout=500 })
  end,
})

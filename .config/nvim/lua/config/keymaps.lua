-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>cp", function()
  local ok, copilot = pcall(require, "copilot.client")
  if not ok then return end
  if copilot.is_disabled() then
    vim.cmd("Copilot enable")
    vim.notify("Copilot enabled", vim.log.levels.INFO)
  else
    vim.cmd("Copilot disable")
    vim.notify("Copilot disabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle Copilot" })

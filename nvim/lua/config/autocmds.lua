-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach({})]])

vim.cmd([[autocmd BufWritePre (InsertLeave?) <buffer> lua vim.lsp.buf.formatting_sync(nil,500)]])

vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    local floating = vim.api.nvim_win_get_config(0).relative ~= ""
    vim.diagnostic.config({
      virtual_text = floating,
      virtual_lines = not floating,
    })
  end,
})

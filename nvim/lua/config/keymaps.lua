-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local opts = { noremap = true, silent = true }

map("n", "<C-a>", "gg<S-v>G", { desc = "Select all", remap = true })

-- delete a word backwords
map("n", "dw", "vb_d")

-- Increment / Decrement
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("QA", "qa", {})
vim.api.nvim_create_user_command("Qa", "qa", {})

vim.keymap.set("", "<F2>", ":%s#\\s\\+$##<cr>")

vim.keymap.set("n", "gdl", ":diffget LOCAL<CR>", { noremap = true })
vim.keymap.set("n", "gdr", ":diffget REMOTE<CR>", { noremap = true })
vim.keymap.set("n", "gdb", ":diffget BASE<CR>", { noremap = true })

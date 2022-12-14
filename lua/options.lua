--[[
To see what an option is set to execute :lua = vim.o.<name>
--]]

vim.o.backup = false
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.dictionary = "/usr/share/dict/words"
vim.o.expandtab = true
vim.o.grepprg = "rg --vimgrep"
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 5
vim.o.shiftwidth = 4
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.showmatch = true
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.smartindent = true
-- vim.o.spell = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.updatetime = 100 -- affects CursorHold and subsequently things like highlighting Code Actions.
vim.o.wrap = false
vim.o.foldmethod = "indent"
vim.o.foldenable = false
vim.opt.listchars = 'tab:⇨|,nbsp:␣,trail:‗,extends:>,precedes:<' --eol:↵, tab:|⇆⇥_, tab:‗‗,
vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

if vim.fn.has("termguicolors") == 1 then
  vim.o.termguicolors = true
end

--[[
vim.o allows you to set global vim options, but not local buffer vim options.
vim.opt has a more expansive API that can handle local and global vim options.
See :h lua-vim-options
]]
vim.opt.colorcolumn = "80"

-- LSP configuration options
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)
vim.diagnostic.config({
  float = {
    border = "rounded",
  },
})


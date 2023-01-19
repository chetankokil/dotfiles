local cmd = vim.cmd

-- global
vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:append("c")

--local
-- vim.o.background = "light"
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 50
vim.g.do_filetype_lua = 1
vim.g.sonokai_style = 'maia'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_enable_italic = 1

vim.g['conjure#extract#tree_sitter#enabled'] = true
vim.cmd('highlight TelescopePreviewNormal guibg=none')
vim.cmd('highlight TelescopeBorder guibg=none')
vim.cmd('highlight NvimTreeNormal guibg=none')
vim.cmd('highlight  NvimTreeFolderIcon guifg=#81a1c1')
vim.cmd('highlight  NvimTreeFolderName guifg=#81a1c1')
--vim.cmd('colorscheme nord')
vim.cmd('highlight VertSplit guibg=none')
vim.cmd('highlight AlphaHeader guifg=#81a1c1')
-- vim.cmd('highlight Comment gui=italic')
vim.cmd('highlight AlphaFooter guifg=#81a1c1')
-- vim.cmd('highlight Keyword guifg=#575268')
vim.cmd('highlight Statusline guibg=none')
vim.cmd('highlight StatuslineNC guibg=none')
vim.cmd('highlight BufferLineModified guibg=Tabline guifg=#A3BE8C')
-- vim.cmd('highlight BufferLineModified guibg=#2e3440 guifg=#A3BE8C')
vim.cmd('highlight BufferLineModifiedSelected guifg=#A3BE8C guibg=#2e3440')
-- vim.cmd('highlight BufferLineModifiedSelected guifg=#A3BE8C guibg=Tabline')
-- vim.cmd('highlight Keyword guifg=#81A1C1')
vim.diagnostic.config({ virtual_text = false })

cmd([[colorscheme kanagawa]])
cmd[[highlight Normal guibg=0 ctermbg=0]]
cmd[[highlight CursorLine guibg=0]]

-- LSP
cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
-- NOTE: You may or may not want java included here. You will need it if you want basic Java support
-- but it may also conflict if you are using something like nvim-jdtls which also works on a java filetype
-- autocmd.
cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
-- cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])
cmd([[augroup end]])

-- If you want a :Format command this is useful
cmd [[autocmd BufWritePre * lua vim.lsp.buf.format{async = true}]]
--cmd([[command! Format lua vim.lsp.buf.formatting()]])
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])


local kanagawa_colors = require("kanagawa.colors").setup()
cmd(string.format([[hi! StatusLine guifg=%s guibg=%s]], kanagawa_colors.fujiGray, kanagawa_colors.sumiInk1))
cmd([[hi! link StatusLineNC Comment]])
cmd([[hi! link StatusError DiagnosticError]])
cmd([[hi! link statuswarn diagnosticWarn]])
cmd([[hi! link WinSeparator Comment]])

local kanagawa_group = vim.api.nvim_create_augroup("kanagawa", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
  group = kanagawa_group,
})



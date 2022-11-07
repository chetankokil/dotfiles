local cmd = vim.cmd

-- global
vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
vim.opt_global.shortmess:append("c")

--local
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250
vim.g.do_filetype_lua = 1
vim.g.sonokai_style = 'maia'
vim.g.sonokai_better_performance = 1
vim.g.sonokai_enable_italic = 1


vim.cmd('highlight Normal guibg=none')
vim.cmd('highlight TelescopeNormal guibg=none')
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
vim.cmd('highlight Keyword guifg=#575268')
vim.cmd('highlight Statusline guibg=none')
vim.cmd('highlight StatuslineNC guibg=none')
vim.cmd('highlight BufferLineModified guibg=Tabline guifg=#A3BE8C')
-- vim.cmd('highlight BufferLineModified guibg=#2e3440 guifg=#A3BE8C')
vim.cmd('highlight BufferLineModifiedSelected guifg=#A3BE8C guibg=#2e3440')
-- vim.cmd('highlight BufferLineModifiedSelected guifg=#A3BE8C guibg=Tabline')
vim.cmd('highlight Keyword guifg=#81A1C1')
vim.diagnostic.config({ virtual_text = false })

cmd([[colorscheme kanagawa]])
-- cmd[[highlight ColorColumn guibg=lightgrey]]

-- LSP
cmd([[augroup lsp]])
cmd([[autocmd!]])
cmd([[autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
-- NOTE: You may or may not want java included here. You will need it if you want basic Java support
-- but it may also conflict if you are using something like nvim-jdtls which also works on a java filetype
-- autocmd.
cmd([[autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]])
cmd([[augroup end]])

-- If you want a :Format command this is useful
cmd [[autocmd BufWritePre * lua vim.lsp.buf.format{async = true}]]
--cmd([[command! Format lua vim.lsp.buf.formatting()]])
vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })]])



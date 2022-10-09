local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- LSP
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
map("n", "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{async = true}<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>')
map("n", "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]]) -- all workspace diagnostics
map("n", "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]]) -- all workspace errors
map("n", "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]]) -- all workspace warnings
map("n", "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
map("n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
map("n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")

-- Example mappings for usage with nvim-dap. If you don't use that, you can
-- skip these
map("n", "<leader>dc", [[<cmd>lua require"dap".continue()<CR>]])
map("n", "<leader>dr", [[<cmd>lua require"dap".repl.toggle()<CR>]])
map("n", "<leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
map("n", "<leader>dt", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
map("n", "<leader>dso", [[<cmd>lua require"dap".step_over()<CR>]])
map("n", "<leader>dsi", [[<cmd>lua require"dap".step_into()<CR>]])
map("n", "<leader>dl", [[<cmd>lua require"dap".run_last()<CR>]])


map("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<cr>]])
map("n", "<leader>fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]])
map("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]])
map("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]])
map("n", "<leader>mc", [[<cmd>lua require('telescope').extensions.metals.commands()<cr>]])
map("n", "<leader>fd", [[<cmd>lua require('telescope.builtin').diagnostics()<cr>]])
map("n", "<leader>ffb", [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>]])


map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "Y", "y$")
map("n","<C-a>", "gg<S-v>G")


-- nvim-tree toggle
map("n", "<leader>n" , ":NvimTreeToggle<cr>" , { noremap = true })


-- split windows
map("n", "ss", ":split<Return><C-w>w", { silent = true })
map("n", "sv", ":vsplit<Return><C-w>w", { silent = true})


-- move windows
map("n", "<Space>" ,"<C-w>w")
map("", "s<left>" ,"<C-w>h")
map("", "s<up>" ,"<C-w>k")
map("", "s<down>" ,"<C-w>j")
map("n", "s<right>" ,"<C-w>l")

map("n","<Tab>", ":tabn<cr>")
map("n","<S-Tab>", ":tabp<cr>")

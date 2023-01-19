local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


local builtin = require 'telescope.builtin'
local Path = require('plenary.path')
local action_state = require('telescope.actions.state')

local function go_up_level_mappings(_, map)
  map('i', "<C-u>", function(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local prompt = action_state.get_current_line()

    local cwd = Path:new(picker.cwd or ".")
    local parent = cwd:parent().filename

    picker:close_existing_pickers()
    builtin.find_files({
      cwd = parent,
      attach_mappings = go_up_level_mappings,
      default_text = prompt,
      max_results = 50,
    })
  end)
  return true
end

-- LSP
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map('n', '<leader>v', ':vsplit | lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>s', ':belowright split | lua vim.lsp.buf.definition()<CR>')
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
-- map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences'})
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
map("n", "<F5>", [[<cmd>lua require"dap".continue()<CR>]])
map("n", "<leader>dr", [[<cmd>lua require"dap".repl.toggle()<CR>]])
map("n", "<leader>b", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
map("n", "<F10>", [[<cmd>lua require"dap".step_over()<CR>]])
map("n", "<F11>", [[<cmd>lua require"dap".step_into()<CR>]])
map("n", "<F12>", [[<cmd>lua require"dap".step_out()<CR>]])
map("n", "<leader>dl", [[<cmd>lua require"dap".run_last()<CR>]])
map("n", "<leader>dut", [[<cmd>lua require"dapui".toggle()<CR>]])

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

map("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<cr>]])
map("n", "<Leader>fr", ":Telescope oldfiles<CR>", { noremap = true, silent = true })
map("n", "<leader>fg", [[<cmd>lua require('telescope.builtin').live_grep()<cr>]])
map("n", "<leader>fw", [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { desc = '[F]ind Current [W]ord'})
map("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').buffers()<cr>]])
map("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<cr>]])
map("n", "<leader>mc", [[<cmd>lua require('telescope').extensions.metals.commands()<cr>]])
map("n", "<leader>fd", [[<cmd>lua require('telescope.builtin').diagnostics()<cr>]])
map("n", "<leader>ffb", [[<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>]])
map("n", "<leader>ffd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
map("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
map("n", "<leader>ds", ":SymbolsOutline<CR>", {noremap = true, silent = true})
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")
map("n", "H", "^")
map("n", "L", "$")
map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "Y", "y$")
map("n","<C-a>", "gg<S-v>G")
map("n","<C-/>", ":Commentary<CR>", {noremap = true, silent = true})
map("v","<C-/>", ":Commentary<CR>", {noremap = true, silent = true})
map('v', '<leader>D', '"_D', opts) -- delete into blackhole register
map('v', '<leader>dd', '"_dd', opts) -- TODO dont walk 1 line down from eol

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


-- copilot next mappings  (copilot.nvim)
map("n", "<leader>cn", "<cmd>lua require'copilot'.next()<CR>") 
map("n", "<leader>cp", "<cmd>lua require'copilot'.prev()<CR>") 
map("n", "<leader>cc", "<cmd>lua require'copilot'.close()<CR>") 
map("n", "<leader>cs", "<cmd>lua require'copilot'.start()<CR>")   
map("n", "<leader>ce", "<cmd>lua require'copilot'.stop()<CR>")  
map("n", "<leader>ca", "<cmd>lua require'copilot'.add()<CR>")
map("n", "<leader>cd", "<cmd>lua require'copilot'.delete()<CR>")  
map("n", "<leader>cr", "<cmd>lua require'copilot'.rename()<CR>")
map("n", "<leader>cf", "<cmd>lua require'copilot'.find()<CR>")
map("n", "<leader>cm", "<cmd>lua require'copilot'.move()<CR>")
map("n", "<leader>co", "<cmd>lua require'copilot'.open()<CR>")
map("n", "<leader>ct", "<cmd>lua require'copilot'.toggle()<CR>")
map("n", "<leader>cl", "<cmd>lua require'copilot'.list()<CR>")  
map("n", "<leader>cg", "<cmd>lua require'copilot'.goto()<CR>")
map("n", "<leader>cu", "<cmd>lua require'copilot'.update()<CR>")  
map("n", "<leader>cv", "<cmd>lua require'copilot'.view()<CR>")  
map("n", "<leader>cx", "<cmd>lua require'copilot'.execute()<CR>") 
map("n", "<leader>cy", "<cmd>lua require'copilot'.yank()<CR>")  
map("n", "<leader>cz", "<cmd>lua require'copilot'.zoom()<CR>")  
map("n", "<leader>cq", "<cmd>lua require'copilot'.quit()<CR>")  
--

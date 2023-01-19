local nvim_lsp = require'lspconfig'

local rt = {
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
        },
    },

        -- all the opts to send to nvim-lspconfig
        -- these override the defaults set by rust-tools.nvim
        -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
        server = {
            -- on_attach is a callback called when the language server attachs to the buffer
            -- on_attach = on_attach,

             on_attach = function(client, bufnr)
             --     -- Hover actions
                 local bufopts = { noremap = true, silent = true, buffer = bufnr }
                  vim.keymap.set("n", "<C-space>", "<cmd>RustHoverActions<CR>", bufopts)
             --     -- Code action groups
             --   vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                  require 'illuminate'.on_attach(client)
                  local id = vim.api.nvim_create_augroup("RustLint", { clear = true })
                  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
                    group = id,
                    pattern = "*.rs",
                    callback = function()
             -- NOTE: ../../settings/shared.lua has a broader wildcard executing formatting.
                        require("lint").try_lint()
                    end,
                 })  
            end,
        settings = {

            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                assist = {
                      importEnforceGranularity = true,
                      importPrefix = "crate"
                  },
                cargo = {
                      allFeatures = true
                  },
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
                inlayHints  = {
                    locationLinks = false,
                    lifetimeElisionHints = {
                        enable = true,
                        useParameterNames = true
                      },
                },
            }
        }
    },
}

nvim_lsp.pyright.setup{}
require('rust-tools').setup(rt)

local lsp_group = vim.api.nvim_create_augroup("lsp", { clear = true })

return {
  "scalameta/nvim-metals",
  ft = { "scala", "sbt", "sc" },
  config = function()
    local metals_config = require("metals").bare_config()

    metals_config.settings = {
      showImplicitArguments = true,
      excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
    }
    metals_config.on_attach = function(client, bufnr)
      require("plugins.lsp.keys").setup(client, bufnr)
      vim.api.nvim_create_autocmd("CursorHold", {
        callback = vim.lsp.buf.document_highlight,
        buffer = bufnr,
        group = lsp_group,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        callback = vim.lsp.buf.clear_references,
        buffer = bufnr,
        group = lsp_group,
      })
      vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
        callback = vim.lsp.codelens.refresh,
        buffer = bufnr,
        group = lsp_group,
      })
    end

    metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
    local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "scala", "sbt", "java" },
      callback = function()
        require("metals").initialize_or_attach(metals_config)
      end,
      group = nvim_metals_group,
    })
  end,
}

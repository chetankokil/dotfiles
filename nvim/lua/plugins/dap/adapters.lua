local dap_vscode_ok, dap_vscode = pcall(require, "dap-vscode-js")
if not dap_vscode_ok then
  vim.api.nvim_err_writeln("dap-vscode-js not installed!")
  return
end

local mason_registry = require("mason-registry")

return {
  setup = function(dap)
    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
    }

    dap.adapters.go = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }

    dap.adapters.lldb = {
      type = "executable",
      command = "/usr/bin/lldb-vscode", -- adjust as needed
      name = "lldb",
    }

    dap.adapters.rust = {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    }

    -- local codelldb_root = mason_registry.get_package("codelldb"):get_install_path() .. "/extension/"
    -- local codelldb_path = codelldb_root .. "adapter/codelldb"
    -- local liblldb_path = codelldb_root .. "lldb/lib/liblldb.so"
    --
    -- dap.adapters.rust = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)

    -- The VSCode Debugger requires a special setup
    dap_vscode.setup({
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
      debugger_path = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter", -- Path to VSCode Debugger
      debugger_cmd = { "js-debug-adapter" },
    })
  end,
}

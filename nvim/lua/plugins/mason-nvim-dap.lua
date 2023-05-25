return {
  "jay-babu/mason-nvim-dap.nvim",
  config = function()
    require("mason-nvim-dap").setup({
      ensure_installed = { "python", "delve" },
      automatic_installation = true,
      handlers = {
        function(config)
          -- all sources with no handler get passed here

          -- Keep original functionality
          require("mason-nvim-dap").default_setup(config)
        end,
        python = function(config)
          config.adapters = {
            type = "executable",
            command = "/usr/bin/python3",
            args = {
              "-m",
              "debugpy.adapter",
            },
          }
          require("mason-nvim-dap").default_setup(config) -- don't forget this!
        end,
        go = function(config)
          config.adapters = {
            type = "server",
            port = "${port}",
            executable = {
              command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
              args = { "dap", "-l", "127.0.0.1:${port}" },
            },
          }
        end,
        rust = function(config)
          config.adapters = {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          }
        end,
      },
    })
  end,
}

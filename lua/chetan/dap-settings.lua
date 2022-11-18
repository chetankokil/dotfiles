local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  command = 'python3';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
   {
     type = 'python';
     request = 'launch';
     name = "Launch file";
     program = "${file}";
     pythonPath = function()
       return '/opt/homebrew/bin/python3.10'
     end;
   },
}




vim.fn.sign_define("DapBreakpoint", { text = "⬢", texthl = "Yellow", linehl = "", numhl = "Yellow" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "Green", linehl = "ColorColumn", numhl = "Green" })




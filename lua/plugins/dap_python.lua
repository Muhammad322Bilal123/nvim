
local M = {}


function M.setup()
  local dap = require("dap")

  dap.adapters.python = {
    type = "executable",
    command = os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python",
    args = { "-m", "debugpy.adapter" },
  }

  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        return "/usr/bin/python3"
      end,
    },
  }
end

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.close()
    dap.close()
  end
})



return M

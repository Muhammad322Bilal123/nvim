local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = vim.fn.exepath("debugpy-adapter"), -- Mason path
  args = {},
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.exepath("python3")
    end,
  },
}
local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = vim.fn.exepath("debugpy-adapter"), -- Mason path
  args = {},
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.exepath("python3")
    end,
  },
}


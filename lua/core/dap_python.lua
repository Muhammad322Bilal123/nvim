
local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = "/home/biiiiai/Desktop/AI_prac/venv/venv/bin/python3",  -- Your Python venv path
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",   -- current file
    pythonPath = "/home/biiiiai/Desktop/AI_prac/venv/venv/bin/python3",
  },
}

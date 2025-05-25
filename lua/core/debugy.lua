local M = {}

function M.setup()
  local dap = require("dap")
  local dapui = require("dapui")

  -- Setup dap-ui with custom layouts and controls
  dapui.setup({
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.3 },
          { id = "breakpoints", size = 0.2 },
          { id = "stacks", size = 0.2 },
          { id = "watches", size = 0.3 },
        },
        size = 30,  -- reduced to avoid layout clash with file explorer
        position = "left",
      },
      {
        elements = {
          { id = "repl", size = 0.5 },
          { id = "console", size = 0.5 },
        },
        size = 10,
        position = "bottom",
      },
    },
    controls = {
      enabled = true,
      element = "repl",
      icons = {
        pause = "",
        play = "",
        step_into = "",
        step_over = "",
        step_out = "",
        step_back = "",
        run_last = "",
        terminate = "",
      },
    },
  })

  -- Auto-open/close dap-ui
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  -- Optional: close dapui when opening file explorer
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "NvimTree*", "neo-tree*" },
    callback = function()
      require("dapui").close()
    end,
  })

  -- Python debug adapter configuration
  dap.adapters.python = {
    type = "executable",
    command = "python3",
    args = { "-m", "debugpy.adapter" },
  }

  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        local venv_path = os.getenv("VIRTUAL_ENV")
        if venv_path then
          return venv_path .. "/bin/python"
        end
        return "python3"
      end,
    },
  }
end

return M

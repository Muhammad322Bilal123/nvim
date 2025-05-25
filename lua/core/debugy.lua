local M = {}

function M.setup()
  local dap = require("dap")
  local dapui = require("dapui")

  -- Setup dap-ui with custom layouts and controls
  dapui.setup({
    layouts = {
      {
        -- Left sidebar with debugging info panels
        elements = {
          { id = "scopes", size = 0.3 },       -- Variables in current scope
          { id = "breakpoints", size = 0.2 },  -- List of breakpoints
          { id = "stacks", size = 0.2 },       -- Call stack frames
          { id = "watches", size = 0.3 },      -- Expressions being watched
        },
        size = 30,    -- Sidebar width (columns)
        position = "left",
      },
      {
        -- Bottom panel with REPL and console output
        elements = {
          { id = "repl", size = 0.5 },         -- Debug REPL for input/output
          { id = "console", size = 0.5 },      -- Debug console logs
        },
        size = 10,    -- Height (rows)
        position = "bottom",
      },
    },
    controls = {
      enabled = true,
      element = "repl",  -- Show debug controls in the REPL element
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

  -- Automatically open dapui when debugging session starts
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  -- Automatically close dapui when debugging session ends or exits
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  -- Optionally close dapui when opening file explorers to avoid clutter
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "NvimTree*", "neo-tree*" },
    callback = function()
      dapui.close()
    end,
  })

  -- Python debug adapter configuration using debugpy
  dap.adapters.python = {
    type = "executable",
    command = "python3",
    args = { "-m", "debugpy.adapter" },
  }

  -- Python debug configuration for launching the current file
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        local venv_path = os.getenv("VIRTUAL_ENV")
        if venv_path then
          -- Use the Python interpreter from the virtual environment if set
          return venv_path .. "/bin/python"
        end
        -- Fallback to system python3
        return "python3"
      end,
    },
  }
end

return M


-- lua/core/lsp_signature.lua

-- Patch open_floating_preview to limit width and height globally (for all LSP floating windows)
local orig_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  opts = opts or {}
  opts.max_width = opts.max_width or 20   -- max width 60 columns
  opts.max_height = opts.max_height or 6  -- max height 6 lines
  return orig_open_floating_preview(contents, syntax, opts, ...)
end

require("lsp_signature").setup({
  bind = true,
  doc_lines = 2,
  floating_window = true,
  hint_enable = true,
  hint_prefix = "🔹 ",
  handler_opts = {
    border = "rounded",
    max_width = 60,  -- consistent with patched global max width
    max_height = 4,  -- limit height specifically for signature help
  },
  always_trigger = false,
  auto_close_after = nil,
  extra_trigger_chars = {},
})

-- Enable line wrapping and breakindent in signature floating windows
vim.api.nvim_create_autocmd("WinScrolled", {
  pattern = "*",
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_win_get_buf(win)
    local config = vim.api.nvim_win_get_config(win)
    if config and config.relative == "cursor" then
      -- These are floating windows near cursor, likely signature help
      vim.api.nvim_buf_set_option(buf, "wrap", true)
      vim.api.nvim_buf_set_option(buf, "linebreak", true)
      vim.api.nvim_buf_set_option(buf, "breakindent", true)
    end
  end,
})

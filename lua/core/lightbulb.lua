
-- lua/plugins/lightbulb.lua
vim.opt.updatetime = 200  -- make CursorHold trigger faster

return {
  "kosayoda/nvim-lightbulb",
  dependencies = { "antoinemadec/FixCursorHold.nvim" },
  config = function()
    require("nvim-lightbulb").setup({
      autocmd = { enabled = true },
      sign = {
        enabled = true,
        priority = 10,
      },
      float = { enabled = false },
      virtual_text = { enabled = false },
    })

    vim.cmd([[
      augroup LightBulb
        autocmd!
        autocmd CursorHold,CursorHoldI * lua require("nvim-lightbulb").update_lightbulb()
      augroup END
    ]])
  end,
}

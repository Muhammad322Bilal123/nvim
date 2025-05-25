local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")



local logo = {
  "██████   ███  █      █  ",
  "██   ██   █   █      █  ",
  "█████     █   █      █  ",
  "██   ██   █   █      █  ",
  "██████   ███  __________",
}


--dashboard.section.header.val = logo

dashboard.section.buttons.val = {
  dashboard.button("f", "📂  Find file", ":Telescope find_files<CR>"),
  dashboard.button("t", "📁  File Browser", ":NvimTreeToggle<CR>"),
  dashboard.button("p", "📦  Open project", ":Telescope projects<CR>"),
  dashboard.button("r", "🔍  Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "⚙️  Settings", ":e $MYVIMRC<CR>"),
  dashboard.button("q", "⏻  Quit", ":qa<CR>"),
}



alpha.setup(dashboard.config)

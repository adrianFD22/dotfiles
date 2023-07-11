local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<Leader>ha", mark.add_file)
vim.keymap.set("n", "<Leader>hp", ui.toggle_quick_menu)

vim.keymap.set("n", "<Leader>hh", ui.nav_prev)
vim.keymap.set("n", "<Leader>hl", ui.nav_next)

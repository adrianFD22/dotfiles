
-- Windows
vim.keymap.set("n", "<A-h>", function() vim.cmd("wincmd h") end)
vim.keymap.set("n", "<A-j>", function() vim.cmd("wincmd j") end)
vim.keymap.set("n", "<A-k>", function() vim.cmd("wincmd k") end)
vim.keymap.set("n", "<A-l>", function() vim.cmd("wincmd l") end)

-- Change directory
vim.keymap.set("n", "<Leader>cd", function() vim.cmd("cd %:h | pwd") end)

-- Reload config
vim.keymap.set("n", "<Leader>r", function() vim.cmd("source ~/.config/nvim/init.lua") print("init.lua reloaded") end)

-- Open terminal
vim.keymap.set("n", "<A-t>", function() vim.cmd("silent !$TERMINAL --working-directory %:h&") end)

-- Execute current buffer
--vim.keymap.set("n", "<Leader>.", function () vim.cmd('!%:p')end)
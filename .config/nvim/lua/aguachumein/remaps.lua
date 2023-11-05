
-- Navigate windows
--vim.keymap.set("n", "<A-h>", function() vim.cmd("wincmd h") end)
--vim.keymap.set("n", "<A-j>", function() vim.cmd("wincmd j") end)
--vim.keymap.set("n", "<A-k>", function() vim.cmd("wincmd k") end)
--vim.keymap.set("n", "<A-l>", function() vim.cmd("wincmd l") end)

-- Navigate buffers
vim.keymap.set("n", "<A-h>", function() vim.cmd("bp") end)
vim.keymap.set("n", "<A-l>", function() vim.cmd("bn") end)

-- Change directory
vim.keymap.set("n", "<Leader>cd", function() vim.cmd("cd %:h | pwd") end)


-- Remap j to gj
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('v', 'k', 'gk')

-- Reload config
vim.keymap.set("n", "<Leader>r", function() vim.cmd("source ~/.config/nvim/init.lua") print("init.lua reloaded") end)

-- Open terminal
vim.keymap.set("n", "<A-t>", function() vim.cmd("silent !$TERMINAL --working-directory %:h&") end)

-- Execute current buffer
--vim.keymap.set("n", "<Leader>.", function () vim.cmd('!%:p')end)

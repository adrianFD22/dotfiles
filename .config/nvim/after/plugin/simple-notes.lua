
-- Old

-- Config simple-notes
--local notes = require("simple-notes")
--
--notes.setup({
    --daily_dir = "/home/adrian/Notes/Daily/",
    ----templates_dir = "/home/adrian/Notes/.templates/Standard/"
    --templates_dir = "/home/adrian/Notes/.templates/Standard/"
--})
--
---- Navigate notes
--vim.keymap.set("n", "<leader>cn", notes.open_daily_note)	-- Open daily note
--vim.keymap.set("n", "<leader>pc", function() notes.print_calendar(7) end)

--------------------------------------------------

-- Utils
function open_note()
    local note = vim.fn.system("simple-notes get note")

    local command = "e " .. note
    vim.cmd(command)
end

-- Navigate notes
vim.keymap.set("n", "<leader>cn", open_note)	-- Open daily note

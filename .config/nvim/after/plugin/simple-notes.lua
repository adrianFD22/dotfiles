
-- Config simple-notes
local notes = require("simple-notes")

notes.setup({
    daily_dir = "/home/adrian/Personal/Notes/Daily/",
    templates_dir = "/home/adrian/Personal/Notes/Templates/Standard/"
    --templates_dir = "/home/adrian/Personal/Notes/Templates/Travel/"
})

-- Navigate notes
vim.keymap.set("n", "<leader>cn", notes.open_daily_note)	-- Open daily note
--vim.keymap.set("n", "<leader>pc", function() notes.print_calendar(7) end)

-- Insert markdown syntax
--vim.keymap.set("n", "<leader>mc", notes.toggle_checkbox) 	-- Toggle checkbox


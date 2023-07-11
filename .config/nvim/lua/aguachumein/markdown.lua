
-- Utils
function string.insert(str1, str2, pos)
    return str1:sub(1,pos)..str2..str1:sub(pos+1)
end


-- Cool functions
local function toggle_checkbox()
    local blank_reg = "^%s*"

    local unchecked_reg = "%- %[ %]"
    local checked_reg = "%- %[x%]"
    local list_item_reg = "%-"

    local unchecked = "- [ ]"
    local checked = "- [x]"

    local current_line = vim.api.nvim_get_current_line()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local new_line = ""

    if current_line:find(blank_reg .. checked_reg) then
        print("checked match")
        new_line = current_line:gsub(checked_reg, unchecked)
    elseif current_line:find(blank_reg .. unchecked_reg) then
        print("unchecked match")
        new_line = current_line:gsub(unchecked_reg, checked)
    elseif current_line:find(blank_reg .. list_item_reg) then
        print("list match")
        new_line = current_line:gsub(list_item_reg, unchecked)
    else
        return
    end

    vim.api.nvim_buf_set_lines(0, row-1, row, true, {new_line})
end


-- Insert markdown syntax
vim.keymap.set("n", "<leader>mc", toggle_checkbox) 	-- Toggle checkbox

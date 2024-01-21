

----------------------------------------
--             Functions
----------------------------------------

-- Check if file exists
local function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

-- Compiles the main tex file of current project
local function CompileMainTex()
    local dirs, dir_path, dir_name, file_name, command

    -- Find main in current folder
    dir_path = vim.fn.expand('%:p:h')

    dirs = {".", ".."}

    for _, path in ipairs(dirs) do
        dir_name = dir_path .. "/".. path
        file_name = dir_name .. "/main.tex"
        if file_exists(file_name) then
            -- Compile latex
            command = "pdflatex -output-directory='" .. dir_name .. "' '" .. file_name .. "' > /dev/null &"
            os.execute(command)
            print("Compile main.tex")
            return
        end
    end

    print("No main.tex file found")
end

-- Compiles the ref.bib file of current project
local function CompileBib()
    local dirs, dir_path, dir_name, biber_cmd, bibtex_cmd, command

    -- Find main in current folder
    dir_path = vim.fn.expand('%:p:h')

    dirs = {".", ".."}

    for _, path in ipairs(dirs) do
        dir_name = dir_path .. "/".. path .. "/"
        if file_exists(dir_name .. "ref.bib") and file_exists(dir_name .. "main.tex") then
            -- Compile bibtex
            biber_cmd = "biber --output-directory=" .. dir_name .. " --input-directory=".. dir_name .. " " .. dir_name .. "main"
            bibtex_cmd = "bibtex " .. dir_name .. "main"
            command = biber_cmd .. " || " .. bibtex_cmd .. " &"
            os.execute(command)
            print("Compile bib")
            return
        end
    end

    print("No main.tex and ref.bib found")
end


----------------------------------------
--             Shortcuts
----------------------------------------

vim.keymap.set("n", "<Leader>lc", CompileMainTex)                           -- Compile current buffer
vim.keymap.set("n", "<Leader>lb", CompileBib)                           -- Compile current buffer
vim.keymap.set("n", "<Leader>w", function() vim.cmd("set wrap!") end)

-- Math mode text-object

-- https://thevaluable.dev/vim-create-text-objects/
vim.api.nvim_set_keymap('x', "i" .. '$', string.format(':<C-u>silent! normal! f%sF%slvt%s<CR>', '$', '$', '$'), { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', "a" .. '$', string.format(':<C-u>silent! normal! f%sF%svf%s<CR>', '$', '$', '$'), { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', "i" .. '$', string.format(':<C-u>silent! normal! f%sF%slvt%s<CR>', '$', '$', '$'), { noremap = true, silent = true })
vim.api.nvim_set_keymap('o', "a" .. '$', string.format(':<C-u>silent! normal! f%sF%svf%s<CR>', '$', '$', '$'), { noremap = true, silent = true })



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
    local dirs, dir_path, file_name, command

    -- Find main in current folder
    file_name = vim.fn.expand('%:r')
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

-- Executes biber on the current file
local function CompileBibliography()
    local dir_path, file_name, command, biber_cmd, bibtex_cmd

    -- Check file type
    if vim.bo.filetype ~= "tex" then
        print("Invalid filetype for biber: " .. vim.bo.filetype)
        return nil
    end

    -- Get file name
    file_name = vim.fn.expand('%:r')
    dir_path = vim.fn.expand('%:p:h')

    -- Compile tex
    biber_cmd = "biber --output-directory=" .. dir_path .. " --input-directory=".. dir_path .. " " .. file_name
    bibtex_cmd = "bibtex " .. file_name
    command = bibtex_cmd .. " || " .. biber_cmd .. " &"
    os.execute(command)

    print("Compiling bibliography")
end

----------------------------------------
--             Shortcuts
----------------------------------------

vim.keymap.set("n", "<Leader>lc", CompileMainTex)                           -- Compile current buffer
vim.keymap.set("n", "<Leader>lb", CompileBibliography)                           -- Compile current buffer
vim.keymap.set("n", "<Leader>w", function() vim.cmd("set wrap!") end)

-- Remap j to gj
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('v', 'j', 'gj')
vim.keymap.set('v', 'k', 'gk')


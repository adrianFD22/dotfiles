

----------------------------------------
--             Functions
----------------------------------------

-- Compiles the tex file of the current buffer
local function CompileTex()
    local dir_path, file_name, command

    -- Check file type
    if vim.bo.filetype ~= "tex" then
        print("Invalid filetype for tex compiling: " .. vim.bo.filetype)
        return nil
    end

    -- Get file name
    file_name = vim.fn.expand('%:r')
    dir_path = vim.fn.expand('%:p:h')

    -- Compile tex
    command = "pdflatex -output-directory='" .. dir_path .. "' '" .. file_name .. "' > /dev/null &"
    os.execute(command)

    print("Compile tex")
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

-- Changes j and k with gj and gk in function on how the wrap option is set
local function ChangeGJ()
    local wrap

    wrap = vim.opt.wrap:get()

    if wrap then
        -- Normal mode
        vim.keymap.set('n', 'j', 'gj')
        vim.keymap.set('n', 'k', 'gk')

        -- Visual mode
        vim.keymap.set('v', 'j', 'gj')
        vim.keymap.set('v', 'k', 'gk')

    else
        vim.keymap.del('n', 'j')
        vim.keymap.del('n', 'k')
    end
end

-- Toggle 'wrap mode'
local function ToggleWrapMode()
    vim.cmd("set wrap!")
    ChangeGJ()
end


----------------------------------------
--             Shortcuts
----------------------------------------

vim.keymap.set("n", "<Leader>lc", CompileTex)                           -- Compile current buffer
vim.keymap.set("n", "<Leader>lb", CompileBibliography)                           -- Compile current buffer
vim.keymap.set("n", "<Leader>w", ToggleWrapMode)   -- Toggle wrap

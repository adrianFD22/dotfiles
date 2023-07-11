

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
    command = "pdflatex -output-directory=" .. dir_path .. " " .. file_name .. " > /dev/null &"
    os.execute(command)

    print("Compile tex")
end

-- Executes biber on the current file
local function ExecuteBiber()
    local dir_path, file_name, full_path, command

    -- Check file type
    if vim.bo.filetype ~= "tex" then
        print("Invalid filetype for biber: " .. vim.bo.filetype)
        return nil
    end

    -- Get file name
    file_name = vim.fn.expand('%:r')
    dir_path = vim.fn.expand('%:p:h')

    full_path = dir_path .. "/" .. file_name

    -- Compile tex
    command = "biber --output-directory=" .. dir_path .. " --input-directory=".. dir_path .. " " .. file_name .. " &"
    os.execute(command)

    print("Executing biber")
end

-- Changes j and k with gj and gk in function on how the wrap option is set
local function ChangeGJ()
    local wrap

    wrap = vim.opt.wrap:get()

    if wrap then
        vim.keymap.set('n', 'j', 'gj')
        vim.keymap.set('n', 'k', 'gk')
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
vim.keymap.set("n", "<Leader>lb", ExecuteBiber)                           -- Compile current buffer
vim.keymap.set("n", "<Leader>w", ToggleWrapMode)   -- Toggle wrap

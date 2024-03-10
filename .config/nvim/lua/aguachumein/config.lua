
-- Leader
vim.g.mapleader = " "

-- Appearance
vim.cmd('colorscheme gruvbox-material')
vim.opt.colorcolumn = "0"
vim.opt.guicursor = 'i:block'

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

-- Tab identing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Line wrap
vim.opt.wrap = false
vim.opt.list = false
vim.opt.linebreak = true

-- Search case insensitive
vim.cmd('set ic')

-- Incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Scroll
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 3

-- Time
vim.opt.updatetime = 50

-- Swap file
vim.opt.swapfile = false
vim.opt.backup = false

-- Copy and paste
vim.opt.clipboard:append("unnamedplus", "unnamed")

-- Remove trailing whitespaces
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Custom filetypes
vim.filetype.add({
	extension = {

        -- GAP
		g = 'gap',
		gd = 'gap',
		gi = 'gap',

        -- Tex
        tex = "tex",
        sty = "tex",

        -- Python
        sage = "python",
	}
})

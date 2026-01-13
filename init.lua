require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.clipboard = "unnamedplus"

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "//"

require('command-completion').setup()
Telescope = require('telescope')
Telescope.setup()
Telescope.load_extension('media_files')

-- *TODO - Setup Telescope keybinds with built-in pickers with my custom idea
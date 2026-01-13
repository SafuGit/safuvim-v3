require("config.lazy")
require("config.lsp")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8

vim.opt.clipboard = "unnamedplus"
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true })
vim.keymap.set("n", "<C-v>", '"+p', { noremap = true })
vim.keymap.set("v", "<C-v>", '"+p', { noremap = true })
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true })

vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true })

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "//"

require('command-completion').setup()
-- require('lir').setup() -- *TODO - Configure lir.nvim with command pallete
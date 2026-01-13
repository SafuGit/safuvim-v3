require("config.lazy")
require("config.lsp")

-- Leader key
vim.g.mapleader = "<Space>"
vim.g.maplocalleader = "//"

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

vim.keymap.set("n", "<leader>p", function()
  require("palette.ui.palette").open()
end)

require('command-completion').setup()
require('palette').setup()
-- require('lir').setup() -- *TODO - Configure lir.nvim with command palette
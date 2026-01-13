-- Leader key
vim.g.mapleader = "<Space>"
vim.g.maplocalleader = "//"

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

vim.keymap.set("n", "qf", function()
  vim.cmd("Telescope commander")
end)

local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require('command-completion').setup()
require('lir').setup({
    show_hidden_files = false,
  ignore = {}, -- { ".DS_Store", "node_modules" } etc.
  devicons = {
    enable = false,
    highlight_dirname = false
  },
  mappings = {
    ['E']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<Del>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['<C-b>']     = actions.up,
    ['<Esc>']     = actions.quit,

    ['F']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['C']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['<C-c>'] = clipboard_actions.copy,
    ['<C-x>'] = clipboard_actions.cut,
    ['<C-v>'] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = false
    },
  },
  hide_cursor = true,
})

local commander = require("commander")

commander.setup()

commander.add({
  {
    desc = "Open File Explorer (LIR)",
    cmd = "<CMD>lua require'lir.float'.toggle()<CR>",
    keys = { "n", "<leader>e" },
  }
})
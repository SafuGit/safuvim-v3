-- Leader key
vim.g.mapleader = "<Space>"
vim.g.maplocalleader = "/"

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
vim.keymap.set("c", "<C-v>", "<C-r>+", { noremap = true })
vim.keymap.set("c", "<C-S-v>", "<C-r>+", { noremap = true })
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true })

vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true })
vim.keymap.set("c", "<C-a>", "ggVG", { noremap = true })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true })

vim.keymap.set("n", "qf", "<cmd>Telescope commander<CR>")

local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'

require('command-completion').setup()
require('lir').setup({
  show_hidden_files = true,
  ignore = {}, -- { ".DS_Store", "node_modules" } etc.
  devicons = {
    enable = false,
    highlight_dirname = false
  },
  mappings = {
    ['<CR>']  = actions.edit,
    ['<C-s>'] = actions.split,
    ['<Del>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['<C-b>'] = actions.up,
    ['<Esc>'] = actions.quit,

    ['F']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['C']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

    ['J']     = function()
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

local function open_cmd_palette()
  require('command-palette').run_cmd.ui()
end

vim.keymap.set('n', 'qf', open_cmd_palette, { noremap = true, silent = true })
vim.api.nvim_create_user_command('CmdPalette', open_cmd_palette, {})

local devicons = require 'nvim-web-devicons'
require('incline').setup {
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    if filename == '' then
      filename = '[No Name]'
    end
    local ft_icon, ft_color = devicons.get_icon_color(filename)

    local function get_git_diff()
      local icons = { removed = '', changed = '', added = '' }
      local signs = vim.b[props.buf].gitsigns_status_dict
      local labels = {}
      if signs == nil then
        return labels
      end
      for name, icon in pairs(icons) do
        if tonumber(signs[name]) and signs[name] > 0 then
          table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
        end
      end
      if #labels > 0 then
        table.insert(labels, { '┊ ' })
      end
      return labels
    end

    local function get_diagnostic_label()
      local icons = { error = '', warn = '', info = '', hint = '' }
      local label = {}

      for severity, icon in pairs(icons) do
        local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
        if n > 0 then
          table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
        end
      end
      if #label > 0 then
        table.insert(label, { '┊ ' })
      end
      return label
    end

    return {
      { get_diagnostic_label() },
      { get_git_diff() },
      { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
      { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
      { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
    }
  end,
}

require('lualine').setup {
  options = {
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '│', right = '│' },
    globalstatus = true,
    disabled_filetypes = {
      statusline = { 'dashboard', 'alpha' },
    },
  },

  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch', icon = '' },
      'diff',
    },
    lualine_c = {}, -- incline already shows filename

    lualine_x = {
      'diagnostics',
      'encoding',
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

vim.keymap.set('n', '<leader>fb', function()
  require('arena').toggle()
end)

vim.o.shell = "pwsh"
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
vim.o.shellquote = ""
vim.o.shellxquote = ""

vim.keymap.set({ 'n', 'i' }, '<C-s>', ':w<CR>', { noremap = true, silent = true })

local ok, secrets = pcall(require, "env.token")
if ok and secrets.COPILOT_TOKEN then
  vim.env.COPILOT_TOKEN = secrets.COPILOT_TOKEN
  vim.notify(
    "COPILOT_TOKEN loaded from env/token.lua",
    vim.log.levels.INFO
  )
else
  vim.notify(
    "env/token.lua not found or COPILOT_TOKEN missing",
    vim.log.levels.WARN
  )
end

local function check_copilot_token()
  local copilot_token = vim.env.COPILOT_TOKEN or os.getenv("COPILOT_TOKEN")
  if not copilot_token or copilot_token == "" then
    vim.notify(
      "COPILOT_TOKEN not set; ai_commit_msg copilot provider will not work",
      vim.log.levels.WARN
    )
  else
    vim.notify(
      "COPILOT_TOKEN found; ai_commit_msg copilot provider enabled",
      vim.log.levels.INFO
    )
  end
end

vim.api.nvim_create_user_command(
  "CheckCopilotToken",
  check_copilot_token,
  {}
)

-- vim.cmd([[autocmd FileType gitcommit lua require("ai_commit_msg").generate() ]])

local api = vim.api
local g = vim.g
local opt = vim.opt

--general
opt.termguicolors = true

opt.timeoutlen = 500
opt.updatetime = 50

opt.scrolloff = 8

opt.backspace = 'indent,eol,start'

opt.clipboard = 'unnamedplus'

opt.history = 50

opt.mouse = 'a'

api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })

g.mapleader = ' '
g.maplocalleader = ' '

--file management
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.undofile = true

-- ui
opt.number = false
opt.relativenumber = false

-- opt.cursorline = true
opt.signcolumn = 'yes'
opt.cmdheight = 1
-- opt.pumheight = 10
opt.pumblend = 15
opt.winblend = 15
opt.background = 'dark'

opt.title = true
opt.showtabline = 0

-- editor
opt.wrap = true
opt.linebreak = true
opt.textwidth = 0
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = -1
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

opt.list = true
opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true


-- other
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
    pattern = '*',
    command = 'set nopaste'
})


-- signs
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })

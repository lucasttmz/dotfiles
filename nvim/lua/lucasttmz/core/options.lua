-- Seta o <space> como tecla leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Seta como verdadeiro uso de uma nerdfont
vim.g.have_nerd_font = true

-- Ativa cores verdadeiras
vim.opt.termguicolors = true

-- Não mostra o modo (já mostra na status line)
vim.opt.showmode = false

-- Ativa o número de linhas relativas
vim.opt.number = true
vim.opt.relativenumber = true

-- Configura a indentação
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Transforma tabs em espaços
vim.opt.expandtab = true

-- Ativa o breakindent 
vim.opt.breakindent = true

-- Ativa o uso do mouse
vim.opt.mouse = 'a'

-- Sincroniza o clipboard
vim.opt.clipboard = 'unnamedplus'

-- Salva o histórico do undo
vim.opt.undofile = true

-- Divide tela para baixo e para direita
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Procura case-insensitive utilizar \C se não quiser
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Coluna de sinais semore ativada 
vim.opt.signcolumn = 'yes'

-- Diminui o updatetime
vim.opt.updatetime = 250

-- Diminui tempo para mostrar combinações
vim.opt.timeoutlen = 300

-- Divide os paineis para direita e para baixo
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Mostra whitespace no editor
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Mostra as substituições enquanto digita
vim.opt.inccommand = 'split'

-- Mostra a linha atual
vim.opt.cursorline = true

-- Sempre deixa 10 linhas a baixo da linha atual
vim.opt.scrolloff = 10

-- Permite posicionar o cursor onde não exista caracteres (somento no block mode)
vim.opt.virtualedit = "block"

-- Marca as palavras durante a busca até pressionar <ESC> no modo normal
vim.opt.hlsearch = true

-- Seta linewrap e wordwrap
vim.opt.linebreak = true
vim.opt.wrap = true

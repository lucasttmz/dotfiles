-- Seta o <space> como tecla leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Seta como verdadeiro uso de uma nerdfont
vim.g.have_nerd_font = true

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

-- Ativa o uso do mouse
vim.opt.mouse = 'a'

-- Sincroniza o clipboard
vim.opt.clipboard = 'unnamedplus'

-- Ativa o breakindent 
vim.opt.breakindent = true

-- Salva o histórico do undo
vim.opt.undofile = true

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

-- KEY MAPS

-- Marca as palavras durante a busca até pressionar <ESC> no modo normal
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Sai do modo terminal com <Esc><Esc>
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Desativa as setas do teclado
vim.keymap.set('n', '<left>', '<cmd>echo "Use h para ir para esquerda!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l para ir para direita!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k para ir para cima!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j para ir para baixo!!"<CR>')

--  CTRL+<hjkl> para mover entre janelas
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Ativa highlight no yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Instala o Lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Colorscheme
    { 
        "catppuccin/nvim", 
        name = "catppuccin",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme 'catppuccin'
        end
    },

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function()
            require('lualine').setup()
        end,
    },

    -- Comenta bloco visual com "gc"
    { 'numToStr/Comment.nvim', opts = {} },

    -- Adiciona simbolos para demonstrar as mudanças dos arquivos
    { 
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

    {
        'folke/which-key.nvim',
        event = 'VimEnter',
        config = function()
            require('which-key').setup()
            require('which-key').register {
                ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
                ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
                ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
                ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
                ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            }
        end,
    },

    -- Fuzzy Finder (arquivos, lsp, etc)
    { 
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        },
        config = function()
            -- Insert mode: <c-/>
            -- Normal mode: ?
            require('telescope').setup {
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            }

            -- Ativa as extensões 
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

            -- Pickers
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
            vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
            vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
            vim.keymap.set('n', '<leader>/', function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })
            vim.keymap.set('n', '<leader>s/', function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end, { desc = '[S]earch [/] in Open Files' })
            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = '[S]earch [N]eovim files' })
        end,
    },

    {
        'folke/todo-comments.nvim', 
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' }, 
        opts = { signs = false }
    },

    { 
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "python"},

                auto_install = true,

                highlight = {
                    enable = true,
                }
            })
        end,
    },
})

-- Desativa o highlight semantico (se precisar quando ativar LSP)
-- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--   vim.api.nvim_set_hl(0, group, {})
-- end

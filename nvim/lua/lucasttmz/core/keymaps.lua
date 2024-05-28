-- Limpa o hightlight com o <Esc>
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Sai do modo terminal com <Esc><Esc>
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Desativa as setas do teclado
vim.keymap.set('n', '<left>', '<cmd>echo "Use h para ir para esquerda!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l para ir para direita!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k para ir para cima!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j para ir para baixo!!"<CR>')

-- CTRL+<hjkl> para mover entre janelas
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Melhora o comportamento do hjkl
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

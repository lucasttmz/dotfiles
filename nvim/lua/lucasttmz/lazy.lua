-- Instala o Lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "lucasttmz.plugins" }, { import = "lucasttmz.plugins.lsp" }, {
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        notify = false;
    },
})

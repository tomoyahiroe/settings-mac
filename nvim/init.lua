-- 通常の設定
vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.wrap = true
vim.o.cursorline = true
vim.g.mapleader = " "

vim.keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', { silent = true })

-- lazy.nvimのbootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインの読み込み
require("lazy").setup("plugins")

-- init.lua に追加
-- プロジェクト固有の設定を自動読み込み
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local project_config = vim.fn.getcwd() .. "/.nvim.lua"
        if vim.fn.filereadable(project_config) == 1 then
            dofile(project_config)
        end
    end,
})

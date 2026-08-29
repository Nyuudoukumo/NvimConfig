-- 1. 准备lazy.nvim模块（存在性检测）
-- stdpath("data")
-- macOS/Linux: ~/.local/share/nvim
-- Windows: ~/AppData/Local/nvim-data
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
-- 
-- 2. 将 lazypath 设置为运行时路径
-- rtp（runtime path）
-- nvim进行路径搜索的时候，除已有的路径，还会从prepend的路径中查找
-- 否则，下面 require("lazy") 是找不到的
vim.opt.rtp:prepend(lazypath)

-- 3. 加载lazy.nvim模块
-- VSCode owns the UI and language tooling, so only load explicitly approved
-- text-editing plugins there. This keeps incompatible plugins from crashing
-- the embedded Neovim process.
local plugins
if vim.g.vscode then
    plugins = {
        require("plugins.tools.surround"),
    }
else
    plugins = {
        { import = "plugins.ui" },
        { import = "plugins.tools" },
        { import = "plugins.lsp" },
    }
end

require("lazy").setup(plugins)

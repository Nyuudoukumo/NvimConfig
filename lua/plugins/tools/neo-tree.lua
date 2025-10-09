return{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<A-n>n', ':Neotree filesystem reveal left<CR>', {desc = "打开文件树侧栏"})
    vim.keymap.set('n', '<A-n>c', ':Neotree close<CR>', {desc = "关闭文件树侧栏"})
    require("neo-tree").setup({
      window = {
        width = 30,
      }
    })
  end
}

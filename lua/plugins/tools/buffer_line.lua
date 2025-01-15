return{
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    --vim.keymap.set("n","<A-h>",":BufferLineCyclePrev<CR>",opt)
    --vim.keymap.set("n","<A-l>",":BufferLineCycleNext<CR>",opt)
    vim.opt.termguicolors = true
    require("bufferline").setup{}
  end
}

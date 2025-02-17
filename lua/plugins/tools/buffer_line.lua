return{
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    vim.keymap.set("n","<A-h>",":BufferLineMovePrev<CR>",opt)
    vim.keymap.set("n","<A-l>",":BufferLineMoveNext<CR>",opt)
    vim.opt.termguicolors = true
    require("bufferline").setup{
      options = {
        move_wraps_at_ends = true,
      }
    }
  end
}

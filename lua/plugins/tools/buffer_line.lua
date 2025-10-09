return{
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()

    vim.keymap.set("n","<A-h>",":BufferLineMovePrev<CR>",{desc = "BufferLineMovePrev"})
    vim.keymap.set("n","<A-l>",":BufferLineMoveNext<CR>",{desc = "BufferLineMoveNext"})
    vim.keymap.set("n","<S-h>",":BufferLineCyclePrev<CR>",{desc = "BufferLineCyclePrev"})
    vim.keymap.set("n","<S-l>",":BufferLineCycleNext<CR>",{desc = "BufferLineCycleNext"})

    vim.opt.termguicolors = true
    require("bufferline").setup{
      options = {
        move_wraps_at_ends = true,
      }
    }
  end
}

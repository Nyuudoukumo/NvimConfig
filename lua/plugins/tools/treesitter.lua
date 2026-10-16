local languages = {
  "markdown",
  "markdown_inline",
  "lua",
  "javascript",
  "c",
  "cpp",
  "vim",
  "rust",
  "html",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")

      -- The legacy branch exposes configs.setup(), while main uses install().
      if type(treesitter.install) ~= "function" then
        require("nvim-treesitter.configs").setup({
          ensure_installed = languages,
          highlight = { enable = true },
          indent = { enable = true, disable = { "c", "cpp" } },
        })
        return
      end

      treesitter.setup()
      treesitter.install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
        pattern = languages,
        callback = function(args)
          -- A parser may still be downloading when the first buffer opens.
          if not pcall(vim.treesitter.start, args.buf) then
            return
          end

          if args.match ~= "c" and args.match ~= "cpp" then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}

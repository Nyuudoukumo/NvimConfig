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

      treesitter.setup()
      treesitter.install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = languages,
        callback = function(args)
          vim.treesitter.start(args.buf)

          if args.match ~= "c" and args.match ~= "cpp" then
            vim.bo[args.buf].indentexpr = "v:lua.require" .. string.char(39) .. "nvim-treesitter" .. string.char(39) .. ".indentexpr()"
          end
        end,
      })
    end,
  },
}

require("vimConfig.options")
require("vimConfig.keymaps")

-- Load the shared editing configuration in both Neovim and VSCode. Keep the
-- VSCode module after it so editor actions replace incompatible window maps.
if vim.g.vscode then
	require("vimConfig.vscode")
end

require("lazynvim")

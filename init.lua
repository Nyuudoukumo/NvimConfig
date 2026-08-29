if vim.g.vscode then
	require("vimConfig.vscode")
	require("lazynvim")
	return
end

require("vimConfig.options")
require("vimConfig.keymaps")
require("lazynvim")

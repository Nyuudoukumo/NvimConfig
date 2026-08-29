if vim.g.vscode then
	require("vimConfig.vscode")
	return
end

require("vimConfig.options")
require("vimConfig.keymaps")
require("lazynvim")

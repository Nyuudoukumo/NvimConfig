-- VSCode owns the UI, language tooling, completion, and clipboard.  Keep this
-- configuration dependency-free so vscode-neovim can always finish starting.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function vscode_action(name)
	return function()
		require("vscode").action(name)
	end
end

local map = vim.keymap.set
local silent = { silent = true }

-- Editing mappings shared with the terminal Neovim configuration.
map("", "<Space>", "<Nop>", silent)
map("i", "jk", "<Esc>", silent)
map("v", "<", "<gv", silent)
map("v", ">", ">gv", silent)
map("v", "p", '"_dP', silent)
map("x", "J", ":move '>+1<CR>gv-gv", silent)
map("x", "K", ":move '<-2<CR>gv-gv", silent)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", silent)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", silent)

-- Delegate editor and workbench operations to VSCode rather than opening
-- Neovim windows or loading terminal UI plugins.
map("n", "<C-h>", vscode_action("workbench.action.navigateLeft"), silent)
map("n", "<C-j>", vscode_action("workbench.action.navigateDown"), silent)
map("n", "<C-k>", vscode_action("workbench.action.navigateUp"), silent)
map("n", "<C-l>", vscode_action("workbench.action.navigateRight"), silent)
map("n", "<leader>e", vscode_action("workbench.view.explorer"), silent)
map("n", "<leader>ff", vscode_action("workbench.action.quickOpen"), silent)
map("n", "<leader>fg", vscode_action("workbench.action.findInFiles"), silent)
map("n", "<leader>sv", vscode_action("workbench.action.splitEditorRight"), silent)
map("n", "<leader>s", vscode_action("workbench.action.splitEditorDown"), silent)

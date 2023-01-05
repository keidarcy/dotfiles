-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		side = "right",
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
})

vim.keymap.set("n", "<c-z>", ":NvimTreeFindFileToggle<CR>")
vim.keymap.set("n", "<leader><c-e>", ":NvimTreeFocus<CR>")

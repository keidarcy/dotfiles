local opts = { noremap = true, silent = true }

local builtin = require("telescope.builtin")

-- vim.keymap.set(
-- 	"n",
-- 	"<C-p>",
-- 	"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ hidden = true }))<cr>",
-- 	opts
-- )

vim.keymap.set("n", "<leader>pf", builtin.find_files, opts)
vim.keymap.set("n", "<C-p>", builtin.git_files, opts)
vim.keymap.set("n", "<leader>ps", builtin.live_grep, opts)
-- vim.keymap.set("n", "<leader>ps", function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

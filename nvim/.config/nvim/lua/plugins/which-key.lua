local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

require("which-key.health").check()

-- local opts = {
-- 	mode = "n", -- NORMAL mode
-- 	-- prefix: use "<leader>f" for example for mapping everything related to finding files
-- 	-- the prefix is prepended to every mapping part of `mappings`
-- 	prefix = "",
-- 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
-- 	silent = true, -- use `silent` when creating keymaps
-- 	noremap = true, -- use `noremap` when creating keymaps
-- 	nowait = false, -- use `nowait` when creating keymaps
-- }

-- local mappings = {
-- 	f = {
-- 		name = "file", -- optional group name
-- 		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
-- 		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false, buffer = 123 }, -- additional options for creating the keymap
-- 		n = { "New File" }, -- just a label. don't create any mapping
-- 		e = "Edit File", -- same as above
-- 		["1"] = "which_key_ignore", -- special label to hide it in the popup
-- 		b = {
-- 			function()
-- 				print("bar")
-- 			end,
-- 			"Foobar",
-- 		}, -- you can also pass functions!
-- 	},
-- }
--

local mappings = {}
local opts = {}

wk.add(mappings, opts)

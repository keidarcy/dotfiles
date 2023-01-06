vim.opt.signcolumn = "yes" -- Reserve space for diagnostic icons

local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
	"gopls",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"hs", -- Hammerspoon
                    "packer_plugins" -- packer 
				},
			},
		},
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	-- ["<CR>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil
-- disable enter
-- cmp_mappings['<CR>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	set_lsp_keymaps = false,
})

lsp.on_attach(function(client, bufnr)
	local map = function(mode, lhs, rhs)
		local opts = { remap = false, buffer = bufnr }
		vim.keymap.set(mode, lhs, rhs, opts)
	end

	-- how to disable eslint
	--     if client.name == "eslint" then
	--         vim.cmd.LspStop('eslint')
	--         return
	--     end

	-- LSP actions
	map("n", "gh", vim.lsp.buf.hover)
	map("n", "gd", vim.lsp.buf.definition)
	map("n", "gD", vim.lsp.buf.declaration)
	map("n", "gi", vim.lsp.buf.implementation)
	map("n", "go", vim.lsp.buf.type_definition)
	map("n", "gr", vim.lsp.buf.references)
	map("n", "<C-k>", vim.lsp.buf.signature_help)
	map("n", "<F2>", vim.lsp.buf.rename)
	map("n", "<F4>", vim.lsp.buf.code_action)
	-- map('x', '<F4>', vim.lsp.buf.range_code_action)
	map("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

	-- Diagnostics
	map("n", "gl", vim.diagnostic.open_float)
	map("n", "[d", vim.diagnostic.goto_prev)
	map("n", "]d", vim.diagnostic.goto_next)
	-- map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

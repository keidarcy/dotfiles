local lsp_zero = require("lsp-zero")

local lsp_attach = function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end

lsp_zero.extend_lspconfig({
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	lsp_attach = lsp_attach,
	float_border = "rounded",
	sign_text = {
		error = "✘",
		warn = "▲",
		hint = "⚑",
		info = "",
	},
})

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"eslint",
		"lua_ls",
		"rust_analyzer",
		"gopls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		lua_ls = function()
			require("lspconfig").lua_ls.setup({
				on_init = function(client)
					lsp_zero.nvim_lua_settings(client, {})
				end,
			})
		end,
	},
})

vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

vim.diagnostic.config({
	virtual_text = false,
	severity_sort = true,
	float = {
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format()

require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = { "menu", "menuone", "noselect" }

cmp.setup({
	formatting = cmp_format,
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
	mapping = cmp.mapping.preset.insert({
		-- confirm completion item
		["<CR>"] = cmp.mapping.confirm({ select = false }),

		-- toggle completion menu
		["<C-e>"] = cmp_action.toggle_completion(),

		-- tab complete
		["<Tab>"] = cmp_action.tab_complete(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),

		-- navigate between snippet placeholder
		["<C-d>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),

		-- scroll documentation window
		["<C-f>"] = cmp.mapping.scroll_docs(5),
		["<C-u>"] = cmp.mapping.scroll_docs(-5),
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

-- local navic = require("nvim-navic")
-- local lsp = require("lsp-zero")

-- lsp.preset("recommended")

-- lsp.ensure_installed({
-- 	"tsserver",
-- 	"eslint",
-- 	"lua_ls",
-- 	"rust_analyzer",
-- 	"gopls",
-- })

-- -- Fix Undefined global 'vim'
-- lsp.configure("lua_ls", {
-- 	settings = {
-- 		Lua = {
-- 			workspace = { checkThirdParty = false },
-- 			telemetry = { enable = false },
-- 		},
-- 	},
-- })

-- local cmp = require("cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
-- 	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
-- 	["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 	-- ["<CR>"] = cmp.mapping.complete(),
-- })

-- -- disable completion with tab
-- -- this helps with copilot setup
-- cmp_mappings["<Tab>"] = nil
-- cmp_mappings["<S-Tab>"] = nil
-- -- disable enter
-- -- cmp_mappings['<CR>'] = nil

-- lsp.setup_nvim_cmp({
-- 	mapping = cmp_mappings,
-- })

-- lsp.set_preferences({
-- 	suggest_lsp_servers = false,
-- 	set_lsp_keymaps = false,
-- 	configure_diagnostics = true,
-- 	cmp_capabilities = true,
-- 	manage_nvim_cmp = true,
-- 	call_servers = "local",
-- 	sign_icons = {
-- 		error = "✘",
-- 		warn = "▲",
-- 		hint = "⚑",
-- 		info = "",
-- 	},
-- })

-- lsp.on_attach(function(client, bufnr)
-- 	local map = function(mode, lhs, rhs)
-- 		local opts = { remap = false, buffer = bufnr }
-- 		vim.keymap.set(mode, lhs, rhs, opts)
-- 	end

-- 	if client.server_capabilities.documentSymbolProvider then
-- 		navic.attach(client, bufnr)
-- 	end

-- 	-- how to disable eslint
-- 	--     if client.name == "eslint" then
-- 	--         vim.cmd.LspStop('eslint')
-- 	--         return
-- 	--     end

-- 	-- LSP actions
-- 	map("n", "gh", vim.lsp.buf.hover)
-- 	map("n", "gd", vim.lsp.buf.definition)
-- 	map("n", "gD", vim.lsp.buf.declaration)
-- 	map("n", "gi", vim.lsp.buf.implementation)
-- 	map("n", "go", vim.lsp.buf.type_definition)
-- 	map("n", "gr", vim.lsp.buf.references)
-- 	map("n", "<C-k>", vim.lsp.buf.signature_help)
-- 	map("n", "<F2>", vim.lsp.buf.rename)
-- 	map("n", "<F4>", vim.lsp.buf.code_action)
-- 	-- map('x', '<F4>', vim.lsp.buf.range_code_action)
-- 	map("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")

-- 	-- Diagnostics
-- 	map("n", "gl", vim.diagnostic.open_float)
-- 	map("n", "[d", vim.diagnostic.goto_prev)
-- 	map("n", "]d", vim.diagnostic.goto_next)
-- 	-- map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
-- end)

-- lsp.setup()

-- vim.diagnostic.config({
-- 	virtual_text = true,
-- })

-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

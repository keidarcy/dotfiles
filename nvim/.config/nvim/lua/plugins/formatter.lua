local M = {}

local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
	return
end

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		go = {
			require("formatter.filetypes.go").goimports,
			require("formatter.filetypes.go").gofumpt,
			require("formatter.filetypes.go").golines,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		javascript = {
			-- prettierd
			function()
				return {
					exe = "prettierd",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettierd,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettierd,
		},
		json = {
			require("formatter.filetypes.json").prettierd,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettierd,
		},
		terraform = {
			function()
				return {
					exe = "terraform",
					args = { "fmt", "-" },
					stdin = true,
				}
			end,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- only run the formatting if the buffer doesn't define the formatter_nvim_disabled variable
function M.format_write_if_enabled()
	if not vim.b.formatter_nvim_disabled then
		vim.api.nvim_command("FormatWrite")
	end
end

-- toggle the formatter on and off for current buffer
function M.toggle_formatter_disabled()
	if not vim.b.formatter_nvim_disabled then
		vim.b.formatter_nvim_disabled = true
	else
		vim.b.formatter_nvim_disabled = not vim.b.formatter_nvim_disabled
	end
end

return M

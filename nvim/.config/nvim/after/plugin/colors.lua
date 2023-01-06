require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
})


function ColorMyPencils(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

	--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()

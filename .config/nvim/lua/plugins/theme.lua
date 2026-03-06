-- ================================================================================================
-- TITLE : nightfox
-- ABOUT : Minimal dark theme aligned with the kitty palette.
-- LINKS :
--   > github : https://github.com/EdenEast/nightfox.nvim
-- ================================================================================================

return {
	{
		"xiyaowong/nvim-transparent",
		lazy = false,
		priority = 999,
		opts = {
			extra_groups = {
				"NvimTreeNormal",
				"NvimTreeNormalNC",
				"NvimTreeSignColumn",
				"NvimTreeEndOfBuffer",
				"NvimTreeWinSeparator",
			},
		},
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 999,
		config = function()
			local colors = {
				bg = "#111111",
				bg_alt = "#1a1a1a",
				bg_highlight = "#202020",
				bg_visual = "#303030",
				fg = "#e8e8e8",
				fg_muted = "#cfcfcf",
				selection = "#414868",
				comment = "#6b7280",
				blue = "#7aa2f7",
				cyan = "#7dcfff",
				green = "#9ece6a",
				yellow = "#e0af68",
				red = "#f7768e",
				magenta = "#bb9af7",
				border = "#303030",
			}

			require("nightfox").setup({
				options = {
					transparent = false,
					styles = {
						comments = "italic",
						keywords = "NONE",
						functions = "NONE",
						types = "NONE",
					},
				},
				palettes = {
					duskfox = {
						bg0 = colors.bg,
						bg1 = colors.bg_alt,
						bg2 = colors.bg_highlight,
						bg3 = colors.bg_visual,
						sel0 = colors.selection,
						sel1 = colors.bg_visual,
						fg0 = colors.fg,
						fg1 = colors.fg_muted,
						fg2 = colors.comment,
						blue = colors.blue,
						cyan = colors.cyan,
						green = colors.green,
						yellow = colors.yellow,
						red = colors.red,
						magenta = colors.magenta,
						comment = colors.comment,
					},
				},
				groups = {
					duskfox = {
						Normal = { bg = colors.bg, fg = colors.fg },
						NormalNC = { bg = colors.bg, fg = colors.fg },
						NormalFloat = { bg = colors.bg_alt, fg = colors.fg },
						FloatBorder = { bg = colors.bg_alt, fg = colors.border },
						SignColumn = { bg = colors.bg, fg = colors.comment },
						LineNr = { bg = colors.bg, fg = colors.comment },
						CursorLine = { bg = colors.bg_alt },
						CursorLineNr = { bg = colors.bg_alt, fg = colors.fg },
						Visual = { bg = colors.bg_visual, fg = colors.fg },
						VisualNOS = { bg = colors.bg_visual, fg = colors.fg },
						Search = { bg = colors.yellow, fg = colors.bg },
						IncSearch = { bg = colors.cyan, fg = colors.bg },
						MatchParen = { bg = colors.bg_visual, fg = colors.blue, style = "bold" },
						Pmenu = { bg = colors.bg_alt, fg = colors.fg },
						PmenuSel = { bg = colors.selection, fg = colors.fg },
						PmenuSbar = { bg = colors.bg_alt },
						PmenuThumb = { bg = colors.bg_visual },
						StatusLine = { bg = colors.bg_alt, fg = colors.fg },
						StatusLineNC = { bg = colors.bg_alt, fg = colors.comment },
						VertSplit = { fg = colors.border },
						WinSeparator = { fg = colors.border },
						Comment = { fg = colors.comment, style = "italic" },
						DiagnosticError = { fg = colors.red },
						DiagnosticWarn = { fg = colors.yellow },
						DiagnosticInfo = { fg = colors.blue },
						DiagnosticHint = { fg = colors.cyan },
						NvimTreeNormal = { bg = colors.bg, fg = colors.fg },
						NvimTreeNormalNC = { bg = colors.bg, fg = colors.fg },
						NvimTreeWinSeparator = { bg = colors.bg, fg = colors.border },
					},
				},
			})
			vim.cmd("colorscheme duskfox")
		end,
	},
}

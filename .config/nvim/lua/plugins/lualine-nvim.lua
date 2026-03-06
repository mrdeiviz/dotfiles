-- ================================================================================================
-- TITLE : lualine.nvim
-- LINKS :
--   > github : https://github.com/nvim-lualine/lualine.nvim
-- ABOUT : A blazing fast and easy to configure Neovim statusline written in Lua.
-- ================================================================================================

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local theme = {
			normal = {
				a = { bg = "#7aa2f7", fg = "#111111", gui = "bold" },
				b = { bg = "#1a1a1a", fg = "#e8e8e8" },
				c = { bg = "#111111", fg = "#cfcfcf" },
			},
			insert = {
				a = { bg = "#7dcfff", fg = "#111111", gui = "bold" },
				b = { bg = "#1a1a1a", fg = "#e8e8e8" },
			},
			visual = {
				a = { bg = "#bb9af7", fg = "#111111", gui = "bold" },
				b = { bg = "#1a1a1a", fg = "#e8e8e8" },
			},
			replace = {
				a = { bg = "#f7768e", fg = "#111111", gui = "bold" },
				b = { bg = "#1a1a1a", fg = "#e8e8e8" },
			},
			command = {
				a = { bg = "#e0af68", fg = "#111111", gui = "bold" },
				b = { bg = "#1a1a1a", fg = "#e8e8e8" },
			},
			inactive = {
				a = { bg = "#111111", fg = "#6b7280", gui = "bold" },
				b = { bg = "#111111", fg = "#6b7280" },
				c = { bg = "#111111", fg = "#6b7280" },
			},
		}

		require("lualine").setup({
			options = {
				theme = theme,
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = "|",
			},
		})
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}

-- ================================================================================================
-- TITLE : nvim-treesitter
-- ABOUT : Treesitter configurations and abstraction layer for Neovim.
-- NOTES : this has been updated for the latest treesitter api using branch "main"
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter
-- ================================================================================================

local parsers = {
	"bash",
	"c",
	"cpp",
	"css",
	"dockerfile",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"rust",
	"svelte",
	"typescript",
	"vue",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = function()
		require("nvim-treesitter").install(parsers):wait(300000)
		require("nvim-treesitter").update():wait(300000)
	end,
	event = { "BufReadPost", "BufNewFile" },
	lazy = false,
	config = function()
		local treesitter = require("nvim-treesitter")
		treesitter.setup({})

		local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = group,
			callback = function(args)
				if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
					vim.treesitter.start(args.buf)
				end
			end,
		})
	end,
}

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			css = { "prettierd" },
			dockerfile = { "prettierd" },
			go = { "gofumpt" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			python = { "ruff_format" },
			sh = { "shfmt" },
			svelte = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			vue = { "prettierd" },
		},
		format_on_save = function(bufnr)
			if vim.bo[bufnr].buftype ~= "" then
				return
			end
			return {
				timeout_ms = 1000,
				lsp_format = "fallback",
			}
		end,
	},
}

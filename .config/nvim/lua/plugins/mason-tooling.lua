return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"ts_ls",
			},
			-- LSP activation is handled explicitly in lua/servers/init.lua.
			automatic_enable = false,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
			opts = {
				ensure_installed = {
					"typescript-language-server",
					"eslint_d",
					"prettierd",
					"stylua",
					"luacheck",
					"shfmt",
					"shellcheck",
					"hadolint",
					"gofumpt",
				},
			run_on_start = true,
		},
	},
}

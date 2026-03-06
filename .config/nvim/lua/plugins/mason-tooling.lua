local function has(executable)
	return vim.fn.executable(executable) == 1
end

local function installed_tools()
	local tools = {
		"typescript-language-server",
		"eslint_d",
		"prettierd",
		"shfmt",
		"shellcheck",
		"hadolint",
	}

	if has("unzip") then
		table.insert(tools, "stylua")
	end

	if has("luarocks") then
		table.insert(tools, "luacheck")
	end

	if has("go") then
		table.insert(tools, "gofumpt")
	end

	return tools
end

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
			ensure_installed = installed_tools(),
			run_on_start = true,
		},
	},
}

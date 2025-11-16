return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
		--
		local servers = {
			"tailwindcss",
			"vtsls",
			"html",
			"cssls",
			"jsonls",
			"lua_ls",
			"pyright",
			"clangd",
			"gopls",
			"emmet_language_server",
		}

		-- 2. SETUP MASON-LSPCONFIG TO AUTO-INSTALL THEM
		require("mason-lspconfig").setup({
			ensure_installed = servers,
		})

		local util = require("lspconfig.util") -- This is still correct for utilities

		-- Setup for Tailwind CSS
		vim.lsp.config("tailwindcss", {
			-- capabilities = capabilities,
		})

		-- Setup for TypeScript/JavaScript Server (typescript-language-server)
		-- vim.lsp.config("ts_ls", {
		-- 	-- capabilities = capabilities,
		-- })

		-- Setup for TypeScript/JavaScript Server (Vue TypeScript Server)
		vim.lsp.config("vtsls", {
			-- capabilities = capabilities,
		})

		-- Setup for HTML language server
		vim.lsp.config("html", {
			-- capabilities = capabilities,
		})

		-- Setup for CSS language server
		vim.lsp.config("cssls", {
			-- capabilities = capabilities,
		})

		-- Setup for JSON language server
		vim.lsp.config("jsonls", {
			-- capabilities = capabilities,
		})

		-- Setup for Lua language server
		vim.lsp.config("lua_ls", {
			-- capabilities = capabilities,
		})

		-- Setup for Python language server (pyright)
		vim.lsp.config("pyright", {
			-- capabilities = capabilities,
		})

		-- Setup for C/C++ language server (clangd)
		vim.lsp.config("clangd", {
			-- capabilities = capabilities,
		})

		-- Setup for go language server (gopls)
		vim.lsp.config("gopls", {
			-- capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
		})

		-- Setup for emmet language server
		vim.lsp.config("emmet_language_server", {
			-- capabilities = capabilities,
		})

		-- Setup for java language server
		-- Inside ftplugin/java.lua file

		-- Key mappings
		vim.keymap.set("n", "D", vim.lsp.buf.hover, {}) -- Show hover information
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}) -- Jump to definition (full specification)
		-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {}) -- Jump to declaration (introduction)
		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {}) -- Jump to implementation (actual code)
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, {}) -- List all references
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- Trigger code actions
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {}) -- Rename symbol
	end,
}

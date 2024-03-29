-- FOR WHEN YOU STOP USING JAVA!!!!!
local lsp = require("lsp-zero")
local lspconfig = require 'lspconfig'
local root_pattern = lspconfig.util.root_pattern

lsp.preset("recommended")

lsp.ensure_installed({
	'jdtls',
	'lua_ls'
	-- 'sumneko_lua',
	-- 'rust_analyzer',
	-- 'tsserver',
	-- 'eslint',
})
-- Fix Undefined global 'vim'
-- lsp.configure('sumneko_lua', {
-- lsp.configure('lua-language-server', {
	-- settings = {
	-- 	Lua = {
	-- 		diagnostics = {
	-- 			globals = { 'vim','hs' }
	-- 		}
	-- 	}
	-- }
-- })

lspconfig.lua_ls.setup {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim','hs' }
			}
		}
	}
}
lspconfig.jdtls.setup{
	root_dir = root_pattern(".git", "pom.xml"),
}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

-- vim.diagnostic.config({
	--     virtual_text = true,
	-- })
	vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{
		virtual_text = true,
	}
	)


	lsp.on_attach(function(client, bufnr)
		local opts = {buffer = bufnr, remap = false}

		print("Attaching LSP")
		if client.name == "eslint" then
			vim.cmd.LspStop('eslint')
			return
		end

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set("n", "<leader>R", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>r", require('telescope.builtin').lsp_references, opts)
		vim.keymap.set("n", "<space>d", require('telescope.builtin').diagnostics, opts)
		vim.keymap.set("n", "<space>s", require('telescope.builtin').lsp_document_symbols, opts)
	end)

	-- lspconfig.rust_analyzer.setup{
	-- 	capabilities = capabilities ,
	-- 	on_attach = on_attach,
	-- }
	lsp.setup()

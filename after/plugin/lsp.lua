local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed({
	'tsserver',
	'gopls',
	'rust_analyzer',
	'eslint',
	'sumneko_lua',
	'clangd',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
	["<C-u>"] = cmp.mapping.scroll_docs(-4),
	["<C-d>"] = cmp.mapping.scroll_docs(4),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = true,
})

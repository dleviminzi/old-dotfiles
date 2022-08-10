local Remap = require("minzi.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local protocol = require'vim.lsp.protocol'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function(client, bufnr)
		    nnoremap("gd", function() vim.lsp.buf.definition() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>ca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)

            if client.server_capabilities.document_formatting then
                vim.cmd([[
                    augroup formatting
                        autocmd! * <buffer>
                        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
                        autocmd BufWritePre *.go :silent! lua org_imports(3000)
                    augroup END
                ]])
            end

            if client.server_capabilities.document_highlight then
                vim.cmd([[
                    augroup lsp_document_highlight
                        autocmd! * <buffer>
                        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
                    augroup END
                ]])
            end

            protocol.CompletionItemKind = {
                '', -- Text
                '', -- Method
                '', -- Function
                '', -- Constructor
                '', -- Field
                '', -- Variable
                '', -- Class
                'ﰮ', -- Interface
                '', -- Module
                '', -- Property
                '', -- Unit
                '', -- Value
                '', -- Enum
                '', -- Keyword
                '﬌', -- Snippet
                '', -- Color
                '', -- File
                '', -- Reference
                '', -- Folder
                '', -- EnumMember
                '', -- Constant
                '', -- Struct
                '', -- Event
                'ﬦ', -- Operator
                '', -- TypeParameter
            }

		end,
	}, _config or {})
end

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').tsserver.setup(config())
require('lspconfig').ccls.setup(config())
require('lspconfig').jedi_language_server.setup(config())
require('lspconfig').svelte.setup(config())
require('lspconfig').solang.setup(config())
require('lspconfig').cssls.setup(config())
require('lspconfig').gopls.setup(config({
	cmd = { 'gopls' },
	settings = {
		gopls = {
            completeUnimported =  true,
			gofumpt = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}))
require('lspconfig').golangci_lint_ls.setup(config({
    cmd = { 'golangci-lint' },
    settings = {
		gopls = {
            completeUnimported =  true,
            gofumpt = true,
		},
	},
}))

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.go" },
  callback = function()
	  vim.lsp.buf.formatting_sync(nil, 3000)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go" },
	callback = function()
		local params = vim.lsp.util.make_range_params(nil, vim.lsp.util._get_offset_encoding())
		params.context = {only = {"source.organizeImports"}}

		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, vim.lsp.util._get_offset_encoding())
				else
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
	end,
})

-- require("lspconfig").rust_analyzer.setup(config({
-- 	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
-- }))
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities=capabilities,
-- }
-- require('lspconfig')['tsserver'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities=capabilities,
-- }
-- require('lspconfig')['rust_analyzer'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities=capabilities,
-- }
-- require('lspconfig')['gopls'].setup{
--     cmd = {"gopls", "--remote=auto"},
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities=capabilities,
-- }

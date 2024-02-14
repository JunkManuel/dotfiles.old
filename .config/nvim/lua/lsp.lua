--------------------------
-- Setup lsp
--------------------------
local lspconfig = require('lspconfig')
require("lsp-ui")

--------------------------
-- Python language server
--------------------------
lspconfig.jedi_language_server.setup {
	init_options = {
		diagnostics = {
			enable = true
		},
	},
}

--------------------------
-- Lua language server
--------------------------
lspconfig.lua_ls.setup {}

--------------------------
-- VimScript language server
--------------------------
lspconfig.vimls.setup {}

--------------------------
-- Setup lsp
--------------------------
local lspconfig = require'lspconfig'
require("lsp-ui")
-- require("lsp-keybindings")

--------------------------
-- Python language server
--------------------------
lspconfig.jedi_language_server.setup {}

--------------------------
-- Lua language server
--------------------------
lspconfig.lua_ls.setup {}

--------------------------
-- VimScript language server
--------------------------
lspconfig.vimls.setup {}


--------------------------
-- END lsp
--------------------------
require("lsp-keybindings")

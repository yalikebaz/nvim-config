local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("shahbaz.lsp.lsp-installer")
require("shahbaz.lsp.handlers").setup()
require "shahbaz.lsp.null-ls"

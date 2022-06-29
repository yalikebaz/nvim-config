local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("shahbaz.lsp.lsp-installer")
require("shahbaz.lsp.handlers").setup()
require("shahbaz.lsp.null-ls")

-- TODO setup cmp for emmet ... do i have to globally install it as per https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#emmet_ls? Or is it handled already by lsp-installer (as per https://github.com/neovim/nvim-lspconfig/wiki/Installing-language-servers)

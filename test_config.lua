-- In order to use this test config. In the terminal type nvim -u test_config.lua


-- ignore default config and plugins
vim.opt.runtimepath:remove(vim.fn.expand("~/.config/nvim"))
vim.opt.packpath:remove(vim.fn.expand("~/.local/share/nvim/site"))

-- append test directory
local test_dir = "/tmp/nvim-config"
vim.opt.runtimepath:append(vim.fn.expand(test_dir))
vim.opt.packpath:append(vim.fn.expand(test_dir))

-- install packer
local install_path = test_dir .. "/pack/packer/start/packer.nvim"
local install_plugins = false

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.cmd("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	vim.cmd("packadd packer.nvim")
	install_plugins = true
end

local packer = require("packer")

packer.init({ package_root = test_dir .. "/pack",
	compile_path = test_dir .. "/plugin/packer_compiled.lua",
})

packer.startup(function()
	local use = function(args)
		if type(args) == "string" then
			local plugin = args
			args = { plugin }
		end

		args.event = "User LoadPlugins"

		packer.use(args)
	end

	-- Packer can manage itself
	packer.use("wbthomason/packer.nvim")

	-- TEST PLUGINS HERE
	use({
		"lalitmee/browse.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	}) 
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins


	if install_plugins then
		packer.sync()
	else
		-- load plugins at your earliest convenience
		vim.defer_fn(function()
			vim.cmd("doautocmd User LoadPlugins")
		end, 1)
	end
end)

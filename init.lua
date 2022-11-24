require("user.keymaps")
require("user.plugins")
require("user.options")
require("user.functions")
require("user.globals")
require("user.colorscheme")

require("ui").load_ui_plugins()

vim.diagnostic.config({
	virtual_text = {
		-- source = "always",  -- Or "if_many"
		prefix = "●", -- Could be '■', '▎', 'x'
	},
	severity_sort = true,
	float = {
		source = "always", -- Or "if_many"
	},
})

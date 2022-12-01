local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end
telescope.load_extension("harpoon")
local path = require("plenary.path")

local stat, harpoon = pcall(require, "harpoon")
if not stat then
	print("harpoon not found")
	return
end
harpoon.setup({
	shortenPath = function(file)
		return path.new(string.format("%s", file)):shorten(1, { -2, -1 })
	end,
})

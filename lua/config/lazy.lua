-- Bootstrap lazy.nvim if it is not already installed.
-- lazy.nvim is the plugin manager; it handles downloading, updating, and
-- lazy-loading plugins declared under lua/plugins/.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",       -- shallow clone: skip blobs, saves bandwidth
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",          -- pin to latest stable tag, not HEAD
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugin specs from lua/plugins/*.lua automatically.
-- Each file in that directory returns a table (or list of tables) of lazy specs.
require("lazy").setup("plugins")

vim.opt.shiftwidth = 4				-- changes indentation length
vim.opt.tabstop = 4					-- changes the length of tab
vim.opt.fileencoding = "utf-8"		-- makes the file encoding utf-8 by default
vim.opt.relativenumber = true		-- a setting for relative line numbers
vim.opt.number = true				-- line numbers
vim.opt.splitbelow = true			-- place any horizontal splits on the bottom of the screen
vim.opt.splitright = true			-- same as above but for vertical splits
vim.opt.wrap = false				-- always show lines as one long pötkylä
vim.opt.undofile = true				-- allows nvim to create an 'undofile' which stores undo history so that it can persist through closing and reopening a file
vim.opt.swapfile = false			-- disables the creation of swap-files
vim.opt.timeoutlen = 500			-- this changes the timeout time of keymap comption (in milliseconds)
vim.opt.scrolloff = 999				-- Changes it so that the cursor doesn't have to reach top/bottom of the page for scrolling to happen
vim.opt.virtualedit = "block"		-- Makes empty cells selectable in VISUAL BLOCK mode.
vim.opt.ignorecase = true			-- Pretty self explanatory
vim.opt.clipboard = "unnamedplus"	-- Synchronizes the system clipboard with neovim's clipboard
vim.opt.title = true				-- Display extra information in window title
vim.opt.termguicolors = true		-- Increases the color range available for the terminal

vim.cmd("colorscheme vim")

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>e", ":w<CR>:Explore<CR>", opts)

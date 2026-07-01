-- comment
-- Set <space> as the leader key See `:h mapleader` NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
-- OPTIONS
-- See `:h vim.o` NOTE: You can change these options as you wish! For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'` (Note the single quotes)

vim.opt.shiftwidth = 4         -- changes indentation length vim.opt.tabstop = 4            -- changes the length of tab
vim.opt.tabstop = 4
vim.opt.expandtab = true

vim.opt.fileencoding = "utf-8" -- makes the file encoding utf-8 by default
vim.opt.relativenumber = false  -- a setting for relative line numbers
vim.opt.number = true          -- line numbers
vim.opt.splitbelow = true      -- place any horizontal splits on the bottom of the screen
vim.opt.splitright = true      -- same as above but for vertical splits
vim.opt.wrap = false           -- always show lines as one long pötkylä
vim.opt.undofile = true        -- allows nvim to create an 'undofile' which stores undo history so that it can persist through closing and reopening a file
vim.opt.swapfile = false       -- disables the creation of swap-files
-- vim.opt.timeoutlen = 500			-- this changes the timeout time of keymap comption (in milliseconds)
vim.opt.scrolloff = 999        -- Changes it so that the cursor doesn't have to reach top/bottom of the page for scrolling to happen
vim.opt.virtualedit = "block"  -- Makes empty cells selectable in VISUAL BLOCK mode.
vim.opt.ignorecase = false     -- Pretty self explanatory
vim.opt.title = true           -- Display extra information in window title
vim.opt.termguicolors = true   -- Increases the color range available for the terminal
vim.opt.wrapscan = true        -- searches wrap around the file
vim.opt.list = false           -- Show <tab> and trailing spaces.

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
-- vim.o.confirm = true


-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')


-- completion
-- vim.keymap.set({ "n" }, "<leader>c", "<C-x><C-o>")

vim.keymap.set({ "n" }, "<leader>t", ":60vsplit<CR>:terminal<CR>i")

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

-- vim.keymap.set({ "n" }, "<leader>d", "vim.lsp.")

-- AUTOCOMMANDS (EVENT HANDLERS)
--
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    callback = function()
	vim.hl.on_yank()
    end,
})

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
    callback = function()
	vim.o.clipboard = 'unnamedplus'
    end,
})

-- USER COMMANDS: DEFINE CUSTOM COMMANDS
--
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
--  vim.api.nvim_create_user_command('GitBlameLine', function()
--      local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
--      local filename = vim.api.nvim_buf_get_name(0)
--      print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
--  end, { desc = 'Print the git blame for the current line' })

-- PLUGINS

vim.pack.add({
    "https://github.com/rebelot/kanagawa.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/saghen/blink.lib",
})

require("fzf-lua")

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup()

-- fzf-lua keybindings
vim.keymap.set({ "n" }, "<leader>f", function() FzfLua.files() end)
vim.keymap.set({ "n" }, "<leader>b", function() FzfLua.buffers() end)

vim.cmd("colorscheme kanagawa")

require('lualine').setup({
    options = { theme = "auto", section_separators = "", component_separators = "" }
})

-- Enable LSPs

vim.lsp.enable({
    "ccls",
    "zls",
    "ts_ls",
    "jsonls",
    "html",
    "pylsp",
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(env)
	    local client = assert(vim.lsp.get_client_by_id(env.data.client_id))

	    vim.keymap.set({ "n" }, "<leader>d", function() vim.diagnostic.open_float() end)

	    if client:supports_method('textDocument/formatting') then
		vim.api.nvim_create_autocmd('BufWritePre', {
		    group = vim.api.nvim_create_augroup("my.lsp", {clear=false}),
		    buffer = env.buf,
		    callback = function()
		    vim.lsp.buf.format({ bufnr = env.buf, id = client.id, timeout_ms = 1000 })
		end,
	    })
	end
    end
})


local map = vim.keymap.set

map("n", "<leader>fs", "<cmd>w<CR>")
map("n", "<leader><leader>", "<cmd> Telescope find_files <CR>")
map("n", "<leader>qq", "<cmd> q <CR>")
map("n", "<leader>qQ", "<cmd> q! <CR>")
map("n", "<leader>/", "<cmd> Telescope live_grep <CR>")
map("n", "<leader>?", "<cmd> Telescope current_buffer_fuzzy_find <CR>")
map("n", "<leader>fc", "<cmd> Telescope find_files cwd=~/.config/nvim/ <CR>")
map("n", "<leader>fd", "<cmd> Telescope current_buffer_fuzzy_find <CR>")
map("n", "<leader>ft", "<cmd> Telescope filetypes <CR>")
map("n", "<leader>fi", "1<C-g>")
map("n", "<leader>fr", "<cmd> Telescope oldfiles <CR>")
map("n", "<leader>fR", "<cmd> edit! <CR>")
map("n", "<leader>of", "<cmd> Telescope file_browser cwd=~ <CR>")
map("n", "<leader>:", "<cmd> Telescope commands <CR>")
map("n", "<leader>pp", "<cmd> Telescope project display_type=full <CR>")
map("n", "<leader>pe", "<cmd> edit ~/.local/share/nvim/telescope-projects.txt <CR>")
map("n", "<leader>gg", "<cmd> Neogit <CR>")
map("n", "<leader>lf", "<cmd> lua vim.lsp.buf.format({ async = true, timeout = 2000 }) <CR>")
map("n", "<leader>la", "<cmd> lua vim.lsp.buf.code_action() <CR>")
map("n", "<leader>ld", "<cmd> Telescope diagnostics <CR>")
map("n", "<leader>ls", "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>")
map("n", "<leader>lr", "<cmd> lua vim.lsp.buf.rename() <CR>")
map("n", "<leader>sh", "<cmd> split <CR>")
map("n", "<leader>sv", "<cmd> vsplit <CR>")
map("n", "<leader>wd", "<cmd> q <CR>")
map("n", "<leader>bb", "<cmd> Telescope buffers <CR>")
map("n", "<leader>bd", "<cmd> bdelete <CR>")
map("n", "<leader>bc", "<cmd> enew <CR>")
map("n", "<leader>t<leader>", "<cmd> Telescope <CR>")
map("n", "<leader>tj", "<cmd> Telescope jumplist <CR>")
map("n", "<leader>tb", [[<cmd> lua
	if vim.o.showtabline ~= 0 then
		vim.o.showtabline = 0
	else
		vim.o.showtabline = 2
	end
<CR>]])
map("n", "<f2>", "<cmd> Telescope keymaps <CR>")
map("n", "K", [[<cmd> lua
	local line_diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
	if vim.tbl_isempty(line_diagnostics) then
		vim.lsp.buf.hover()
	else
		vim.diagnostic.open_float()
	end
<CR>]])
map("n", "gd", "<cmd> lua vim.lsp.buf.definition() <CR>")
map("n", "gD", "<cmd> Telescope lsp_references <CR>")
map("n", "g[", "<cmd> lua vim.diagnostic.goto_prev() <CR>")
map("n", "g]", "<cmd> lua vim.diagnostic.goto_next() <CR>")
map("n", "<leader>;f", [[<cmd> lua
	if vim.o.guifont == 'Hack:h20' then
		vim.o.guifont = 'Hack:h32'
	elseif vim.o.guifont == 'Hack:h32' then
		vim.o.guifont = ''
	else
		vim.o.guifont = 'Hack:h20'
	end
<CR>]])
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-I>", "<C-I>") -- makes jumplist work in neovide?
map("i", "<C-backspace>", "<C-w>", { nowait = true })
map("v", "<leader>/", "<ESC><cmd> lua require('Comment.api').toggle.linewise(vim.fn.visualmode()) <CR>") -- TODO: doesnt work

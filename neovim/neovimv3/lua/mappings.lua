local map = vim.keymap.set

-- map leader key as space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE: <leader>k - special group of bindings (will be eventually) (not needed now)

map({ "i", "t" }, "<C-k>", "<up>")                                                               -- <C-k> to move up
map({ "i", "t" }, "<C-j>", "<down>")                                                             -- <C-j> to move down
map({ "i", "t" }, "<C-h>", "<left>")                                                             -- <C-h> to move left
map({ "i", "t" }, "<C-l>", "<right>")                                                            -- <C-l> to move right
map("n", "<leader>fd", "<cmd> Pick grep_live <CR>")                                              -- Search project
map("n", "<leader>fD", "<cmd> Pick buf_lines scope='current' <CR>")                              -- Search current file
map("n", "<leader>fs", "<cmd>:silent w<CR>")                                                     -- Save file
map("n", "<leader><leader>", "<cmd> Pick files <CR>")                                            -- Find files
map("n", "<leader>qq", "<cmd> q <CR>")                                                           -- Quit
map("n", "<leader>qQ", "<cmd> q! <CR>")                                                          -- Force quit
map("n", "<leader>fc", "<cmd> Pick files cwd='~/.config/nvim/' <CR>")                            -- Modify config
map("n", "<leader>ft", "<cmd> Pick filetype <CR>")                                               -- Change file type
map("n", "<leader>fr", "<cmd> edit! <CR>")                                                       -- Reload file
map("n", "<leader>fR", "<cmd> Pick oldfiles <CR>")                                               -- Recent files
map("n", "<leader>of", "<cmd> Pick explorer cwd='$HOME' <CR>")                                   -- Open file
map("n", "<leader>ot", "<cmd> Pick grep pattern='TODO|FIXME|NOTE|WARNING|HACK|PERF|FIX' <CR>")   -- Open TODOs and similar
map("n", "<leader>:", "<cmd> Pick commands <CR>")                                                -- Pick commands
map("n", "<leader>pp", "<cmd> Pick project <CR>")                                                -- Projects
map("n", "<leader>pe", "<cmd> edit ~/.local/share/nvim/projects.txt <CR>")                       -- Edit projects file
map("n", "<leader>sh", "<cmd> split <CR>")                                                       -- Horizontal split
map("n", "<leader>sv", "<cmd> vsplit <CR>")                                                      -- Vertical split
map("n", "<leader>wd", "<cmd> close <CR>")                                                       -- Window close
map("n", "<leader>bb", "<cmd> Pick buffers <CR>")                                                -- Buffers
map("n", "<leader>nn", "<cmd> cd ~/Repos/notes/ <CR><cmd> Pick files cwd='~/Repos/notes/' <CR>") -- Browse notes
map("n", "<leader>co", "<cmd> Pick colorscheme <CR>")                                            -- Choose colorscheme
map("n", "<leader>nc", function()
    local notes_dir = "~/Repos/notes/oneTimeNotes/Others/"
    local note = vim.fn.input("Note file name (.md added automatically): ") .. ".md"
    if note ~= ".md" then
        vim.cmd("edit " .. notes_dir .. note)               -- Open file in a new buf
        vim.api.nvim_set_current_dir(notes_dir)             -- Change CWD to notes
    end
end)                                                        -- Create new note (one time notes directory) and open it
map("n", "<leader>tj", "<cmd> Pick list scope='jump' <CR>") -- Jumplist
map("n", "<leader>tb", function()
    if vim.o.showtabline ~= 0 then
        vim.o.showtabline = 0
    else
        vim.o.showtabline = 2
    end
end)                                         -- Show / hide tab bar
map("n", "<leader>td", "<cmd> bdelete <CR>") -- Delete current buffer (and tab)
map("n", "<f2>", "<cmd> Pick keymaps <CR>")  -- Show keymaps
map("n", "<f3>", "<cmd> Pick help <CR>")     -- Neovim help pages
map("n", "<tab>", "<cmd> bnext <CR>")        -- Next buffer
map("n", "<S-tab>", "<cmd> bprev <CR>")      -- Previous buffer
map("v", "Y", "\"+y<Esc>")                   -- Y To copy to system clipboard
map({ "n", "v" }, "<C-d>", "<C-d>zz")        -- Center C-d
map({ "n", "v" }, "<C-u>", "<C-u>zz")        -- Center C-u
map("n", "n", "nzzzv")                       -- Center search
map("n", "N", "Nzzzv")                       -- Center backwards search
map("v", "y", "ygv<esc>")                    -- Prevent cursor jump when copying
map("n", ";", "<cmd> Pick commands <CR>")    -- Quick command
-- map("n", "<C-e>", function() vim.print(vim.treesitter.get_captures_at_cursor(0)) end)            -- Show highlight group at cursor

-- terminal mappings
map({ "n", "t" }, "<A-i>", "<cmd> Term <CR>")
map("t", "<A-Esc>", "<C-\\><C-n>") -- Terminal enter normal mode
map("t", "<A-k>", "<Up><Cr>")      -- Alt+k to repeat previous command

-- git mappings
map("n", "<leader>gg", "<cmd> Term lazygit <CR>")
map({ "n", "t" }, "<C-g>", "<cmd> Term lazygit <CR>")

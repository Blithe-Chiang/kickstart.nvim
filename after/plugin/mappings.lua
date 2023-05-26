
-- [[ Basic Keymaps ]]

-- map jj to Esc
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap=true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Standard Operations
vim.keymap.set('n', "<leader>w", "<cmd>w<cr>", { desc = "Save" })
vim.keymap.set('n', "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
vim.keymap.set('n', "<leader>n", "<cmd>enew<cr>", { desc = "New File" })
-- vim.keymap.set('n', "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
-- see :h i_CTRL-Q
-- vim.keymap.set('n', "<C-q>", "<cmd>q!<cr>", { desc = "Force quit" })
vim.keymap.set('n', "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set('n', "\\", "<cmd>split<cr>", { desc = "Horizontal Split" })
vim.keymap.set('n', "<leader>c", "<cmd>BufferClose<cr>", { desc = "Close Buffer" })
vim.keymap.set('n', "<leader>C", "<cmd>BufferClose!<cr>", { desc = "Force close Buffer" })
vim.keymap.set('n', "<leader>ke", "<cmd>e!<cr>", { desc = "Discard" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap for quickfix list
vim.keymap.set('n', "[q", "<cmd>cprev<cr>", { desc = "Previous item in quickfix list" })
vim.keymap.set('n', "]q", "<cmd>cnext<cr>", { desc = "Next item in quickfix list" })
vim.keymap.set('n', "[Q", "<cmd>cfirst<cr>", { desc = "First item in quickfix list" })
vim.keymap.set('n', "]Q", "<cmd>clast<cr>", { desc = "Last item in quickfix list" })

-- -- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>df', require('telescope.builtin').diagnostics, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- telescope
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>f/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'search in current buffer' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = 'Find recent files' })
vim.keymap.set('n', '<leader>fk', require('telescope.builtin').keymaps, { desc = 'Find keymaps' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>f<CR>', require("telescope.builtin").resume, { desc = 'Find words' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fF', function () require("telescope.builtin").find_files { hidden = true, no_ignore = true } end, { desc = 'Find all files' })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').grep_string, { desc = 'Find for word under cursor' })
vim.keymap.set('n', '<leader>fw', require('telescope').extensions.live_grep_args.live_grep_args , { desc = 'Find words' })
vim.keymap.set('v', '<leader>fw', require("telescope-live-grep-args.shortcuts").grep_visual_selection, { desc = 'Find selection' })
vim.keymap.set('n', "<leader>gc", function() require("telescope.builtin").git_commits() end, {desc = "Git commits" })
vim.keymap.set('n', "<leader>gt", function() require("telescope.builtin").git_status() end, {desc = "Git status" })
vim.keymap.set('n', "<cr>", function() require('telescope').extensions.cmdline.cmdline({}) end, {desc = "Command" })


-- File tree
vim.keymap.set('n', '<leader>e', "<cmd>Neotree toggle<cr>", { desc = 'Toggle FileTree' })
vim.keymap.set('n', '<leader>o', "<cmd>NeoTreeReveal<cr>", { desc = 'Reveal in FileTree' })


-- Sessions
vim.keymap.set('n', '<leader>r', "<cmd>SessionManager load_session<cr>", { desc = 'Load Sessions' })

-- hop.nvim
-- normal mode (easymotion-like)
vim.keymap.set("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true});
vim.keymap.set("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true});
vim.keymap.set("n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true});
vim.keymap.set("n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true});
-- visual mode (easymotion-like)
vim.keymap.set("x", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true});
vim.keymap.set("x", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true});
vim.keymap.set("x", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true});
vim.keymap.set("x", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true});
-- (sneak-like) in all mode.
vim.keymap.set("", "s", "<cmd>HopChar2AC<CR>", {noremap=false});
vim.keymap.set("", "S", "<cmd>HopChar2BC<CR>", {noremap=false});

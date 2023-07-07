
-- [[ Basic Keymaps ]]

-- map jj to Esc
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap=true })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

function QuitWithConfim()
  local current_windows = vim.api.nvim_list_wins()
  if #current_windows == 1 then
    local choice = vim.fn.confirm("Quit neovim?", "&Yes\n&No", 2)
    if choice == 1 then
      vim.cmd('q')
    else
      -- vim.cmd('echo "Canceled."')
    end
  else
      vim.cmd('q')
  end
end

-- Standard Operations
vim.keymap.set('n', "<leader>q", QuitWithConfim, { desc = "Quit" })
vim.keymap.set('n', "<leader>ew", "<cmd>w<cr>", { desc = "Save File" })
vim.keymap.set('n', "<leader>en", "<cmd>enew<cr>", { desc = "New File" })
vim.keymap.set('n', "<leader>er", "<cmd>e!<cr>", { desc = "Discard File" })
-- File tree
vim.keymap.set('n', '<leader>ee', "<cmd>Neotree toggle<cr>", { desc = 'Toggle FileTree' })
vim.keymap.set('n', '<leader>eg', "<cmd>Neotree toggle git_status<cr>", { desc = 'Toggle Git Status' })
vim.keymap.set('n', '<leader>eo', "<cmd>NeoTreeReveal<cr>", { desc = 'Reveal in FileTree' })

-- vim.keymap.set('n', "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
-- see :h i_CTRL-Q
-- vim.keymap.set('n', "<C-q>", "<cmd>q!<cr>", { desc = "Force quit" })
vim.keymap.set('n', "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set('n', "\\", "<cmd>split<cr>", { desc = "Horizontal Split" })
vim.keymap.set('n', "<leader>c", "<cmd>BufferClose<cr>", { desc = "Close Buffer" })
vim.keymap.set('n', "<leader>C", "<cmd>BufferClose!<cr>", { desc = "Force close Buffer" })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- UI settings
function ToggleWordWrap()
  local value = vim.wo.wrap
  vim.wo.wrap = not value
end
vim.keymap.set('n', '<leader>uw', ToggleWordWrap, { desc = 'Toggle word wrap' })

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

-- Pickup theme
vim.keymap.set('n', '<leader>ft', require('telescope.builtin').colorscheme, { desc = 'Pick up theme' })

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
vim.keymap.set('v', '<leader>fb', function() require("telescope-live-grep-args.shortcuts").grep_visual_selection({ quote_char = "\\b", postfix=''}) end, { desc = 'Find boundary' })
vim.keymap.set('n', "<leader>gb", function() require("telescope.builtin").git_branches() end, {desc = "Git branches" })
vim.keymap.set('n', "<leader>gc", function() require("telescope.builtin").git_commits() end, {desc = "Git commits" })
vim.keymap.set('n', "<leader>gt", function() require("telescope.builtin").git_status() end, {desc = "Git status" })

-- Sessions
vim.keymap.set('n', '<leader>r', "<cmd>SessionManager load_session<cr>", { desc = 'Load Sessions' })

-- hop.nvim
-- normal & visual mode (easymotion-like)
vim.keymap.set({"n","x"}, "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true});
vim.keymap.set({"n","x"}, "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true});
vim.keymap.set({"n","x"}, "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true});
vim.keymap.set({"n","x"}, "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true});
-- (sneak-like) in all mode.
vim.keymap.set("", "s", "<cmd>HopChar2AC<CR>", {noremap=false});
vim.keymap.set("", "S", "<cmd>HopChar2BC<CR>", {noremap=false});

-- Fugitive mappings
vim.keymap.set('n', "gL",  function() vim.cmd('Git blame') end, {desc = "View full Git blame" })
vim.keymap.set('n', "<leader>ge",  function() vim.cmd('Gedit') end, {desc = "Edit current version of file" })
vim.keymap.set('n', "<leader>gg",  function() vim.cmd('Git') end, {desc = "Open Fugitive" })
vim.keymap.set('n', "<leader>gw", "<cmd>Git log -g stash<CR>", { desc = "List Git Stash" })
vim.keymap.set('n', "<leader>gl", ':Git log --since=', { desc = "Recent Git Log" })

-- window management
vim.keymap.set('n', "<leader>ww", "<C-w>o", { desc = "Color other window" })

-- search panel
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
  desc = "Open Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
  desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "Search on current file"
})



local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<M-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<M-.>', '<Cmd>BufferNext<CR>', opts)
-- better mapping
map('n', 'gT', '<Cmd>BufferPrevious<CR>', opts)
map('n', 'gt', '<Cmd>BufferNext<CR>', opts)

map('n', '[b', '<Cmd>BufferPrevious<CR>', opts)
map('n', ']b', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<M-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<M->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
-- better mapping; possible refactor with loop
map('n', '1gt', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '2gt', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '3gt', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '4gt', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '5gt', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '6gt', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '7gt', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '8gt', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '9gt', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '0gt', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<M-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<M-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

map('n', '<leader>br', '<Cmd>BufferCloseBuffersRight<CR>', opts)
map('n', '<leader>bl', '<Cmd>BufferCloseBuffersLeft<CR>', opts)
map('n', '<leader>bo', '<Cmd>BufferCloseAllButVisible<CR>', opts)

-- Magic buffer-picking mode
-- TODO: fix conflict with pin buffer
-- map('n', '<M-p>', '<Cmd>BufferPick<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

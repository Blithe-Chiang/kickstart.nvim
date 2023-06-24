-- [[ Setting options ]]
-- See `:help vim.o`

-- set scrolloff
vim.o.scrolloff = 5

-- set termguicolors
vim.o.termguicolors = true

-- highlight current line
vim.o.cursorline = true

-- highlight column
vim.wo.cursorcolumn = false

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- set ward wrap
vim.wo.wrap = false

-- Relative line number
vim.o.relativenumber = false

-- spell
vim.o.spell = false

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- fix strange endofline
vim.cmd([[
  set noendofline
  set nofixendofline
]])

-- tab and indent
vim.cmd[[
  " tab
  set expandtab                    " expand tabs to spaces
  set smarttab
  set shiftround

  " indent
  set autoindent smartindent shiftround
  set shiftwidth=4
  set tabstop=4
  set softtabstop=4                " insert mode tab and backspace use 4 spaces
]]

-- settings in neovide
if (vim.g.neovide) then
  -- useful for macos
  vim.g.neovide_input_macos_alt_is_meta = true
  -- disable cursor animation
  vim.g.neovide_cursor_animation_length = 0
end

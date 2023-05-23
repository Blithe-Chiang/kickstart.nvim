
-- Set the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
local leader = ' '
vim.g.mapleader = leader
vim.g.maplocalleader = leader

-- map jj to Esc
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap=true })

-- fix strange endofline
vim.cmd([[
  set noendofline
  set nofixendofline
]])


-- settings in neovide
if (vim.g.neovide) then
  -- useful for macos
  vim.g.neovide_input_macos_alt_is_meta = true
  -- disable cursor animation
  vim.g.neovide_cursor_animation_length = 0
end

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Here is where you install your plugins.
--  You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  -- Github extension for fugitive
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    -- do things with window
    "mrjones2014/smart-splits.nvim",
    config = function()
      vim.keymap.set('n', "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
      vim.keymap.set('n', "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to below split" })
      vim.keymap.set('n', "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to above split" })
      vim.keymap.set('n', "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })
      vim.keymap.set('n', "<C-Up>", require("smart-splits").resize_up, { desc = "Resize split up" })
      vim.keymap.set('n', "<C-Down>", require("smart-splits").resize_down, { desc = "Resize split down" })
      vim.keymap.set('n', "<C-Left>", require("smart-splits").resize_left, { desc = "Resize split left" })
      vim.keymap.set('n', "<C-Right>", require("smart-splits").resize_right, { desc = "Resize split right" })
      return {
        ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
        ignored_buftypes = { "nofile" }
      }
    end
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '[g', require('gitsigns').prev_hunk, { buffer = bufnr, desc = 'Go to Previous Hunk' })
        vim.keymap.set('n', ']g', require('gitsigns').next_hunk, { buffer = bufnr, desc = 'Go to Next Hunk' })
        vim.keymap.set('n', "<leader>gp",  require("gitsigns").preview_hunk, { desc = "Preview Git hunk" })
        vim.keymap.set('n', "<leader>gL",  function() require("gitsigns").blame_line { full = true } end, {desc = "View full Git blame" })
        vim.keymap.set('n', "<leader>gl",  require("gitsigns").blame_line, { desc = "View Git blame" })
        vim.keymap.set('n', "<leader>gh",  require("gitsigns").reset_hunk, { desc = "Reset Git hunk" })
        vim.keymap.set('n', "<leader>gr",  require("gitsigns").reset_buffer, { desc = "Reset Git buffer" })
        vim.keymap.set('n', "<leader>gs",  require("gitsigns").stage_hunk, { desc = "Stage Git hunk" })
        vim.keymap.set('n', "<leader>gS",  require("gitsigns").stage_buffer, { desc = "Stage Git buffer" })
        vim.keymap.set('n', "<leader>gu",  require("gitsigns").undo_stage_hunk, { desc = "Unstage Git hunk" })
        vim.keymap.set('n', "<leader>gd",  require("gitsigns").diffthis, { desc = "View Git diff" })
      end,
    },
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    -- event = "UIEnter",
    config = function()
      local c = require('vscode.colors').get_colors()
      require('vscode').setup({
        -- Alternatively set style in setup
        -- style = 'light',

        -- Enable transparent background
        -- transparent = true,

        -- Enable italic comment
        italic_comments = false,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- -- Override colors (see ./lua/vscode/colors.lua)
        -- color_overrides = {
        --   vscLineNumber = '#333333',
        -- },

        -- -- Override highlight groups (see ./lua/vscode/theme.lua)
        -- group_overrides = {
        --   -- this supports the same val table as vim.api.nvim_set_hl
        --   -- use colors from this colorscheme by requiring vscode.colors!
        --   Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
        -- }
      })
      require('vscode').load()
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        -- theme = 'onedark',
        theme = 'vscode',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,      -- Displays file status (readonly status, modified status)
            newfile_status = false,  -- Display new file status (new file means no write after created)
            path = 3,                -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory
            shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = '[+]',      -- Text to show when the file is modified.
              readonly = '[RO]',      -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]',     -- Text to show for newly created file before first write
            }
          }
        }
      }
    },
  },

  -- {
  --   -- Add indentation guides even on blank lines
  --   'lukas-reineke/indent-blankline.nvim',
  --   -- Enable `lukas-reineke/indent-blankline.nvim`
  --   -- See `:help indent_blankline.txt`
  --   opts = {
  --     char = '┊',
  --     show_trailing_blankline_indent = false,
  --   },
  -- },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',
    keys = { { "gc", mode = { "n", "v" } }, { "gb", mode = { "n", "v" } } },
    opts = function()
      local commentstring_avail, commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      return commentstring_avail and commentstring and { pre_hook = commentstring.create_pre_hook() } or {}
    end,
  },

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim',
    event = "VeryLazy",
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = function()
      local actions = require "telescope.actions"
      -- require telescope and load extensions as necessary
      local lga_actions = require("telescope-live-grep-args.actions")
      local telescope = require "telescope"
      telescope.load_extension "live_grep_args"
      return {
        defaults = {
          path_display = { "truncate" },
          sorting_strategy = "ascending",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              -- set in extensions field?
              ["<C-g>"] = lga_actions.quote_prompt()
            },
            n = { ["q"] = actions.close },
          },
        },
      }
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = "VeryLazy",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    build = ':TSUpdate',
    opts = {
      highlight = {
        enable = true,
        disable = function(_, bufnr) return vim.api.nvim_buf_line_count(bufnr) > 5000 end,
      },
      incremental_selection = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
    },
  },
  require 'kickstart.plugins.lsp',
  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below automatically adds your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  --
  --    An additional note is that if you only copied in the `init.lua`, you can just comment this line
  --    to get rid of the warning telling you that there are not plugins in `lua/custom/plugins/`.
  { import = 'custom.plugins' },
}, {})

-- [[ Setting options ]]
-- See `:help vim.o`

-- set scrolloff
vim.o.scrolloff = 5

-- set termguicolors
vim.o.termguicolors = true

-- highlight current line
vim.o.cursorline = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

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

-- [[ Configure Telescope ]]
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = '<c-space>',
      -- node_incremental = '<c-space>',
      -- scope_incremental = '<c-s>',
      -- node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- -- You can use the capture groups defined in textobjects.scm
        -- ['aa'] = '@parameter.outer',
        -- ['ia'] = '@parameter.inner',
        -- ['af'] = '@function.outer',
        -- ['if'] = '@function.inner',
        -- ['ac'] = '@class.outer',
        -- ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et


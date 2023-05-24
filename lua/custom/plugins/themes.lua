-- set theme.
local theme = 'vscode'

return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = theme,
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
  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    enabled = theme == 'onedark',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    -- event = "UIEnter",
    enabled = theme == 'vscode',
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
}

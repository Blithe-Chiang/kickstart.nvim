-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    "mbbill/undotree"
  },
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require("colorizer").setup {
        filetypes = { "*" },
        user_default_options = {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          names = true, -- "Name" codes like Blue or blue
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          AARRGGBB = false, -- 0xAARRGGBB hex codes
          rgb_fn = false, -- CSS rgb() and rgba() functions
          hsl_fn = false, -- CSS hsl() and hsla() functions
          css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "background", -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = false, -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { "css" }, }, -- Enable sass colors
          virtualtext = "■",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          always_update = false
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {},
      }
    end
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below

      signs = true, -- show icons in the signs column
      sign_priority = 8, -- sign priority
      -- keywords recognized as todo comments
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      gui_style = {
        fg = "NONE", -- The gui style to use for the fg highlight group.
        bg = "BOLD", -- The gui style to use for the bg highlight group.
      },
      merge_keywords = true, -- when true, custom keywords will be merged with the defaults
      -- highlighting of the line containing the todo comment
      -- * before: highlights before the keyword (typically comment characters)
      -- * keyword: highlights of the keyword
      -- * after: highlights after the keyword (todo text)
      highlight = {
        multiline = true, -- enable multine todo comments
        multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
        multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
        exclude = {}, -- list of file types to exclude highlighting
      },
      -- list of named colors where we try to extract the guifg from the
      -- list of highlight groups or use the hex color if hl not found as a fallback
      colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
      },
      search = {
        command = "rg",
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
        },
        -- regex that will be used to match keywords.
        -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    }
  },
  {
    -- surround
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "BufRead",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  -- {
  --   -- better navigation in current buffer
  --   "phaazon/hop.nvim",
  --   enabled = false,
  --   version = "v2", -- very recommend
  --   event = "VeryLazy",
  --   config = function()
  --     require("hop").setup({
  --       -- Configuration here, or leave empty to use defaults
  --     })
  --   end
  -- },
  {
    -- better navigation in current buffer
    "aznhe21/hop.nvim",
    cmd = {
      "HopWordBC",
      "HopWordAC",
      "HopLineAC",
      "HopLineBC",
      "HopChar2AC",
      "HopChar2BC",
    },
    branch= 'fix-some-bugs',
    config = function()
      require("hop").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    -- better match. will parse comment correctly
    "andymass/vim-matchup",
    event = "BufRead",
    enabled = false,
    config = function()
      -- local group = vim.api.nvim_create_augroup('vim-match-mode-switch', { clear = true })
      -- -- to v/V mode
      -- vim.api.nvim_create_autocmd('ModeChanged', {
      --   callback = function ()
      --     vim.cmd[[NoMatchParen]]
      --   end,
      --   pattern = { '*:[vV]' },
      --   group = group,
      -- })
      -- -- from v/V mode
      -- vim.api.nvim_create_autocmd('ModeChanged', {
      --   callback = function ()
      --     vim.cmd[[DoMatchParen]]
      --   end,
      --   pattern = { '[vV]:*' },
      --   group = group,
      -- })
    end,
  },
  {
    -- for better pair input
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local opts = {
        check_ts = true,
        ts_config = { java = false },
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0,
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "PmenuSel",
          highlight_grey = "LineNr",
        },
      }
      local npairs = require "nvim-autopairs"
      npairs.setup(opts)

      local cmp_status_ok, cmp = pcall(require, "cmp")
      if cmp_status_ok then
        cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done { tex = false })
      end
    end,
  },
  {
    -- search and replace
    "nvim-pack/nvim-spectre",
    tags = '*',
    keys = {
      n = {
        "<leader>S",
        "<leader>sw",
        "<leader>sp",
      },
      v = {
        "<leader>sw",
      }
    },
    opts = function()
      return {
        mapping={
          ['send_to_qf'] = {
            map = "<C-q>",
            cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
            desc = "send all item to quickfix"
          },
        },
        find_engine = {
          -- rg is map with finder_cmd
          ['rg'] = {
            options = {
              ['no-ignore'] = {
                value="--no-ignore",
                desc="disable ignore filter",
                icon="[NI]"
              },
            }
          },
        }
      }
    end
  },
  {
    -- terminal setup
    "akinsho/toggleterm.nvim",
    tags = '*',
    keys = {
      "<M-j>"
    },
    config = function()
      require("toggleterm").setup{
        direction = "horizontal",
        size = 20,
        open_mapping = [[<M-j>]],
      }
    end
  },
  {
    "RRethy/nvim-align",
    cmd = {
      "Align"
    }
  },
}

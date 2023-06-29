-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    -- surround
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
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
    enabled = true,
    branch= 'fix-some-bugs',
    event = "VeryLazy",
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
    config = function()
      -- disable highlight match paren
      vim.g.matchup_matchparen_enabled = 0
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
    -- terminal setup
    "akinsho/toggleterm.nvim",
    tags = '*',
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup{
        direction = "horizontal",
        size = 20,
        open_mapping = [[<M-j>]],
      }
    end
  },
}

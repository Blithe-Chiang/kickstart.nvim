return {
  {
    -- use lsp zero to configure LSPs
    'VonHeikemen/lsp-zero.nvim',
    event = "VeryLazy",
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      {'L3MON4D3/LuaSnip'},                  -- Required

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    }
  },
  {
    -- signature help
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    "folke/neoconf.nvim",
    config = function ()
      require("neoconf").setup({
        -- override any of the default settings here
      })
    end
  },
  {
    -- formatters
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(
          ".null-ls-root",
          ".neoconf.json",
          ".git",
          "Makefile",
          "package.json"
        ),
        sources = {
          -- nls.builtins.formatting.fish_indent,
          -- nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.gofmt,
          nls.builtins.formatting.prettier,
          -- nls.builtins.formatting.shfmt,
          -- nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
  {
    -- nvim completion
    "hrsh7th/nvim-cmp",
    commit = "a9c701fa7e12e9257b3162000e5288a75d280c28", -- https://github.com/hrsh7th/nvim-cmp/issues/1382
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-Path",
      "hrsh7th/cmp-nvim-lsp",
    },
  },
  {
    "Bekaboo/dropbar.nvim",
    enabled = false,
    event="BufRead",
  }
}

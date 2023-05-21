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
  {
    -- better navigation in current buffer
    "phaazon/hop.nvim",
    version = "v2", -- very recommend
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
    end,
  },
}

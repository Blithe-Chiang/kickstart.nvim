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

        -- normal mode (easymotion-like)
        vim.api.nvim_set_keymap("n", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true});
        vim.api.nvim_set_keymap("n", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true});
        vim.api.nvim_set_keymap("n", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true});
        vim.api.nvim_set_keymap("n", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true});

        -- visual mode (easymotion-like)
        vim.api.nvim_set_keymap("x", "<Leader><Leader>w", "<cmd>HopWordAC<CR>", {noremap=true});
        vim.api.nvim_set_keymap("x", "<Leader><Leader>b", "<cmd>HopWordBC<CR>", {noremap=true});
        vim.api.nvim_set_keymap("x", "<Leader><Leader>j", "<cmd>HopLineAC<CR>", {noremap=true});
        vim.api.nvim_set_keymap("x", "<Leader><Leader>k", "<cmd>HopLineBC<CR>", {noremap=true});

        -- (sneak-like) in all mode.
        vim.api.nvim_set_keymap("", "s", "<cmd>HopChar2AC<CR>", {noremap=false});
        vim.api.nvim_set_keymap("", "S", "<cmd>HopChar2BC<CR>", {noremap=false});
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

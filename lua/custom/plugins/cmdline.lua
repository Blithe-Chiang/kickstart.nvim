return {
  {
    -- beautiful command line
    'VonHeikemen/fine-cmdline.nvim',
    enabled = false,
    dependencies = {
      'MunifTanjim/nui.nvim'
    },
    config = function()
      vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
    end
  }
}

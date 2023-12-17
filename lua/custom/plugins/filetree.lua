return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = {
    "Neotree",
    "NeoTreeReveal",
  },
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function ()
    require('neo-tree').setup {
      window = {
        mappings = {
          ["l"] = { "open", config = { } },
          ["h"] = { "close_node", config = { } },
        }
      }
    }
  end,
}

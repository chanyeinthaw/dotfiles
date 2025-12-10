-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "\\", ":Neotree reveal float<CR>", { desc = "NeoTree reveal" } },
    -- {
    -- 	"<leader>b",
    -- 	":Neotree buffers current<CR>",
    -- 	{ desc = "NeoTree buffers" },
    -- },
  },
  opts = {
    popup_border_style = "rounded",
    filesystem = {
      window = {
        position = "current",
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },

    buffers = {
      window = {
        position = "right",
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}

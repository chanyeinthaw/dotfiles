return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      theme = "nord",
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = { "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {
          function()
            return require("auto-session.lib").current_session_name(true)
          end,
        },
        -- lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      -- tabline = {
      -- 	lualine_a = {},
      -- 	lualine_b = {},
      -- 	lualine_c = {},
      -- 	lualine_x = {},
      -- 	lualine_y = { "fileformat" },
      -- 	lualine_z = { "hostname" },
      -- },
      -- winbar = {
      -- 	lualine_a = { {
      -- 		"filename",
      -- 		separator = { right = " " },
      -- 	} },
      -- 	lualine_b = {},
      -- 	lualine_c = {},
      -- 	lualine_x = {},
      -- 	lualine_y = {},
      -- 	lualine_z = {},
      -- },
      -- inactive_winbar = {
      -- 	lualine_a = { "filename" },
      -- 	lualine_b = {},
      -- 	lualine_c = {},
      -- 	lualine_x = {},
      -- 	lualine_y = {},
      -- 	lualine_z = {},
      -- },
    },
  },
}

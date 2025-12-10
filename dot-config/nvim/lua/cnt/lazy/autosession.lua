return {
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },

        -- cwd_change_handling = {
        -- 	post_cwd_changed_hook = function()
        -- 		-- require("lualine").refresh()
        -- 	end,
        -- },
        --
        session_lens = {
          load_on_setup = true, -- Initialize on startup (requires Telescope)
          theme_conf = { -- Pass through for Telescope theme options
            -- layout_config = { -- As one example, can change width/height of picker
            --   width = 0.8,    -- percent of window
            --   height = 0.5,
            -- },
          },
          previewer = false, -- File preview for session picker

          mappings = {
            -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
            delete_session = { { "i", "n" }, "<C-D>" },
            alternate_session = { "i", "<C-S>" },
            copy_session = { "i", "<C-Y>" },
          },

          session_control = {
            control_dir = vim.fn.stdpath("data") .. "/auto_session/", -- Auto session control dir, for control files, like alternating between two sessions with session-lens
            control_filename = "session_control.json", -- File name of the session control file
          },
        },
      })

      vim.keymap.set("n", "<leader>ss", function()
        vim.cmd("AutoSession search")
        -- _G.send_escape()
      end, {
        desc = "[S]earch [s]essions",
      })
    end,
  },
}

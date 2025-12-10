return {
  {
    "pocco81/auto-save.nvim",
    opts = {
      enabled = true,
      execution_message = nil,
      condition = function(buf)
        local status, result = pcall(function()
          return vim.bo[buf].filetype
        end)

        if status and result == "harpoon" then
          return false
        end

        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true -- met condition(s), can save
        end
        return false -- can't save
      end,
    },
  },
}

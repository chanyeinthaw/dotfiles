vim.api.nvim_create_user_command("Switch", function(opts)
  local arg = opts.args
  local script_path = vim.fn.expand("~/.config/nvim/scripts/switch.sh")
  local target_dir = vim.fn.expand(arg)

  vim.fn.jobstart({ "bash", script_path, target_dir }, {
    on_stdout = function(_, data)
      if data then
        vim.notify(table.concat(data, "\n"), vim.log.levels.INFO)
      end
    end,
    on_stderr = function(_, data)
      if data then
        vim.notify(table.concat(data, "\n"), vim.log.levels.ERROR)
      end
    end,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end, {
  nargs = 1,
  complete = "file", -- Add custom completion if needed
})

local function set_window_title()
  local pwd = vim.cmd("pwd")
  local rd = vim.fn.fnamemodify(pwd, ":p:h:t")
  vim.opt.titlestring = rd
end

vim.api.nvim_create_autocmd({ "DirChanged" }, {
  pattern = "*",
  callback = set_window_title,
})

-- Set the initial window title
set_window_title()

-- Enable relative number only in Normal mode
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  pattern = "*",
  callback = function()
    -- Get the current filetype
    local ft = vim.bo.filetype

    -- List of filetypes where this behavior should not apply
    local excluded_filetypes = { "TelescopePrompt", "neo-tree-popup" }

    -- Check if the current filetype is in the excluded list
    if vim.tbl_contains(excluded_filetypes, ft) then
      return
    end

    -- Toggle relativenumber based on the event
    if vim.v.event.name == "InsertEnter" then
      vim.opt.relativenumber = false
    elseif vim.v.event.name == "InsertLeave" then
      vim.opt.relativenumber = true
    end
  end,
})

-- Always show absolute line numbers
vim.opt.number = true

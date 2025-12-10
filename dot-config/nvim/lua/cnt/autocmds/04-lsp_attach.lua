--- @param client (nil|vim.lsp.Client)
--- @param name (string)
--- @param file_name (string)
local function conditional_detatch_lsp(client, name, file_name)
  if client and client.name == name then
    local root_dir = client.config.root_dir or vim.loop.cwd()
    local deno_json = root_dir .. "/" .. file_name
    if vim.loop.fs_stat(deno_json) then
      -- vim.notify("Detaching LSP client: " .. client.name .. " due to presence of " .. file_name, vim.log.levels.INFO)
      client.stop()
    end
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    conditional_detatch_lsp(client, "typescript-tools", "deno.json")
    conditional_detatch_lsp(client, "denols", "package.json")
  end,
})

vim.api.nvim_create_user_command("LspKill", function(opts)
  local lsp_name = opts.args
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({
    bufnr = bufnr,
  })

  for _, client in pairs(clients) do
    if client.name == lsp_name and client.attached_buffers[bufnr] then
      client.stop()
      print("Detached LSP client: " .. lsp_name)
      return
    end
  end

  print("No active LSP client found with name: " .. lsp_name .. " for the current buffer.")
end, { nargs = 1 })

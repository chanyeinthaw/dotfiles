function _G.lsp_attach_remaps(event)
  local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, {
      buffer = event.buf,
      desc = "LSP: " .. desc,
    })
  end

  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  map("gd", require("telescope.builtin").lsp_definitions, "[G]o to definition")
  map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
  map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

  -- map("K", vim.lsp.buf.hover, "Hover Documentation")
  map("K", function()
    require("pretty_hover").hover()
  end, "Hover Documentation")

  map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
  map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
  map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
  map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
  map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

  -- The followingtwo autocommands are used to highlight references of the
  -- word under your cursor when your cursor rests there for a little while.
  --    See `:help CursorHold` for information about when this is executed
  --
  -- When you move your cursor, the highlights will be cleared (the second autocommand).
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = event.buf,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = event.buf,
      callback = vim.lsp.buf.clear_references,
    })
  end

  -- The following autocommand is used to enable inlay hints in your
  -- code, if the language server you are using supports them
  -- This may be unwanted, since they displace some of your code
  if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    map("<leader>th", function()
      vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
    end, "[T]oggle Inlay [H]ints")
  end
end

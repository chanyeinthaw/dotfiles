local function get_import_module_pref()
  local root_dir = vim.fn.getcwd()
  local nvim_cfg = root_dir .. "/.nvim.json"
  if not vim.loop.fs_stat(nvim_cfg) then
    return "non-relative"
  end

  nvim_cfg = vim.fn.json_decode(vim.fn.readfile(nvim_cfg))

  if nvim_cfg.typescript_importModuleSpecifierPreference == nil then
    return "non-relative"
  end

  return nvim_cfg.typescript_importModuleSpecifierPreference
end

return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        },
        tsserver_file_preferences = {
          -- non-relative = always absolute
          -- relative = relative to the project root
          -- project-relative = ???
          importModuleSpecifierPreference = get_import_module_pref(),
        },
      },
    },
  },
}

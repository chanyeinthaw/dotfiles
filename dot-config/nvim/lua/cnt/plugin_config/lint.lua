local eslint_config_file_formats = {
  ".eslintrc.json",
  "eslint.config.js",
  "eslint.config.ts",
  ".eslintrc.cjs",
}

local function has_eslint_rc()
  for _, file in pairs(eslint_config_file_formats) do
    if vim.fn.filereadable(file) == 1 then
      return true
    end
  end
end

vim.env.ESLINT_D_PPID = vim.fn.getpid()

local linters = {}

if has_eslint_rc() then
  linters = {
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },

    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
  }
end

require("lint").linters_by_ft = linters

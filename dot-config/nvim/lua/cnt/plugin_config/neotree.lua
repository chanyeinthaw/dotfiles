vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })

local bg = current_bg_color()
if bg then
  vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { bg = bg })
  vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { bg = bg })
end

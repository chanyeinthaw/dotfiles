function _G.harpoon_remaps(harpoon)
  vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
  end, {
    desc = "[H]arpoon [a]dd",
  })

  vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, {
    desc = "Open harpoon",
  })

  for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
      harpoon:list():select(i)
    end)
  end

  vim.keymap.set("n", "<C-P>", function()
    harpoon:list():prev()
  end)
  vim.keymap.set("n", "<C-N>", function()
    harpoon:list():next()
  end)
end

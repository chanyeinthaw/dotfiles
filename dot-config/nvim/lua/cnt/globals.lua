function _G.send_escape()
  local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(keys, "m", false)
end

function _G.DeleteNamelessBuffers()
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_get_name(buf) == "" and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

function _G.current_bg_color()
  local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })

  if normal_hl then
    return string.format("#%06x", normal_hl.bg)
  else
    return nil
  end
end

function _G.get_current_picker_title()
  local action_state = require("telescope.actions.state")
  local picker = action_state.get_current_picker(vim.api.nvim_get_current_buf())
  if picker and picker.prompt_title then
    return picker.prompt_title
  else
    return nil
  end
end

function _G.conditional_delete_buffer(bufnr)
  local title = get_current_picker_title()

  if title == "Sessions" then
    local current_picker = require("telescope.actions.state").get_current_picker(bufnr)
    local AutoSession = require("auto-session")
    current_picker:delete_selection(function(selection)
      AutoSession.DeleteSession(selection.path)
    end)
  end
  require("telescope.actions").delete_buffer(bufnr)
end

local function telescope_force_delete_buffer(prompt_bufnr)
  local action_state = require("telescope.actions.state")
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  current_picker:delete_selection(function(selection)
    local ok = pcall(vim.api.nvim_buf_delete, selection.bufnr, { force = true })
    return ok
  end)
end

function _G.conditional_delete_buffer_force(bufnr)
  local title = get_current_picker_title()

  if title == "Sessions" then
    local current_picker = require("telescope.actions.state").get_current_picker(bufnr)
    local AutoSession = require("auto-session")
    current_picker:delete_selection(function(selection)
      AutoSession.DeleteSession(selection.path)
    end)
  end
  telescope_force_delete_buffer(bufnr)
end
-- vim.api.nvim_command('command! DeleteNamelessBuffers lua DeleteNamelessBuffers()')
--

function _G.file_exists_in_root(filename)
  -- Get the current root directory
  local root_dir = vim.fn.getcwd()

  -- Construct the full path to the file
  local file_path = root_dir .. "/" .. filename

  -- Check if the file exists
  local file = io.open(file_path, "r")
  if file then
    io.close(file)
    return true
  else
    return false
  end
end

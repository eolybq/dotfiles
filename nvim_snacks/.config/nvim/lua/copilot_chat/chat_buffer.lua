local api = vim.api

local M = {}

function M.create()
  local buf = api.nvim_create_buf(false, true)
  api.nvim_buf_set_name(buf, "Copilot_Chat")
  api.nvim_buf_set_option(buf, "filetype", "markdown")
  
  -- Zobrazit buffer v split okně
  vim.cmd("sbuffer " .. buf)
  return buf
end

function M.append(buf, text)
  api.nvim_buf_set_lines(buf, -1, -1, false, {text})
  -- Auto-scroll
  api.nvim_win_set_cursor(0, {api.nvim_buf_line_count(buf), 0})
end

return M

-- ~/.config/nvim/lua/copilot_chat/init.lua
require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup{}
    end
  }
})

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local M = {}

function M.start_chat()
  local messages = {}
  
  local picker = pickers.new({
    -- Vypnutí sortování pomocí dummy sorteru
    sorter = {
      scoring_function = function() return 1 end,
      highlighter = function() return {} end,
    },
    finder = finders.new_dynamic({
      entry_maker = function(line)
        return {
          value = line,
          display = line,
          ordinal = line,
        }
      end,
      fn = function()
        return messages
      end,
    }),
    prompt_title = "💬 Copilot Chat (Enter to send, ESC to quit)",
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local input = action_state.get_current_line()
        if #input == 0 then return end

        -- Přidat zprávu uživatele
        table.insert(messages, "👤 You: " .. input)
        
        -- Simulovat odpověď
        table.insert(messages, "🤖 Copilot: Response to '" .. input .. "'")
        
        -- Refresh picker s novými zprávami
        picker:refresh(finders.new_dynamic({
          entry_maker = function(line) return {value = line} end,
          fn = function() return messages end,
        }), {reset_prompt = false})
        
        -- Vyčistit prompt
        vim.api.nvim_buf_set_lines(vim.fn.bufnr(""), 0, -1, false, {})
      end)

      return true
    end,
  })

  picker:find()
end

vim.keymap.set("n", "<leader>cc", M.start_chat, {desc = "Start Copilot Chat"})

return M

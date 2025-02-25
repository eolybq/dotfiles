local api = vim.api

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local sorters = require("telescope.sorters")

local M = {}

local chat_history = {}
local picker_instance = nil -- This will hold the picker instance

-- Function to send input to the model and update the picker
local function send_input_to_model(input, callback)
	local api_endpoint = "http://localhost:11434/api/chat"

	local request_body = vim.json.encode({
		model = "qwen2.5-coder:7b",
		messages = {
			{
				role = "user",
				content = input,
			},
		},
		stream = false,
	})

	local curl_command = "curl -s -X POST -H 'Content-Type: application/json' -d '"
		.. request_body
		.. "' "
		.. api_endpoint
	local response = vim.fn.system(curl_command)

	print(response)

	-- Decode the response
	local response_json = vim.json.decode(response)

	-- Add the new message to chat history
	table.insert(chat_history, { input = input, response = response_json.message.content })

	-- Call the callback to update the picker
	callback()
end

-- Function to format chat history for display
local function format_chat_entry(entry)
	return "You: " .. entry.input .. "\n" .. "Bot: " .. entry.response
end

-- Function to initialize or update the picker
local function chat_picker()
	-- Create a new picker or update the existing one
	picker_instance = pickers.new({}, {
		prompt_title = "Chat with Ollama",
		finder = finders.new_table({
			results = chat_history,
			entry_maker = function(entry)
				return {
					value = entry,
					display = format_chat_entry(entry), -- Format the chat entry for display
					ordinal = entry.input, -- Use input as ordinal for sorting
				}
			end,
		}),
		sorter = sorters.Sorter:new({
			scoring_function = function()
				return 0
			end,
			highlighter = function()
				return {}
			end,
		}),
		attach_mappings = function(prompt_bufnr, map)
			-- Map Enter key to send input to the model and refresh the picker
			map("i", "<CR>", function()
				local input = vim.fn.getline(".") -- Get the current line input
				send_input_to_model(input, function()
					-- After sending the input, refresh the picker with updated chat history
					chat_picker() -- Recreate and show the picker with updated history
				end)
			end)

			-- Allow for closing the picker with Esc
			map("i", "<Esc>", actions.close)

			return true
		end,
	})

	-- Show the picker
	picker_instance:find()
end

M.chat_picker = chat_picker

return M

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "ayu_dark",
        -- section_separators = { left = "", right = "" },
        section_separators = "",
        component_separators = "|",
      },
      sections = {
        -- lualine_a = {
        --   {
        --     "mode",
        --     fmt = function(str)
        --       return str:sub(1, 1)
        --     end,
        --   },
        -- },
        lualine_c = {
          {
            "filename",
            fmt = function(str)
              return "[" .. str .. "]"
            end,
          },
        },
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
          "encoding",
          "fileformat",
          -- "filetype",
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 }},
        },
      },
      inactive_sections = {
        lualine_c = {
      {
        'filename',
        fmt = function(str)
          return '[' .. str .. ']'
        end
      }
    },
      }
    })
  end,
}

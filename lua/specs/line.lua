-- local Plugin = {
--     'nvim-lualine/lualine.nvim',
--     dependencies = {
--       'nvim-tree/nvim-web-devicons'
--     }
-- }
-- 
-- return Plugin

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '▶', right = '◀' },
        section_separators = { left = '»', right = '«' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {
          {
            'branch',
            icon = '⎇',
          },
          {
            'diff',
          },
          {
            'diagnostics',
            symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
          },
        },
        lualine_c = {
          {
            'filename',
          },
        },
        lualine_x = {
          {
            'encoding',
          },
          {
            'fileformat',
            symbols = {
              unix = 'unix',
              dos = 'dos',
              mac = 'mac',
            }
          },
          {
            'filetype',
          },
        },
        lualine_y = {
          {
            'progress',
          },
        },
        lualine_z = {
          {
            'location',
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          'filename',
        },
        lualine_x = {
          'location',
        },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {
        "neo-tree",
        "lazy", 
      },
    }
  end,
}

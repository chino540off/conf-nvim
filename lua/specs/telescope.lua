-- Fuzzy Finder
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzy-native.nvim",
        build = function()
          if vim.fn.executable("make") == 0 then
            return
          end

          local workdir = vim.api.nvim_get_runtime_file("deps/fzy-lua-native", true)

          local job_output = function(cid, data, name)
            for i, val in pairs(data) do
              print(val)
            end
          end

          if workdir[1] == nil then
            return
          end

          vim.fn.jobstart({ "make" }, {
            cwd = workdir[1],
            on_stdout = job_output,
          })
        end,
      },
      {
        "nvim-telescope/telescope-smart-history.nvim",
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
      },
    },

    cmd = "Telescope",
    init = function()
      local bind = vim.keymap.set
      local builtin = require("telescope.builtin")

      -- Search pattern
      bind("n", "<leader>tg", function()
        builtin.live_grep({
          default_text = vim.fn.expand("<cword>"),
        })
      end)
      bind("n", "<leader>tG", "<cmd>Telescope live_grep<cr>")

      -- Show key bindings list
      bind("n", "<leader>t?", "<cmd>Telescope keymaps<cr>")

      -- Find files by name
      bind("n", "<leader>tf", "<cmd>Telescope find_files<cr>")

      -- Search symbols in buffer
      bind("n", "<leader>ts", "<cmd>Telescope treesitter<cr>")

      -- Search buffer lines
      bind("n", "<leader>tB", "<cmd>Telescope current_buffer_fuzzy_find<cr>")

      -- Open file_browser
      bind("n", "<leader>tF", "<cmd>Telescope file_browser<cr>")

      -- Search in files history
      bind("n", "<leader>th", "<cmd>Telescope oldfiles<cr>")

      -- Search in active buffers list
      bind("n", "<leader>tb", "<cmd>Telescope buffers<cr>")
    end,
    config = function()
      local command = vim.api.nvim_create_user_command

      local telescope = require("telescope")
      local actions = require("telescope.actions")

      command("TGrep", function(input)
        require("telescope.builtin").grep_string({ search = input.args })
      end, { nargs = 1 })

      local function defaults(title)
        return {
          prompt_title = title,
          results_title = false,
        }
      end

      local function dropdown(title, previewer)
        return {
          prompt_title = title,
          previewer = previewer or false,
          theme = "dropdown",
        }
      end

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<M-k>"] = actions.move_selection_previous,
              ["<M-j>"] = actions.move_selection_next,
              ["<M-b>"] = actions.select_default,
              ["<C-Down>"] = actions.cycle_history_next,
              ["<C-Up>"] = actions.cycle_history_prev,
            },
          },

          -- Default layout options
          prompt_prefix = " ",
          selection_caret = "❯ ",
          layout_strategy = "vertical",
          sorting_strategy = "ascending",
          layout_config = {
            preview_cutoff = 25,
            mirror = true,
            prompt_position = "top",
          },
          history = {
            path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
            limit = 100,
          },
        },
        pickers = {
          buffers = dropdown(),
          find_files = dropdown(),
          oldfiles = dropdown("History"),
          keymaps = dropdown(),
          command_history = dropdown(),
          colorscheme = dropdown(),

          grep_string = defaults("Search"),
          treesitter = defaults("Buffer Symbols"),
          current_buffer_fuzzy_find = defaults("Lines"),
          live_grep = defaults("Grep"),

          commands = defaults(),
          help_tags = defaults(),
        },
        extension = {
          fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
          },
          file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ["i"] = {
                -- your custom insert mode mappings
              },
              ["n"] = {
                -- your custom normal mode mappings
              },
            },
          },
        },
      })

      telescope.load_extension("fzy_native")
      telescope.load_extension("smart_history")
      telescope.load_extension("file_browser")
    end,
  },
}

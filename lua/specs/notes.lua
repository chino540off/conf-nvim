return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    init = function()
      vim.opt.conceallevel = 1

      local bind = vim.keymap.set

      -- New note
      bind("n", "<leader>nn", "<cmd>ObsidianNew<cr>")
      -- Switch workspace
      bind("n", "<leader>nw", "<cmd>ObsidianWorkspace<cr>")
      -- Search note
      bind("n", "<leader>ns", "<cmd>ObsidianSearch<cr>")
      -- Search tags
      bind("n", "<leader>nt", "<cmd>ObsidianTags<cr>")
      -- Insert template
      bind("n", "<leader>ni", "<cmd>ObsidianTemplate<cr>")
    end,
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/notes/personal",
        },
        {
          name = "work",
          path = "~/notes/work",
        },
      },

      -- see below for full list of options 👇
      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
      },

      -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
      -- way then set 'mappings = {}'.
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ["<cr>"] = {
          action = function()
            return require("obsidian").util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },
      ui = {
        enable = false, -- set to false to disable all additional syntax features
      },
      templates = {
        folder = "~/notes/templates",
        date_format = "%Y/%m/%d",
        time_format = "%H:%M",
      },
    },
  },
}

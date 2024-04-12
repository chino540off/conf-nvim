return {
  {
    "nvim-treesitter/nvim-treesitter",

    pin = true,

    dependencies = {
      { "nvim-treesitter/nvim-treesitter-textobjects", pin = true },
    },

    opts = {
      highlight = {
        enable = true,
        disable = { "vue" },
        additional_vim_regex_highlighting = { "html", "vimdoc" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "ga",
          node_incremental = "ga",
          node_decremental = "gz",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ia"] = "@parameter.inner",
          },
        },
        swap = {
          enable = true,
          swap_previous = {
            ["{a"] = "@parameter.inner",
          },
          swap_next = {
            ["}a"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
        },
      },
      ensure_installed = {
        "c",
        "cpp",
        "css",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "helm",
        "html",
        "json",
        "lua",
        "rust",
        "vim",
        "vimdoc",
      },
    },

    build = function()
      pcall(vim.cmd, "TSUpdate")
    end,

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}

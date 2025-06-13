return {
  -- Add Python & related to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "black", "python-lsp-server", "mypy", "flake8" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = { "black" },
      },
      formatters = {
        black = {
          prepend_args = { "--fast" },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          enabled = true,
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  enabled = true,
                  ignore = {},
                  maxLineLength = 100,
                },
                flake8 = {
                  enabled = true,
                  maxLineLength = 100,
                },
                pylsp_mypy = {
                  enabled = true,
                  strict = true,
                },
              },
            },
          },
        },
      },
    },
  },
}

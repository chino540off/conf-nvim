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
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "black", "python-lsp-server" })
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
          prepend_args = { "--line-length", "100" },
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
                  ignore = {},
                  maxLineLength = 100,
                },
              },
            },
          },
        },
      },
    },
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "latex", "markdown" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "ltex-ls" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          enabled = true,
          settings = {
            ltex = {
              language = "en-GB",
            },
          },
        },
      },
    },
  },
}

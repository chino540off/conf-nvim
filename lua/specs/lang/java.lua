return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "java" })
    end,
  },
  {
    "nvim-java/nvim-java",
    config = false,
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "jdtls" })
        end,
      },
      {
        "neovim/nvim-lspconfig",
        opts = {
          servers = {
            jdtls = {
              enabled = true,
              -- Your custom jdtls settings goes here
            },
          },
          setup = {
            jdtls = function()
              require("java").setup({
                -- Your custom nvim-java configuration goes here
              })
            end,
          },
        },
      },
    },
  },
}

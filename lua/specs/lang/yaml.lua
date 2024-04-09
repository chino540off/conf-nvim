return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "yaml" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      -- for ansiblels validation
      vim.list_extend(opts.ensure_installed, { "yamllint", "yamlfmt" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["yaml"] = { "yamlfmt" },
      },
      formatters = {
        yamlfmt = {
          prepend_args = {
            "-formatter",
            table.concat({
              "include_document_start=true",
              "indent=2",
              "retain_line_breaks_single=true",
              "scan_folded_as_literal=true",
              "scan_folded_as_literal=true",
            }, ","),
          },
        },
      },
    },
  },
  {
    "cuducos/yaml.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
}

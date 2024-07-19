return {
  -- Add C++ & related to treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "c", "cpp", "cmake", "doxygen" })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "clang-format", "clangd", "cmakelang" })
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["cpp"] = { "clang-format" },
        ["cmake"] = { "cmake_format" },
      },
      formatters = {
        cmake_format = {
          prepend_args = { "--config", ".cmake-format.yml", "--" },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          enabled = false,
        },
      },
    },
  },
  {
    -- https://www.vim.org/scripts/script.php?script_id=31
    "vim-scripts/a.vim",
    keys = {
      {
        "<leader>a",
        "<cmd>A<cr>",
        desc = "switches to the header file corresponding to the current file being edited (or vise versa)",
      },
    },
  },
}

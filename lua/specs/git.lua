return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
      {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen" },
        config = function()
          local diff = require("diffview.actions")
          require("diffview").setup({
            use_icons = false,
            view = {
              default = {
                layout = "diff2_vertical",
              },
              merge_tool = {
                layout = "diff3_mixed",
              },
            },
            keymaps = {
              view = {
                { "n", "<M-h>", diff.conflict_choose("ours"), { desc = "Choose ours" } },
                { "n", "<M-l>", diff.conflict_choose("theirs"), { desc = "Choose theirs" } },
                { "n", "<M-j>", diff.next_conflict, { desc = "Go to next conflict" } },
                { "n", "<M-k>", diff.prev_conflict, { desc = "Go to previous conflict" } },
              },
            },
          })
        end,
      },
    },

    cmd = "Neogit",

    keys = { { "<leader>G", "<cmd>Neogit<cr>" } },

    opts = {
      disable_hint = true,
      auto_refresh = false,
      disable_context_highlighting = true,
      integrations = {
        telescope = true,
        diffview = true,
      },
      signs = {
        section = { "»", "-" },
        item = { "+", "*" },
      },
    },
  },
  -- git signs highlights text that has changed since the list
  -- git commit, and also lets you interactively stage & unstage
  -- hunks in a commit.
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
}

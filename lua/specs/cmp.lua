return {
  -- Completion framework:
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- LSP completion source:
    "hrsh7th/cmp-nvim-lsp",

    -- Useful completion sources:
    "onsails/lspkind.nvim",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "f3fora/cmp-spell",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    vim.opt.completeopt = { "menu", "menuone", "noselect" }
    local function border(hl_name)
      return {
        { "┌", hl_name },
        { "─", hl_name },
        { "┐", hl_name },
        { "│", hl_name },
        { "┘", hl_name },
        { "─", hl_name },
        { "└", hl_name },
        { "│", hl_name },
      }
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        completion = {
          border = border("CmpMenuBorder"),
          winhighlight = "Normal:CmpMenu,CursorLine:CmpMenuSel,Search:None",
        },
        documentation = {
          border = border("CmpDocBorder"),
          winhighlight = "Normal:CmpDoc",
        },
      },
      formatting = {
        fields = { "menu", "abbr", "kind" },
        expandable_indicator = true,
        --format = lspkind.cmp_format({
        --  mode = "symbol_text",
        --  menu = {
        --  },
        --}),
        format = function(entry, vim_item)
          local menu_length = 0
          if vim_item.menu ~= nil then
            menu_length = string.len(vim_item.menu)
          end
          local kind = lspkind.cmp_format({
            preset = "default",
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              luasnip = "[LuaSnip]",
              nvim_lua = "[Lua]",
              latex_symbols = "[Latex]",
              path = "[Path]",
              spell = "[Spell]",
            },
          })(entry, vim_item)
          if vim_item.menu ~= nil then
            local new_menu_length = string.len(vim_item.menu)
            kind.menu = string.sub(vim_item.menu, 1, new_menu_length - menu_length)
          end
          return kind
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "luasnip" }, -- For luasnip users.
        -- { name = "orgmode" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end,
          },
        },
        { name = "path" },
        {
          name = "spell",
          option = {
            keep_all_entries = false,
            enable_in_context = function()
              --return require("cmp.config.context").in_treesitter_capture("spell")
              return true
            end,
            preselect_correct_word = true,
          },
        },
      }),
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "buffer" } },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline({
        --["<Tab>"] = { c = function() end },
        --["<S-Tab>"] = { c = function() end },
      }),
      sources = cmp.config.sources({
        { name = "path", option = { trailing_slash = true } },
        { name = "cmdline", option = { treat_trailing_slash = false } },
      }),
    })
  end,
}

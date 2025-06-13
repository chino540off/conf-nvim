return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "latex", "markdown" })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    after = { "nvim-treesitter" },
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    config = function()
      require("render-markdown").setup({
        --heading = {
        --  -- Turn on / off heading icon & background rendering
        --  enabled = true,
        --  -- Turn on / off any sign column related rendering
        --  sign = true,
        --  -- Determines how icons fill the available space:
        --  --  inline:  underlying '#'s are concealed resulting in a left aligned icon
        --  --  overlay: result is left padded with spaces to hide any additional '#'
        --  position = "overlay",
        --  -- Replaces '#+' of 'atx_h._marker'
        --  -- The number of '#' in the heading determines the 'level'
        --  -- The 'level' is used to index into the list using a cycle
        --  icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
        --  -- Added to the sign column if enabled
        --  -- The 'level' is used to index into the list using a cycle
        --  signs = { "󰫎 " },
        --  -- Width of the heading background:
        --  --  block: width of the heading text
        --  --  full:  full width of the window
        --  -- Can also be a list of the above values in which case the 'level' is used
        --  -- to index into the list using a clamp
        --  width = "full",
        --  -- Amount of margin to add to the left of headings
        --  -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        --  -- Margin available space is computed after accounting for padding
        --  -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
        --  left_margin = 0,
        --  -- Amount of padding to add to the left of headings
        --  -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        --  -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
        --  left_pad = 0,
        --  -- Amount of padding to add to the right of headings when width is 'block'
        --  -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
        --  -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
        --  right_pad = 0,
        --  -- Minimum width to use for headings when width is 'block'
        --  -- Can also be a list of integers in which case the 'level' is used to index into the list using a clamp
        --  min_width = 0,
        --  -- Determines if a border is added above and below headings
        --  border = false,
        --  -- Always use virtual lines for heading borders instead of attempting to use empty lines
        --  border_virtual = false,
        --  -- Highlight the start of the border using the foreground highlight
        --  border_prefix = false,
        --  -- Used above heading for border
        --  above = "▄",
        --  -- Used below heading for border
        --  below = "▀",
        --  -- The 'level' is used to index into the list using a clamp
        --  -- Highlight for the heading icon and extends through the entire line
        --  backgrounds = {
        --    "RenderMarkdownH1Bg",
        --    "RenderMarkdownH2Bg",
        --    "RenderMarkdownH3Bg",
        --    "RenderMarkdownH4Bg",
        --    "RenderMarkdownH5Bg",
        --    "RenderMarkdownH6Bg",
        --  },
        --  -- The 'level' is used to index into the list using a clamp
        --  -- Highlight for the heading and sign icons
        --  foregrounds = {
        --    "RenderMarkdownH1",
        --    "RenderMarkdownH2",
        --    "RenderMarkdownH3",
        --    "RenderMarkdownH4",
        --    "RenderMarkdownH5",
        --    "RenderMarkdownH6",
        --  },
        --},
        -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
        -- There are two special states for unchecked & checked defined in the markdown grammar
        --checkbox = {
        --  -- Turn on / off checkbox state rendering
        --  enabled = true,
        --  -- Determines how icons fill the available space:
        --  --  inline:  underlying text is concealed resulting in a left aligned icon
        --  --  overlay: result is left padded with spaces to hide any additional text
        --  position = "inline",
        --  unchecked = {
        --    -- Replaces '[ ]' of 'task_list_marker_unchecked'
        --    icon = "▢ ",
        --    -- Highlight for the unchecked icon
        --    highlight = "RenderMarkdownUnchecked",
        --    -- Highlight for item associated with unchecked checkbox
        --    scope_highlight = nil,
        --  },
        --  checked = {
        --    -- Replaces '[x]' of 'task_list_marker_checked'
        --    icon = "✔ ",
        --    -- Highlight for the checked icon
        --    highlight = "RenderMarkdownChecked",
        --    -- Highlight for item associated with checked checkbox
        --    scope_highlight = nil,
        --  },
        --  -- Define custom checkbox states, more involved as they are not part of the markdown grammar
        --  -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
        --  -- Can specify as many additional states as you like following the 'todo' pattern below
        --  --   The key in this case 'todo' is for healthcheck and to allow users to change its values
        --  --   'raw':             Matched against the raw text of a 'shortcut_link'
        --  --   'rendered':        Replaces the 'raw' value when rendering
        --  --   'highlight':       Highlight for the 'rendered' icon
        --  --   'scope_highlight': Highlight for item associated with custom checkbox
        --  custom = {
        --    todo = { raw = "[-]", rendered = "⚠ ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
        --  },
        --},
        -- link = {
        --   -- Turn on / off inline link icon rendering
        --   enabled = true,
        --   -- Inlined with 'image' elements
        --   image = "󰥶 ",
        --   -- Inlined with 'email_autolink' elements
        --   email = "󰀓 ",
        --   -- Fallback icon for 'inline_link' and 'uri_autolink' elements
        --   hyperlink = "󰌹 ",
        --   -- Applies to the fallback inlined icon
        --   highlight = "RenderMarkdownLink",
        --   -- Applies to WikiLink elements
        --   wiki = { icon = "◳ ", highlight = "RenderMarkdownWikiLink" },
        --   -- Define custom destination patterns so icons can quickly inform you of what a link
        --   -- contains. Applies to 'inline_link' and wikilink nodes.
        --   -- Can specify as many additional values as you like following the 'web' pattern below
        --   --   The key in this case 'web' is for healthcheck and to allow users to change its values
        --   --   'pattern':   Matched against the destination text see :h lua-pattern
        --   --   'icon':      Gets inlined before the link text
        --   --   'highlight': Highlight for the 'icon'
        --   custom = {
        --     web = { pattern = "^http", icon = "󰖟 " },
        --     youtube = { pattern = "youtube%.com", icon = "󰗃 " },
        --     github = { pattern = "github%.com", icon = "󰊤 " },
        --     neovim = { pattern = "neovim%.io", icon = " " },
        --     stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
        --     discord = { pattern = "discord%.com", icon = "󰙯 " },
        --     reddit = { pattern = "reddit%.com", icon = "󰑍 " },
        --   },
        -- },
      })
    end,
  },
}

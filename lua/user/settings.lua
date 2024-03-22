vim.opt.ruler = true
vim.opt.number = true
vim.opt.termguicolors = true

-- menu
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest"

-- text formatting
vim.opt.tabstop = 8
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- folding
vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 0

vim.opt.background   = "dark"
vim.opt.completeopt  = {"noinsert", "menuone", "noselect"}
vim.opt.clipboard    = "unnamedplus"
vim.opt.cursorline   = true
vim.opt.number       = true
vim.opt.title        = true
vim.opt.wildmenu     = true
vim.opt.expandtab    = false
vim.opt.shiftwidth   = 4
vim.opt.tabstop      = 4
vim.opt.scrolloff    = 4
vim.opt.wrap         = false
vim.opt.compatible   = false
vim.opt.hlsearch     = false
vim.opt.autoread     = true
vim.opt.incsearch    = true
vim.opt.ignorecase   = true
vim.opt.smartcase    = true
vim.opt.showmatch    = true
vim.opt.showmode     = false
vim.opt.ruler        = false
vim.opt.laststatus   = 0
vim.opt.showcmd      = false
vim.opt.timeoutlen   = 700
vim.opt.list         = true
-- vim.opt.mouse        = ""

vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "tab:▎⋅"

vim.g.mapleader        = " "
vim.g.zig_fmt_autosave = 0

local HOME = os.getenv("HOME")

dofile(HOME .. "/.config/nvim/plugins.lua")

-- for whatever reason this color scheme has to go below plugins.lua :(
vim.cmd('colorscheme gruvbox')

local function load_dir(dir)
   require("plenary.scandir").scan_dir(dir, { on_insert = function(file, _)
      if not file:match("%.lua$") then return end
      dofile(file)
   end})
end

load_dir(HOME .. "/.config/nvim/plugins")
load_dir(HOME .. "/.config/nvim/config")

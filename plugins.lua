-- Bootstrap Pckr
local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

if not vim.uv.fs_stat(pckr_path) then
   vim.fn.system({ 'git', 'clone', "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
   })
end
vim.opt.rtp:prepend(pckr_path)

local cmd = require('pckr.loader.cmd')
require('pckr').add({
   'nvim-lua/plenary.nvim',     -- library



   -- Completion
   'hrsh7th/nvim-cmp',          -- Completion Engine
   'hrsh7th/cmp-buffer',        -- .. from buffer
   'hrsh7th/cmp-path',          -- .. from file path
   'hrsh7th/cmp-cmdline',       -- .. from command line
   'hrsh7th/cmp-calc',          -- .. as a calculator
   'f3fora/cmp-spell',          -- .. from spell check
   'max397574/cmp-greek',       -- .. for greek characters



   --
   -- File Managment / Navigation
   {'nvim-telescope/telescope.nvim', cond = cmd('Telescope'), config = __telescope}, -- Fuzzy find files
   {'is0n/fm-nvim',                  cond = cmd('Xplr')},                            -- Used for the File Manager `xplr`
   {'tpope/vim-fugitive',            cond = cmd('Git')},                             -- Git integration
   { 'nvim-telescope/telescope-fzf-native.nvim', 
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      cond = cmd('Telescope')
   },



   --
   -- Utils
   'folke/which-key.nvim',          -- Keybind hints
   'mg979/vim-visual-multi',        -- Multi cursor support
   'akinsho/toggleterm.nvim',       -- Floating terminal

   {'VidocqH/auto-indent.nvim', config = function()
      require("auto-indent").setup()
   end },      -- auto indent when pressing tab

   {'Saecki/crates.nvim', config = function()
      require('crates').setup()
   end }, -- Crates.io integration

   {'numToStr/Comment.nvim', config = function()
      require('Comment').setup()
      require('Comment.ft').hjson = '#%s'
   end }, -- Commenting code



   --
   -- Appearance
   'nvim-lualine/lualine.nvim',           -- status line
   'nvim-tree/nvim-web-devicons',         -- icons library
   'psliwka/vim-smoothie',                -- smooth scrolling
   'lewis6991/gitsigns.nvim',             -- visual git integration

   {'RRethy/vim-illuminate', config = function()
      require('illuminate').configure({
         delay = 10,
         under_cursor = false,
      })
   end },               -- passive highlight current word

   {'lukas-reineke/indent-blankline.nvim', config = function()
      require("ibl").setup()
   end }, -- ghost characters for spaces, tabs, and newlines

   {'mawkler/modicator.nvim', config = function()
      require("modicator").setup()
   end },
})
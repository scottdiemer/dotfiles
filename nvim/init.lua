-- ========================================================================== --
--                                   SETTINGS                                 --
-- ========================================================================== --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.undofile = true


local undodir = vim.fn.expand("~/.config/nvim/undo/")
vim.fn.mkdir(undodir, "p") 
vim.opt.undodir = undodir

-- Map Leader key to space
vim.g.mapleader = " "
-- Disable Perl & Ruby Providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- ========================================================================== --
--                               PLUGIN MANAGER                              --
-- ========================================================================== --
-- Bootstrap lazy.nvim (automatically installs it if missing)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- In-buffer Markdown rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {},
  },
  -- Theme
  { "navarasu/onedark.nvim", lazy = false, priority = 1000, config = function()
    require('onedark').load()
  end },

  -- File Explorer (Modern NERDTree replacement)
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },

  -- Statusline (Modern Airline replacement)
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, config = true },

-- Treesitter
{
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    local ts = require("nvim-treesitter")

    -- Install the parsers we use.
    ts.install({
      "javascript",
      "typescript",
      "tsx",
      "html",
      "css",
      "graphql",
      "json",
      "markdown",
      "markdown_inline",
    })
  end,
},
  -- Native LSP & Autocomplete (Modern CoC replacement)
  { "neovim/nvim-lspconfig" },
  { 
    "hrsh7th/nvim-cmp", 
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- Added build step here
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping.select_next_item(),
        }),
        sources = cmp.config.sources({ { name = 'nvim-lsp' }, { name = 'luasnip' } })
      })
    end
  },

  -- AutoPairs = Automatically pairs closing bracket when creating opening bracket  
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },

  {
    'stevearc/conform.nvim',
    event = { "BufWritePre" }, -- Loads the plugin right before you save a file
    cmd = { "ConformInfo" },   -- Allows running `:ConformInfo` to debug issues
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      -- Define which formatters to use for specific file types
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
      },
      -- Automatically format when saving the file
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  -- Quality of Life classics that still work beautifully in Lua
  { "tpope/vim-surround" },
  { "numToStr/Comment.nvim", config = true }, -- Modern tcomment replacement
  { "windwp/nvim-ts-autotag", config = true }, -- Modern closetag/matchtag replacement
}, {
  -- Lazy.nvim options (proper place for disabling rocks)
  rocks = {
    enabled = false,
  },
})


-- ========================================================================== --
--                                KEYMAPPINGS                                 --
-- ========================================================================== --
-- Toggle NvimTree (Ctrl + n)
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

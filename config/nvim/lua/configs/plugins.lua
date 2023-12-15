local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Colorschemes
  { "tomasiser/vim-code-dark", lazy = true },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", name = "kanagawa", lazy = false, priority = 1000 },
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", lazy = false, priority = 1000 },

  "tpope/vim-fugitive",
  "tpope/vim-commentary",
  "tpope/vim-endwise",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "tpope/vim-repeat",
  "kien/rainbow_parentheses.vim",
  "BurntSushi/ripgrep",
  "terryma/vim-multiple-cursors",
  "junegunn/vim-easy-align",
  "sickill/vim-pasta",
  "janko-m/vim-test",
  "folke/trouble.nvim",
  { "nvim-telescope/telescope.nvim", tag = "0.1.5" },
  "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "airblade/vim-gitgutter",
  "github/copilot.vim",
  "ruanyl/vim-gh-line",

  -- Clojure specific plugins
  { "tpope/vim-classpath", ft = "clj" },
  { "tpope/vim-salve", ft = "clj" },
  { "tpope/vim-dispatch", ft = "clj" },
  { "tpope/vim-projectionist", ft = "clj" },
  { "vim-scripts/paredit.vim", ft = "clj" },
  { "guns/vim-clojure-highlight", ft = "clj" },
  { "tpope/vim-sexp-mappings-for-regular-people", ft = "clj" },
  { "guns/vim-sexp", ft = "clj" },
  { "Olical/conjure", ft = "clj" },

  -- Rust specific plugins
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "rust-lang/rust.vim",
  "neovim/nvim-lspconfig",
  "simrat39/rust-tools.nvim",

  -- Writing
  "nvim-lua/plenary.nvim",
  "jose-elias-alvarez/null-ls.nvim",
}

local opts = {
}

require("lazy").setup(plugins, opts)

vim.api.nvim_set_var("test#strategy", "neovim");
vim.api.nvim_set_var("test#neovim#term_position", "vertical");
vim.api.nvim_set_var("copilot_node_command", "~/.nodenv/versions/16.20.0/bin/node")

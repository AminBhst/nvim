local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- local packer_config = vim.api.nvim_create_augroup("packer_config", { clear = true })

-- call PackerSync whenever this file is written
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- command = "source <afile> | PackerSync",
-- group = packer_config,
-- })

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Could not require Packer")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Add plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "MunifTanjim/nui.nvim"

  -- Aesthetic
  use "lunarvim/darkplus.nvim"
  use "rafi/awesome-vim-colorschemes"
  use "morhetz/gruvbox"
  use "ryanoasis/vim-devicons"
  use "kyazdani42/nvim-web-devicons"
  use "andweeb/presence.nvim"
  use "glepnir/dashboard-nvim"
  use "tanvirtin/monokai.nvim"
  use "folke/tokyonight.nvim"
  use "windwp/nvim-autopairs"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "EdenEast/nightfox.nvim"
  use "antosha417/nvim-lsp-file-operations"

  -- Java
  use 'mfussenegger/nvim-jdtls'


  -- Flutter
  use "akinsho/flutter-tools.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason-lspconfig.nvim"
  use "williamboman/mason.nvim"
  use "jay-babu/mason-nvim-dap.nvim"
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  require("lsp-file-operations").setup()
  use "Slotos/telescope-lsp-handlers.nvim"

  use "vim-airline/vim-airline"

  -- git
  use "lewis6991/gitsigns.nvim"

  -- ProjectMgr
  use "petertriho/nvim-scrollbar"
  use "nvim-telescope/telescope.nvim"
  use "nvim-tree/nvim-tree.lua"
  use 'ThePrimeagen/harpoon'
  use {'nvim-telescope/telescope-ui-select.nvim' }

  -- buffer line
  --[[ use "akinsho/bufferline.nvim" ]]

  -- linting
  use "jose-elias-alvarez/null-ls.nvim"
--  use "joechrisellis/lsp-format-modifications.nvim" does not work for formatters which do not support range formatting

  -- commenting
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "numToStr/Comment.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"

  -- DAP
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "ravenxrz/DAPInstall.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

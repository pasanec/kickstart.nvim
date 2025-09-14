-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
        },
      }

      -- Open parent directory in current window.
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

      -- Open parent directory in floating window.
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'tjdevries/ocaml.nvim',
    build = 'make',
    config = function()
      require('ocaml').setup()
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'github/copilot.vim',
    },
    opts = {
      -- log_level = 'DEBUG',
      adapters = {
        http = {
          copilot = function()
            return require('codecompanion.adapters').extend 'copilot'
          end,
          qween = function()
            return require('codecompanion.adapters').extend('ollama', {
              name = 'qwen',
              env = {
                url = 'http://127.0.0.1:11434',
                api_key = 'hello',
              },
              schema = {
                model = {
                  default = 'hf.co/unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:Q4_K_XL',
                },
              },
            })
          end,
        },
      },
      strategies = {
        chat = {
          adapter = 'copilot',
        },
        inline = {
          adapter = 'copilot',
        },
        agent = {
          adapter = 'copilot',
        },
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'codecompanion' },
  },
  {
    'echasnovski/mini.diff',
    config = function()
      local diff = require 'mini.diff'
      diff.setup {
        -- Disabled by default
        source = diff.gen_source.none(),
      }
    end,
  },
  {
    'nvim-flutter/flutter-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = { 'dart' },
    config = function()
      require('flutter-tools').setup {} -- use defaults
    end,
  },
  {
    'nvim-flutter/pubspec-assist.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    ft = { 'dart' },
    config = function()
      require('pubspec-assist').setup {} -- use defaults
    end,
  },
}

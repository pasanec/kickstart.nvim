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
    'praem90/nvim-phpcsf',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    ft = 'php',
    config = function()
      local phpsniff = require 'phpcs'
      phpsniff.setup {
        phpcs = vim.fn.expand '~' .. '/.config/composer/vendor/bin/phpcs',
        phpcbf = vim.fn.expand '~' .. '/.config/composer/vendor/bin/phpcbf',
        standard = 'moodle-extra',
      }
      vim.keymap.set('n', '<leader>ps', phpsniff.cs, { desc = '[P]HP [S]niff' })
      vim.keymap.set('n', '<leader>pf', phpsniff.cbf, { desc = '[P]HP [F]ormat' })
    end,
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
    opts = function()
      local adapters = require 'codecompanion.adapters'
      return {
        -- (optional) turn on logging while you debug
        opts = { log_level = 'DEBUG' },

        adapters = {
          lmstudio = function()
            local adapters = require 'codecompanion.adapters'
            return adapters.extend('openai_compatible', {
              env = {
                url = 'http://127.0.0.1:1234',
                api_key = 'lm-studio',
                chat_url = '/v1/chat/completions',
                models_endpoint = '/v1/models',
              },
              headers = { ['Authorization'] = 'Bearer ${api_key}' },

              -- this forces all requests CodeCompanion sends to LM Studio
              extra_body = {
                stream = false,
              },

              schema = {
                -- model = { default = 'openai/gpt-oss-20b' },
                model = { default = 'qwen3-coder-30b-a3b-instruct' },
                temperature = { default = 0.2 },
                max_tokens = { default = 1024 },
              },
            })
          end,
        },

        strategies = {
          -- if you want to keep Copilot for chat/inline, leave these as 'copilot'
          chat = { adapter = 'lmstudio' },
          inline = { adapter = 'lmstudio' },
          agent = { adapter = 'lmstudio' }, -- needs tool-calling support (see note below)
        },
      }
    end,
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

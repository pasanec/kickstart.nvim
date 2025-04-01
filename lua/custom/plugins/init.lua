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
    ft = 'php',
    config = function()
      local phpsniff = require 'phpcs'
      phpsniff.setup {
        phpcs = '~/.config/composer/vendor/bin/phpcs',
        phpcbf = '~/.config/composer/vendor/bin/phpcbf',
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
}

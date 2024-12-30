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
}

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
    config = function()
      require('phpcs').setup {
        phpcs = '~/.config/composer/vendor/bin/phpcs',
        phpcbf = '~/.config/composer/vendor/bin/phpcbf',
        standard = 'moodle-extra',
      }
    end,
  },
}

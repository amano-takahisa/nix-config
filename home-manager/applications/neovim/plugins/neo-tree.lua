-- if true then return {} end
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { silent = true, noremap = true })

require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    },
  },
})

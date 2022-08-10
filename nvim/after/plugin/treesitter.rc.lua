require('nvim-treesitter.configs').setup {
  highlight = {
	enable = true,              
  },
}
require("nvim-treesitter.highlight")
vim.treesitter.highlighter.hl_map.error = nil

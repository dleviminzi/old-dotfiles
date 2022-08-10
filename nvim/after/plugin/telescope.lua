local Remap = require("minzi.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

require("telescope").setup {
    extensions = {
        file_browser = {
        },
    },
}
require("telescope").load_extension "file_browser"
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
}

nnoremap('ff', function() require('telescope.builtin').find_files() end)
nnoremap('fg', function() require('telescope.builtin').live_grep() end)
nnoremap('fb', function() require("telescope").extensions.file_browser.file_browser() end)
nnoremap('ft', function() require('telescope.builtin').buffers() end)
nnoremap('fh', function() require('telescope.builtin').help_tags() end)

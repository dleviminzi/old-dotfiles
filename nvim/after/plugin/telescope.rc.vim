:lua <<EOF
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
EOF

" Find files using Telescope command-line sugar.
nnoremap ff <cmd> lua require('telescope.builtin').find_files() <cr>
nnoremap fg <cmd> lua require('telescope.builtin').live_grep() <cr>
nnoremap fb <cmd> lua require("telescope").extensions.file_browser.file_browser() <cr>
nnoremap ft <cmd> lua require('telescope.builtin').buffers() <cr>
nnoremap fh <cmd> lua require('telescope.builtin').help_tags() <cr>

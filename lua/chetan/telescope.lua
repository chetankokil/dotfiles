local actions = require("telescope.actions")
require('telescope').setup{
   defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    winblend = 0,
    layout_defaults = {
      horizontal = {
        width_padding = 0.1,
        height_padding = 0.1,
        preview_width = 0.6,
        -- mirror = false,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
        -- mirror = true,
      }
    },
   file_ignore_patterns = { "target", "node_modules", "parser.c", "out", "%.min.js" },
   prompt_prefix = "❯",
   file_previewer = require("telescope.previewers").vim_buffer_cat.new,
   grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
   mappings = {
     n = {
       ["f"] = actions.send_to_qflist,
     },
   },
   },
}


require("telescope").load_extension("fzy_native")
require('telescope').load_extension "file_browser"
require("telescope").load_extension("dir")

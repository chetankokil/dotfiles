local present, nvim_tree = pcall(require, "nvim-tree")

if not present then
  return
end


vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvim_tree.setup {
  view = {
    width = 45,
    side = "left", hide_root_folder = true,
  },
  open_on_setup=true,
  disable_netrw = true,
  hijack_cursor = true,
  update_cwd = false,
  respect_buf_cwd=true,
  hijack_directories = {
    auto_open = true,
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
           arrow_closed = "",
          arrow_open = "",
        },
      },
    },
    highlight_opened_files="name",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
}

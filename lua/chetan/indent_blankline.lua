local setup = function()
  require("indent_blankline").setup({
    char = "|",
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    show_end_of_line = true,
    filetype_exclude = { "help" },
  })
end

return {
  setup = setup,
}

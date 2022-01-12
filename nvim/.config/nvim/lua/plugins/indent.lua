require'utils'.apply_options({
  list = true;
  listchars = {
    eol = "↴",
  }
})

require'indent_blankline'.setup {
    char = "|",
    buftype_exclude = {"terminal"},
--    show_end_of_line = true,
    show_current_context = true,
}

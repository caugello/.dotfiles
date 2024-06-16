require'utils'.apply_options({
  list = true;
  listchars = {
    eol = "↴",
  }
})

vim.g.indent_blankline_fileTypeExclude = {"golang"}

local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
--require'ibl'.setup {
    ----char = "|",
    ----buftype_exclude = {"terminal"},
------    show_end_of_line = true,
    ----show_current_context = true,
--}

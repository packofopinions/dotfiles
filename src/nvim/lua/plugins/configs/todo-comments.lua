--- TodoComments -----------------------

require("todo-comments").setup {
keywords = {
    FIX = { icon = "x", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
    TODO = { icon = "x", color = "hint" },
    HACK = { icon = "x", color = "warning" },
    WARN = { icon = "x", color = "warning", alt = { "XXX" } },
    PERF = { icon = "x", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "x", color = "info", alt = { "INFO" } },
    TEST = { icon = "x", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
}

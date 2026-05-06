require('lint').linters_by_ft = {
    python = {
        'flake8',
        'mypy',
    },
}

require('lint').linters.flake8.args = {
    '--ignore=E501',  -- W504
    '--format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s',
    '--no-show-source',
    '--stdin-display-name',
    function() return vim.api.nvim_buf_get_name(0) end,
    '-',
}

require("lint").linters.mypy.args = {
    "--show-column-numbers",
    "--show-error-end",
    "--hide-error-context",
    "--no-color-output",
    "--no-error-summary",
    "--no-pretty"
}

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
    --require("lint").try_lint("cspell")  -- run special linter
  end,
})

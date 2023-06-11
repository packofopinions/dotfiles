--- ALE --------------------------------

vim.g.ale_linters_explicit = 1
vim.g.ale_linters = {
    python = {'flake8', 'mypy'},
    yaml = {'yamllint'},
    xml = {'xmllint'},
    go = {'govet'},
    --sql = ['sqlint'],
    --php = ['php', 'phpmd', 'phpstan'],
}
-- Python
vim.g.ale_python_flake8_options = '--ignore=E501'
vim.g.ale_python_mypy_options = '--check-untyped-defs --ignore-missing-imports'
-- Yaml
vim.g.ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'

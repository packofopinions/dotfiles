vim.diagnostic.config({
    virtual_text = true,       -- avoid inline text redraws
    signs = true,              -- avoid signcolumn churn
    underline = false,           -- cheap visual hint
    update_in_insert = false,   -- don't recompute while typing
    severity_sort = true,
    float = { border = "rounded", focusable = false, source = "if_many" },
})


-- ################################
-- ## LSP config
-- ################################
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()


-- GO ------------------
vim.lsp.config("gopls", {
    cmd = { "gopls" }, -- Убедитесь, что `gopls` доступен в PATH
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})
vim.lsp.enable("gopls")

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.go' },
  callback = function(args)
    vim.lsp.buf.format({
      bufnr = args.buf,
      async = false, -- Synchronous formatting can prevent race conditions on save
    })
  end,
})


-- Python ------------------
vim.lsp.config.pylsp = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
          --vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    end,
    settings = {
        pylsp = {
            plugins = {
                flake8 = {
                  enabled = false,
                  ignore = { "E501", "W504" },
                },
                pylsp_mypy = {
                    enabled = false,
                    live_mode = false,
                    dmypy = false,
                    report_progress = true,
                    -- plugins = { 'pydantic.mypy' },
                },
                pycodestyle = { enabled = false },
                pyflakes    = { enabled = false },
                mccabe      = { enabled = false },
                ruff        = { enabled = false },  -- if you installed python-lsp-ruff and want Ruff instead
                black       = { enabled = false },  -- or enable for formatting
                mypy        = { enabled = false },  -- with pylsp-mypy
            },
        },
    },
}
vim.lsp.enable('pylsp')


-- ################################
-- ## CMP
-- ################################
local cmp = require('cmp')
cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    completion = {
        --completeopt = 'menu,menuone,noinsert',
        autocomplete = false, -- Отключить автоматическое появление
    },
    mapping = {
        ['<C-SPACE>'] = cmp.mapping.complete(), -- Вызов меню автокомплита
        ['<C-n>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {'i'}),
        ['<C-p>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {'i'}),

        ['<C-e>'] = cmp.mapping.abort(), -- Закрыть меню
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Подтвердить выбор
    },
    sources = cmp.config.sources({
        {
            name = 'nvim_lsp',  -- Источник из LSP
        },
    }),
})

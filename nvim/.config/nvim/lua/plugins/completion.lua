local cmp = require('cmp')
local lspkind = require('lspkind')
lspkind.init()

cmp.setup {
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ 
      behavior = cmp.SelectBehavior.Select
    }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({
      behavior = cmp.SelectBehavior.Select
    }), {'i'}),
    ["<Tab>"] = cmp.mapping(function(fallback)
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "") 
    end, { "i", "s" }),
  },
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'cmp_tabnine'},
    { name = 'nvim_lua'},
    { name = 'ultisnips' },
    { name = 'buffer', keyword_length=5},
    { name = 'path'},
  },
  formatting = {
    format = lspkind.cmp_format({with_text = true, menu = ({
        buffer = "[Buf]",
        nvim_lsp = "[LSP]",
        cmp_tabnine = "[TN]",
        path = "[Path]",
        nvim_lua = "[Lua]",
      })
    }),
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
}

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  max_lines = 1000;
  max_num_results = 20;
  sort = true;
  run_on_every_keystroke = true;
  snippet_placeholder = '..';
})

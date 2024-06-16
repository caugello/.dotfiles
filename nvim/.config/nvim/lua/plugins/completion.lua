local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local compare = require('cmp.config.compare')

local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
}

require("luasnip.loaders.from_vscode").lazy_load()

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
    ['<PageDown>'] = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<PageUp>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    --["<Tab>"] = cmp.mapping(function(fallback)
  --vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "")
    --end, { "i", "s" }),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua'},
    { name = 'buffer', keyword_length=5},
    { name = 'path'},
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
      vim_item.menu = source_mapping[entry.source.name]
      if entry.source.name == "cmp_tabnine" then
        local detail = (entry.completion_item.data or {}).detail
        vim_item.kind = ""
        if detail and detail:find('.*%%.*') then
          vim_item.kind = vim_item.kind .. ' ' .. detail
        end

        if (entry.completion_item.data or {}).multiline then
          vim_item.kind = vim_item.kind .. ' ' .. '[ML]'
        end
      end
      local maxwidth = 80
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
      return vim_item
    end,
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
}


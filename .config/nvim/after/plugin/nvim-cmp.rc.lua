local ok, cmp = pcall(require, 'cmp')
if (not ok) then return end

local ok, luasnip = pcall(require, 'luasnip')
if (not ok) then return end

local ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if ok then
  -- Autopairs when confirm
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup({})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = function(entry, vim_item)
      local source = entry.source.name
      vim_item.menu = '(' .. source .. ')'
      return vim_item
    end
  },
  experimental = {
    ghost_text = true, -- Show ghost_text. See `:help experimental.ghost_text`
                       -- Note: This feature conflict with copilot.vim's preview.
                       -- See `:help cmp-faq`
  },
  mapping = cmp.mapping.preset.insert {
    -- Behavior select to only select the text, potentially adds ghost_text at cursor.
    -- See `:help cmp.select_next_item`
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
})

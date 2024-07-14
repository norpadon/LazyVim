return {
  opts = function(_, opts)
    local cmp = require("cmp")
    opts.mapping = {
      ["<S-Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ["<S-Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ["<S-Space>"] = cmp.mapping.confirm({ select = true }),
      ["<C-Space>"] = cmp.mapping.complete({}),
    }
    table.experimental = {}
  end,
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
  },
  ---@param opts cmp.ConfigSchema
  config = function(_, opts)
    local cmp = require("cmp")
    local mapping = {
      ["<S-Down>"] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
      ["<S-Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { "i", "c" }),
      ["<S-Space>"] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete({}), { "i", "c" }),
    }
    opts.mapping = mapping
    opts.experimental = {}
    cmp.setup(opts)
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = mapping,
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      mapping = mapping,
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
  end,
}

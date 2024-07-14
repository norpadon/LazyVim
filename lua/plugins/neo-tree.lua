return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    enable_git_status = true,
    filesystem = {
      filtered_items = {
        visible = true,
        hide_gitignored = false,
      },
      bind_to_cwd = true,
    },
    window = {
      mappings = {
        ["<CR>"] = "open",
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state)
            require("lazy.util").open(state.tree:get_node().path, { system = true })
          end,
          desc = "Open with System Application",
        },
        ["P"] = { "toggle_preview", config = { use_float = false } },
      },
    },
  },
}

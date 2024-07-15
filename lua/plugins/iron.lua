return {
  "Vigemus/iron.nvim",
  dependencies = "mrcjkb/haskell-tools.nvim",
  main = "iron.core",
  opts = function(_, opts)
    opts.config = {
      -- Whether a repl should be discarded or not
      scratch_repl = true,
      -- Your repl definitions come here
      should_map_plug = false,
      repl_definition = {
        sh = {
          -- Can be a table or a function that
          -- returns a table (see below)
          command = { "zsh" },
        },
        python = {
          command = { "python" }, -- or { "ipython", "--no-autoindent" }
          format = require("iron.fts.common").bracketed_paste_python,
        },
        haskell = {
          command = function(meta)
            local file = vim.api.nvim_buf_get_name(meta.current_bufnr)
            -- call `require` in case iron is set up before haskell-tools
            return require("haskell-tools").repl.mk_repl_cmd(file)
          end,
        },
      },
      -- How the repl window will be displayed
      -- See below for more information
      repl_open_cmd = require("iron.view").split("30%"),
    }
    -- Iron doesn't set keymaps by default anymore.
    -- You can set them here or manually add keymaps to the functions in iron.core
    opts.keymaps = {}
    -- If the highlight is on, you can change how it looks
    -- For the available options, check nvim_set_hl
    opts.highlight = {
      italic = true,
    }
    opts.ignore_blank_lines = true -- ignore blank lines when sending visual select lines,
  end,
  keys = {
    { "<space>rs", "<cmd>IronRepl<cr><cmd>IronFocus<cr>", desc = "Open REPL" },
    { "<space>rr", "<cmd>IronRestart<cr>", desc = "Restart REPL" },
  },
}

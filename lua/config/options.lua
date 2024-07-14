-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if vim.g.neovide then
  vim.opt.guifont = "MartianMono Nerd Font:h12"
end

vim.g.have_nerd_font = true

vim.filetype.add({
  extension = {
    ncl = "nickel",
    bb = "clojure",
  },
})

vim.opt.spelllang = { "en_us" }
vim.opt.spell = true

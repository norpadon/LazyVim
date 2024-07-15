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

local opt = vim.opt

opt.spelllang = { "en_us" }
opt.spell = true

opt.relativenumber = false

opt.mousescroll = "ver:1,hor:0"

-- Enter Terminal mode when focused on a terminal Window
local termGroup = vim.api.nvim_create_augroup("TermGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.cmd("startinsert")
  end,
  pattern = { "term://*" },
  group = termGroup,
})

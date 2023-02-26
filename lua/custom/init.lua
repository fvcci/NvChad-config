local opt = vim.opt
local g = vim.g

g.luasnippets_path = "your snippets path"

-- Show line number and relative line number
opt.number = true
opt.relativenumber = true

-- Minimum lines to keep above and below cursor when scrolling
opt.scrolloff = 3

opt.nocompatible = true   -- disable compatibility to old-time vi

-- Auto-write the file based on some condition
opt.autowrite = true

opt.cc=95                 -- set an 80 column border for good coding style
opt.cursorline = true     -- highlight current cursorline
opt.ttyfast = true        -- Speed up scrolling in Vim
opt.syntax = true         -- syntax highlighting

---------------------------------- plugins ----------------------------------

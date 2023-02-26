local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "javascript",
    "python",
    "c",
    "cpp",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    "ltex-ls",
    "clangd",
    "clangd-format",
    "pylsp",
    "json-lsp",
    "cmake-language-server",
    "bash-language-server",
    "lua-language-server",
    "vim-language-server",
    "docerfile-language-server",
    "yaml-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M

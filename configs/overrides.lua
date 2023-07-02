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
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
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

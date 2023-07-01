local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  -- enable dashboard
  { "goolord/alpha-nvim",
    disable = false,
  },

  -- Override plugin definition options
  { "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  { "williamboman/mason.nvim",
    opts = overrides.mason
  },

  { "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  { "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  { "kevinhwang91/nvim-hlslens",
    branch = "main",
    config = function()
      require("custom.plugins.configs.hlslens")
    end,
  },

  { "907th/vim-auto-save",
    event = "InsertEnter"
  },
}

return plugins

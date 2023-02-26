local M = {}
local api = vim.api

local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = api.nvim_create_augroup("restore_after_yank", { clear = true }),
  callback = function()
    vim.cmd([[
      silent! normal! `y
      silent! delmarks y
    ]])
  end,
})


M.general = {
  i = {
    ["jk"] = { "<ESC>", "Change Keybinding" },
    -- Enable smart indenting
    ["{<Enter>"] = { "{<Enter>}<Esc>O" },
  },

  n = {
    ["<leader>ev"] = { "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>",
      opts = {
        silent = true,
        desc = "open init.lua",
      }
    },

    ["<C-n>"] = { "<C-W>S" },

    -- switch between windows
    ["<A-h>"] = { "<C-w>h", "window left" },
    ["<A-l>"] = { "<C-w>l", "window right" },
    ["<A-j>"] = { "<C-w>j", "window down" },
    ["<A-k>"] = { "<C-w>k", "window up" },

    -- move split panes to left/bottom/top/right
    ["<C-A-h>"] = { "<C-W>H", "move split pane to left" },
    ["<C-A-k>"] = { "<C-W>K", "move split pane to bottom" },
    ["<C-A-j>"] = { "<C-W>J", "move split pane to top" },
    ["<C-A-l>"] = { "<C-W>L", "move split pane to right" },

    -- Pane resizing
    ["<A-->"] = { ":resize -5<CR>" },
    ["<A-=>"] = { ":resize +5<CR>" },
    ["<A-_>"] = { ":vertical resize -5<CR>" },
    ["<A-+>"] = { ":vertical resize +5<CR>" },

    ["^"] = { "g^" },
    ["_"] = { "g_" },
    ["H"] = { "g^" },
    ["L"] = { "g_" },
    ["0"] = { "g0" },

    -- quality of life improvements
    ["<leader>p"] = { "m`o<ESC>p``", opts = { desc = "paste below current line" } },
    ["<leader>P"] = { "m`O<ESC>p``", opts = { desc = "paste above current line" } },
    ["<space>o"] = { "printf('m`%so<ESC>``', v:count1)",
      opts = {
        expr = true,
        desc = "insert line below",
      }
    },
    ["<space>O"] = { "printf('m`%sO<ESC>``', v:count1)",
      opts = {
        expr = true,
        desc = "insert line above",
      }
    },
    ["y"] = { "myy" },

    ["J"] = {
      function()
        vim.cmd([[
            normal! mzJ`z
            delmarks z
          ]])
      end, {
        desc = "join line",
      }
    },

    ["gJ"] = {
      function()
        -- we must use `normal!`, otherwise it will trigger recursive mapping
        vim.cmd([[
            normal! zmgJ`z
            delmarks z
          ]])
      end, {
        desc = "join visual lines",
      }
    },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["/"] = { [[/\v]] },

    -- Change text without putting it into the vim register,
    ["c"] = { '"_c' },
    ["C"] = { '"_C' },
    ["cc"] = { '"_cc' },

    -- -- Remove trailing whitespace characters
    -- ["<leader><space>"] = { "<cmd>StripTrailingWhitespace<cr>",
    --   opts = { desc = "remove trailing space" }
    -- },
    --
    -- -- check the syntax group of current cursor position
    -- ["<leader>st"] = { "<cmd>call utils#SynGroup()<cr>",
    --   opts = { desc = "check syntax group" }
    -- },

    -- ["<leader>cl"] = { "<cmd>call utils#ToggleCursorCol()<cr>", opts = { desc = "toggle cursor column" } },

    -- -- Move current line up and down
    -- ["<A-K>"] = { '<cmd>call utils#SwitchLine(line("."), "up")<cr>',
    --   opts = { desc = "move line up" }
    -- },
    -- ["<A-J>"] = { '<cmd>call utils#SwitchLine(line("."), "down")<cr>',
    --   opts = { desc = "move line down" }
    -- },
  },

  x = {
    ["<"] = { "<gv" },
    [">"] = { ">gv" },
    ["^"] = { "g^" },
    ["_"] = { "g_" },
    ["$"] = { "g_" },
    ["H"] = { "g^" },
    ["L"] = { "g_" },
    ["c"] = { '"_c' },

    -- -- Move current visual-line selection up and down
    -- ["<A-K>"] = { '<cmd>call utils#MoveSelection("up")<cr>',
    --   opts = { desc = "move selection up" }
    -- },
    -- ["<A-J>"] = { '<cmd>call utils#MoveSelection("down")<cr>',
    --   opts = { desc = "move selection down" }
    -- },
    --
    -- Replace visual selection with text in register, but not contaminate the register,
    -- see also https://stackoverflow.com/q/10723700/6064933.
    ["p"] = { '"_c<Esc>p' },
  },

  t = { ["jk"] = { termcodes "<C-\\><C-N>", "escape terminal mode" } },
}

M.nvterm = {
  t = {
    ["<A-h>"] = { "<C-w>h", "window left" },

    -- toggle in terminal mode
    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
  },

  n = {
    ["<A-h>"] = { "<C-w>h", "window left" },

    -- toggle in normal mode
    ["<A-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },

    -- new
    ["<leader>h"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },

    ["<leader>v"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-f>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  },
}

return M

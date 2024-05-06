-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

local hop = require "hop"
local hint = require "hop.hint"
local directions = hint.HintDirection

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    --
    -- place this in one of your configuration file(s)
    -- place this in one of your configuration file(s)
    -- TODO add hop keybindings
    ["<leader>e"] = {
      function()
        hop.hint_camel_case {
          direction = hint.HintDirection.AFTER_CURSOR,
          hint_position = hint.HintPosition.END,
        }
      end,
    },
    ["<leader>ge"] = {
      function()
        hop.hint_camel_case {
          direction = hint.HintDirection.BEFORE_CURSOR,
          hint_position = hint.HintPosition.END,
        }
      end,
    },
    ["<leader>w"] = {
      function()
        hop.hint_camel_case {
          direction = hint.HintDirection.AFTER_CURSOR,
          hint_position = hint.HintPosition.BEGIN,
        }
      end,
    },
    ["<leader>b"] = {
      function()
        hop.hint_camel_case {
          direction = hint.HintDirection.BEFORE_CURSOR,
          hint_position = hint.HintPosition.BEGIN,
        }
      end,
    },
    ["<leader>k"] = {
      function() hop.hint_vertical { direction = hint.HintDirection.BEFORE_CURSOR } end,
    },
    ["<leader>j"] = {
      function() hop.hint_vertical { direction = hint.HintDirection.AFTER_CURSOR } end,
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}

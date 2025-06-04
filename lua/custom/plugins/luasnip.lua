
return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load() -- optional

    -- Load custom Python snippets
    local python_snips = require("custom.snippets.python")
    ls.snippets = ls.snippets or {}
    ls.snippets.python = ls.snippets.python or {}

    vim.list_extend(ls.snippets.python, python_snips)

    -- LuaSnip settings
    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })

    -- Keymaps
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then ls.expand_or_jump() end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then ls.jump(-1) end
    end, { silent = true })
  end,
}

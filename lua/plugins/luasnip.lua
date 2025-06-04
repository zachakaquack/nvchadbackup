-- lua/plugins/luasnip.lua
return {
  "L3MON4D3/LuaSnip",
  config = function()
    local ls = require("luasnip")

    -- Load friendly-snippets (optional)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Load your custom snippets
    ls.snippets = ls.snippets or {}
    local custom_python_snips = require("custom.snippets.python")
    require("luasnip").snippets.python = require("luasnip").snippets.python or {}
    -- merge or overwrite only your custom snippets
    for _, snippet in ipairs(custom_python_snips) do
      table.insert(require("luasnip").snippets.python, snippet)
    end
    _G.my_custom_snips = custom_python_snips
    -- print("loading custom snippets")
    -- print(vim.inspect(_G.my_custom_snips))

    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })


    -- Keymaps for snippet expand and jump

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if require("luasnip").expand_or_jumpable() then
        require("luasnip").expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      end
    end, { silent = true })
  end,
}

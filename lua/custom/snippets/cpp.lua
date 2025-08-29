local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = require("luasnip").insert_node

return {
  s("scout", {
    desc = "std::cout snippet",
    t { "std::cout << " },
    i(1),
    t { " << '\\n';" },
  }),
  s("scin", {
    desc = "std::scin snippet",
    t { "std::cin >> " },
    i(1),
    t { ";" },
  }),
  s("sline", {
    desc = "std::scin snippet",
    t { "std::getline(std::cin >> std::ws, " },
    i(1),
    t { ");" },
  }),
  s("cppmain", {
    t {
      "#include <iostream>",
      "",
      "int main(){",
      "",
      "  ",
    },
    i(1),
    t {
      "",
      "",
      "  return 0;",
      "}",
    },
  }),
}

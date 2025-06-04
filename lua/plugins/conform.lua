return {
  "stevearc/conform.nvim",
  opts = {
    require("conform").setup {
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        json = { "jq" },
        python = { "black" },
        markdown = { "mdformat" },
        ["*"] = { "trim_whitespace", "trim_newlines" },
      },
    },
  },
}

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        include = {
          "**/.env",
          "**/.env.*",
          ".env",
          ".env.*",
        },
        exclude = {},
      },
    },
  },
}

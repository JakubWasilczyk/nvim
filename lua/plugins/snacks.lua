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

          "**/.cargo",
          "**/.cargo/*",
          "**/config.toml",
        },
        exclude = {},
      },
    },
  },
}

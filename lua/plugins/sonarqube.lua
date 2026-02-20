return {
  {
    "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    dependencies = {
      "mason-org/mason.nvim",
    },
    config = function()
      local sonarlint = require("sonarlint")

      -- Helper to find the analyzer jars installed by Mason
      local mason_path = vim.fn.stdpath("data") .. "/mason/share/sonarlint-analyzers"

      sonarlint.setup({
        server = {
          cmd = {
            "sonarlint-language-server",
            "-stdio",
            "-analyzers",
            -- Add the analyzers you need.
            -- You can verify these paths in ~/.local/share/nvim/mason/share/sonarlint-analyzers/
            mason_path .. "/sonarjs.jar",
          },
        },
        filetypes = {
          "typescript",
          "typescriptreact",
          "javascript",
          "javascriptreact",
        },
        autocmds = {
          "BufWritePost", -- Trigger only on save
          "BufEnter", -- Trigger when entering the buffer
        },
      })
    end,
  },

  -- Optional: Ensure the server is installed automatically
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "sonarlint-language-server")
    end,
  },
}

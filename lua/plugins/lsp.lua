local ensure_installed = {
  "lua_ls",
  "dockerls",
  "tsserver",
  "yamlls",
  "tailwindcss",
  "prismals",
  "spectral",
  "markdown_oxide",
  "html",
  "emmet_language_server",
  "docker_compose_language_service",
  "cssls",
  "sqlls",
  "terraformls",
  "jsonls",
  "basedpyright",
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      for _, v in pairs(ensure_installed) do
        lspconfig[v].setup({})
      end

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

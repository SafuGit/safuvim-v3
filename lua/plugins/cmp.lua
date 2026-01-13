return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer", -- buffer completion,
    "hrsh7th/cmp-path", -- filesystem paths,
    { "hrsh7th/cmp-nvim-lsp", event = { "BufReadPre", "BufNewFile" } },  -- lsp completions
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua", -- neovim lua api completions
    "petertriho/cmp-git", -- git completions
    "SergioRibera/cmp-dotenv", -- .env file completions
  },
  config = function()
    local cmp = require("cmp")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    cmp.setup({
      sources = cmp.config.sources({
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "nvim_lua" },
        { name = "git" },
        { name = "dotenv" },
      })
    })
  end
}

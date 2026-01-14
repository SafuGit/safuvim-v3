return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",                                               -- buffer completion,
    "hrsh7th/cmp-path",                                                 -- filesystem paths,
    { "hrsh7th/cmp-nvim-lsp", event = { "BufReadPre", "BufNewFile" } }, -- lsp completions
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",                                             -- neovim lua api completions
    "petertriho/cmp-git",                                               -- git completions
    "SergioRibera/cmp-dotenv",                                          -- .env file completions
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
      }),
      formatting = {
        format = function(entry, vim_item)
          local highlights_info = require("colorful-menu").cmp_highlights(entry)

          -- highlight_info is nil means we are missing the ts parser, it's
          -- better to fallback to use default `vim_item.abbr`. What this plugin
          -- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
          if highlights_info ~= nil then
            vim_item.abbr_hl_group = highlights_info.highlights
            vim_item.abbr = highlights_info.text
          end

          return vim_item
        end,
      },
    })

    cmp.event:on("menu_opened", function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
      vim.b.copilot_suggestion_hidden = false
    end)
  end
}

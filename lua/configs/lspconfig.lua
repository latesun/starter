local capabilities = require("nvchad.configs.lspconfig").capabilities
local map = vim.keymap.set

local function telescope(func)
  return function()
    require("telescope.builtin")[func]()
  end
end

local on_attach = function(client, _)
  map("n", "gd", telescope "lsp_definitions")
  map("n", "gr", telescope "lsp_references")
  map("n", "gi", telescope "lsp_implementations")
  map("n", "go", telescope "diagnostics")
  map("n", "<leader>ss", telescope "spell_suggest")
  map("n", "<leader>hl", telescope "highlights")

  map("n", "K", "<cmd> Lspsaga hover_doc <CR>")
  map({ "n", "v" }, "<leader>ca", "<cmd> Lspsaga code_action <CR>")
  map("n", "<leader>rn", "<cmd> Lspsaga rename <CR>")
end

local servers = {
  bufls = {},
  clangd = {},
  golangci_lint_ls = {},
  gopls = require "configs.lsp.gopls",
  lua_ls = require "configs.lsp.lua_ls",
  jsonls = {},
  pyright = {},
  ruff_lsp = {},
  rust_analyzer = require "configs.lsp.rust_analyzer",
  yamlls = {},
}

for name, settings in pairs(servers) do
  if name == "clangd" then
    capabilities.offsetEncoding = { "utf-16" }
  end

  require("lspconfig")[name].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = settings,
    filetypes = name == "clangd" and { "c", "cpp" } or nil,
  }
end

return {
  lsp = {
    servers = { "gopls" },
  },
  dap = {
    ensure_installed = { "delve" },
  },
  treesitter = {
    ensure_installed = { "go" },
  },
}
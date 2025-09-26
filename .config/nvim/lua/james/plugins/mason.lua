return {
  "mason-org/mason.nvim",
  enabled = true,
  opts = {
    ensure_installed = {
      "lua-language-server",
      "pyright", 
      "rust-analyzer",
      "gopls",
    },
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
}

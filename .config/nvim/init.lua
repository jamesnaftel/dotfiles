if vim.g.vscode then
  print("Running in VSCode")
  require("james.core")
  return
end

require("james.core")
require('james.lazy')
require("james.plugins")
require('james.lsp')

vim.lsp.enable("lua_ls", true)
vim.lsp.enable("pyright", true)


require('james.plugins.copilot')

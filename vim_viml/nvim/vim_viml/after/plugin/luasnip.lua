local ls = require("luasnip")

ls.config.set_config {
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	-- ext_opts = {
	-- 	[types.choiceNode] = {
	-- 		active = {
	-- 			virt_text = { { "choiceNode", "Comment" } },
	-- 		},
	-- 	},
	-- },
	-- -- treesitter-hl has 100, use something higher (default is 200).
	-- ext_base_prio = 300,
	-- -- minimal increase in priority.
	-- ext_prio_increase = 1,
	-- enable_autosnippets = true,
}


require("luasnip/loaders/from_vscode").load({ include = { "python" } }) -- Load only python snippets
require("luasnip/loaders/from_vscode").load({ include = { "go" } }) -- Load only go snippets

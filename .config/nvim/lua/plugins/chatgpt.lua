return {
    enabled = true,
    "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup({
                openai_params = {
                    model = "gpt-3.5-turbo",
                    max_tokens = 10000,
                }
            })
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "folke/trouble.nvim",
          "nvim-telescope/telescope.nvim"
        }
}

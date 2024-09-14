return {
    enabled = true,
    "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup({
                openai_params = {
                    model = "gpt-4o",
                    max_tokens = 4096,
                },
                edit_with_instructions = {
                    keymaps = {
                      use_output_as_input = "<C-p>",
                    },
                }
            })
          vim.keymap.set({'n', 'v'}, '<leader>ce', "<cmd>ChatGPTEditWithInstructions<CR>", { desc = '[C]hatGPT[E]ditWithInstuctions' })
          vim.keymap.set({'n', 'v'}, '<leader>cc', "<cmd>ChatGPT<CR>", { desc = '[C]hatGPT[C]' })
        end,
        dependencies = {
          "MunifTanjim/nui.nvim",
          "nvim-lua/plenary.nvim",
          "folke/trouble.nvim",
          "nvim-telescope/telescope.nvim"
        }
}

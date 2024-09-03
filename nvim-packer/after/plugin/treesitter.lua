require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "lua",
        "rust",
        "go",
        "python",
        "bash",
        "cmake",
        "comment",
        "cpp",
        "css",
        "dockerfile",
        "gitignore",
        "graphql",
        "haskell",
        "elixir",
        "html",
        "java",
        "javascript",
        "json",
        "markdown",
        "ocaml",
        "sql",
        "toml",
        "yaml",
        "vim",
        "zig"
    },
    sync_install = false,

    ignore_install = {"phpdoc"},

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

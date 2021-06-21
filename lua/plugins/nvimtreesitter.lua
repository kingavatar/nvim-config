local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
        "javascript",
        "html",
        "css",
        "bash",
        "lua",
        "json",
        "python",
        "c",
        "cpp",
        "dockerfile",
        "dart",
        "rust",
        "go",
        "gomod",
        "java",
        "latex",
        "bibtex",
        "ruby",
        "scss",
        "toml",
        "typescript",
        "vue",
        "yaml"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}

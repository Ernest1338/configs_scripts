local ls = require("luasnip")

ls.add_snippets(
    "all", {
        -- Available in any filetype
        --ls.parser.parse_snippet("hw", "hello world"),
    }
)

ls.add_snippets(
    "rust", {
        -- Rust specific snippets
    }
)


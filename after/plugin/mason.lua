
return require('mason').setup( {
opts = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    -- ensure_installed = { "lua-language-server",
    --                  "clang-format",
    --                  "clangd",
    --                  "cmake-language-server",
    --                  "cpplint",
    --                  "cpptools",
    --                  "cpplint",
    --                  "gitlint",
    --                  "json-lsp",
    --                  "html-lsp",
    --                  "pyright",
    --                  "texlab",
    --                   "pylint",
    --              },
    }
})


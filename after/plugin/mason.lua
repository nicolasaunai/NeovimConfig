
local ok, mason = pcall(require, "mason-lspconfig")
if not  ok then
    print("Mason LSP config not found")
    return
end
mason.setup {
    ensure_installed = { "lua-language-server",
                         "clang-format",
                         "clangd",
                         "cmake-language-server",
                         "cpplint",
                         "cpptools",
                         "cpplint",
                         "gitlint",
                         "json-lsp",
                         "html-lsp",
                         -- "pylint", -- seems not to work :/
                         "pyright",
                         "texlab",
                     },
}

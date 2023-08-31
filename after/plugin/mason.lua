
local ok, mason = pcall(require, "mason-tool-installer")
if not  ok then
    print("mason-tool-installer not found")
    return
end
mason.setup({
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
                         "pyright",
                         "texlab",
                          "pylint",
                     },
})

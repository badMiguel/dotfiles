local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep -- repeat input

local function get_root_dir()
    local lsp_clients = vim.lsp.get_active_clients({ bufnr = 0 })

    if #lsp_clients > 0 then
        local root_path = lsp_clients[1].config.root_dir
        return vim.fn.fnamemodify(root_path, ":t")
    end

    -- when lsp not yet loaded
    local root = vim.fn.finddir(".git", ".;")
    if root == "" then
        root = vim.fn.findfile("*.sln", ".;")
    end

    if root ~= "" then
        local root_path = vim.fn.fnamemodify(root, ":p:h:h")
        return vim.fn.fnamemodify(root_path, ":t")
    end

    return "Namespace"
end

local function get_file_name()
    return vim.fn.expand("%:t:r")
end

return {
    s("controller", {
        t({
            "using System.Text.Encodings.Web;",
            "using Microsoft.AspNetCore.Mvc;",
            "",
        }),
        t({ "", "", "" }),
        f(function()
            return string.format("namespace %s.Controller;", get_root_dir())
        end),
        t({ "", "", "" }),
        f(function()
            return string.format("public class %s : Controller", get_file_name())
        end),
        t({ "", "{", "", }),
        t("    public IActionResult "), i(1, "Index"), t("()"),
        t({
            "",
            "    {",
            "        return View()",
            "    }",
            "}"
        }),
    }),

    s("models", {
        t({
            "using System.ComponentModel.DataAnnotations;",
            "",
            "",
        }),
        f(function()
            return string.format("namespace %s.Models;", get_root_dir())
        end),
        t({ "", "", "" }),
        f(function()
            return string.format("public class %s", get_file_name())
        end),
        t({
            "",
            "{",
            "",
            "}",
        })
    }),
}

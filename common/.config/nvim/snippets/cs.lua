local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node                  -- input
local rep = require("luasnip.extras").rep -- input repeat

return {
    s("controller", {
        t({
            "using Microsoft.AspNetCore.Mvc;",
            "using System.Text.Encodings.Web;",
            "",
        }),
        t({ "", "", "" }),
        -- todo get root dir name and file name
        t("namespace "), i(1, "ProjName"), t(".Controllers;"),
        t({ "", "", "" }),
        t("public class "), i(2, "FileName"), t(" : Controller"),
        t({ "", "{", "", }),
        t("    public string "), i(3, "Index"), t("()"),
        t({
            "",
            "    {",
            "        return \"Hello World!\";",
            "    }",
            "}"
        }),
    }),
}

local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local rep = require("luasnip.extras").rep -- repeat input

return {
    s("cshtmlviews", {
        t({ "@{", "" }),
        t("     ViewData[\""), i(1, "Title"), t("\"] = \""), i(2, "Index"), t("\";"),
        t({
            "",
            "}",
            "",
            "<h2>Heading</h2>",
            "",
            "<p>This is some text</p>"
        }),
    }),
}

local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local snippets = {}

local italic_snippet = s("FIT", {
    t("\\textit{"),
    i(1, "ITALIC TEXT HERE"),
    t("}"),
    i(0)
})

local bold_snippet = s("FBF", {
    t("\\textbf{"),
    i(1, "BOLD TEXT HERE"),
    t("}"),
    i(0)
})

table.insert(snippets, italic_snippet)
table.insert(snippets, bold_snippet)

return snippets

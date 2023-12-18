return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      segments = {
        { text = { builtin.foldfunc },                                                      click = "v:lua.ScFa" },
        { sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true }, click = "v:lua.ScSa" },
        { sign = { name = { "Diagnostic" }, maxwidth = 1, auto = true },                    click = "v:lua.ScSa" },
        { text = { builtin.lnumfunc },                                                      click = "v:lua.ScLa" },
        { text = { " " } },
        { sign = { namespace = { "gitsign" }, colwidth = 1, wrap = true },                  click = "v:lua.ScSa" },
        { text = { " " } },
      }
    })
  end,
}

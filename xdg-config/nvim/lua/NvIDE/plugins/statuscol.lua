return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      segments = {
        { sign = { namespace = { "gitsign", "diagnostic" }, colwidth = 1, wrap = true },    click = "v:lua.ScSa" },
        -- { sign = { namespace = { "diagnostic" }, maxwidth = 1 },                            click = "v:lua.ScSa" },
        { text = { builtin.foldfunc },                                                      click = "v:lua.ScFa" },
        { sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true }, click = "v:lua.ScSa" },
        { text = { " " } },
        { text = { builtin.lnumfunc },                                                      click = "v:lua.ScLa" },
        { text = { " " } },
      }
    })
  end,
}

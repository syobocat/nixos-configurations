local opt = vim.opt
opt.ambiwidth = "double"
opt.breakindent = true
opt.browsedir = "current"
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,preview,noinsert,noselect"
opt.confirm = true
opt.copyindent = true
opt.cursorline = true
opt.expandtab = true
opt.fileencodings = "ucs-bom,utf-8,sjis,euc-jp,default,latin1"
opt.helplang = "ja", "en"
opt.maxmempattern = 2000000
opt.mousefocus = true
opt.number = true
opt.shiftwidth = 4
opt.smartcase = true
opt.startofline = true
opt.tabstop = 4
opt.termguicolors = true

vim.cmd "colorscheme one"
vim.g.one_allow_italics = 1

vim.g.indentLine_setConceal = 0

vim.g.airline_powerline_fonts = 1

require"nvim-autopairs".setup()
require"nvim-treesitter.configs".setup {
    rainbow = {
        enable = true,
        query = "rainbow-parens",
        strategy = require 'ts-rainbow.strategy.global',
    },
    highlight = {
        enable = true,
    },
}

vim.diagnostic.config({
    update_in_insert = true,
})
require"mason".setup()
require"mason-lspconfig".setup()
require"mason-lspconfig".setup_handlers {
  function (server_name)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach
    }
  end,
}

capabilities = require("cmp_nvim_lsp").default_capabilities()

local cmp = require"cmp"
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
    })
})

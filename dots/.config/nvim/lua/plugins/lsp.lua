return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        qmlls = {
          cmd = { "qmlls6", "-E" },
          filetypes = { "qml" },
        },
      },
    },
  },
}

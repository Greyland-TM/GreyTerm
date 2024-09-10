return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  ---@diagnostic disable: missing-fields
  opts = {
    config = {
      basedpyright = {
        settings = {
          basedpyright = {
            disableLanguageServices = false,
            analysis = {
              autoImportCompletions = true,
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true,
              reportUnknownMemberType = false,
            },
          },
        },
      },
    },
  },
}


return {
  Lua = {
    diagnostics = {
      globals = { "vim", "use", "keymap" },
      disable = { "assign-type-mismatch" },
      unusedLocalExclude = { "client" },
    },
    telemetry = {
      enable = false,
    },
  },
}

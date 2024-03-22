return {
  ["rust-analyzer"] = {
    cargo = {
      features = true,
    },
    checkOnSave = {
      command = "clippy",
    },
    imports = {
      granularity = {
        group = "module",
      },
      prefix = "self",
    },
  },
}

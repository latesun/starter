local plugins = {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "../configs.dashboard"
    end,
    lazy = false,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "clang-format",
        "gofumpt",
        "goimports",
        "golangci-lint-langserver",
        "gopls",
        "isort",
        "json-lsp",
        "prettierd",
        "pyright",
        "ruff",
        "ruff-lsp",
        "rust-analyzer",
        "rustfmt",
        "stylua",
        "taplo",
        "yaml-language-server",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "../configs.lspconfig"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
    end,
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        prompt_prefix = "   ",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "json",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "toml",
        "yaml",
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "../configs.conform"
    end,
  },

  {
    "leisiji/interestingwords.nvim",
    lazy = false,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require "../configs.outline"
    end,
    lazy = false,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[slient! GoInstallDeps]]
    end,
  },

  {
    "jcdickinson/codeium.nvim",
    config = function()
      require("codeium").setup {}
    end,
    lazy = false,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "codeium" },
        { name = "crates" },
      },
    },
  },

  {
    "ethanholz/nvim-lastplace",
    config = function()
      require("nvim-lastplace").setup {}
    end,
    lazy = false,
  },

  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },

  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },

  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup {}
    end,
    lazy = false,
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
    end,
    lazy = false,
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
}

return plugins

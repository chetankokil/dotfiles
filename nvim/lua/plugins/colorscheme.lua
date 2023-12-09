return {
  -- nebulous coloscheme
  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    opts = { theme = "darker" },
  },
  {
    -- this colorscheme hasn't been updated to semantic highlights yet
    "dedguy21/nebulous.nvim",
    name = "nebulous",
    opts = {
      variant = "midnight",
      italic = {
        comments = true,
        keywords = true,
        functions = false,
        variables = true,
      },
    },
  },
  -- add colorizer to this but might be better in coding
  {
    "NvChad/nvim-colorizer.lua",
    opts = {},
  },
  -- added for easy transparency to colorschemes
  {
    "xiyaowong/transparent.nvim",
    opts = {},
  },
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = {},
  },
  { "catppuccin/nvim", opts = {}, name = "catppuccin" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  --disable default colorscheme
  {
    "folke/tokyonight.nvim",
    enable = false,
  },
}

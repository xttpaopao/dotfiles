require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    float = {},
    transparent_background = true, -- disables setting the background color.
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    integrations = {
        snacks = true,
        mason = true,
        neotree = false,
        treesitter = true,
        bufferline = true,
        -- catppuccin's lualine integration expects a table (not boolean) in recent versions
        lualine = {},
        blink_cmp = true,
        noice = true,
        notify = true,
        dap = {
            enabled = true,
            enable_ui = true,
        },
        toggleterm = true,
    },
    highlight_overrides = {
        mocha = function(mocha)
            return {
                CursorLineNr = { fg = mocha.yellow },
                TelescopeSelection = { bg = mocha.surface0 },
                TelescopeSelectionCaret = { fg = mocha.yellow, bg = mocha.surface0 },
                TelescopePromptPrefix = { fg = mocha.yellow },
                FlashCurrent = { bg = mocha.peach, fg = mocha.base },
                FlashMatch = { bg = mocha.red, fg = mocha.base },
                FlashLabel = { bg = mocha.teal, fg = mocha.base },
                NormalFloat = { bg = mocha.base },
                FloatBorder = { bg = mocha.base },
                FloatTitle = { bg = mocha.base },
            }
        end,
    },
})

vim.cmd("colorscheme catppuccin-mocha")

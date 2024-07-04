return {
    "echasnovski/mini.animate",
    recommended = true,
    event = "VeryLazy",
    opts = function()
        local animate = require("mini.animate")

        return {
            -- Cursor path
            cursor = {
                -- Whether to enable this animation
                enable = false,
            },
            -- Vertical scroll
            scroll = {
                -- Whether to enable this animation
                enable = true,

                -- Timing of animation (how steps will progress in time)
                timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),

                -- Subscroll generator based on total scroll
                -- subscroll = --<function: implements equal scroll with at most 60 steps>,
            },
            -- Window resize
            resize = {
                -- Whether to enable this animation
                enable = false,
            },
            -- Window open
            open = {
                enable = false,
            },
            -- Window close
            close = {
                enable = false,
            },
        }
    end,
}

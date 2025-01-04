Config = Config or {}

Config.DefaultWebhook = 'YOUR_WEBHOOK_HERE'
Config.DefaultColor = 'RED' -- RED, GREEN, BLUE, YELLOW, PURPLE, ORANGE, CYAN, WHITE, BLACK

GetColor = function(color)
    local colorMap = { -- You can add more colors here
        RED = 16711680,
        GREEN = 65280,
        BLUE = 255,
        YELLOW = 16776960,
        PURPLE = 8388736,
        ORANGE = 16753920,
        CYAN = 65535,
        WHITE = 16777215,
        BLACK = 0
    }

    return colorMap[color] or colorMap[Config.DefaultColor]
end
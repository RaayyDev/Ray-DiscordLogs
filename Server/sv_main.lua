local function sendToDiscord(content, embed, hook)
    local payload = {}

    if not hook then
        hook = Config.DefaultWebhook
    end

    if embed then
        payload = {
            embeds = { embed }
        }
    else
        payload = {
            content = content
        }
    end

    PerformHttpRequest(hook, function(err, text, headers)
        if Config.DebugMode then
            print(string.format('[DEBUG] Discord response: %s', text))
        end
    end, 'POST', json.encode(payload), { ['Content-Type'] = 'application/json' })
end


exports('logMessage', function(content, hook)
    if type(content) ~= 'string' then
        print('[ERROR] logMessage - content must be a string')
        return
    end
    sendToDiscord(content, nil, hook)
end)

exports('logEmbed', function(embedData, hook)
    if type(embed) ~= 'table' then
        print('[ERROR] logEmbed - embed must be a table')
        return
    end
    
    if not embedData.title or not embedData.description then
        print('[ERROR] logEmbed - embed must have a title and description')
        return
    end

    local embed = {
        title = embedData.title,
        description = embedData.description,
        color = GetColor(embedData.color) or GetColor(Config.DefaultColor),
        fields = embedData.fields or nil,
        footer = embedData.footer or nil,
    }

    sendToDiscord(nil, embed, hook)
end)

exports('logTyped', function(type, message, hook)
    local embedColors = {
        INFO = "BLUE",
        WARNING = "YELLOW",
        ERROR = "RED"
    }

    local color = embedColors[string.upper(type)] or Config.DefaultColor
    local embed = {
        title = string.format('[%s] Log', string.upper(type)),
        description = message,
        color = colorMap[color],
        footer = { text = "Typed Logs" },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }

    sendToDiscord(nil, embed, hook)
end)

if Config.DebugMode then
    print('[DEBUG] Log system initialized.')
end
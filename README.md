# Discord Logs for FiveM

> 🚀 **Easily send logs to Discord using exports in your FiveM server scripts!**

This script allows you to send messages to Discord channels via webhooks, either as plain text or rich embeds with titles, descriptions, colors, and more.

---

## 🌟 Features

- **Simple Messages**: Send plain text logs to Discord.
- **Rich Embeds**: Create embeds with titles, descriptions, and customizable fields.
- **Customizable Colors**: Choose from a variety of preset colors.
- **Typed Logs**: Use pre-defined types like `INFO`, `WARNING`, and `ERROR` for clarity.
- **Flexible Webhooks**: Use different webhooks for different purposes.
- **Debug Mode**: Activate detailed logging for debugging.

---

## 📦 Installation

1. **Download and Install**:
   - Place the script folder in your server's `resources` directory.

2. **Add to `server.cfg`**:
   ```plaintext
   ensure R-DiscordLogs
   ```

3. **Configure**:
   Update the `Config.DefaultWebhook` and `Config.DefaultColor` in your script if needed.

---

## 🚀 Usage

### 📝 Sending a Simple Message
Use the `logMessage` export to send plain text to Discord.

#### Example:
```lua
exports['R-DiscordLogs']:logMessage('This is a simple log message.', "https://your-webhook-url")
```

### 📋 Sending an Embed
Use the `logEmbed` export to send rich embeds with custom data.

#### Example:
```lua
exports['R-DiscordLogs']:logEmbed({
    title = "Player Joined",
    description = "**JohnDoe** has joined the server!",
    color = "GREEN", -- Choose a color from the list below
    fields = {
        { name = "Steam ID", value = "steam:1234567890", inline = true },
        { name = "IP Address", value = "127.0.0.1", inline = true }
    },
    footer = { text = "Server Logs" }
}, "https://your-webhook-url")
```

### 🔔 Sending a Typed Log
Use the `logTyped` export to send typed logs with predefined colors.

#### Example:
```lua
exports['R-DiscordLogs']:logTyped('INFO', 'This is an informational message.', "https://your-webhook-url")
exports['R-DiscordLogs']:logTyped('WARNING', 'This is a warning message.', "https://your-webhook-url")
exports['R-DiscordLogs']:logTyped('ERROR', 'This is an error message.', "https://your-webhook-url")
```

---

## 🎨 Color Options
Choose from the following preset colors:

| **Color**   | **Name**  |
|-------------|-----------|
| ⬛ BLACK  | `BLACK`   |
| ⚪ WHITE  | `WHITE`   |
| 🔵 BLUE   | `BLUE`    |
| 🟢 GREEN  | `GREEN`   |
| 🟡 YELLOW | `YELLOW`  |
| 🟠 ORANGE | `ORANGE`  |
| 🟣 PURPLE | `PURPLE`  |
| 🟥 RED    | `RED`     |
| 🔹 CYAN   | `CYAN`    |

If no color is specified, the script will default to the color set in `Config.DefaultColor`.

---

## ⚙️ Configuration

Update the following variables in the script:

- **Default Webhook**:
  Replace `Config.DefaultWebhook` with your Discord webhook URL.
  ```lua
  Config.DefaultWebhook = "YOUR_DISCORD_WEBHOOK_URL"
  ```

- **Default Color**:
  Replace `Config.DefaultColor` with your preferred default color.
  ```lua
  Config.DefaultColor = "BLUE"
  ```

- **Enable Debug Mode**:
  Set `Config.DebugMode` to `true` for detailed console logging.
  ```lua
  Config.DebugMode = true
  ```

---

## ❓ FAQ

### What happens if I don't specify a webhook?
If no webhook is provided, the script will use the default webhook defined in `Config.DefaultWebhook`.

### Can I use custom colors?
No, you must use one of the preset colors. However, you can modify the `colorMap` in the script to add more options.

---

## 💬 Need Help?
If you encounter any issues or have suggestions, feel free to reach out!

Happy logging! 🚀

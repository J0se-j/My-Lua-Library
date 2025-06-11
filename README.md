# 🌌 Amethyst UI Library

A sleek, Rayfield-style Roblox UI Library with full mobile support, smooth animations, draggable minimized window, and 82% transparent Amethyst theme. Designed for developers who want an aesthetic and user-friendly interface in their Roblox games.

---

## ✨ Features

- ✅ Full **Mobile Support**
- 🎨 Elegant **Amethyst Theme**
- 🎬 **Loading Animations** on launch
- 🧭 **Hamburger Menu** with sliding tabs
- 🧊 **Rounded Corners** on all UI components
- 📉 **82% Transparency** for a glassy, modern look
- 🔘 Custom **Buttons, Sliders, and Sections**
- 🪟 **Minimized Draggable UI** with a tiny "Show Script" label
- ⚙️ **Rayfield-Like API** for intuitive scripting
- 💾 Optional **Configuration Saving System**

---

## 📦 Quick Start (Loadstring)

Add this to your script to load the library:

```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/J0se-j/My-Lua-Library/refs/heads/main/Booting-the-library"))()
```
#🧪 Example Script
```lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/J0se-j/My-Lua-Library/refs/heads/main/Booting-the-library"))()

local Window = Library:CreateWindow({
    Name = "Amethyst UI Example",
    LoadingTitle = "Amethyst UI Library",
    LoadingSubtitle = "by J0se-j",
    ToggleUIKeybind = Enum.KeyCode.K,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "AmethystUI",
        FileName = "UserSettings"
    }
})

local Tab = Window:CreateTab("Main Tab", 4483362458)
local Section = Tab:CreateSection("Controls")

Section:CreateButton({
    Name = "Click Me!",
    Callback = function()
        print("Button Clicked!")
    end
})

Section:CreateSlider({
    Name = "Volume",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(value)
        print("Volume set to:", value)
    end
})
```
#🧰 API Reference
| Function                         | Description                    |
| -------------------------------- | ------------------------------ |
| `Library:Destroy()`              | Destroys the UI completely     |
| `CreateWindow({ ... })`          | Initializes the library window |
| `Window:CreateTab(name, iconId)` | Adds a new tab                 |
| `Tab:CreateSection(name)`        | Adds a labeled section         |
| `Section:CreateButton({ ... })`  | Creates a button               |
| `Section:CreateSlider({ ... })`  | Creates a slider               |

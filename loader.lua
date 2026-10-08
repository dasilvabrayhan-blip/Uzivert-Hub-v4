-- ============================================
-- 🎃 UZIVERT HUB — LOADER OFICIAL
-- ============================================
print("🎃 Cargando Uzivert Hub...")

local BASE_URL = "https://raw.githubusercontent.com/dasilvabrayhan-blip/Uzivert-Hub-v4/main/"
local SCRIPT_URL = BASE_URL .. "Uzivert-Hub.lua"
local MANTENIMIENTO_URL = BASE_URL .. "mantenimiento.txt"
local DISCORD_URL = "https://discord.gg/vHhERWcbXe"

-- 🧟 Chequeo de mantenimiento
local mantActivo = false
pcall(function()
    local resp = game:HttpGet(MANTENIMIENTO_URL)
    if resp and resp:gsub("%s", "") == "1" then
        mantActivo = true
    end
end)

if mantActivo then
    print("🧟 UZIVERT HUB EN MANTENIMIENTO")
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UzivertMantenimiento"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 9999
    ScreenGui.Parent = game:GetService("CoreGui")

    local Panel = Instance.new("Frame")
    Panel.Size = UDim2.new(0, 380, 0, 220)
    Panel.Position = UDim2.new(0.5, -190, 0.5, -110)
    Panel.BackgroundColor3 = Color3.fromRGB(10, 5, 15)
    Panel.BorderSizePixel = 0
    Panel.Active = true
    Panel.Draggable = true
    Panel.Parent = ScreenGui

    local cPanel = Instance.new("UICorner")
    cPanel.CornerRadius = UDim.new(0, 14)
    cPanel.Parent = Panel

    local sPanel = Instance.new("UIStroke")
    sPanel.Color = Color3.fromRGB(255, 140, 0)
    sPanel.Thickness = 2
    sPanel.Parent = Panel

    local Titulo = Instance.new("TextLabel")
    Titulo.Size = UDim2.new(1, -30, 0, 40)
    Titulo.Position = UDim2.new(0, 15, 0, 15)
    Titulo.BackgroundTransparency = 1
    Titulo.Text = "🧟 UZIVERT HUB — MANTENIMIENTO"
    Titulo.TextColor3 = Color3.fromRGB(255, 140, 0)
    Titulo.Font = Enum.Font.GothamBlack
    Titulo.TextSize = 15
    Titulo.Parent = Panel

    local Mensaje = Instance.new("TextLabel")
    Mensaje.Size = UDim2.new(1, -30, 0, 100)
    Mensaje.Position = UDim2.new(0, 15, 0, 60)
    Mensaje.BackgroundTransparency = 1
    Mensaje.Text = "Estamos arreglando bugs y mejorando el hub.\n\nVolvé en unos minutos. 🎃"
    Mensaje.TextColor3 = Color3.fromRGB(200, 170, 220)
    Mensaje.Font = Enum.Font.GothamMedium
    Mensaje.TextSize = 12
    Mensaje.TextWrapped = true
    Mensaje.Parent = Panel

    local DiscordBtn = Instance.new("TextButton")
    DiscordBtn.Size = UDim2.new(1, -30, 0, 40)
    DiscordBtn.Position = UDim2.new(0, 15, 1, -55)
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    DiscordBtn.Text = "💬 Unirse al Discord"
    DiscordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    DiscordBtn.Font = Enum.Font.GothamBold
    DiscordBtn.TextSize = 13
    DiscordBtn.BorderSizePixel = 0
    DiscordBtn.Parent = Panel

    local cBtn = Instance.new("UICorner")
    cBtn.CornerRadius = UDim.new(0, 8)
    cBtn.Parent = Panel

    DiscordBtn.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard(DISCORD_URL)
            DiscordBtn.Text = "✅ ¡Copiado!"
            task.wait(2)
            DiscordBtn.Text = "💬 Unirse al Discord"
        end
    end)
    
    return
end

-- 🎯 Cargar el hub
print("✅ Cargando hub...")
local ok, scriptContent = pcall(function()
    return game:HttpGet(SCRIPT_URL)
end)

if ok and scriptContent then
    local fn, err = loadstring(scriptContent)
    if fn then
        fn()
    else
        print("❌ Error: " .. tostring(err))
    end
else
    print("❌ No se pudo cargar el hub")
end

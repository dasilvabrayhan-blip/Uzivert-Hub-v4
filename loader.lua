-- CARTEL: LOADER DESACTUALIZADO (bloquea el juego, sin escapatoria)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")
local ContextActionService = game:GetService("ContextActionService")
local HttpService = game:GetService("HttpService")

local INVITE_CODE = "vHhERWcbXe"
local LINK = "https://discord.gg/" .. INVITE_CODE

pcall(function()
    local old = (gethui and gethui() or game:GetService("CoreGui")):FindFirstChild("CartelLoaderViejo")
    if old then old:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "CartelLoaderViejo"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 2147483647
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
local okParent = pcall(function() gui.Parent = (gethui and gethui()) or game:GetService("CoreGui") end)
if not okParent or not gui.Parent then gui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui") end

-- Bloqueo total: fondo que come todos los clics/toques y libera el mouse
local fondo = Instance.new("TextButton")
fondo.Size = UDim2.fromScale(1, 1)
fondo.BackgroundColor3 = Color3.fromRGB(4, 5, 10)
fondo.BackgroundTransparency = 1
fondo.BorderSizePixel = 0
fondo.Text = ""
fondo.AutoButtonColor = false
fondo.Modal = true
fondo.Active = true
fondo.Parent = gui
TweenService:Create(fondo, TweenInfo.new(0.4), { BackgroundTransparency = 0.25 }):Play()

-- Bloquea teclado, movimiento, salto y herramientas mientras el cartel este abierto
pcall(function()
    ContextActionService:BindActionAtPriority("UZ_BloquearTodo", function()
        return Enum.ContextActionResult.Sink
    end, false, 3000, unpack(Enum.KeyCode:GetEnumItems()))
    ContextActionService:BindActionAtPriority("UZ_BloquearMouse", function()
        return Enum.ContextActionResult.Sink
    end, false, 3000, Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.Touch, Enum.UserInputType.MouseWheel)
end)
pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false) end)
task.spawn(function()
    while gui.Parent do
        pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false) end)
        task.wait(1)
    end
end)

-- Tarjeta
local card = Instance.new("Frame")
card.AnchorPoint = Vector2.new(0.5, 0.5)
card.Position = UDim2.fromScale(0.5, 0.5)
card.Size = UDim2.fromOffset(400, 250)
card.BackgroundColor3 = Color3.fromRGB(14, 15, 24)
card.BorderSizePixel = 0
card.Active = true
card.ClipsDescendants = true
card.Parent = fondo
Instance.new("UICorner", card).CornerRadius = UDim.new(0, 16)
local scale = Instance.new("UIScale", card)
scale.Scale = 0.85

local cg = Instance.new("UIGradient", card)
cg.Rotation = 90
cg.Color = ColorSequence.new(Color3.fromRGB(22, 24, 38), Color3.fromRGB(10, 11, 18))

local stroke = Instance.new("UIStroke", card)
stroke.Thickness = 2
stroke.Color = Color3.new(1, 1, 1)
local sg = Instance.new("UIGradient", stroke)
sg.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 80, 90)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 190, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 90)),
})

-- Barra superior de color
local bar = Instance.new("Frame", card)
bar.Size = UDim2.new(1, 0, 0, 4)
bar.BackgroundColor3 = Color3.fromRGB(255, 80, 90)
bar.BorderSizePixel = 0
local bg = Instance.new("UIGradient", bar)
bg.Color = sg.Color

-- Icono de aviso dibujado con Frames
local icoWrap = Instance.new("Frame", card)
icoWrap.AnchorPoint = Vector2.new(0.5, 0)
icoWrap.Position = UDim2.new(0.5, 0, 0, 22)
icoWrap.Size = UDim2.fromOffset(54, 54)
icoWrap.BackgroundTransparency = 1
local pulse = Instance.new("Frame", icoWrap)
pulse.AnchorPoint = Vector2.new(0.5, 0.5)
pulse.Position = UDim2.fromScale(0.5, 0.5)
pulse.Size = UDim2.fromOffset(54, 54)
pulse.BackgroundColor3 = Color3.fromRGB(255, 80, 90)
pulse.BackgroundTransparency = 0.8
pulse.BorderSizePixel = 0
Instance.new("UICorner", pulse).CornerRadius = UDim.new(1, 0)
local ico = Instance.new("Frame", icoWrap)
ico.AnchorPoint = Vector2.new(0.5, 0.5)
ico.Position = UDim2.fromScale(0.5, 0.5)
ico.Size = UDim2.fromOffset(40, 40)
ico.BackgroundColor3 = Color3.fromRGB(255, 80, 90)
ico.BorderSizePixel = 0
Instance.new("UICorner", ico).CornerRadius = UDim.new(1, 0)
local ex = Instance.new("TextLabel", ico)
ex.Size = UDim2.fromScale(1, 1)
ex.BackgroundTransparency = 1
ex.Text = "!"
ex.TextColor3 = Color3.new(1, 1, 1)
ex.Font = Enum.Font.GothamBlack
ex.TextSize = 26

local titulo = Instance.new("TextLabel", card)
titulo.Position = UDim2.new(0, 0, 0, 84)
titulo.Size = UDim2.new(1, 0, 0, 26)
titulo.BackgroundTransparency = 1
titulo.Text = "LOADER DESACTUALIZADO"
titulo.TextColor3 = Color3.new(1, 1, 1)
titulo.Font = Enum.Font.GothamBlack
titulo.TextSize = 20

local texto = Instance.new("TextLabel", card)
texto.Position = UDim2.new(0, 24, 0, 114)
texto.Size = UDim2.new(1, -48, 0, 48)
texto.BackgroundTransparency = 1
texto.Text = "Este loader ya no es el oficial.\nEntra al Discord para conseguir el nuevo loader actualizado."
texto.TextColor3 = Color3.fromRGB(170, 176, 200)
texto.Font = Enum.Font.GothamMedium
texto.TextSize = 13
texto.TextWrapped = true

local btn = Instance.new("TextButton", card)
btn.AnchorPoint = Vector2.new(0.5, 1)
btn.Position = UDim2.new(0.5, 0, 1, -24)
btn.Size = UDim2.new(1, -48, 0, 44)
btn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
btn.AutoButtonColor = false
btn.Text = "ABRIR DISCORD"
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14
Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
local bs = Instance.new("UIScale", btn)

local nota = Instance.new("TextLabel", card)
nota.AnchorPoint = Vector2.new(0.5, 1)
nota.Position = UDim2.new(0.5, 0, 1, -8)
nota.Size = UDim2.new(1, -48, 0, 14)
nota.BackgroundTransparency = 1
nota.Text = LINK
nota.TextColor3 = Color3.fromRGB(110, 116, 140)
nota.Font = Enum.Font.Gotham
nota.TextSize = 11

-- Animaciones
TweenService:Create(scale, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
RunService.Heartbeat:Connect(function()
    if not gui.Parent then return end
    local t = os.clock()
    sg.Rotation = (t * 80) % 360
    bg.Offset = Vector2.new(math.sin(t * 1.5) * 0.5, 0)
    local p = (t * 1.2) % 1
    pulse.Size = UDim2.fromOffset(40 + 30 * p, 40 + 30 * p)
    pulse.BackgroundTransparency = 0.55 + 0.45 * p
end)

btn.MouseEnter:Connect(function() TweenService:Create(bs, TweenInfo.new(0.15), { Scale = 1.03 }):Play() end)
btn.MouseLeave:Connect(function() TweenService:Create(bs, TweenInfo.new(0.15), { Scale = 1 }):Play() end)

-- Abrir Discord: navegador directo, app de Discord, y copia como respaldo
local function abrirDiscord()
    local req = (syn and syn.request) or (http and http.request) or http_request or request
    local ok = false
    if setclipboard then pcall(setclipboard, LINK) end
    -- 1) app de Discord instalada (RPC local)
    if req then
        ok = pcall(function()
            req({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json", ["Origin"] = "https://discord.com" },
                Body = HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = { code = INVITE_CODE },
                    nonce = HttpService:GenerateGUID(false),
                }),
            })
        end)
    end
    -- 2) navegador
    pcall(function() GuiService:OpenBrowserWindow(LINK) end)
    pcall(function() game:GetService("GuiService"):OpenBrowserWindow(LINK) end)
    btn.Text = "ABRIENDO DISCORD..."
    TweenService:Create(btn, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(46, 190, 110) }):Play()
    task.delay(3, function()
        if not gui.Parent then return end
        btn.Text = "ABRIR DISCORD"
        TweenService:Create(btn, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(88, 101, 242) }):Play()
    end)
end
btn.MouseButton1Click:Connect(abrirDiscord)

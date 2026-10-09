-- ============================================
-- UZIVERT HUB | v4.7.0 HALLOWEEN 🎃
-- Proyecto inicial por Uzivert
-- Con ayuda explicativa de Nexvyr
-- ============================================

local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local Debris = game:GetService("Debris")

local VERSION = "v4.7.0 HALLOWEEN"

local COLORES = {
    Fondo = Color3.fromRGB(10, 5, 15),
    FondoPanel = Color3.fromRGB(20, 10, 25),
    Sidebar = Color3.fromRGB(15, 5, 20),
    Naranja1 = Color3.fromRGB(255, 140, 0),
    Naranja2 = Color3.fromRGB(255, 180, 50),
    Naranja3 = Color3.fromRGB(200, 90, 0),
    Morado1 = Color3.fromRGB(140, 60, 200),
    Morado2 = Color3.fromRGB(180, 100, 255),
    Morado3 = Color3.fromRGB(90, 30, 130),
    Texto = Color3.fromRGB(255, 255, 255),
    Sub = Color3.fromRGB(200, 170, 220),
    Rojo = Color3.fromRGB(255, 50, 50),
    Verde = Color3.fromRGB(60, 220, 120),
    Amarillo = Color3.fromRGB(255, 200, 80),
    Mantenimiento = Color3.fromRGB(255, 180, 80),
}

COLORES.FondoPrincipal = COLORES.Fondo
COLORES.FondoSecundario = COLORES.FondoPanel
COLORES.Acento = COLORES.Naranja1
COLORES.AcentoBrillo = COLORES.Naranja2
COLORES.TextoSecundario = COLORES.Sub
COLORES.AzulOscuro = COLORES.Morado3
COLORES.AzulOscuroBorde = COLORES.Naranja1

local ARCHIVO_CONFIG = "UzivertHub_Config_v470.json"

local CONFIG_DEFAULT = {
    ESP = true, GunESP = false, AntiFling = false, Noclip = false,
    Walkspeed = 16, Spinbot = false, Monitor = false, FPSBoost = false,
    Anims = false,
    AutoGrabAntiM = true, AutoGrabDistMurder = 25,
    AutoGrabRegresar = true, AutoGrabLock = false,
    AutoGrabPos = {0, 30, 0.5, 40}, AutoGrabMostrar = true,
    ShootMostrar = true, ShootLock = false,
    ShootPos = {0, 30, 0.5, 100},
    ShootAvzMostrar = false, ShootAvzLock = false,
    ShootAvzPos = {0, 30, 0.5, 170},
    ShootAltura = 1.55,
    ShootPredVel = 0.11,
    ShootPredMov = 0.13,
    ShootBurst = 3,
    ShootBurstDelay = 0.04,
    ShootRangoMax = 350,
    ShootRangoMin = 3,
    ShootWallCheck = true,
    ShootAuto = false,
    ShootPing = 60,
    ShootPingAuto = true,
    AutoPrankBomb = false,
    KillAllActivo = false,
    KnifeAura = false,
    KnifeAuraDist = 15,
    AimLock = false,
    AutoStab = false,
    AutoStabRango = 6,
    ModoNoche = false,
    AutoGetGun = false,
    RoundTimer = false,
}

local CONFIG = {}

local function cargarConfig()
    if isfile and isfile(ARCHIVO_CONFIG) then
        local ok, data = pcall(function()
            return HttpService:JSONDecode(readfile(ARCHIVO_CONFIG))
        end)
        if ok and data then
            CONFIG = data
            print("🎃 Configuración v4.7.0 cargada")
            return true
        end
    end
    CONFIG = CONFIG_DEFAULT
    print("📝 Configuración v4.7.0 por defecto")
    return false
end

local function guardarConfig()
    if writefile then
        pcall(function()
            writefile(ARCHIVO_CONFIG, HttpService:JSONEncode(CONFIG))
        end)
    end
end

cargarConfig()

local ESP_ACTIVO = CONFIG.ESP
local GUN_ESP_ACTIVO = CONFIG.GunESP
local ANTI_FLING_ACTIVO = CONFIG.AntiFling
local NOCLIP_ACTIVO = CONFIG.Noclip
local WALKSPEED_VALOR = CONFIG.Walkspeed
local SPINBOT_ACTIVO = CONFIG.Spinbot
local MONITOR_ACTIVO = CONFIG.Monitor
local FPS_BOOST_ACTIVO = CONFIG.FPSBoost
local ANIMS_ACTIVO = CONFIG.Anims
local GRAB_ANTI_MURDERER = CONFIG.AutoGrabAntiM
local GRAB_MURDERER_RANGO = CONFIG.AutoGrabDistMurder
local GRAB_REGRESAR = CONFIG.AutoGrabRegresar
local SHOOT_MOSTRAR = CONFIG.ShootMostrar ~= false
local SHOOT_AVZ_MOSTRAR = CONFIG.ShootAvzMostrar or false
local SHOOT_ALTURA = CONFIG.ShootAltura or 1.55
local SHOOT_PRED_VEL = CONFIG.ShootPredVel or 0.11
local SHOOT_PRED_MOV = CONFIG.ShootPredMov or 0.13
local SHOOT_BURST = CONFIG.ShootBurst or 3
local SHOOT_BURST_DELAY = CONFIG.ShootBurstDelay or 0.04
local SHOOT_RANGO_MAX = CONFIG.ShootRangoMax or 350
local SHOOT_RANGO_MIN = CONFIG.ShootRangoMin or 3
local SHOOT_WALL_CHECK = CONFIG.ShootWallCheck ~= false
local SHOOT_AUTO = CONFIG.ShootAuto
local SHOOT_PING = CONFIG.ShootPing or 60
local SHOOT_PING_AUTO = CONFIG.ShootPingAuto ~= false
local AUTO_PRANK_BOMB_ACTIVO = CONFIG.AutoPrankBomb or false
local prankBombConnection = nil
local KILL_ALL_ACTIVO = CONFIG.KillAllActivo or false

print("🎃 Parte 1/10 cargada - v4.7.0 HALLOWEEN")

-- 🎃 Ping a la API (cada 2 min)
task.spawn(function()
    pcall(function()
        game:HttpGet("https://uzivert-api.onrender.com/registrar?user=" .. LocalPlayer.Name)
    end)
    
    while task.wait(120) do
        pcall(function()
            game:HttpGet("https://uzivert-api.onrender.com/registrar?user=" .. LocalPlayer.Name)
        end)
    end
end)

local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UzivertHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = PlayerGui

local BotonFlotante = Instance.new("TextButton")
BotonFlotante.Size = UDim2.new(0, 65, 0, 65)
BotonFlotante.Position = UDim2.new(0, 30, 0.5, -32)
BotonFlotante.BackgroundColor3 = COLORES.FondoPanel
BotonFlotante.Text = ""
BotonFlotante.BorderSizePixel = 0
BotonFlotante.Active = true
BotonFlotante.Draggable = true
BotonFlotante.ClipsDescendants = true
BotonFlotante.Parent = ScreenGui

local cBoton = Instance.new("UICorner")
cBoton.CornerRadius = UDim.new(1, 0)
cBoton.Parent = BotonFlotante

local gradBoton = Instance.new("UIGradient")
gradBoton.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, COLORES.Naranja3),
    ColorSequenceKeypoint.new(0.5, COLORES.Naranja1),
    ColorSequenceKeypoint.new(1, COLORES.Morado3),
})
gradBoton.Rotation = 45
gradBoton.Parent = BotonFlotante

local LetraU = Instance.new("TextLabel")
LetraU.Size = UDim2.new(1, 0, 1, 0)
LetraU.BackgroundTransparency = 1
LetraU.Text = "🎃"
LetraU.TextColor3 = COLORES.Texto
LetraU.Font = Enum.Font.GothamBlack
LetraU.TextSize = 32
LetraU.ZIndex = 2
LetraU.Parent = BotonFlotante

local sBoton = Instance.new("UIStroke")
sBoton.Color = COLORES.Naranja2
sBoton.Thickness = 2
sBoton.Transparency = 0.3
sBoton.Parent = BotonFlotante

task.spawn(function()
    while task.wait() do
        local t = tick()
        local a = (math.sin(t * 2) + 1) / 2
        sBoton.Color = COLORES.Naranja1:Lerp(COLORES.Morado2, a)
        sBoton.Transparency = 0.5 - a * 0.3
    end
end)

local Panel = Instance.new("Frame")
Panel.Name = "UzivertPanel"
Panel.Size = UDim2.new(0, 520, 0, 340)
Panel.Position = UDim2.new(0.5, -260, 0.5, -170)
Panel.BackgroundColor3 = COLORES.Fondo
Panel.BackgroundTransparency = 0.15
Panel.BorderSizePixel = 0
Panel.Visible = false
Panel.Active = true
Panel.Draggable = true
Panel.ClipsDescendants = true
Panel.Parent = ScreenGui

local cP = Instance.new("UICorner")
cP.CornerRadius = UDim.new(0, 16)
cP.Parent = Panel

local sP = Instance.new("UIStroke")
sP.Color = COLORES.Naranja1
sP.Thickness = 2
sP.Transparency = 0.3
sP.Parent = Panel

task.spawn(function()
    while task.wait() do
        local t = tick()
        local a = (math.sin(t * 1.5) + 1) / 2
        sP.Color = COLORES.Naranja1:Lerp(COLORES.Morado2, a)
        sP.Transparency = 0.5 - a * 0.3
    end
end)

local Niebla1 = Instance.new("Frame")
Niebla1.Size = UDim2.new(0, 200, 0, 200)
Niebla1.Position = UDim2.new(-0.2, 0, 0.3, 0)
Niebla1.BackgroundColor3 = COLORES.Morado1
Niebla1.BackgroundTransparency = 0.9
Niebla1.BorderSizePixel = 0
Niebla1.ZIndex = 0
Niebla1.Parent = Panel

local cN1 = Instance.new("UICorner")
cN1.CornerRadius = UDim.new(1, 0)
cN1.Parent = Niebla1

local Niebla2 = Instance.new("Frame")
Niebla2.Size = UDim2.new(0, 250, 0, 250)
Niebla2.Position = UDim2.new(0.7, 0, 0.5, 0)
Niebla2.BackgroundColor3 = COLORES.Morado2
Niebla2.BackgroundTransparency = 0.9
Niebla2.BorderSizePixel = 0
Niebla2.ZIndex = 0
Niebla2.Parent = Panel

local cN2 = Instance.new("UICorner")
cN2.CornerRadius = UDim.new(1, 0)
cN2.Parent = Niebla2

task.spawn(function()
    while task.wait() do
        local t = tick()
        Niebla1.Position = UDim2.new(-0.2 + math.sin(t * 0.3) * 0.05, 0, 0.3 + math.cos(t * 0.3) * 0.05, 0)
        Niebla2.Position = UDim2.new(0.7 + math.sin(t * 0.4) * 0.05, 0, 0.5 + math.cos(t * 0.4) * 0.05, 0)
    end
end)

task.spawn(function()
    while true do
        if Panel.Visible then
            local bat = Instance.new("TextLabel")
            bat.Size = UDim2.new(0, 20, 0, 20)
            bat.BackgroundTransparency = 1
            bat.Text = "🦇"
            bat.TextSize = math.random(12, 20)
            bat.TextColor3 = Color3.fromRGB(50, 30, 60)
            bat.Position = UDim2.new(-0.1, 0, math.random(), 0)
            bat.ZIndex = 1
            bat.Parent = Panel
            local duracion = math.random(6, 12)
            local targetY = bat.Position.Y.Scale + (math.random() - 0.5) * 0.3
            TweenService:Create(bat, TweenInfo.new(duracion, Enum.EasingStyle.Linear), {
                Position = UDim2.new(1.1, 0, targetY, 0),
            }):Play()
            Debris:AddItem(bat, duracion + 1)
        end
        task.wait(math.random(15, 35) / 10)
    end
end)

local function crearTelarana(posX, posY, rot)
    local web = Instance.new("TextLabel")
    web.Size = UDim2.new(0, 80, 0, 80)
    web.Position = UDim2.new(posX, 0, posY, 0)
    web.BackgroundTransparency = 1
    web.Text = "🕸️"
    web.TextSize = 60
    web.TextColor3 = Color3.fromRGB(200, 200, 220)
    web.TextTransparency = 0.3
    web.Rotation = rot
    web.ZIndex = 1
    web.Parent = Panel
end

crearTelarana(0, 0, 0)
crearTelarana(1, 0, 90)
crearTelarana(0, 1, -90)
crearTelarana(1, 1, 180)

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 130, 1, 0)
Sidebar.BackgroundColor3 = COLORES.Sidebar
Sidebar.BackgroundTransparency = 0.35
Sidebar.BorderSizePixel = 0
Sidebar.ZIndex = 2
Sidebar.ClipsDescendants = true
Sidebar.Parent = Panel

local cSidebar = Instance.new("UICorner")
cSidebar.CornerRadius = UDim.new(0, 16)
cSidebar.Parent = Sidebar

local SidebarScroll = Instance.new("ScrollingFrame")
SidebarScroll.Size = UDim2.new(1, 0, 1, 0)
SidebarScroll.Position = UDim2.new(0, 0, 0, 0)
SidebarScroll.BackgroundTransparency = 1
SidebarScroll.BorderSizePixel = 0
SidebarScroll.ScrollBarThickness = 3
SidebarScroll.ScrollBarImageColor3 = COLORES.Naranja1
SidebarScroll.ScrollBarImageTransparency = 0.5
SidebarScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
SidebarScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
SidebarScroll.ScrollingDirection = Enum.ScrollingDirection.Y
SidebarScroll.ScrollingEnabled = true
SidebarScroll.Active = true
SidebarScroll.ClipsDescendants = true
SidebarScroll.ZIndex = 3
SidebarScroll.Parent = Sidebar

local cScroll = Instance.new("UICorner")
cScroll.CornerRadius = UDim.new(0, 16)
cScroll.Parent = SidebarScroll

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.Padding = UDim.new(0, 4)
sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
sidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
sidebarLayout.Parent = SidebarScroll

local sidebarPadding = Instance.new("UIPadding")
sidebarPadding.PaddingTop = UDim.new(0, 100)
sidebarPadding.PaddingBottom = UDim.new(0, 20)
sidebarPadding.PaddingLeft = UDim.new(0, 6)
sidebarPadding.PaddingRight = UDim.new(0, 6)
sidebarPadding.Parent = SidebarScroll

local SidebarFix = Instance.new("Frame")
SidebarFix.Size = UDim2.new(0, 16, 1, 0)
SidebarFix.Position = UDim2.new(1, -16, 0, 0)
SidebarFix.BackgroundColor3 = COLORES.Sidebar
SidebarFix.BackgroundTransparency = 0.35
SidebarFix.BorderSizePixel = 0
SidebarFix.ZIndex = 5
SidebarFix.Parent = Sidebar

local LogoU = Instance.new("TextLabel")
LogoU.Size = UDim2.new(1, 0, 0, 32)
LogoU.Position = UDim2.new(0, 0, 0, 10)
LogoU.BackgroundTransparency = 1
LogoU.Text = "🎃"
LogoU.TextColor3 = COLORES.Naranja2
LogoU.Font = Enum.Font.GothamBlack
LogoU.TextSize = 26
LogoU.ZIndex = 6
LogoU.Parent = Sidebar

local Titulo = Instance.new("TextLabel")
Titulo.Size = UDim2.new(1, -20, 0, 22)
Titulo.Position = UDim2.new(0, 10, 0, 44)
Titulo.BackgroundTransparency = 1
Titulo.Text = "Uzivert"
Titulo.TextColor3 = COLORES.Naranja2
Titulo.Font = Enum.Font.GothamBlack
Titulo.TextSize = 16
Titulo.ZIndex = 6
Titulo.Parent = Sidebar

local Subtitulo = Instance.new("TextLabel")
Subtitulo.Size = UDim2.new(1, -20, 0, 14)
Subtitulo.Position = UDim2.new(0, 10, 0, 68)
Subtitulo.BackgroundTransparency = 1
Subtitulo.Text = "★ " .. VERSION .. " ★"
Subtitulo.TextColor3 = COLORES.Morado2
Subtitulo.Font = Enum.Font.Gotham
Subtitulo.TextSize = 9
Subtitulo.ZIndex = 6
Subtitulo.Parent = Sidebar

local Sep = Instance.new("Frame")
Sep.Size = UDim2.new(1, -24, 0, 1)
Sep.Position = UDim2.new(0, 12, 0, 90)
Sep.BackgroundColor3 = COLORES.Naranja1
Sep.BackgroundTransparency = 0.5
Sep.BorderSizePixel = 0
Sep.ZIndex = 6
Sep.Parent = Sidebar

local BotonCerrar = Instance.new("TextButton")
BotonCerrar.Size = UDim2.new(0, 22, 0, 22)
BotonCerrar.Position = UDim2.new(1, -28, 0, 12)
BotonCerrar.BackgroundColor3 = COLORES.Rojo
BotonCerrar.Text = "×"
BotonCerrar.TextColor3 = COLORES.Texto
BotonCerrar.Font = Enum.Font.GothamBold
BotonCerrar.TextSize = 16
BotonCerrar.BorderSizePixel = 0
BotonCerrar.ZIndex = 10
BotonCerrar.Parent = Panel

local cCerrar = Instance.new("UICorner")
cCerrar.CornerRadius = UDim.new(1, 0)
cCerrar.Parent = BotonCerrar

local BotonMin = Instance.new("TextButton")
BotonMin.Size = UDim2.new(0, 22, 0, 22)
BotonMin.Position = UDim2.new(1, -54, 0, 12)
BotonMin.BackgroundColor3 = COLORES.Amarillo
BotonMin.Text = "−"
BotonMin.TextColor3 = COLORES.Texto
BotonMin.Font = Enum.Font.GothamBold
BotonMin.TextSize = 16
BotonMin.BorderSizePixel = 0
BotonMin.ZIndex = 10
BotonMin.Parent = Panel

local cMin = Instance.new("UICorner")
cMin.CornerRadius = UDim.new(1, 0)
cMin.Parent = BotonMin

BotonCerrar.MouseButton1Click:Connect(function()
    Panel.Visible = false
    BotonFlotante.Visible = true
end)

BotonMin.MouseButton1Click:Connect(function()
    Panel.Visible = false
    BotonFlotante.Visible = true
end)

BotonFlotante.MouseButton1Click:Connect(function()
    Panel.Visible = not Panel.Visible
    if Panel.Visible then BotonFlotante.Visible = false end
end)

local Paginas = {}

local function crearRipple(boton)
    boton.MouseButton1Down:Connect(function()
        local ripple = Instance.new("Frame")
        ripple.Size = UDim2.new(0, 0, 0, 0)
        ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
        ripple.AnchorPoint = Vector2.new(0.5, 0.5)
        ripple.BackgroundColor3 = COLORES.Naranja2
        ripple.BackgroundTransparency = 0.6
        ripple.BorderSizePixel = 0
        ripple.ZIndex = 10
        ripple.Parent = boton
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(1, 0)
        c.Parent = ripple
        TweenService:Create(ripple, TweenInfo.new(0.5), {
            Size = UDim2.new(0, 300, 0, 300),
            BackgroundTransparency = 1,
        }):Play()
        task.wait(0.6)
        ripple:Destroy()
    end)
end

local function crearPagina(nombre, icono, orden)
    local boton = Instance.new("TextButton")
    boton.Size = UDim2.new(1, -12, 0, 30)
    boton.Position = UDim2.new(0, 0, 0, 0)
    boton.LayoutOrder = orden
    boton.BackgroundColor3 = COLORES.Sidebar
    boton.BackgroundTransparency = 0.6
    boton.Text = ""
    boton.BorderSizePixel = 0
    boton.ZIndex = 4
    boton.ClipsDescendants = true
    boton.Parent = SidebarScroll

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 7)
    c.Parent = boton

    local stroke = Instance.new("UIStroke")
    stroke.Color = COLORES.Naranja1
    stroke.Thickness = 1
    stroke.Transparency = 0.6
    stroke.Parent = boton

    crearRipple(boton)

    local iconLbl = Instance.new("TextLabel")
    iconLbl.Size = UDim2.new(0, 24, 1, 0)
    iconLbl.Position = UDim2.new(0, 6, 0, 0)
    iconLbl.BackgroundTransparency = 1
    iconLbl.Text = icono or "•"
    iconLbl.TextColor3 = COLORES.Naranja2
    iconLbl.TextSize = 14
    iconLbl.Font = Enum.Font.GothamBold
    iconLbl.ZIndex = 5
    iconLbl.Parent = boton

    local texto = Instance.new("TextLabel")
    texto.Size = UDim2.new(1, -34, 1, 0)
    texto.Position = UDim2.new(0, 30, 0, 0)
    texto.BackgroundTransparency = 1
    texto.Text = nombre
    texto.TextColor3 = COLORES.Texto
    texto.Font = Enum.Font.GothamMedium
    texto.TextSize = 11
    texto.TextXAlignment = Enum.TextXAlignment.Left
    texto.ZIndex = 5
    texto.Parent = boton

    task.spawn(function()
        while task.wait() do
            local t = tick() + orden
            local a = (math.sin(t * 2) + 1) / 2
            stroke.Color = COLORES.Naranja3:Lerp(COLORES.Morado2, a)
            stroke.Transparency = 0.6 - a * 0.3
        end
    end)

    local pagina = Instance.new("ScrollingFrame")
    pagina.Size = UDim2.new(1, -145, 1, -20)
    pagina.Position = UDim2.new(0, 135, 0, 10)
    pagina.BackgroundTransparency = 1
    pagina.BorderSizePixel = 0
    pagina.ScrollBarThickness = 4
    pagina.ScrollBarImageColor3 = COLORES.Naranja1
    pagina.ScrollBarImageTransparency = 0.3
    pagina.CanvasSize = UDim2.new(0, 0, 0, 0)
    pagina.AutomaticCanvasSize = Enum.AutomaticSize.Y
    pagina.ScrollingDirection = Enum.ScrollingDirection.Y
    pagina.ScrollingEnabled = true
    pagina.Active = true
    pagina.ClipsDescendants = true
    pagina.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
    pagina.Visible = false
    pagina.ZIndex = 2
    pagina.Parent = Panel

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.Parent = pagina

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 8)
    padding.PaddingBottom = UDim.new(0, 40)
    padding.PaddingLeft = UDim.new(0, 8)
    padding.PaddingRight = UDim.new(0, 8)
    padding.Parent = pagina

    table.insert(Paginas, {boton, pagina, texto, iconLbl})

    boton.MouseButton1Click:Connect(function()
        for _, p in ipairs(Paginas) do
            p[2].Visible = false
            p[1].BackgroundTransparency = 0.6
        end
        pagina.Visible = true
        boton.BackgroundTransparency = 0.3
    end)

    return pagina
end

local function crearToggle(padre, texto, estadoInicial, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 38)
    frame.BackgroundColor3 = COLORES.Morado3
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.ZIndex = 2
    frame.Parent = padre

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 9)
    c.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = COLORES.Naranja1
    stroke.Thickness = 1
    stroke.Transparency = 0.4
    stroke.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = texto
    label.TextColor3 = COLORES.Texto
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 2
    label.Parent = frame

    local switch = Instance.new("TextButton")
    switch.Size = UDim2.new(0, 42, 0, 20)
    switch.Position = UDim2.new(1, -54, 0.5, -10)
    switch.BackgroundColor3 = estadoInicial and COLORES.Naranja1 or Color3.fromRGB(50, 40, 60)
    switch.Text = ""
    switch.BorderSizePixel = 0
    switch.ZIndex = 2
    switch.Parent = frame

    local c2 = Instance.new("UICorner")
    c2.CornerRadius = UDim.new(1, 0)
    c2.Parent = switch

    local circulo = Instance.new("Frame")
    circulo.Size = UDim2.new(0, 14, 0, 14)
    circulo.Position = estadoInicial and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
    circulo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    circulo.BorderSizePixel = 0
    circulo.ZIndex = 3
    circulo.Parent = switch

    local c3 = Instance.new("UICorner")
    c3.CornerRadius = UDim.new(1, 0)
    c3.Parent = circulo

    local estado = estadoInicial

    switch.MouseButton1Click:Connect(function()
        estado = not estado
        switch.BackgroundColor3 = estado and COLORES.Naranja1 or Color3.fromRGB(50, 40, 60)
        TweenService:Create(circulo, TweenInfo.new(0.2), {
            Position = estado and UDim2.new(1, -16, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
        }):Play()
        callback(estado)
    end)
end

local function crearBoton(padre, texto, callback, color)
    local boton = Instance.new("TextButton")
    boton.Size = UDim2.new(1, 0, 0, 42)
    boton.BackgroundColor3 = color or COLORES.Morado1
    boton.BackgroundTransparency = 0.5
    boton.Text = texto
    boton.TextColor3 = COLORES.Texto
    boton.Font = Enum.Font.GothamBold
    boton.TextSize = 12
    boton.BorderSizePixel = 0
    boton.ClipsDescendants = true
    boton.ZIndex = 2
    boton.Parent = padre

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 9)
    c.Parent = boton

    local stroke = Instance.new("UIStroke")
    stroke.Color = color or COLORES.Naranja1
    stroke.Thickness = 1.5
    stroke.Transparency = 0.2
    stroke.Parent = boton

    task.spawn(function()
        while task.wait() do
            local t = tick()
            local a = (math.sin(t * 1.5) + 1) / 2
            stroke.Color = (color or COLORES.Naranja3):Lerp(COLORES.Morado2, a)
            stroke.Transparency = 0.4 - a * 0.3
        end
    end)

    crearRipple(boton)

    boton.MouseEnter:Connect(function()
        TweenService:Create(boton, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.3,
        }):Play()
    end)

    boton.MouseLeave:Connect(function()
        TweenService:Create(boton, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.5,
        }):Play()
    end)

    boton.MouseButton1Click:Connect(callback)
    return boton
end

local function crearSlider(padre, texto, min, max, inicial, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 50)
    frame.BackgroundColor3 = COLORES.Morado3
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.ZIndex = 2
    frame.Parent = padre

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 9)
    c.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = COLORES.Naranja1
    stroke.Thickness = 1
    stroke.Transparency = 0.4
    stroke.Parent = frame

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 0, 18)
    label.Position = UDim2.new(0, 10, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = texto .. ": " .. inicial
    label.TextColor3 = COLORES.Texto
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 10
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 2
    label.Parent = frame

    local barra = Instance.new("Frame")
    barra.Size = UDim2.new(1, -20, 0, 8)
    barra.Position = UDim2.new(0, 10, 0, 30)
    barra.BackgroundColor3 = Color3.fromRGB(30, 20, 40)
    barra.BorderSizePixel = 0
    barra.ZIndex = 2
    barra.Parent = frame

    local c2 = Instance.new("UICorner")
    c2.CornerRadius = UDim.new(1, 0)
    c2.Parent = barra

    local relleno = Instance.new("Frame")
    relleno.Size = UDim2.new((inicial - min) / (max - min), 0, 1, 0)
    relleno.BackgroundColor3 = COLORES.Naranja1
    relleno.BorderSizePixel = 0
    relleno.ZIndex = 3
    relleno.Parent = barra

    local c3 = Instance.new("UICorner")
    c3.CornerRadius = UDim.new(1, 0)
    c3.Parent = relleno

    local valor = inicial
    local arrastrando = false

    barra.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            arrastrando = true
            if Panel then Panel.Draggable = false end
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if arrastrando and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local posX = math.clamp((input.Position.X - barra.AbsolutePosition.X) / barra.AbsoluteSize.X, 0, 1)
            valor = math.floor(min + (max - min) * posX)
            relleno.Size = UDim2.new(posX, 0, 1, 0)
            label.Text = texto .. ": " .. valor
            callback(valor)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            arrastrando = false
            if Panel then Panel.Draggable = true end
        end
    end)
end

print("🎃 Parte 2/10 cargada - Halloween UI")

local PaginaVisual = crearPagina("Visual", "🎃", 1)
local PaginaAim = crearPagina("Combat", "👻", 2)
local PaginaAura = crearPagina("Crab", "💀", 3)
local PaginaPlayer = crearPagina("Jugador", "🦇", 4)
local PaginaFling = crearPagina("Fling", "🕷️", 5)
local PaginaAnims = crearPagina("Anims", "🕸️", 6)
local PaginaBomb = crearPagina("Bomb Jump", "🧟", 7)
local PaginaRend = crearPagina("Fps", "⚰️", 8)
local PaginaInfo = crearPagina("Info", "🍬", 9)
local PaginaUpdate = crearPagina("Update", "📜", 10)
local PaginaAvisos = crearPagina("Avisos", "⚠️", 11)
local PaginaCreador = crearPagina("Creador", "👑", 12)

Paginas[1][2].Visible = true
Paginas[1][1].BackgroundTransparency = 0.3

-- ============================================
-- 🆕 DETECCIÓN DE ROLES CON GetPlayerData (v3)
-- ============================================
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local playerDataRemote = nil
local RoleCache = {}

task.spawn(function()
    while not playerDataRemote do
        for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
            if obj.Name == "GetPlayerData" then
                playerDataRemote = obj
                print("🎃 [ROLES] Remote encontrado: " .. obj:GetFullName())
                break
            end
        end
        if not playerDataRemote then
            task.wait(2)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if playerDataRemote then
            local success, data = pcall(function()
                return playerDataRemote:InvokeServer()
            end)
            if success and data then
                local newRoles = {}
                for plr, plrData in pairs(data) do
                    if plrData.Dead or not plrData.Role or plrData.Role == "" then
                        newRoles[plr] = "Lobby"
                    else
                        newRoles[plr] = plrData.Role
                    end
                end
                RoleCache = newRoles
            end
        end
    end
end)

local function detectarMurderer()
    for plrName, role in pairs(RoleCache) do
        if role == "Murderer" then
            return Players:FindFirstChild(plrName)
        end
    end
    return nil
end

local function detectarSheriff()
    for plrName, role in pairs(RoleCache) do
        if role == "Sheriff" then
            return Players:FindFirstChild(plrName)
        end
    end
    return nil
end

local function detectarHero()
    for plrName, role in pairs(RoleCache) do
        if role == "Hero" then
            return Players:FindFirstChild(plrName)
        end
    end
    return nil
end

local function detectarRol(jugador)
    -- Usa RoleCache (detecta antes del contador)
    if RoleCache and RoleCache[jugador.Name] then
        local rol = RoleCache[jugador.Name]
        if rol == "" then rol = "Lobby" end
        return rol
    end
    return "Lobby"
end

_G.AIM_ON = false

_G.UZIVERT_aim_loop = function()
    if not _G.AIM_ON then return end
    local char = LocalPlayer.Character
    if not char then return end
    local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")
    if not gun then return end
    local murderer = detectarMurderer()
    if not murderer or not murderer.Character then return end
    local targetHrp = murderer.Character:FindFirstChild("HumanoidRootPart")
    if not targetHrp then return end
    local cam = workspace.CurrentCamera
    if not cam then return end
    cam.CFrame = CFrame.new(cam.CFrame.Position, targetHrp.Position)
end

_G.UZIVERT_aim_con = RunService.RenderStepped:Connect(function()
    if not _G.AIM_ON then return end
    _G.UZIVERT_aim_loop()
end)

-- ============================================
-- 🗡️ AUTO STAB
-- ============================================
_G.UZIVERT_AUTO_STAB_ON = false
_G.UZIVERT_STAB_RANGO = 6

_G.UZIVERT_AUTO_STAB_LOOP = RunService.Heartbeat:Connect(function()
    if not _G.UZIVERT_AUTO_STAB_ON then return end
    if not soyMurderer() then return end
    
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local knife = char:FindFirstChild("Knife") or (LocalPlayer:FindFirstChild("Backpack") and LocalPlayer.Backpack:FindFirstChild("Knife"))
    if not knife then return end
    
    for _, enemy in ipairs(Players:GetPlayers()) do
        if enemy ~= LocalPlayer and enemy.Character then
            local eRoot = enemy.Character:FindFirstChild("HumanoidRootPart")
            local eHum = enemy.Character:FindFirstChildOfClass("Humanoid")
            if eRoot and eHum and eHum.Health > 0 then
                local dist = (hrp.Position - eRoot.Position).Magnitude
                if dist <= _G.UZIVERT_STAB_RANGO then
                    if knife.Parent == LocalPlayer.Backpack then
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if hum then hum:EquipTool(knife) end
                        task.wait(0.05)
                    end
                    pcall(function()
                        knife.Events.KnifeStabbed:FireServer()
                        knife.Events.HandleTouched:FireServer(eRoot)
                    end)
                end
            end
        end
    end
end)

-- ============================================
-- 🌙 MODO NOCHE
-- ============================================
_G.UZIVERT_MODO_NOCHE_ON = false
_G.UZIVERT_NOCHE_SNAP = {}

_G.UZIVERT_MODO_NOCHE = function(state)
    _G.UZIVERT_MODO_NOCHE_ON = state
    
    if state then
        _G.UZIVERT_NOCHE_SNAP.GlobalShadows = Lighting.GlobalShadows
        _G.UZIVERT_NOCHE_SNAP.Brightness = Lighting.Brightness
        _G.UZIVERT_NOCHE_SNAP.ClockTime = Lighting.ClockTime
        _G.UZIVERT_NOCHE_SNAP.OutdoorAmbient = Lighting.OutdoorAmbient
        _G.UZIVERT_NOCHE_SNAP.Ambient = Lighting.Ambient
        _G.UZIVERT_NOCHE_SNAP.FogColor = Lighting.FogColor
        _G.UZIVERT_NOCHE_SNAP.FogEnd = Lighting.FogEnd
        _G.UZIVERT_NOCHE_SNAP.ColorShift_Top = Lighting.ColorShift_Top
        _G.UZIVERT_NOCHE_SNAP.ColorShift_Bottom = Lighting.ColorShift_Bottom
        
        Lighting.GlobalShadows = true
        Lighting.Brightness = 2
        Lighting.ClockTime = 0
        Lighting.OutdoorAmbient = Color3.fromRGB(40, 50, 70)
        Lighting.Ambient = Color3.fromRGB(20, 25, 35)
        Lighting.FogColor = Color3.fromRGB(15, 20, 30)
        Lighting.FogEnd = 2000
        Lighting.ColorShift_Top = Color3.fromRGB(160, 180, 240)
        Lighting.ColorShift_Bottom = Color3.fromRGB(25, 40, 60)
        
        local bloom = Instance.new("BloomEffect")
        bloom.Name = "UzivertNocheBloom"
        bloom.Intensity = 0.6
        bloom.Size = 40
        bloom.Threshold = 0.2
        bloom.Parent = Lighting
        
        local blur = Instance.new("BlurEffect")
        blur.Name = "UzivertNocheBlur"
        blur.Size = 2
        blur.Parent = Lighting
        
        print("🌙 Modo Noche ON")
    else
        if _G.UZIVERT_NOCHE_SNAP.GlobalShadows ~= nil then Lighting.GlobalShadows = _G.UZIVERT_NOCHE_SNAP.GlobalShadows end
        if _G.UZIVERT_NOCHE_SNAP.Brightness then Lighting.Brightness = _G.UZIVERT_NOCHE_SNAP.Brightness end
        if _G.UZIVERT_NOCHE_SNAP.ClockTime then Lighting.ClockTime = _G.UZIVERT_NOCHE_SNAP.ClockTime end
        if _G.UZIVERT_NOCHE_SNAP.OutdoorAmbient then Lighting.OutdoorAmbient = _G.UZIVERT_NOCHE_SNAP.OutdoorAmbient end
        if _G.UZIVERT_NOCHE_SNAP.Ambient then Lighting.Ambient = _G.UZIVERT_NOCHE_SNAP.Ambient end
        if _G.UZIVERT_NOCHE_SNAP.FogColor then Lighting.FogColor = _G.UZIVERT_NOCHE_SNAP.FogColor end
        if _G.UZIVERT_NOCHE_SNAP.FogEnd then Lighting.FogEnd = _G.UZIVERT_NOCHE_SNAP.FogEnd end
        if _G.UZIVERT_NOCHE_SNAP.ColorShift_Top then Lighting.ColorShift_Top = _G.UZIVERT_NOCHE_SNAP.ColorShift_Top end
        if _G.UZIVERT_NOCHE_SNAP.ColorShift_Bottom then Lighting.ColorShift_Bottom = _G.UZIVERT_NOCHE_SNAP.ColorShift_Bottom end
        
        local bloom = Lighting:FindFirstChild("UzivertNocheBloom")
        if bloom then bloom:Destroy() end
        local blur = Lighting:FindFirstChild("UzivertNocheBlur")
        if blur then blur:Destroy() end
        
        print("☀️ Modo Noche OFF")
    end
end

local function soyMurderer()
    local char = LocalPlayer.Character
    if not char then return false end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name == "Knife" or tool.Name:lower():find("knife")) then return true end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack and backpack:FindFirstChild("Knife") then return true end
    return false
end

local function tengoGun()
    local char = LocalPlayer.Character
    if not char then return false end
    for _, tool in ipairs(char:GetChildren()) do
        if tool:IsA("Tool") and (tool.Name == "Gun" or tool.Name == "Revolver") then return true end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack and (backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")) then return true end
    return false
end

-- ============================================
-- 💀 MATAR SHERIFF
-- ============================================
_G.UZIVERT_MATAR_SHERIFF = function()
    if not soyMurderer() then
        print("❌ No sos Murderer")
        return
    end
    
    local char = LocalPlayer.Character
    if not char then return end
    
    local knife = char:FindFirstChild("Knife") 
                or (LocalPlayer:FindFirstChild("Backpack") and LocalPlayer.Backpack:FindFirstChild("Knife"))
    if not knife then
        print("❌ No tenés Knife")
        return
    end
    
    local sheriff = detectarSheriff()
    if not sheriff or not sheriff.Character then
        print("❌ No hay Sheriff")
        return
    end
    
    if knife.Parent == LocalPlayer.Backpack then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum:EquipTool(knife) end
        task.wait(0.1)
    end
    
    local sRoot = sheriff.Character:FindFirstChild("HumanoidRootPart")
    if sRoot then
        pcall(function()
            knife.Events.KnifeStabbed:FireServer()
            knife.Events.HandleTouched:FireServer(sRoot)
        end)
        print("💀 Sheriff muerto: " .. sheriff.Name)
    end
end

local function enLobby()
    local char = LocalPlayer.Character
    if not char then return true end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return true end
    return hrp.Position.Y < -50000
end

local COLORES_ESP = {
    Murderer = Color3.fromRGB(255, 30, 30),
    Sheriff  = Color3.fromRGB(30, 140, 255),
    Innocent = Color3.fromRGB(30, 255, 120),
    Hero     = Color3.fromRGB(255, 255, 0),
    Lobby    = Color3.fromRGB(150, 150, 150),
}

local function aplicarESP(jugador)
    if jugador == LocalPlayer then return end
    if not jugador.Character then return end
    
    local rol = "Lobby"
    if RoleCache and RoleCache[jugador.Name] then
        rol = RoleCache[jugador.Name]
        if rol == "" then rol = "Lobby" end
    end
    
    local color = COLORES_ESP[rol] or COLORES_ESP.Lobby
    
    local anterior = jugador.Character:FindFirstChild("ESP_Highlight")
    if anterior then anterior:Destroy() end
    
    local hl = Instance.new("Highlight")
    hl.Name = "ESP_Highlight"
    hl.Parent = jugador.Character
    hl.Adornee = jugador.Character
    hl.FillColor = color
    hl.FillTransparency = 0.35
    hl.OutlineColor = color
    hl.OutlineTransparency = 0
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
end

task.spawn(function()
    while task.wait(0.3) do
        if ESP_ACTIVO then
            for _, jugador in ipairs(Players:GetPlayers()) do
                if jugador ~= LocalPlayer and jugador.Character then
                    local hum = jugador.Character:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 then
                        aplicarESP(jugador)
                    end
                end
            end
        end
    end
end) 

local highlights = {}

local function whoHasGun()
    for _, player in pairs(Players:GetPlayers()) do
        local backpack = player:FindFirstChild("Backpack")
        local character = player.Character
        if backpack and (backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")) then return player, "equipada" end
        if character and (character:FindFirstChild("Gun") or character:FindFirstChild("Revolver")) then return player, "equipada" end
    end
    return nil, nil
end

local function findDroppedGun()
    local gun = workspace:FindFirstChild("GunDrop", true)
    if gun then return gun end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "GunDrop" then return obj end
    end
    return nil
end

-- ============================================
-- 🔫 AUTO GET GUN
-- ============================================
_G.UZIVERT_AUTO_GET_GUN_ON = false

_G.UZIVERT_AGARRAR_GUN = function()
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        if soyMurderer() then return end
        if tengoGun() then return end
        
        local gunDrop = findDroppedGun()
        if not gunDrop then return end
        
        firetouchinterest(hrp, gunDrop, 0)
        task.wait()
        firetouchinterest(hrp, gunDrop, 1)
    end)
end

_G.UZIVERT_AUTO_GET_GUN_LOOP = RunService.Heartbeat:Connect(function()
    if not _G.UZIVERT_AUTO_GET_GUN_ON then return end
    _G.UZIVERT_AGARRAR_GUN()
    task.wait(0.5)
end)

local function aplicarGunESP(obj, esTirada)
    if not obj then return end
    if obj:FindFirstChild("GunESP_Highlight") then return end
    local hl = Instance.new("Highlight")
    hl.Name = "GunESP_Highlight"
    hl.Parent = obj
    hl.Adornee = obj
    hl.FillColor = Color3.fromRGB(30, 140, 255)
    hl.FillTransparency = 0.4
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.OutlineTransparency = 0
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    table.insert(highlights, hl)
    if not obj:FindFirstChild("GunESP_Billboard") then
        local billboard = Instance.new("BillboardGui")
        billboard.Name = "GunESP_Billboard"
        billboard.Size = UDim2.new(0, 100, 0, 30)
        billboard.StudsOffset = Vector3.new(0, 2, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = obj
        local texto = Instance.new("TextLabel")
        texto.Name = "DistanciaLabel"
        texto.Size = UDim2.new(1, 0, 1, 0)
        texto.BackgroundTransparency = 1
        texto.Text = esTirada and "Dropped Gun!" or "Gun"
        texto.TextColor3 = esTirada and Color3.fromRGB(255, 225, 0) or Color3.fromRGB(30, 140, 255)
        texto.TextStrokeTransparency = 0
        texto.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        texto.Font = Enum.Font.GothamBold
        texto.TextSize = 14
        texto.Parent = billboard
    end
end

local function limpiarGunESP()
    for _, hl in ipairs(highlights) do
        if hl and hl.Parent then hl:Destroy() end
    end
    highlights = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        local bb = obj:FindFirstChild("GunESP_Billboard")
        if bb then bb:Destroy() end
    end
end

task.spawn(function()
    while task.wait(0.3) do
        if not GUN_ESP_ACTIVO then
            limpiarGunESP()
            continue
        end
        local sheriff, estado = whoHasGun()
        if sheriff and sheriff.Character then
            local gunTool = sheriff.Character:FindFirstChild("Gun") or sheriff.Character:FindFirstChild("Revolver")
            if gunTool then aplicarGunESP(gunTool, false) end
        end
        local gunTirada = findDroppedGun()
        if gunTirada then aplicarGunESP(gunTirada, true) end
    end
end)

local rawPing = 60
local smoothedPing = 60
local jitter = 0
local pingSource = "Fallback"
local lastAttempt = -math.huge
local lastGoodSample = -math.huge
local SAMPLE_INTERVAL = 0.4
local STALE_INTERVAL = 5

local function IsFinite(value)
    return type(value) == "number" and value == value
        and value > -math.huge and value < math.huge
end

local function ReadDataPing()
    local network = Stats:FindFirstChild("Network")
    local serverStats = network and network:FindFirstChild("ServerStatsItem")
    local item = serverStats and serverStats:FindFirstChild("Data Ping")
    return item and item:GetValue()
end

local function ReadPerformancePing()
    local performance = Stats:FindFirstChild("PerformanceStats")
    local item = performance and performance:FindFirstChild("Ping")
    return item and item:GetValue()
end

local function ReadNetworkPing()
    local value = LocalPlayer:GetNetworkPing()
    if IsFinite(value) then return value * 1000 end
end

local pingReaders = {
    { ReadDataPing, "Data Ping" },
    { ReadPerformancePing, "Performance" },
    { ReadNetworkPing, "Network" },
}

local function SamplePing()
    pcall(function()
        local now = os.clock()
        if now - lastAttempt < SAMPLE_INTERVAL then return end
        lastAttempt = now
        local value
        for _, reader in ipairs(pingReaders) do
            local ok2, candidate = pcall(reader[1])
            if ok2 and IsFinite(candidate) and candidate > 0 then
                value = candidate
                pingSource = reader[2]
                break
            end
        end
        if not value then return end
        local elapsed = now - lastGoodSample
        local nextRaw = math.clamp(math.floor(value + 0.5), 5, 1200)
        if elapsed > STALE_INTERVAL then
            smoothedPing = nextRaw
            jitter = 0
        else
            local weight = elapsed / SAMPLE_INTERVAL
            jitter = jitter + (math.abs(nextRaw - rawPing) - jitter) * (1 - 0.75 ^ weight)
            local alpha = math.abs(nextRaw - smoothedPing) > 40 and 0.6 or 0.25
            alpha = 1 - (1 - alpha) ^ weight
            smoothedPing = smoothedPing + (nextRaw - smoothedPing) * alpha
        end
        rawPing = nextRaw
        lastGoodSample = now
    end)
end

local function GetPing()
    return math.floor(smoothedPing + 0.5)
end

print("🎃 Parte 3/10 cargada - Roles + ESP + Ping")

local animPresets = {
    ["Default"] = nil,
    ["Vampire"] = {idle1="http://www.roblox.com/asset/?id=1083445855", idle2="http://www.roblox.com/asset/?id=1083450166", walk="http://www.roblox.com/asset/?id=1083473930", run="http://www.roblox.com/asset/?id=1083462077", jump="http://www.roblox.com/asset/?id=1083455352", climb="http://www.roblox.com/asset/?id=1083439238", fall="http://www.roblox.com/asset/?id=1083443587", swim="http://www.roblox.com/asset/?id=1083480626", swimidle="http://www.roblox.com/asset/?id=1083477208", death="http://www.roblox.com/asset/?id=1083445498"},
    ["Hero"] = {idle1="http://www.roblox.com/asset/?id=616111295", idle2="http://www.roblox.com/asset/?id=616113536", walk="http://www.roblox.com/asset/?id=616122287", run="http://www.roblox.com/asset/?id=616117076", jump="http://www.roblox.com/asset/?id=616115533", climb="http://www.roblox.com/asset/?id=616104706", fall="http://www.roblox.com/asset/?id=616108001", swim="http://www.roblox.com/asset/?id=616119391", swimidle="http://www.roblox.com/asset/?id=616110827", death="http://www.roblox.com/asset/?id=616109459"},
    ["Zombie"] = {idle1="http://www.roblox.com/asset/?id=616158929", idle2="http://www.roblox.com/asset/?id=616160636", walk="http://www.roblox.com/asset/?id=616168032", run="http://www.roblox.com/asset/?id=616163682", jump="http://www.roblox.com/asset/?id=616161997", climb="http://www.roblox.com/asset/?id=616156119", fall="http://www.roblox.com/asset/?id=616157476", swim="http://www.roblox.com/asset/?id=616165462", swimidle="http://www.roblox.com/asset/?id=616159068", death="http://www.roblox.com/asset/?id=616162593"},
    ["Ninja"] = {idle1="http://www.roblox.com/asset/?id=656117400", idle2="http://www.roblox.com/asset/?id=656118341", walk="http://www.roblox.com/asset/?id=656121766", run="http://www.roblox.com/asset/?id=656118852", jump="http://www.roblox.com/asset/?id=656117878", climb="http://www.roblox.com/asset/?id=656114359", fall="http://www.roblox.com/asset/?id=656115606", swim="http://www.roblox.com/asset/?id=656120249", swimidle="http://www.roblox.com/asset/?id=656117506", death="http://www.roblox.com/asset/?id=656114954"},
    ["Astronaut"] = {idle1="http://www.roblox.com/asset/?id=891621366", idle2="http://www.roblox.com/asset/?id=891633237", walk="http://www.roblox.com/asset/?id=891667138", run="http://www.roblox.com/asset/?id=891636393", jump="http://www.roblox.com/asset/?id=891627522", climb="http://www.roblox.com/asset/?id=891609353", fall="http://www.roblox.com/asset/?id=891617961", swim="http://www.roblox.com/asset/?id=891661529", swimidle="http://www.roblox.com/asset/?id=891620272", death="http://www.roblox.com/asset/?id=891615817"},
    ["Cartoon"] = {idle1="http://www.roblox.com/asset/?id=742637544", idle2="http://www.roblox.com/asset/?id=742638445", walk="http://www.roblox.com/asset/?id=742640026", run="http://www.roblox.com/asset/?id=742638842", jump="http://www.roblox.com/asset/?id=742637942", climb="http://www.roblox.com/asset/?id=742636889", fall="http://www.roblox.com/asset/?id=742637151", swim="http://www.roblox.com/asset/?id=742639702", swimidle="http://www.roblox.com/asset/?id=742637601", death="http://www.roblox.com/asset/?id=742637806"},
    ["Pirate"] = {idle1="http://www.roblox.com/asset/?id=750781874", idle2="http://www.roblox.com/asset/?id=750782770", walk="http://www.roblox.com/asset/?id=750785693", run="http://www.roblox.com/asset/?id=750783738", jump="http://www.roblox.com/asset/?id=750782230", climb="http://www.roblox.com/asset/?id=750779899", fall="http://www.roblox.com/asset/?id=750780242", swim="http://www.roblox.com/asset/?id=750784505", swimidle="http://www.roblox.com/asset/?id=750781415", death="http://www.roblox.com/asset/?id=750780242"},
    ["Werewolf"] = {idle1="http://www.roblox.com/asset/?id=1083195517", idle2="http://www.roblox.com/asset/?id=1083214717", walk="http://www.roblox.com/asset/?id=1083178339", run="http://www.roblox.com/asset/?id=1083216690", jump="http://www.roblox.com/asset/?id=1083218792", climb="http://www.roblox.com/asset/?id=1083182000", fall="http://www.roblox.com/asset/?id=1083189019", swim="http://www.roblox.com/asset/?id=1083203763", swimidle="http://www.roblox.com/asset/?id=1083190006", death="http://www.roblox.com/asset/?id=1083183276"},
    ["OG Run"] = {run="http://www.roblox.com/asset/?id=9801814462"},
    ["Jolly"] = {idle1="http://www.roblox.com/asset/?id=136145727878709", idle2="http://www.roblox.com/asset/?id=136145727878709", walk="http://www.roblox.com/asset/?id=83277136078444", run="http://www.roblox.com/asset/?id=124419804298310", jump="http://www.roblox.com/asset/?id=122115816220842", climb="http://www.roblox.com/asset/?id=107190574095036", fall="http://www.roblox.com/asset/?id=85263802503331"},
    ["Cute Kawaii"] = {idle1="http://www.roblox.com/asset/?id=72311682331639", idle2="http://www.roblox.com/asset/?id=72311682331639", walk="http://www.roblox.com/asset/?id=107212872423561", run="http://www.roblox.com/asset/?id=118582510545072", jump="http://www.roblox.com/asset/?id=112952548321695", climb="http://www.roblox.com/asset/?id=126383408493776", fall="http://www.roblox.com/asset/?id=83307333809322"},
    ["Doll 3.0"] = {idle1="http://www.roblox.com/asset/?id=83032187271383", idle2="http://www.roblox.com/asset/?id=83032187271383", walk="http://www.roblox.com/asset/?id=78434960966537", run="http://www.roblox.com/asset/?id=129768396663808", jump="http://www.roblox.com/asset/?id=75369057994828", climb="http://www.roblox.com/asset/?id=112371892133970", fall="http://www.roblox.com/asset/?id=81027444073311"},
    ["Victoria Model"] = {idle1="http://www.roblox.com/asset/?id=132069965396465", idle2="http://www.roblox.com/asset/?id=132069965396465", walk="http://www.roblox.com/asset/?id=84814915379579", run="http://www.roblox.com/asset/?id=84814915379579", jump="http://www.roblox.com/asset/?id=78163261581163", climb="http://www.roblox.com/asset/?id=87772134905508", fall="http://www.roblox.com/asset/?id=110073924253388"},
    ["Bike/Bicyclist"] = {idle1="http://www.roblox.com/asset/?id=126390120399173", idle2="http://www.roblox.com/asset/?id=136791517336633", walk="http://www.roblox.com/asset/?id=98707881660541", run="http://www.roblox.com/asset/?id=102775737211919", jump="http://www.roblox.com/asset/?id=129144847881258", climb="http://www.roblox.com/asset/?id=88267082364595", fall="http://www.roblox.com/asset/?id=110684787086498"},
    ["Animal"] = {idle1="http://www.roblox.com/asset/?id=128838183008466", idle2="http://www.roblox.com/asset/?id=99689776099970", walk="http://www.roblox.com/asset/?id=112238064449133", run="http://www.roblox.com/asset/?id=97412731442167", jump="http://www.roblox.com/asset/?id=123565665274439", climb="http://www.roblox.com/asset/?id=75085836535654", fall="http://www.roblox.com/asset/?id=124705831982259"},
    ["It-Girl Essential Model"] = {idle1="http://www.roblox.com/asset/?id=132232079260125", idle2="http://www.roblox.com/asset/?id=102440789796215", walk="http://www.roblox.com/asset/?id=86579666661215", run="http://www.roblox.com/asset/?id=83336349930143", jump="http://www.roblox.com/asset/?id=103382156539106", climb="http://www.roblox.com/asset/?id=77385815954046", fall="http://www.roblox.com/asset/?id=127262648208409"},
    ["Oldschool"] = {idle1="http://www.roblox.com/asset/?id=10921230744", idle2="http://www.roblox.com/asset/?id=10921232093", walk="http://www.roblox.com/asset/?id=10921244891", run="http://www.roblox.com/asset/?id=10921240218", jump="http://www.roblox.com/asset/?id=10921242013", climb="http://www.roblox.com/asset/?id=10921229866", fall="http://www.roblox.com/asset/?id=10921241244"},
    ["Spider"] = {idle1="http://www.roblox.com/asset/?id=112316814377814", idle2="http://www.roblox.com/asset/?id=103439018552145", walk="http://www.roblox.com/asset/?id=109976439277879", run="http://www.roblox.com/asset/?id=119985832593347", jump="http://www.roblox.com/asset/?id=87979233462906", climb="http://www.roblox.com/asset/?id=119278342251995", fall="http://www.roblox.com/asset/?id=71112238570777"},
    ["Joy"] = {idle1="http://www.roblox.com/asset/?id=119957475250242", idle2="http://www.roblox.com/asset/?id=101200477339169", walk="http://www.roblox.com/asset/?id=112597572150963", run="http://www.roblox.com/asset/?id=96521659811743", jump="http://www.roblox.com/asset/?id=82500357520736", climb="http://www.roblox.com/asset/?id=110061716873830", fall="http://www.roblox.com/asset/?id=132095139090357"},
    ["Flying Aura"] = {idle1="http://www.roblox.com/asset/?id=122426844584505", idle2="http://www.roblox.com/asset/?id=122426844584505", walk="http://www.roblox.com/asset/?id=83077254246622", run="http://www.roblox.com/asset/?id=77053251062908", jump="http://www.roblox.com/asset/?id=125422018244301", climb="http://www.roblox.com/asset/?id=95973965948476", fall="http://www.roblox.com/asset/?id=109790195947848"},
    ["FHA V2"] = {idle1="http://www.roblox.com/asset/?id=77320840005481", idle2="http://www.roblox.com/asset/?id=77320840005481", walk="http://www.roblox.com/asset/?id=134493251445479", run="http://www.roblox.com/asset/?id=122214533401932", jump="http://www.roblox.com/asset/?id=80078165493816", climb="http://www.roblox.com/asset/?id=114562994724647", fall="http://www.roblox.com/asset/?id=98383265864436"},
    ["Silent Nurse"] = {idle1="http://www.roblox.com/asset/?id=111047244862844", idle2="http://www.roblox.com/asset/?id=111047244862844", walk="http://www.roblox.com/asset/?id=94196382152901", run="http://www.roblox.com/asset/?id=94196382152901", jump="http://www.roblox.com/asset/?id=106098057235980", climb="http://www.roblox.com/asset/?id=108985375609705", fall="http://www.roblox.com/asset/?id=131579609334755"},
    ["Supermodel"] = {idle1="http://www.roblox.com/asset/?id=91917730726110", idle2="http://www.roblox.com/asset/?id=91917730726110", walk="http://www.roblox.com/asset/?id=90320132970213", run="http://www.roblox.com/asset/?id=112051258179255", jump="http://www.roblox.com/asset/?id=91931403363860", climb="http://www.roblox.com/asset/?id=82728029306069", fall="http://www.roblox.com/asset/?id=119173466228299"},
    ["Enchanted Fairy"] = {idle1="http://www.roblox.com/asset/?id=73650178233095", idle2="http://www.roblox.com/asset/?id=73650178233095", walk="http://www.roblox.com/asset/?id=94547195663763", run="http://www.roblox.com/asset/?id=76909584337943", jump="http://www.roblox.com/asset/?id=120533712803667", climb="http://www.roblox.com/asset/?id=140663406485180", fall="http://www.roblox.com/asset/?id=100947971756348"},
    ["Furry"] = {idle1="http://www.roblox.com/asset/?id=111821292044705", idle2="http://www.roblox.com/asset/?id=111821292044705", walk="http://www.roblox.com/asset/?id=104011441852459", run="http://www.roblox.com/asset/?id=87770060317862", jump="http://www.roblox.com/asset/?id=102635582722041", climb="http://www.roblox.com/asset/?id=76660530164497", fall="http://www.roblox.com/asset/?id=137079985547592"},
    ["Vlada Model"] = {idle1="http://www.roblox.com/asset/?id=100139116433530", idle2="http://www.roblox.com/asset/?id=100139116433530", walk="http://www.roblox.com/asset/?id=77983757225444", run="http://www.roblox.com/asset/?id=116717848244930", jump="http://www.roblox.com/asset/?id=120751055172567", climb="http://www.roblox.com/asset/?id=70966616077778", fall="http://www.roblox.com/asset/?id=136118518255777"},
    ["R6 Converter"] = {idle1="http://www.roblox.com/asset/?id=90040240627854", idle2="http://www.roblox.com/asset/?id=90040240627854", walk="http://www.roblox.com/asset/?id=92149852708428", run="http://www.roblox.com/asset/?id=72259383092959", jump="http://www.roblox.com/asset/?id=130519980521511", climb="http://www.roblox.com/asset/?id=80369171706383", fall="http://www.roblox.com/asset/?id=130011792193300"},
}

local allOptions = {
    "Default", "Vampire", "Hero", "Zombie", "Ninja", "Astronaut", "Cartoon", "Pirate", "Werewolf",
    "OG Run", "Jolly", "Cute Kawaii", "Doll 3.0", "Victoria Model", "Bike/Bicyclist", "Animal",
    "It-Girl Essential Model", "Oldschool", "Spider", "Joy", "Flying Aura", "FHA V2",
    "Silent Nurse", "Supermodel", "Enchanted Fairy", "Furry", "Vlada Model", "R6 Converter"
}

local animState = {all="Default", idle="Default", walk="Default", run="Default", jump="Default", climb="Default", fall="Default", swim="Default", swimidle="Default", death="Default"}
local originalAnims = {}

local animMap = {
    idle     = { folder = "idle",     slots = { {child="Animation1",origKey="idle1"}, {child="Animation2",origKey="idle2"} } },
    walk     = { folder = "walk",     slots = { {child="WalkAnim",  origKey="walk"}  } },
    run      = { folder = "run",      slots = { {child="RunAnim",   origKey="run"}   } },
    jump     = { folder = "jump",     slots = { {child="JumpAnim",  origKey="jump"}  } },
    climb    = { folder = "climb",    slots = { {child="ClimbAnim", origKey="climb"} } },
    fall     = { folder = "fall",     slots = { {child="FallAnim",  origKey="fall"}  } },
    swim     = { folder = "swim",     slots = { {child="Swim",      origKey="swim"}  } },
    swimidle = { folder = "swimidle", slots = { {child="SwimIdle",  origKey="swimidle"} } },
    death    = { folder = "death",    slots = { {child="DeathAnim", origKey="death"} } },
}

local function saveOriginalAnims()
    local char = LocalPlayer.Character
    if not char then return end
    local Animate = char:FindFirstChild("Animate")
    if not Animate then return end
    for _, info in pairs(animMap) do
        local folder = Animate:FindFirstChild(info.folder)
        if folder then
            for _, slot in ipairs(info.slots) do
                local anim = folder:FindFirstChild(slot.child)
                if anim and anim.AnimationId and anim.AnimationId ~= "" then
                    originalAnims[slot.origKey] = anim.AnimationId
                end
            end
        end
    end
end

local function applyAnimations()
    if not ANIMS_ACTIVO then return end
    local char = LocalPlayer.Character
    if not char then return end
    local Animate = char:FindFirstChild("Animate")
    if not Animate then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        for _, track in pairs(hum:GetPlayingAnimationTracks()) do track:Stop(0) end
    end
    Animate.Disabled = true
    task.wait(0.1)
    for animType, info in pairs(animMap) do
        local presetName = "Default"
        if animState[animType] ~= "Default" then
            presetName = animState[animType]
        elseif animState.all ~= "Default" then
            presetName = animState.all
        end
        local preset = animPresets[presetName]
        local folder = Animate:FindFirstChild(info.folder)
        if folder then
            for _, slot in ipairs(info.slots) do
                local anim = folder:FindFirstChild(slot.child)
                if anim then
                    local newId
                    if presetName == "Default" then
                        newId = originalAnims[slot.origKey]
                    elseif preset and preset[slot.origKey] then
                        newId = preset[slot.origKey]
                    end
                    if newId then anim.AnimationId = newId end
                end
            end
        end
    end
    Animate.Disabled = false
end

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    saveOriginalAnims()
    if ANIMS_ACTIVO then applyAnimations() end
end)

task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    if hum.WalkSpeed ~= WALKSPEED_VALOR then hum.WalkSpeed = WALKSPEED_VALOR end
                    if NOCLIP_ACTIVO then
                        for _, part in ipairs(char:GetDescendants()) do
                            if part:IsA("BasePart") and part.CanCollide then part.CanCollide = false end
                        end
                    end
                end
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.05) do
        if SPINBOT_ACTIVO then
            pcall(function()
                local char = LocalPlayer.Character
                if char then
                    local hrp = char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, math.rad(hrp.Orientation.Y + 90), 0)
                    end
                end
            end)
        end
    end
end)

local function hayMurdererCerca(posicion, rango)
    local murderer = detectarMurderer()
    if not murderer or not murderer.Character then return false end
    local hrp = murderer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    return (hrp.Position - posicion).Magnitude <= rango
end

local function buscarGunDrop()
    local gun = workspace:FindFirstChild("GunDrop", true)
    if gun then return gun end
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name == "GunDrop" then return obj end
    end
    return nil
end

local function grabarGun()
    if soyMurderer() then print("🔪 Soy Murderer") return end
    if tengoGun() then print("✅ Ya tengo la Gun") return end
    if enLobby() then print("🏠 Estoy en el lobby") return end

    local gunDrop = buscarGunDrop()
    if not gunDrop then print("❌ No hay GunDrop") return end

    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local posGun
    if gunDrop:IsA("BasePart") then
        posGun = gunDrop.Position
    elseif gunDrop:FindFirstChild("Handle") then
        posGun = gunDrop.Handle.Position
    else
        local ok, pivot = pcall(function() return gunDrop:GetPivot().Position end)
        if ok and pivot then posGun = pivot else return end
    end

    if GRAB_ANTI_MURDERER and hayMurdererCerca(posGun, GRAB_MURDERER_RANGO) then
        print("⚠️ Murderer cerca")
        return
    end

    pcall(function()
        gunDrop.CanCollide = false
        gunDrop.CFrame = hrp.CFrame
        gunDrop.Velocity = Vector3.new(0, 0, 0)
        gunDrop.RotVelocity = Vector3.new(0, 0, 0)
    end)

    print("🍬 Gun atraída a tus pies")

    task.wait(0.15)

    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local gunTool = (backpack and (backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")))
        or char:FindFirstChild("Gun")
        or char:FindFirstChild("Revolver")

    if gunTool then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:EquipTool(gunTool)
            print("✅ Gun equipada")
        end
    end
end

local BotonGrab = Instance.new("TextButton")
BotonGrab.Name = "UzivertGrabGun"
BotonGrab.Size = UDim2.new(0, 140, 0, 45)
BotonGrab.Position = UDim2.new(0, 30, 0.5, 40)
BotonGrab.BackgroundColor3 = COLORES.Morado3
BotonGrab.BackgroundTransparency = 0.5
BotonGrab.Text = "🍬 GRAB GUN"
BotonGrab.TextColor3 = COLORES.Texto
BotonGrab.Font = Enum.Font.GothamBold
BotonGrab.TextSize = 14
BotonGrab.BorderSizePixel = 0
BotonGrab.Active = true
BotonGrab.Draggable = true
BotonGrab.Visible = false
BotonGrab.ZIndex = 998
BotonGrab.ClipsDescendants = true
BotonGrab.Parent = ScreenGui

local cBG = Instance.new("UICorner")
cBG.CornerRadius = UDim.new(0, 10)
cBG.Parent = BotonGrab

local sBG = Instance.new("UIStroke")
sBG.Color = COLORES.Naranja1
sBG.Thickness = 2
sBG.Transparency = 0.2
sBG.Parent = BotonGrab

task.spawn(function()
    while task.wait() do
        local t = tick()
        local a = (math.sin(t * 1.5) + 1) / 2
        sBG.Color = COLORES.Naranja3:Lerp(COLORES.Morado2, a)
        sBG.Transparency = 0.4 - a * 0.3
    end
end)

local BotonCandado = Instance.new("TextButton")
BotonCandado.Name = "UzivertGrabLock"
BotonCandado.Size = UDim2.new(0, 22, 0, 22)
BotonCandado.Position = UDim2.new(1, -24, 0, 2)
BotonCandado.BackgroundColor3 = COLORES.Morado3
BotonCandado.BackgroundTransparency = 0.3
BotonCandado.Text = "🔓"
BotonCandado.TextColor3 = COLORES.Texto
BotonCandado.Font = Enum.Font.GothamBold
BotonCandado.TextSize = 12
BotonCandado.BorderSizePixel = 0
BotonCandado.ZIndex = 999
BotonCandado.Parent = BotonGrab

local cLock = Instance.new("UICorner")
cLock.CornerRadius = UDim.new(1, 0)
cLock.Parent = BotonCandado

local BLOQUEADO = CONFIG.AutoGrabLock or false

local function actualizarCandado()
    if BLOQUEADO then
        BotonGrab.Draggable = false
        BotonCandado.Text = "🔒"
        BotonCandado.BackgroundColor3 = COLORES.Rojo
        BotonCandado.BackgroundTransparency = 0.3
    else
        BotonGrab.Draggable = true
        BotonCandado.Text = "🔓"
        BotonCandado.BackgroundColor3 = COLORES.Morado3
        BotonCandado.BackgroundTransparency = 0.3
    end
end

actualizarCandado()

BotonCandado.MouseButton1Click:Connect(function()
    BLOQUEADO = not BLOQUEADO
    CONFIG.AutoGrabLock = BLOQUEADO
    actualizarCandado()
    guardarConfig()
end)

if CONFIG.AutoGrabPos then
    local p = CONFIG.AutoGrabPos
    pcall(function() BotonGrab.Position = UDim2.new(p[1], p[2], p[3], p[4]) end)
end

task.spawn(function()
    while task.wait(2) do
        if not BLOQUEADO then
            pcall(function()
                CONFIG.AutoGrabPos = {BotonGrab.Position.X.Scale, BotonGrab.Position.X.Offset, BotonGrab.Position.Y.Scale, BotonGrab.Position.Y.Offset}
                guardarConfig()
            end)
        end
    end
end)

BotonGrab.MouseButton1Click:Connect(grabarGun)

task.spawn(function()
    while task.wait(0.3) do
        if CONFIG.AutoGrabMostrar == false then
            if BotonGrab.Visible then BotonGrab.Visible = false end
            continue
        end
        local gunDrop = buscarGunDrop()
        local tieneGun = tengoGun()
        local soyMurder = soyMurderer()
        local lobby = enLobby()
        if gunDrop and not tieneGun and not soyMurder and not lobby then
            if not BotonGrab.Visible then BotonGrab.Visible = true end
            local posGun = gunDrop:IsA("BasePart") and gunDrop.Position or gunDrop:GetPivot().Position
            if GRAB_ANTI_MURDERER and hayMurdererCerca(posGun, GRAB_MURDERER_RANGO) then
                BotonGrab.Text = "⚠️ MURDERER CERCA"
            else
                BotonGrab.Text = "🍬 GRAB GUN"
            end
        else
            if BotonGrab.Visible then BotonGrab.Visible = false end
        end
    end
end)

-- ============================================
-- 🌀 FLING NEXUS (con HERO)
-- ============================================
local FLING_TIMEOUT = 2.5
local FLING_ACTIVO = false
local FLING_ALL_ACTIVO = false
local FLING_TARGET = nil
local FLING_THREAD = nil
local FLING_IN_PROGRESS = false

local function FlingPlayer(targetPlayer)
    FLING_IN_PROGRESS = true
    local myChar = LocalPlayer.Character
    if not myChar then FLING_IN_PROGRESS = false return end
    local myHum = myChar:FindFirstChildOfClass("Humanoid")
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not (myHum and myRoot) then FLING_IN_PROGRESS = false return end

    local targetChar = targetPlayer.Character
    if not targetChar then FLING_IN_PROGRESS = false return end
    local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
    local targetRoot = targetHum and targetHum.RootPart
    local targetHead = targetChar:FindFirstChild("Head")
    local accessory = targetChar:FindFirstChildOfClass("Accessory")
    local handle = accessory and accessory:FindFirstChild("Handle")

    local oldPos = myRoot.CFrame

    repeat
        task.wait()
        workspace.CurrentCamera.CameraSubject = targetHead or handle or targetHum
    until workspace.CurrentCamera.CameraSubject == (targetHead or handle or targetHum)

    local function forcePosition(basePart, offset, angle)
        local targetCF = CFrame.new(basePart.Position) * offset * angle
        myRoot.CFrame = targetCF
        myChar:SetPrimaryPartCFrame(targetCF)
        myRoot.Velocity = Vector3.new(9e7, 9e8, 9e7)
        myRoot.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
    end

    local function flingBasePart(basePart)
        local start = tick()
        local ang = 0
        repeat
            if myRoot and targetHum then
                ang = ang + 100
                for _, off in ipairs{
                    CFrame.new(0, 1.5, 0),
                    CFrame.new(0, -1.5, 0),
                    CFrame.new(2.25, 1.5, -2.25),
                    CFrame.new(-2.25, -1.5, 2.25)
                } do
                    forcePosition(basePart, off + targetHum.MoveDirection, CFrame.Angles(math.rad(ang), 0, 0))
                    task.wait()
                end
            end
        until basePart.Velocity.Magnitude > 500 or tick() - start > FLING_TIMEOUT
    end

    local bv = Instance.new("BodyVelocity")
    bv.Name = "FlingVelocity"
    bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Parent = myRoot
    myHum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

    local targetPart = targetRoot or targetHead or handle
    if targetPart then flingBasePart(targetPart) end

    bv:Destroy()
    myHum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

    repeat
        task.wait()
        workspace.CurrentCamera.CameraSubject = myHum
    until workspace.CurrentCamera.CameraSubject == myHum

    repeat
        local cf = oldPos * CFrame.new(0, 0.5, 0)
        myRoot.CFrame = cf
        myChar:SetPrimaryPartCFrame(cf)
        myHum:ChangeState(Enum.HumanoidStateType.GettingUp)
        for _, part in ipairs(myChar:GetChildren()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
        task.wait()
    until (myRoot.Position - oldPos.p).Magnitude < 25

    FLING_IN_PROGRESS = false
end

local function FlingAllLoop()
    FLING_IN_PROGRESS = true
    local players = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(players, plr)
        end
    end
    if #players == 0 then FLING_IN_PROGRESS = false return end

    local index = 1
    while FLING_ALL_ACTIVO do
        local target = players[index]
        if target and target.Character and target.Character:FindFirstChild("Humanoid") 
           and target.Character.Humanoid.Health > 0 then
            FLING_ACTIVO = true
            FLING_TARGET = target
            FlingPlayer(target)
            FLING_ACTIVO = false
        end
        index = index % #players + 1
        task.wait(0.5)
    end
    FLING_IN_PROGRESS = false
end

local function StopFling()
    FLING_ACTIVO = false
    FLING_ALL_ACTIVO = false
    if FLING_THREAD then
        task.cancel(FLING_THREAD)
        FLING_THREAD = nil
    end
    FLING_IN_PROGRESS = false
end

local function IniciarFling(target)
    if FLING_IN_PROGRESS then print("⚠️ Fling en progreso") return end
    StopFling()
    if target == "all" then
        FLING_ALL_ACTIVO = true
        FLING_THREAD = task.spawn(FlingAllLoop)
    elseif target == "Murderer" then
        local m = detectarMurderer()
        if m then
            FLING_ACTIVO = true
            FLING_TARGET = m
            FLING_THREAD = task.spawn(FlingPlayer, m)
        end
    elseif target == "Sheriff" then
        local s = detectarSheriff()
        if not s then s = detectarHero() end
        if s then
            FLING_ACTIVO = true
            FLING_TARGET = s
            FLING_THREAD = task.spawn(FlingPlayer, s)
        end
    end
end

print("🎃 Parte 4/10 cargada - Anims + Grab + Fling Nexus")

local function obtenerGun()
    local char = LocalPlayer.Character
    if not char then return nil end
    local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")
    if gun then return gun end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        gun = backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")
        if gun then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum:EquipTool(gun) end
            return gun
        end
    end
    return nil
end

local function obtenerShootRemote(gun)
    if not gun then return nil end
    return gun:FindFirstChild("Shoot", true)
end

local function obtenerOriginArma(gun)
    if not gun then return Camera.CFrame end
    local handle = gun:FindFirstChild("Handle")
    if handle then return handle.CFrame end
    return Camera.CFrame
end

local function dispararV1()
    local gun = obtenerGun()
    if not gun then print("❌ No tenés Gun") return end
    
    local murderer = detectarMurderer()
    if not murderer or not murderer.Character then print("❌ No hay Murderer") return end
    
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local targetChar = murderer.Character
    local targetHrp = targetChar:FindFirstChild("HumanoidRootPart")
    local hum = targetChar:FindFirstChildOfClass("Humanoid")
    if not hrp or not targetHrp or not hum then return end
    
    local dist = (hrp.Position - targetHrp.Position).Magnitude
    if dist > SHOOT_RANGO_MAX or dist < SHOOT_RANGO_MIN then return end
    
    local shoot = obtenerShootRemote(gun)
    if not shoot then print("❌ No hay remote Shoot") return end
    
    local origin = obtenerOriginArma(gun)
    
    local ping = 0
    pcall(function()
        ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
    end)
    
    local VELOCIDAD_BALA = 600
    local tiempoVuelo = dist / VELOCIDAD_BALA
    local tiempoTotal = tiempoVuelo + ping
    
    local torsoPart = targetChar:FindFirstChild("UpperTorso") 
                   or targetChar:FindFirstChild("Torso") 
                   or targetHrp
    local basePos = torsoPart.Position
    
    local vel = targetHrp.AssemblyLinearVelocity
    local velMag = vel.Magnitude
    
    local factor = 1.5
    if velMag > 30 then
        factor = factor * 1.2
    elseif velMag < 5 then
        factor = factor * 0.8
    end
    
    if velMag > 1 then
        local prediccion = vel * tiempoTotal * factor
        basePos = basePos + Vector3.new(prediccion.X, 0, prediccion.Z)
    elseif hum.MoveDirection.Magnitude > 0 then
        local prediccion = hum.MoveDirection * hum.WalkSpeed * tiempoTotal * factor
        basePos = basePos + Vector3.new(prediccion.X, 0, prediccion.Z)
    end
    
    if basePos.X ~= basePos.X then return end
    if (basePos - torsoPart.Position).Magnitude > 100 then return end
    
    local puntos = {
        basePos,
        basePos + Vector3.new(0, 0.6, 0),
        basePos + Vector3.new(0, -0.3, 0),
        basePos + Vector3.new(1.0, 0, 0),
        basePos + Vector3.new(-1.0, 0, 0),
    }
    
    for i, punto in ipairs(puntos) do
        pcall(function()
            shoot:FireServer(origin, CFrame.new(punto))
        end)
        task.wait(0.025)
    end
    
    print(string.format("🎯 Shoot → %s | Dist: %d | Vel: %d | Torso: %s",
        murderer.Name,
        math.floor(dist),
        math.floor(velMag),
        torsoPart.Name
    ))
end

local function dispararV2()
    local gun = obtenerGun()
    if not gun then print("❌ No tienes Gun") return end
    local murderer = detectarMurderer()
    if not murderer or not murderer.Character then print("❌ No hay Murderer") return end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    local targetHrp = murderer.Character:FindFirstChild("HumanoidRootPart")
    local hum = murderer.Character:FindFirstChildOfClass("Humanoid")
    if not hrp or not targetHrp or not hum then return end
    local dist = (hrp.Position - targetHrp.Position).Magnitude
    if dist > SHOOT_RANGO_MAX or dist < SHOOT_RANGO_MIN then return end
    local shoot = obtenerShootRemote(gun)
    if not shoot then print("❌ No hay remote Shoot") return end
    local origin = obtenerOriginArma(gun)
    
    local basePos = targetHrp.Position + Vector3.new(0, SHOOT_ALTURA, 0)
    
    local ping = 0
    pcall(function()
        ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
    end)
    
    local tiempoVuelo = dist / 1000
    local tiempoTotal = tiempoVuelo + ping
    
    local vel = targetHrp.AssemblyLinearVelocity
    local velMag = vel.Magnitude
    
    local predFactorDinamico = 1.5
    if velMag > 30 then
        predFactorDinamico = 1.5 * 1.2
    elseif velMag < 5 then
        predFactorDinamico = 1.5 * 0.8
    end
    
    if velMag > 1 then
        basePos = basePos + (vel * tiempoTotal * predFactorDinamico)
    elseif hum.MoveDirection.Magnitude > 0 then
        basePos = basePos + (hum.MoveDirection * hum.WalkSpeed * tiempoTotal * predFactorDinamico)
    end
    
    local estado = hum:GetState()
    if estado == Enum.HumanoidStateType.Jumping or estado == Enum.HumanoidStateType.Freefall then
        local g = workspace.Gravity
        local yExtra = vel.Y * tiempoTotal + 0.5 * (-g) * tiempoTotal * tiempoTotal
        basePos = basePos + Vector3.new(0, yExtra, 0)
    end
    
    local dirMov
    if velMag > 1 then
        dirMov = vel.Unit
    else
        dirMov = hum.MoveDirection.Unit
    end
    
    local puntos = {
        basePos,
        basePos + Vector3.new(0, 1.0, 0),
        basePos + Vector3.new(0, -0.5, 0),
        basePos + (dirMov * 1.5),
        basePos - (dirMov * 1.5),
        basePos + Vector3.new(1.5, 0, 0),
        basePos + Vector3.new(-1.5, 0, 0),
    }
    
    for i, punto in ipairs(puntos) do
        pcall(function() shoot:FireServer(origin, CFrame.new(punto)) end)
        task.wait(0.025)
    end
    
    print("🎯 Shoot Avz → " .. murderer.Name .. " | 7 tiros | Dist: " .. math.floor(dist))
end


task.spawn(function()
    while task.wait(0.15) do
        if SHOOT_AUTO then pcall(dispararV2) end
    end
end)

-- ============================================
-- 💥 KILL ALL (Murderer only)
-- ============================================
local function KillAll()
    if not soyMurderer() then
        print("❌ Kill All: No sos Murderer")
        return false
    end

    local char = LocalPlayer.Character
    if not char then return false end

    local knife = char:FindFirstChild("Knife")
    if not knife then
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if backpack then
            knife = backpack:FindFirstChild("Knife")
        end
    end

    if not knife then
        print("❌ Kill All: No tenés Knife")
        return false
    end

    local knifeRemote = knife:FindFirstChild("HandleTouched", true)
    if not knifeRemote then
        for _, obj in ipairs(knife:GetDescendants()) do
            if obj:IsA("RemoteEvent") then
                knifeRemote = obj
                break
            end
        end
    end

    local killed = 0
    for _, enemy in ipairs(Players:GetPlayers()) do
        if enemy ~= LocalPlayer and enemy.Character then
            local eRoot = enemy.Character:FindFirstChild("HumanoidRootPart")
            local eHum = enemy.Character:FindFirstChildOfClass("Humanoid")
            if eRoot and eHum and eHum.Health > 0 then
                pcall(function()
                    eRoot.CFrame = knife.Handle.CFrame
                    eRoot.Velocity = Vector3.new(0, 0, 0)
                    eRoot.RotVelocity = Vector3.new(0, 0, 0)
                end)

                if knifeRemote then
                    pcall(function()
                        knifeRemote:FireServer(eRoot)
                    end)
                end

                killed = killed + 1
                task.wait(0.05)
            end
        end
    end

    print("💥 Kill All → " .. killed .. " objetivos")
    return true
end

task.spawn(function()
    while task.wait(1) do
        if KILL_ALL_ACTIVO and soyMurderer() then
            pcall(KillAll)
        end
    end
end)

-- ============================================
-- 🔪 KNIFE AURA
-- ============================================
local function getKnifeRemoteV47()
    local char = LocalPlayer.Character
    if not char then return nil end
    local knife = char:FindFirstChild("Knife")
    if not knife then
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if backpack then knife = backpack:FindFirstChild("Knife") end
    end
    if not knife then return nil end
    local events = knife:FindFirstChild("Events")
    if events then
        local thrown = events:FindFirstChild("KnifeThrown")
        if thrown then return thrown end
    end
    return knife:FindFirstChild("HandleTouched", true)
end

task.spawn(function()
    while task.wait(0.1) do
        if CONFIG.KnifeAura and soyMurderer() then
            local char = LocalPlayer.Character
            local knife = char and char:FindFirstChild("Knife")
            if knife and knife:FindFirstChild("Handle") then
                for _, enemy in ipairs(Players:GetPlayers()) do
                    if enemy ~= LocalPlayer and enemy.Character then
                        local eRoot = enemy.Character:FindFirstChild("HumanoidRootPart")
                        local eHum = enemy.Character:FindFirstChildOfClass("Humanoid")
                        if eRoot and eHum and eHum.Health > 0 then
                            local dist = (eRoot.Position - char.HumanoidRootPart.Position).Magnitude
                            if dist <= (CONFIG.KnifeAuraDist or 15) then
                                eRoot.CFrame = knife.Handle.CFrame
                                eRoot.Velocity = Vector3.new(0,0,0)
                                eRoot.RotVelocity = Vector3.new(0,0,0)
                                local remote = getKnifeRemoteV47()
                                if remote then pcall(function() remote:FireServer(eRoot) end) end
                            end
                        end
                    end
                end
            end
        end
    end
end)

print("🔪 Knife Aura loop iniciado")

print("🎃 Parte 5/10 cargada - Shoot + Kill All")

-- ============================================
-- 🎯 BOTÓN SHOOT MURDERER (RGB)
-- ============================================
local BotonShoot = Instance.new("TextButton")
BotonShoot.Name = "UzivertShootMurder"
BotonShoot.Size = UDim2.new(0, 160, 0, 50)
BotonShoot.Position = UDim2.new(0, 30, 0.5, 100)
BotonShoot.BackgroundColor3 = COLORES.Fondo
BotonShoot.BackgroundTransparency = 0.3
BotonShoot.Text = "SHOOT MURDERER"
BotonShoot.TextColor3 = COLORES.Texto
BotonShoot.Font = Enum.Font.GothamBold
BotonShoot.TextSize = 13
BotonShoot.BorderSizePixel = 0
BotonShoot.Active = true
BotonShoot.Draggable = true
BotonShoot.Visible = SHOOT_MOSTRAR
BotonShoot.ZIndex = 998
BotonShoot.ClipsDescendants = true
BotonShoot.Parent = ScreenGui

local cBS = Instance.new("UICorner")
cBS.CornerRadius = UDim.new(0, 10)
cBS.Parent = BotonShoot

local sBS = Instance.new("UIStroke")
sBS.Color = COLORES.Naranja1
sBS.Thickness = 2
sBS.Transparency = 0.2
sBS.Parent = BotonShoot

task.spawn(function()
    while BotonShoot.Parent do
        local t = tick()
        local a = (math.sin(t * 1.5) + 1) / 2
        sBS.Color = COLORES.Naranja1:Lerp(COLORES.Morado2, a)
        sBS.Transparency = 0.4 - a * 0.3
        task.wait(0.05)
    end
end)

local BotonCandadoShoot = Instance.new("TextButton")
BotonCandadoShoot.Size = UDim2.new(0, 22, 0, 22)
BotonCandadoShoot.Position = UDim2.new(1, -24, 0, 2)
BotonCandadoShoot.BackgroundColor3 = COLORES.Morado3
BotonCandadoShoot.BackgroundTransparency = 0.3
BotonCandadoShoot.Text = "🔓"
BotonCandadoShoot.TextColor3 = COLORES.Texto
BotonCandadoShoot.Font = Enum.Font.GothamBold
BotonCandadoShoot.TextSize = 12
BotonCandadoShoot.BorderSizePixel = 0
BotonCandadoShoot.ZIndex = 999
BotonCandadoShoot.Parent = BotonShoot

local cLockShoot = Instance.new("UICorner")
cLockShoot.CornerRadius = UDim.new(1, 0)
cLockShoot.Parent = BotonCandadoShoot

local BLOQUEADO_SHOOT = CONFIG.ShootLock or false

local function actualizarCandadoShoot()
    if BLOQUEADO_SHOOT then
        BotonShoot.Draggable = false
        BotonCandadoShoot.Text = "🔒"
        BotonCandadoShoot.BackgroundColor3 = COLORES.Rojo
        BotonCandadoShoot.BackgroundTransparency = 0.3
    else
        BotonShoot.Draggable = true
        BotonCandadoShoot.Text = "🔓"
        BotonCandadoShoot.BackgroundColor3 = COLORES.Morado3
        BotonCandadoShoot.BackgroundTransparency = 0.3
    end
end

actualizarCandadoShoot()

BotonCandadoShoot.MouseButton1Click:Connect(function()
    BLOQUEADO_SHOOT = not BLOQUEADO_SHOOT
    CONFIG.ShootLock = BLOQUEADO_SHOOT
    actualizarCandadoShoot()
    guardarConfig()
end)

if CONFIG.ShootPos then
    local p = CONFIG.ShootPos
    pcall(function() BotonShoot.Position = UDim2.new(p[1], p[2], p[3], p[4]) end)
end

task.spawn(function()
    while task.wait(2) do
        if not BLOQUEADO_SHOOT then
            pcall(function()
                CONFIG.ShootPos = {BotonShoot.Position.X.Scale, BotonShoot.Position.X.Offset, BotonShoot.Position.Y.Scale, BotonShoot.Position.Y.Offset}
                guardarConfig()
            end)
        end
    end
end)

BotonShoot.MouseButton1Click:Connect(function()
    dispararV1()
    BotonShoot.Text = "FIRE!"
    task.delay(0.5, function() BotonShoot.Text = "SHOOT MURDERER" end)
end)

-- ============================================
-- 👻 BOTÓN SHOOT AVANZADO (RGB)
-- ============================================
local BotonAvz = Instance.new("TextButton")
BotonAvz.Name = "UzivertShootAvz"
BotonAvz.Size = UDim2.new(0, 160, 0, 50)
BotonAvz.Position = UDim2.new(0, 30, 0.5, 170)
BotonAvz.BackgroundColor3 = COLORES.Fondo
BotonAvz.BackgroundTransparency = 0.3
BotonAvz.Text = "SHOOT AVANZADO"
BotonAvz.TextColor3 = COLORES.Texto
BotonAvz.Font = Enum.Font.GothamBold
BotonAvz.TextSize = 13
BotonAvz.BorderSizePixel = 0
BotonAvz.Active = true
BotonAvz.Draggable = true
BotonAvz.Visible = false
BotonAvz.ZIndex = 998
BotonAvz.ClipsDescendants = true
BotonAvz.Parent = ScreenGui

local cAvz = Instance.new("UICorner")
cAvz.CornerRadius = UDim.new(0, 10)
cAvz.Parent = BotonAvz

local sAvz = Instance.new("UIStroke")
sAvz.Color = COLORES.Naranja1
sAvz.Thickness = 2
sAvz.Transparency = 0.2
sAvz.Parent = BotonAvz

task.spawn(function()
    while BotonAvz.Parent do
        local t = tick()
        local a = (math.sin(t * 1.5) + 1) / 2
        sAvz.Color = COLORES.Naranja1:Lerp(COLORES.Morado2, a)
        sAvz.Transparency = 0.4 - a * 0.3
        task.wait(0.05)
    end
end)

local BotonCandadoAvz = Instance.new("TextButton")
BotonCandadoAvz.Size = UDim2.new(0, 22, 0, 22)
BotonCandadoAvz.Position = UDim2.new(1, -24, 0, 2)
BotonCandadoAvz.BackgroundColor3 = COLORES.Morado3
BotonCandadoAvz.BackgroundTransparency = 0.3
BotonCandadoAvz.Text = "🔓"
BotonCandadoAvz.TextColor3 = COLORES.Texto
BotonCandadoAvz.Font = Enum.Font.GothamBold
BotonCandadoAvz.TextSize = 12
BotonCandadoAvz.BorderSizePixel = 0
BotonCandadoAvz.ZIndex = 999
BotonCandadoAvz.Parent = BotonAvz

local cLockAvz = Instance.new("UICorner")
cLockAvz.CornerRadius = UDim.new(1, 0)
cLockAvz.Parent = BotonCandadoAvz

local BLOQUEADO_AVZ = CONFIG.ShootAvzLock or false

local function actualizarCandadoAvz()
    if BLOQUEADO_AVZ then
        BotonAvz.Draggable = false
        BotonCandadoAvz.Text = "🔒"
        BotonCandadoAvz.BackgroundColor3 = COLORES.Rojo
        BotonCandadoAvz.BackgroundTransparency = 0.3
    else
        BotonAvz.Draggable = true
        BotonCandadoAvz.Text = "🔓"
        BotonCandadoAvz.BackgroundColor3 = COLORES.Morado3
        BotonCandadoAvz.BackgroundTransparency = 0.3
    end
end

actualizarCandadoAvz()

BotonCandadoAvz.MouseButton1Click:Connect(function()
    BLOQUEADO_AVZ = not BLOQUEADO_AVZ
    CONFIG.ShootAvzLock = BLOQUEADO_AVZ
    actualizarCandadoAvz()
    guardarConfig()
end)

if CONFIG.ShootAvzPos then
    local p = CONFIG.ShootAvzPos
    pcall(function() BotonAvz.Position = UDim2.new(p[1], p[2], p[3], p[4]) end)
end

task.spawn(function()
    while task.wait(2) do
        if not BLOQUEADO_AVZ then
            pcall(function()
                CONFIG.ShootAvzPos = {BotonAvz.Position.X.Scale, BotonAvz.Position.X.Offset, BotonAvz.Position.Y.Scale, BotonAvz.Position.Y.Offset}
                guardarConfig()
            end)
        end
    end
end)

BotonAvz.MouseButton1Click:Connect(function()
    dispararV2()
    BotonAvz.Text = "FIRE!"
    task.delay(0.5, function() BotonAvz.Text = "SHOOT AVANZADO" end)
end)

local monitorGui = nil
local monitorConexion = nil
local monitorFrames = 0
local monitorElapsed = 0
local function destruirMonitor()
    if monitorConexion then monitorConexion:Disconnect() monitorConexion = nil end
    if monitorGui then monitorGui:Destroy() monitorGui = nil end
end
local function crearMonitor()
    destruirMonitor()
    local gui = Instance.new("ScreenGui")
    gui.Name = "UzivertMonitor"
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 998
    gui.Parent = PlayerGui
    monitorGui = gui
    local function makeLabel(y)
        local lbl = Instance.new("TextLabel")
        lbl.AnchorPoint = Vector2.new(1, 0)
        lbl.Size = UDim2.new(1, -24, 0, 19)
        lbl.Position = UDim2.new(1, -12, 0, y)
        lbl.BackgroundTransparency = 1
        lbl.Font = Enum.Font.Code
        lbl.TextXAlignment = Enum.TextXAlignment.Right
        lbl.TextSize = 14
        lbl.TextColor3 = Color3.fromRGB(240, 240, 240)
        lbl.TextStrokeTransparency = 0.4
        lbl.Text = ""
        lbl.Parent = gui
        return lbl
    end
    local pingLabel = makeLabel(40)
    local fpsLabel = makeLabel(59)
    local jitterLabel = makeLabel(78)
    monitorConexion = RunService.RenderStepped:Connect(function(dt)
        if not MONITOR_ACTIVO then return end
        if dt > 0 then
            monitorFrames = monitorFrames + 1
            monitorElapsed = monitorElapsed + dt
            if monitorElapsed >= 0.25 then
                local fps = math.floor(monitorFrames / monitorElapsed + 0.5)
                pingLabel.Text = "Ping: " .. GetPing() .. " ms"
                fpsLabel.Text = "FPS: " .. fps
                jitterLabel.Text = "Jitter: " .. math.floor(jitter + 0.5) .. " ms | " .. pingSource
                monitorFrames = 0
                monitorElapsed = 0
            end
        end
    end)
end

local fpsBoostSnapshot = {}
local function restaurarGraficos()
    for i = #fpsBoostSnapshot, 1, -1 do
        local saved = fpsBoostSnapshot[i]
        pcall(function() saved.object[saved.property] = saved.value end)
        table.remove(fpsBoostSnapshot, i)
    end
end
local function guardarYSetear(object, property, value)
    local ok, original = pcall(function() return object[property] end)
    if ok then
        table.insert(fpsBoostSnapshot, {object = object, property = property, value = original})
        pcall(function() object[property] = value end)
    end
end

print("🎃 Parte 6/10 cargada - Botones Shoot + Fling")

crearToggle(PaginaVisual, "🎃 ESP Jugadores", CONFIG.ESP, function(e)
    ESP_ACTIVO = e
    CONFIG.ESP = e
    guardarConfig()
end)
crearToggle(PaginaVisual, "🔫 Gun ESP (equipada + tirada)", CONFIG.GunESP, function(e)
    GUN_ESP_ACTIVO = e
    CONFIG.GunESP = e
    guardarConfig()
    if not e then limpiarGunESP() end
end)

local leyenda = Instance.new("TextLabel")
leyenda.Size = UDim2.new(1, 0, 0, 60)
leyenda.BackgroundColor3 = COLORES.Morado3
leyenda.BackgroundTransparency = 0.5
leyenda.Text = "🎃 Rojo = Murderer\n👻 Azul = Sheriff\n💀 Verde = Inocente\n🦇 Azul brillante = Gun\n🍬 Amarillo = Dropped Gun"
leyenda.TextColor3 = COLORES.Texto
leyenda.Font = Enum.Font.GothamMedium
leyenda.TextSize = 10
leyenda.BorderSizePixel = 0
leyenda.ZIndex = 2
leyenda.Parent = PaginaVisual

local cLey = Instance.new("UICorner")
cLey.CornerRadius = UDim.new(0, 9)
cLey.Parent = leyenda

local sLey = Instance.new("UIStroke")
sLey.Color = COLORES.Naranja1
sLey.Thickness = 1
sLey.Transparency = 0.4
sLey.Parent = leyenda

crearToggle(PaginaAim, "👻 Auto Shoot (logica avanzada)", CONFIG.ShootAuto, function(e)
    SHOOT_AUTO = e
    CONFIG.ShootAuto = e
    guardarConfig()
end)

crearToggle(PaginaAim, "🎯 Mostrar boton SHOOT MURDERER", CONFIG.ShootMostrar ~= false, function(e)
    SHOOT_MOSTRAR = e
    CONFIG.ShootMostrar = e
    guardarConfig()
    if BotonShoot then BotonShoot.Visible = e end
end)

crearToggle(PaginaAim, "🎯 Aim Lock (Shiftlock + Gun)", CONFIG.AimLock or false, function(e)
    _G.AIM_ON = e
    CONFIG.AimLock = e
    guardarConfig()
end)

crearToggle(PaginaAim, "👻 Mostrar boton SHOOT AVANZADO", CONFIG.ShootAvzMostrar or false, function(e)
    CONFIG.ShootAvzMostrar = e
    guardarConfig()
    if BotonAvz then BotonAvz.Visible = e end
end)

crearToggle(PaginaAim, "💥 Activar KILL ALL (Murderer)", CONFIG.KillAllActivo or false, function(e)
    KILL_ALL_ACTIVO = e
    CONFIG.KillAllActivo = e
    guardarConfig()
    print(e and "💥 Kill All ACTIVADO" or "❌ Kill All DESACTIVADO")
end)

crearSlider(PaginaAim, "Burst Tiros", 1, 10, SHOOT_BURST, function(v)
    SHOOT_BURST = v
    CONFIG.ShootBurst = v
    guardarConfig()
end)

crearSlider(PaginaAim, "Burst Delay x1000", 10, 200, math.floor(SHOOT_BURST_DELAY * 1000), function(v)
    SHOOT_BURST_DELAY = v / 1000
    CONFIG.ShootBurstDelay = SHOOT_BURST_DELAY
    guardarConfig()
end)

crearSlider(PaginaAim, "Rango Maximo", 50, 1000, SHOOT_RANGO_MAX, function(v)
    SHOOT_RANGO_MAX = v
    CONFIG.ShootRangoMax = v
    guardarConfig()
end)

crearSlider(PaginaAim, "Rango Minimo", 0, 50, SHOOT_RANGO_MIN, function(v)
    SHOOT_RANGO_MIN = v
    CONFIG.ShootRangoMin = v
    guardarConfig()
end)

crearBoton(PaginaAim, "Matar Sheriff", function()
    _G.UZIVERT_MATAR_SHERIFF()
end, COLORES.Naranja1)

crearToggle(PaginaAura, "💀 Anti-Murderer", CONFIG.AutoGrabAntiM, function(e)
    GRAB_ANTI_MURDERER = e
    CONFIG.AutoGrabAntiM = e
    guardarConfig()
end)
crearSlider(PaginaAura, "Rango Murderer (studs)", 10, 50, CONFIG.AutoGrabDistMurder, function(v)
    GRAB_MURDERER_RANGO = v
    CONFIG.AutoGrabDistMurder = v
    guardarConfig()
end)
crearToggle(PaginaAura, "🔄 Regresar a posicion original", CONFIG.AutoGrabRegresar, function(e)
    GRAB_REGRESAR = e
    CONFIG.AutoGrabRegresar = e
    guardarConfig()
end)
crearToggle(PaginaAura, "🍬 Mostrar boton GRAB GUN", CONFIG.AutoGrabMostrar ~= false, function(e)
    CONFIG.AutoGrabMostrar = e
    guardarConfig()
end)

crearToggle(PaginaAura, "🔫 Auto Get Gun (lejano)", CONFIG.AutoGetGun or false, function(e)
    _G.UZIVERT_AUTO_GET_GUN_ON = e
    CONFIG.AutoGetGun = e
    guardarConfig()
end)

crearBoton(PaginaAura, "Agarrar Gun Ahora", function()
    _G.UZIVERT_AGARRAR_GUN()
end, COLORES.Naranja1)

crearToggle(PaginaAura, "🔪 Knife Aura", CONFIG.KnifeAura or false, function(e)
    CONFIG.KnifeAura = e
    guardarConfig()
    print(e and "🔪 Knife Aura ACTIVADO" or "🔪 Knife Aura DESACTIVADO")
end)
crearSlider(PaginaAura, "Distancia Knife Aura", 5, 50, CONFIG.KnifeAuraDist or 15, function(v)
    CONFIG.KnifeAuraDist = v
    guardarConfig()
end)

crearToggle(PaginaAura, "🗡️ Auto Stab (Murderer)", CONFIG.AutoStab or false, function(e)
    _G.UZIVERT_AUTO_STAB_ON = e
    CONFIG.AutoStab = e
    guardarConfig()
end)

crearSlider(PaginaAura, "Rango Auto Stab", 5, 25, CONFIG.AutoStabRango or 6, function(v)
    _G.UZIVERT_STAB_RANGO = v
    CONFIG.AutoStabRango = v
    guardarConfig()
end)

crearToggle(PaginaPlayer, "🛡 Anti-Fling", CONFIG.AntiFling, function(e)
    ANTI_FLING_ACTIVO = e
    CONFIG.AntiFling = e
    guardarConfig()
    if e then
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anti-fling-73205"))()
        end)
    end
end)
crearToggle(PaginaPlayer, "👻 Noclip", CONFIG.Noclip, function(e)
    NOCLIP_ACTIVO = e
    CONFIG.Noclip = e
    guardarConfig()
end)
crearSlider(PaginaPlayer, "Walkspeed", 16, 200, CONFIG.Walkspeed, function(v)
    WALKSPEED_VALOR = v
    CONFIG.Walkspeed = v
    guardarConfig()
end)
crearToggle(PaginaPlayer, "🌀 Spinbot (Anti-Aim)", CONFIG.Spinbot, function(e)
    SPINBOT_ACTIVO = e
    CONFIG.Spinbot = e
    guardarConfig()
end)
crearToggle(PaginaPlayer, "👻 Activar Boton de Invisibilidad", false, function(e)
    if e then
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-FE-19153"))()
        end)
    end
end)

crearBoton(PaginaFling, "🌀 FLING MURDERER", function()
    IniciarFling("Murderer")
end, Color3.fromRGB(200, 60, 100))

crearBoton(PaginaFling, "🌀 FLING SHERIFF", function()
    IniciarFling("Sheriff")
end, Color3.fromRGB(80, 130, 220))

crearBoton(PaginaFling, "🌀 FLING ALL", function()
    IniciarFling("all")
end, Color3.fromRGB(200, 50, 200))

crearBoton(PaginaFling, "⛔ DETENER FLING", function()
    StopFling()
end, Color3.fromRGB(100, 80, 180))

_G.UZIVERT_FLING_DD_BTN = Instance.new("TextButton")
_G.UZIVERT_FLING_DD_BTN.Size = UDim2.new(1, 0, 0, 42)
_G.UZIVERT_FLING_DD_BTN.BackgroundColor3 = COLORES.Morado1
_G.UZIVERT_FLING_DD_BTN.BackgroundTransparency = 0.5
_G.UZIVERT_FLING_DD_BTN.Text = "Elegir jugador ▼"
_G.UZIVERT_FLING_DD_BTN.TextColor3 = COLORES.Texto
_G.UZIVERT_FLING_DD_BTN.Font = Enum.Font.GothamBold
_G.UZIVERT_FLING_DD_BTN.TextSize = 12
_G.UZIVERT_FLING_DD_BTN.BorderSizePixel = 0
_G.UZIVERT_FLING_DD_BTN.ClipsDescendants = true
_G.UZIVERT_FLING_DD_BTN.ZIndex = 2
_G.UZIVERT_FLING_DD_BTN.Parent = PaginaFling

_G.UZIVERT_FLING_DD_C = Instance.new("UICorner")
_G.UZIVERT_FLING_DD_C.CornerRadius = UDim.new(0, 9)
_G.UZIVERT_FLING_DD_C.Parent = _G.UZIVERT_FLING_DD_BTN

_G.UZIVERT_FLING_DD_S = Instance.new("UIStroke")
_G.UZIVERT_FLING_DD_S.Color = COLORES.Naranja1
_G.UZIVERT_FLING_DD_S.Thickness = 1.5
_G.UZIVERT_FLING_DD_S.Transparency = 0.2
_G.UZIVERT_FLING_DD_S.Parent = _G.UZIVERT_FLING_DD_BTN

_G.UZIVERT_FLING_DD_LIST = Instance.new("Frame")
_G.UZIVERT_FLING_DD_LIST.Size = UDim2.new(1, 0, 0, 0)
_G.UZIVERT_FLING_DD_LIST.AutomaticSize = Enum.AutomaticSize.Y
_G.UZIVERT_FLING_DD_LIST.BackgroundColor3 = COLORES.Morado3
_G.UZIVERT_FLING_DD_LIST.BackgroundTransparency = 0.3
_G.UZIVERT_FLING_DD_LIST.BorderSizePixel = 0
_G.UZIVERT_FLING_DD_LIST.Visible = false
_G.UZIVERT_FLING_DD_LIST.ZIndex = 2
_G.UZIVERT_FLING_DD_LIST.Parent = PaginaFling

_G.UZIVERT_FLING_DD_LC = Instance.new("UICorner")
_G.UZIVERT_FLING_DD_LC.CornerRadius = UDim.new(0, 9)
_G.UZIVERT_FLING_DD_LC.Parent = _G.UZIVERT_FLING_DD_LIST

_G.UZIVERT_FLING_DD_LS = Instance.new("UIStroke")
_G.UZIVERT_FLING_DD_LS.Color = COLORES.Naranja1
_G.UZIVERT_FLING_DD_LS.Thickness = 1.5
_G.UZIVERT_FLING_DD_LS.Transparency = 0.2
_G.UZIVERT_FLING_DD_LS.Parent = _G.UZIVERT_FLING_DD_LIST

_G.UZIVERT_FLING_DD_LL = Instance.new("UIListLayout")
_G.UZIVERT_FLING_DD_LL.Padding = UDim.new(0, 3)
_G.UZIVERT_FLING_DD_LL.Parent = _G.UZIVERT_FLING_DD_LIST

_G.UZIVERT_FLING_DD_LP = Instance.new("UIPadding")
_G.UZIVERT_FLING_DD_LP.PaddingTop = UDim.new(0, 5)
_G.UZIVERT_FLING_DD_LP.PaddingBottom = UDim.new(0, 5)
_G.UZIVERT_FLING_DD_LP.PaddingLeft = UDim.new(0, 5)
_G.UZIVERT_FLING_DD_LP.PaddingRight = UDim.new(0, 5)
_G.UZIVERT_FLING_DD_LP.Parent = _G.UZIVERT_FLING_DD_LIST

_G.UZIVERT_FLING_DD_BTN.MouseButton1Click:Connect(function()
    _G.UZIVERT_FLING_DD_LIST.Visible = not _G.UZIVERT_FLING_DD_LIST.Visible
    if _G.UZIVERT_FLING_DD_LIST.Visible then
        _G.UZIVERT_ABRIR_LISTA(_G.UZIVERT_FLING_DD_LIST, _G.UZIVERT_FLING_DD_BTN)
    end
end)

crearBoton(PaginaFling, "🌀 FLINGEAR TARGET", function()
    if not _G.UZIVERT_FLING_TARGET then
        print("❌ Elegí un jugador primero")
        return
    end
    if _G.UZIVERT_FLING_IN_PROGRESS then
        print("⚠️ Fling en progreso")
        return
    end
    task.spawn(_G.UZIVERT_FLING_FUNC, _G.UZIVERT_FLING_TARGET)
end, Color3.fromRGB(200, 60, 100))

print("🎃 Parte 7/10 cargada - Páginas Aim/Aura/Player/Fling")

local function crearSelector(padre, titulo, opciones, callback)
    local labelFrame = Instance.new("Frame")
    labelFrame.Size = UDim2.new(1, 0, 0, 30)
    labelFrame.BackgroundColor3 = COLORES.Morado3
    labelFrame.BackgroundTransparency = 0.5
    labelFrame.BorderSizePixel = 0
    labelFrame.Active = true
    labelFrame.ZIndex = 2
    labelFrame.Parent = padre

    local cLF = Instance.new("UICorner")
    cLF.CornerRadius = UDim.new(0, 8)
    cLF.Parent = labelFrame

    local sLF = Instance.new("UIStroke")
    sLF.Color = COLORES.Naranja1
    sLF.Thickness = 1
    sLF.Transparency = 0.4
    sLF.Parent = labelFrame

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -10, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = titulo .. " ▼"
    lbl.TextColor3 = COLORES.Texto
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 3
    lbl.Parent = labelFrame

    local botonToggle = Instance.new("TextButton")
    botonToggle.Size = UDim2.new(1, 0, 1, 0)
    botonToggle.BackgroundTransparency = 1
    botonToggle.Text = ""
    botonToggle.ZIndex = 4
    botonToggle.Parent = labelFrame

    local contenedor = Instance.new("Frame")
    contenedor.Size = UDim2.new(1, 0, 0, #opciones * 28 + 8)
    contenedor.BackgroundColor3 = COLORES.Morado3
    contenedor.BackgroundTransparency = 0.5
    contenedor.BorderSizePixel = 0
    contenedor.Visible = false
    contenedor.ZIndex = 2
    contenedor.Parent = padre

    local cCont = Instance.new("UICorner")
    cCont.CornerRadius = UDim.new(0, 8)
    cCont.Parent = contenedor

    local layoutCont = Instance.new("UIListLayout")
    layoutCont.Padding = UDim.new(0, 3)
    layoutCont.Parent = contenedor

    local paddingCont = Instance.new("UIPadding")
    paddingCont.PaddingTop = UDim.new(0, 4)
    paddingCont.PaddingBottom = UDim.new(0, 4)
    paddingCont.PaddingLeft = UDim.new(0, 4)
    paddingCont.PaddingRight = UDim.new(0, 4)
    paddingCont.Parent = contenedor

    botonToggle.MouseButton1Click:Connect(function()
        contenedor.Visible = not contenedor.Visible
        if contenedor.Visible then lbl.Text = titulo .. " ▲"
        else lbl.Text = titulo .. " ▼" end
    end)

    for _, opcion in ipairs(opciones) do
        local boton = Instance.new("TextButton")
        boton.Size = UDim2.new(1, 0, 0, 25)
        boton.BackgroundColor3 = COLORES.Morado3
        boton.BackgroundTransparency = 0.4
        boton.Text = opcion
        boton.TextColor3 = COLORES.Texto
        boton.Font = Enum.Font.GothamBold
        boton.TextSize = 10
        boton.BorderSizePixel = 0
        boton.ZIndex = 3
        boton.Parent = contenedor

        local cB = Instance.new("UICorner")
        cB.CornerRadius = UDim.new(0, 5)
        cB.Parent = boton

        boton.MouseButton1Click:Connect(function()
            callback(opcion)
            contenedor.Visible = false
            lbl.Text = titulo .. ": " .. opcion .. " ▼"
        end)
    end
end

crearToggle(PaginaAnims, "🎬 Activar Animaciones", CONFIG.Anims, function(e)
    ANIMS_ACTIVO = e
    CONFIG.Anims = e
    guardarConfig()
    if e then
        saveOriginalAnims()
        applyAnimations()
    else
        local char = LocalPlayer.Character
        if char then
            local Animate = char:FindFirstChild("Animate")
            if Animate then
                for animType, info in pairs(animMap) do
                    local folder = Animate:FindFirstChild(info.folder)
                    if folder then
                        for _, slot in ipairs(info.slots) do
                            local anim = folder:FindFirstChild(slot.child)
                            if anim and originalAnims[slot.origKey] then
                                anim.AnimationId = originalAnims[slot.origKey]
                            end
                        end
                    end
                end
            end
        end
    end
end)

crearSelector(PaginaAnims, "Animacion General", allOptions, function(sel) animState.all = sel applyAnimations() end)
crearSelector(PaginaAnims, "Idle", allOptions, function(sel) animState.idle = sel applyAnimations() end)
crearSelector(PaginaAnims, "Walk", allOptions, function(sel) animState.walk = sel applyAnimations() end)
crearSelector(PaginaAnims, "Run", allOptions, function(sel) animState.run = sel applyAnimations() end)
crearSelector(PaginaAnims, "Jump", allOptions, function(sel) animState.jump = sel applyAnimations() end)
crearSelector(PaginaAnims, "Fall", allOptions, function(sel) animState.fall = sel applyAnimations() end)
crearSelector(PaginaAnims, "Climb", allOptions, function(sel) animState.climb = sel applyAnimations() end)
crearSelector(PaginaAnims, "Swim", allOptions, function(sel) animState.swim = sel applyAnimations() end)
crearSelector(PaginaAnims, "SwimIdle", allOptions, function(sel) animState.swimidle = sel applyAnimations() end)
crearSelector(PaginaAnims, "Death", allOptions, function(sel) animState.death = sel applyAnimations() end)

-- ============================================
-- 🎁 AUTO PRANK BOMB (función + UI)
-- ============================================
local function ApplyAutoPrankBomb(state)
    if state then
        if prankBombConnection then
            prankBombConnection:Disconnect()
        end
        prankBombConnection = workspace.ChildAdded:Connect(function(obj)
            if obj.Name == "Handle" then
                task.spawn(function()
                    local creator = obj:WaitForChild("creator", 0.5)
                    if creator then
                        local donoDaBomba = false
                        if creator:IsA("ObjectValue") and creator.Value == LocalPlayer then
                            donoDaBomba = true
                        elseif creator:IsA("StringValue") and creator.Value == LocalPlayer.Name then
                            donoDaBomba = true
                        elseif creator.Value == LocalPlayer.Name then
                            donoDaBomba = true
                        end

                        if donoDaBomba then
                            local character = LocalPlayer.Character
                            if character then
                                local rootPart = character:FindFirstChild("HumanoidRootPart")
                                local humanoid = character:FindFirstChildOfClass("Humanoid")
                                if rootPart and humanoid and obj:IsA("BasePart") then
                                    obj.CFrame = rootPart.CFrame * CFrame.new(0, -3, 0)
                                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                    print("🎁 Auto Prank Bomb → ¡Doble salto!")
                                end
                            end
                        end
                    end
                end)
            end
        end)
        print("🎁 Auto Prank Bomb ACTIVADO")
    else
        if prankBombConnection then
            prankBombConnection:Disconnect()
            prankBombConnection = nil
        end
        print("❌ Auto Prank Bomb DESACTIVADO")
    end
end

local infoBomb = Instance.new("TextLabel")
infoBomb.Size = UDim2.new(1, 0, 0, 100)
infoBomb.BackgroundColor3 = COLORES.Morado3
infoBomb.BackgroundTransparency = 0.5
infoBomb.Text = "🎁 AUTO PRANK BOMB (BOMB JUMP) 🎁\n\n1. Activá el toggle de abajo\n2. Equipá la FakeBomb\n3. Tirala → cae abajo tuyo + saltás solo\n\n💡 Necesitás la Prank Bomb comprada (4,800 coins)"
infoBomb.TextColor3 = COLORES.Texto
infoBomb.Font = Enum.Font.GothamMedium
infoBomb.TextSize = 11
infoBomb.TextWrapped = true
infoBomb.BorderSizePixel = 0
infoBomb.ZIndex = 2
infoBomb.Parent = PaginaBomb

local cInfoBomb = Instance.new("UICorner")
cInfoBomb.CornerRadius = UDim.new(0, 9)
cInfoBomb.Parent = infoBomb

local sInfoBomb = Instance.new("UIStroke")
sInfoBomb.Color = COLORES.Naranja1
sInfoBomb.Thickness = 1
sInfoBomb.Transparency = 0.4
sInfoBomb.Parent = infoBomb

crearToggle(PaginaBomb, "🎁 Auto Prank Bomb (Bomb Jump)", CONFIG.AutoPrankBomb or false, function(e)
    AUTO_PRANK_BOMB_ACTIVO = e
    CONFIG.AutoPrankBomb = e
    guardarConfig()
    ApplyAutoPrankBomb(e)
end)

crearToggle(PaginaRend, "⚰️ Monitor HUD", CONFIG.Monitor, function(e)
    MONITOR_ACTIVO = e
    CONFIG.Monitor = e
    guardarConfig()
    if e then
        SamplePing()
        crearMonitor()
    else
        destruirMonitor()
    end
end)
crearToggle(PaginaRend, "⚡ FPS Boost", CONFIG.FPSBoost, function(e)
    FPS_BOOST_ACTIVO = e
    CONFIG.FPSBoost = e
    guardarConfig()
    if e then
        restaurarGraficos()
        guardarYSetear(Lighting, "GlobalShadows", false)
        guardarYSetear(Lighting, "OutdoorAmbient", Color3.fromRGB(128, 128, 128))
        local terrain = workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            guardarYSetear(terrain, "WaterWaveSize", 0)
            guardarYSetear(terrain, "WaterWaveSpeed", 0)
            guardarYSetear(terrain, "WaterReflectance", 0)
            guardarYSetear(terrain, "WaterTransparency", 0)
        end
    else
        restaurarGraficos()
    end
end)

crearToggle(PaginaRend, "🌙 Modo Noche", CONFIG.ModoNoche or false, function(e)
    _G.UZIVERT_MODO_NOCHE(e)
    CONFIG.ModoNoche = e
    guardarConfig()
end)

crearToggle(PaginaRend, "⏰ Round Timer", CONFIG.RoundTimer or false, function(e)
    _G.UZIVERT_TIMER_ON = e
    CONFIG.RoundTimer = e
    guardarConfig()
    if e then
        _G.UZIVERT_TIMER_START()
    else
        _G.UZIVERT_TIMER_STOP()
    end
end)

print("🎃 Parte 8/10 cargada - Selector + Anims + Bomb Jump + Rend")

local infoTitulo = Instance.new("TextLabel")
infoTitulo.Size = UDim2.new(1, 0, 0, 50)
infoTitulo.BackgroundColor3 = COLORES.Morado3
infoTitulo.BackgroundTransparency = 0.4
infoTitulo.Text = "🎃 Uzivert Hub " .. VERSION .. " 🎃\nProyecto inicial por Uzivert\nCon ayuda explicativa de Nexvyr"
infoTitulo.TextColor3 = COLORES.Texto
infoTitulo.Font = Enum.Font.GothamBold
infoTitulo.TextSize = 10
infoTitulo.TextWrapped = true
infoTitulo.BorderSizePixel = 0
infoTitulo.ZIndex = 2
infoTitulo.Parent = PaginaInfo

local cIT = Instance.new("UICorner")
cIT.CornerRadius = UDim.new(0, 9)
cIT.Parent = infoTitulo

local sIT = Instance.new("UIStroke")
sIT.Color = COLORES.Naranja1
sIT.Thickness = 1
sIT.Transparency = 0.3
sIT.Parent = infoTitulo

local mantInfo = Instance.new("TextLabel")
mantInfo.Size = UDim2.new(1, 0, 0, 70)
mantInfo.BackgroundColor3 = Color3.fromRGB(20, 50, 20)
mantInfo.BackgroundTransparency = 0.4
mantInfo.Text = "✅ TODO OPERATIVO\n\nTodos los sistemas funcionando.\nReportá cualquier bug en Discord."
mantInfo.TextColor3 = COLORES.Verde
mantInfo.Font = Enum.Font.GothamMedium
mantInfo.TextSize = 10
mantInfo.TextWrapped = true
mantInfo.TextXAlignment = Enum.TextXAlignment.Left
mantInfo.TextYAlignment = Enum.TextYAlignment.Top
mantInfo.BorderSizePixel = 0
mantInfo.ZIndex = 2
mantInfo.Parent = PaginaInfo

local cMI = Instance.new("UICorner")
cMI.CornerRadius = UDim.new(0, 9)
cMI.Parent = mantInfo

local sMI = Instance.new("UIStroke")
sMI.Color = COLORES.Verde
sMI.Thickness = 1
sMI.Transparency = 0.4
sMI.Parent = mantInfo

crearBoton(PaginaInfo, "🐛 Reportar Bug", function()
    local texto = "REPORTE DE BUG - UZIVERT HUB v4.6\nJugador: " .. LocalPlayer.Name .. "\nFecha: " .. os.date("%d/%m/%Y %H:%M") .. "\nVersion: " .. VERSION
    pcall(function()
        if setclipboard then setclipboard(texto) end
    end)
    print("Reporte copiado.")
end, Color3.fromRGB(200, 100, 60))

crearBoton(PaginaInfo, "💬 Copiar Discord", function()
    pcall(function()
        if setclipboard then setclipboard("https://discord.gg/vHhERWcbXe") end
    end)
    print("Discord copiado.")
end, Color3.fromRGB(80, 100, 200))

local function crearTarjeta(padre, titulo, contenido, colorBorde)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 0)
    frame.AutomaticSize = Enum.AutomaticSize.Y
    frame.BackgroundColor3 = Color3.fromRGB(30, 15, 40)
    frame.BackgroundTransparency = 0.35
    frame.BorderSizePixel = 0
    frame.ZIndex = 2
    frame.Parent = padre

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 10)
    c.Parent = frame

    local s = Instance.new("UIStroke")
    s.Color = colorBorde or COLORES.Naranja1
    s.Thickness = 1.5
    s.Transparency = 0.3
    s.Parent = frame

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 4)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = frame

    local padding = Instance.new("UIPadding")
    padding.PaddingTop = UDim.new(0, 10)
    padding.PaddingBottom = UDim.new(0, 10)
    padding.PaddingLeft = UDim.new(0, 12)
    padding.PaddingRight = UDim.new(0, 12)
    padding.Parent = frame

    if titulo and titulo ~= "" then
        local tituloLbl = Instance.new("TextLabel")
        tituloLbl.Size = UDim2.new(1, 0, 0, 20)
        tituloLbl.BackgroundTransparency = 1
        tituloLbl.Text = titulo
        tituloLbl.TextColor3 = colorBorde or COLORES.Naranja2
        tituloLbl.Font = Enum.Font.GothamBold
        tituloLbl.TextSize = 12
        tituloLbl.TextXAlignment = Enum.TextXAlignment.Left
        tituloLbl.LayoutOrder = 1
        tituloLbl.Parent = frame
    end

    local contenidoLbl = Instance.new("TextLabel")
    contenidoLbl.Size = UDim2.new(1, 0, 0, 0)
    contenidoLbl.AutomaticSize = Enum.AutomaticSize.Y
    contenidoLbl.BackgroundTransparency = 1
    contenidoLbl.Text = contenido
    contenidoLbl.TextColor3 = COLORES.Texto
    contenidoLbl.Font = Enum.Font.GothamMedium
    contenidoLbl.TextSize = 11
    contenidoLbl.TextWrapped = true
    contenidoLbl.TextXAlignment = Enum.TextXAlignment.Left
    contenidoLbl.TextYAlignment = Enum.TextYAlignment.Top
    contenidoLbl.LayoutOrder = 2
    contenidoLbl.Parent = frame

    return frame
end

crearTarjeta(PaginaUpdate, "📅 Última actualización: 09/10/2026", "Uzivert Hub v4.7.0", COLORES.Naranja2)

crearTarjeta(PaginaUpdate, "🟢 Nuevo en v4.7.0",
    "+ 🎯 Aim Lock (Shiftlock + Gun)\n" ..
    "+ 🗡️ Auto Stab (con slider de rango)\n" ..
    "+ 💀 Matar Sheriff\n" ..
    "+ 🌙 Modo Noche\n" ..
    "+ 🔫 Auto Get Gun (lejano)\n" ..
    "+ ⏰ Round Timer\n" ..
    "+ 🌀 Fling Dropdown",
    COLORES.Verde)

crearTarjeta(PaginaUpdate, "🟢 Nuevo en v4.6.4",
    "+ 🎯 Shoot Murderer más preciso\n" ..
    "+ 🦸 Fling detecta al Hero\n" ..
    "+ ⚡ Sistema de roles optimizado",
    COLORES.Verde)

crearTarjeta(PaginaUpdate, "🐛 BUGS ARREGLADOS",
    "✓ Auto Get Gun (orden de funciones)\n" ..
    "✓ Matar Sheriff (orden de funciones)\n" ..
    "✓ Límite de locales (usar _G.)\n" ..
    "✓ Toggle ESP no borraba highlights\n" ..
    "✓ Fling no detectaba al Hero\n" ..
    "✓ Shoot disparaba al piso/cielo\n" ..
    "  cuando el Murderer saltaba",
    COLORES.Verde)

crearTarjeta(PaginaUpdate, "🔴 Descartado",
    "- Silent Aim (cámara trabada)\n" ..
    "- Knife Throwing TP / Knife Homing\n" ..
    "- ESP Skeleton (no se ve)\n" ..
    "- Skin Copier (ApplyDescription)\n" ..
    "- Anti Silent Aim (muy riesgoso)\n" ..
    "- Notify / Disable Footstep\n" ..
    "- Coins Reach / Remove / Optimizer\n" ..
    "- Round Timer del Nexvyr\n" ..
    "- Herobrine",
    COLORES.Rojo)

crearTarjeta(PaginaAvisos, "⚠️ Aviso Importante", "El script está en fase de desarrollo.\nPuede contener bugs y errores.", COLORES.Amarillo)
crearTarjeta(PaginaAvisos, "🚨 Aviso Oficial — Incidente 08/10/2026",
    "El día 08/10/2026 el código de Uzivert Hub fue robado por terceros.\n\n" ..
    "⚠️ Aclaración importante:\n" ..
    "El Uzivert Hub ORIGINAL y OFICIAL es únicamente el que distribuimos desde nuestro Discord y Gist.\n\n" ..
    "Si ves el hub publicado en otro lado (canales de YouTube, otros servidores, otros usuarios) → NO es oficial.\n\n" ..
    "Las copias pueden:\n" ..
    "• Tener virus\n" ..
    "• Estar modificadas para robar tu cuenta\n" ..
    "• Estar desactualizadas sin soporte\n\n" ..
    "🔒 Protegete:\n" ..
    "• Descargá solo desde nuestro Discord oficial\n" ..
    "• No ejecutes versiones de otros usuarios\n" ..
    "• Reportá copias al staff\n\n" ..
    "💬 Discord oficial: discord.gg/vHhERWcbXe\n\n" ..
    "Gracias por el apoyo. Seguimos mejorando el hub para ustedes. 🎃\n\n" ..
    "— Uzivert",
    COLORES.Rojo)
crearTarjeta(PaginaAvisos, "🚫 Responsabilidad", "El equipo de Uzivert Hub no se hace responsable si resultás baneado del juego.\nUsalo bajo tu propia responsabilidad.", COLORES.Rojo)

local tarjetaCreador = Instance.new("Frame")
tarjetaCreador.Size = UDim2.new(1, 0, 0, 90)
tarjetaCreador.BackgroundColor3 = Color3.fromRGB(30, 15, 40)
tarjetaCreador.BackgroundTransparency = 0.35
tarjetaCreador.BorderSizePixel = 0
tarjetaCreador.Parent = PaginaCreador

local cTC = Instance.new("UICorner")
cTC.CornerRadius = UDim.new(0, 10)
cTC.Parent = tarjetaCreador

local sTC = Instance.new("UIStroke")
sTC.Color = COLORES.Morado2
sTC.Thickness = 1.5
sTC.Transparency = 0.3
sTC.Parent = tarjetaCreador

local avatar = Instance.new("TextLabel")
avatar.Size = UDim2.new(0, 60, 0, 60)
avatar.Position = UDim2.new(0, 12, 0, 15)
avatar.BackgroundColor3 = Color3.fromRGB(50, 25, 65)
avatar.BackgroundTransparency = 0.3
avatar.Text = "🎃"
avatar.TextSize = 32
avatar.BorderSizePixel = 0
avatar.Parent = tarjetaCreador

local cA = Instance.new("UICorner")
cA.CornerRadius = UDim.new(0, 10)
cA.Parent = avatar

local nombre = Instance.new("TextLabel")
nombre.Size = UDim2.new(1, -90, 0, 20)
nombre.Position = UDim2.new(0, 82, 0, 15)
nombre.BackgroundTransparency = 1
nombre.Text = "UZIVERT"
nombre.TextColor3 = COLORES.Texto
nombre.Font = Enum.Font.GothamBold
nombre.TextSize = 15
nombre.TextXAlignment = Enum.TextXAlignment.Left
nombre.Parent = tarjetaCreador

local rol = Instance.new("TextLabel")
rol.Size = UDim2.new(1, -90, 0, 16)
rol.Position = UDim2.new(0, 82, 0, 36)
rol.BackgroundTransparency = 1
rol.Text = "👑 Fundador y creador del proyecto"
rol.TextColor3 = COLORES.Naranja2
rol.Font = Enum.Font.GothamBold
rol.TextSize = 11
rol.TextXAlignment = Enum.TextXAlignment.Left
rol.Parent = tarjetaCreador

local tag = Instance.new("TextLabel")
tag.Size = UDim2.new(1, -90, 0, 16)
tag.Position = UDim2.new(0, 82, 0, 55)
tag.BackgroundTransparency = 1
tag.Text = "Uzivert Hub — Open Hub"
tag.TextColor3 = COLORES.Sub
tag.Font = Enum.Font.GothamMedium
tag.TextSize = 10
tag.TextXAlignment = Enum.TextXAlignment.Left
tag.Parent = tarjetaCreador

crearTarjeta(PaginaCreador, "💬 Mensaje del Creador",
    "¡Hola! Soy Uzivert, fundador y creador del Uzivert Hub. 🎃\n\n" ..
    "Este proyecto nació como una idea pequeña, sin muchas pretensiones. Pero con esfuerzo, dedicación y muchas horas de prueba y error, lo fuimos mejorando versión tras versión hasta convertirlo en lo que es hoy.\n\n" ..
    "Agradezco enormemente a Nexvyr, mi colaborador, quien me ayudó con ideas, código y sobre todo con la motivación para no rendirme cuando las cosas se complicaban.\n\n" ..
    "También a todos los que probaron el hub, reportaron bugs y me bancaron en el proceso. Sin ustedes, esto no tendría sentido.\n\n" ..
    "Seguimos actualizando, mejorando y agregando funciones nuevas. El objetivo es que tengas la mejor experiencia posible en MM2.\n\n" ..
    "Si te gusta el hub → compartilo con tus amigos. Si encontrás bugs → reportalos en el Discord. Si tenés ideas → decímelas.\n\n" ..
    "📱 Redes sociales:\n" ..
    "• TikTok: @Uzivert550\n" ..
    "• Instagram: @hxuntedluv77\n\n" ..
    "💬 Discord oficial: discord.gg/vHhERWcbXe\n\n" ..
    "¡Gracias por usar Uzivert Hub! 🎃\n\n" ..
    "— Uzivert",
    COLORES.Morado2)

print("🎃 Parte 9/10 cargada - Info + Update + Avisos + Creador")

if ANIMS_ACTIVO then
    task.wait(0.5)
    saveOriginalAnims()
    applyAnimations()
end

if AUTO_PRANK_BOMB_ACTIVO then
    task.wait(0.5)
    ApplyAutoPrankBomb(true)
end

print("====================================")
print("🎃 Uzivert Hub " .. VERSION .. " cargado 🎃")
print("Proyecto inicial por Uzivert")
print("Con ayuda explicativa de Nexvyr")
print("====================================")
print("🦇 Murciélagos volando")
print("🕸️ Telarañas en esquinas")
print("👻 Niebla animada")
print("🎃 Iconos temáticos")
print("💀 Colores de Halloween")
print("====================================")
print("Nuevo en v4.6:")
print("  🎁 Auto Prank Bomb (Bomb Jump)")
print("  🍬 Auto Grab Gun Nexus Style")
print("  🌀 Fling Nexus Style")
print("  💥 Kill All (Murderer only)")
print("  28 presets de animaciones")
print("====================================")

print("🎃 Parte 10/10 cargada - SCRIPT COMPLETO v4.6.4")

-- ============================================
-- ⏰ ROUND TIMER
-- ============================================
_G.UZIVERT_TIMER_ON = false
_G.UZIVERT_TIMER_LABEL = nil
_G.UZIVERT_TIMER_CON = nil

_G.UZIVERT_TIMER_START = function()
    if _G.UZIVERT_TIMER_LABEL then
        _G.UZIVERT_TIMER_LABEL:Destroy()
        _G.UZIVERT_TIMER_LABEL = nil
    end
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 150, 0, 40)
    label.Position = UDim2.new(0.5, -75, 0.05, 0)
    label.BackgroundTransparency = 1
    label.Text = "..."
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.Font = Enum.Font.GothamBlack
    label.TextSize = 24
    label.BorderSizePixel = 0
    label.Active = false
    label.Draggable = false
    label.Parent = ScreenGui
    _G.UZIVERT_TIMER_LABEL = label
    
    _G.UZIVERT_TIMER_CON = RunService.Heartbeat:Connect(function()
        local roundTimerPart = workspace:FindFirstChild("RoundTimerPart", true)
        if roundTimerPart then
            local surface = roundTimerPart:FindFirstChild("SurfaceGui", true)
            if surface then
                local timerText = surface:FindFirstChild("Timer", true)
                if timerText and timerText:IsA("TextLabel") then
                    label.Text = timerText.Text
                end
            end
        end
    end)
end

_G.UZIVERT_TIMER_STOP = function()
    if _G.UZIVERT_TIMER_LABEL then
        _G.UZIVERT_TIMER_LABEL:Destroy()
        _G.UZIVERT_TIMER_LABEL = nil
    end
    if _G.UZIVERT_TIMER_CON then
        _G.UZIVERT_TIMER_CON:Disconnect()
        _G.UZIVERT_TIMER_CON = nil
    end
end

-- ============================================
-- 🌀 FLING DROPDOWN
-- ============================================
_G.UZIVERT_FLING_TARGET = nil
_G.UZIVERT_FLING_IN_PROGRESS = false

_G.UZIVERT_FLING_FUNC = function(targetPlayer)
    if _G.UZIVERT_FLING_IN_PROGRESS then return end
    _G.UZIVERT_FLING_IN_PROGRESS = true
    
    local myChar = LocalPlayer.Character
    if not myChar then _G.UZIVERT_FLING_IN_PROGRESS = false return end
    local myHum = myChar:FindFirstChildOfClass("Humanoid")
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    if not (myHum and myRoot) then _G.UZIVERT_FLING_IN_PROGRESS = false return end

    local targetChar = targetPlayer.Character
    if not targetChar then _G.UZIVERT_FLING_IN_PROGRESS = false return end
    local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
    local targetRoot = targetHum and targetHum.RootPart
    local targetHead = targetChar:FindFirstChild("Head")
    local accessory = targetChar:FindFirstChildOfClass("Accessory")
    local handle = accessory and accessory:FindFirstChild("Handle")

    local oldPos = myRoot.CFrame

    repeat
        task.wait()
        workspace.CurrentCamera.CameraSubject = targetHead or handle or targetHum
    until workspace.CurrentCamera.CameraSubject == (targetHead or handle or targetHum)

    local function forcePosition(basePart, offset, angle)
        local targetCF = CFrame.new(basePart.Position) * offset * angle
        myRoot.CFrame = targetCF
        myChar:SetPrimaryPartCFrame(targetCF)
        myRoot.Velocity = Vector3.new(9e7, 9e8, 9e7)
        myRoot.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
    end

    local function flingBasePart(basePart)
        local start = tick()
        local ang = 0
        repeat
            if myRoot and targetHum then
                ang = ang + 100
                for _, off in ipairs{
                    CFrame.new(0, 1.5, 0),
                    CFrame.new(0, -1.5, 0),
                    CFrame.new(2.25, 1.5, -2.25),
                    CFrame.new(-2.25, -1.5, 2.25)
                } do
                    forcePosition(basePart, off + targetHum.MoveDirection, CFrame.Angles(math.rad(ang), 0, 0))
                    task.wait()
                end
            end
        until basePart.Velocity.Magnitude > 500 or tick() - start > 2.5
    end

    local bv = Instance.new("BodyVelocity")
    bv.Name = "UzivertFlingDropdown"
    bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Parent = myRoot
    myHum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

    local targetPart = targetRoot or targetHead or handle
    if targetPart then flingBasePart(targetPart) end

    bv:Destroy()
    myHum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

    repeat
        task.wait()
        workspace.CurrentCamera.CameraSubject = myHum
    until workspace.CurrentCamera.CameraSubject == myHum

    repeat
        local cf = oldPos * CFrame.new(0, 0.5, 0)
        myRoot.CFrame = cf
        myChar:SetPrimaryPartCFrame(cf)
        myHum:ChangeState(Enum.HumanoidStateType.GettingUp)
        for _, part in ipairs(myChar:GetChildren()) do
            if part:IsA("BasePart") then
                part.Velocity = Vector3.zero
                part.RotVelocity = Vector3.zero
            end
        end
        task.wait()
    until (myRoot.Position - oldPos.p).Magnitude < 25

    _G.UZIVERT_FLING_IN_PROGRESS = false
end

_G.UZIVERT_ABRIR_LISTA = function(framePadre, botonDropdown)
    -- Limpiar botones viejos
    for _, child in ipairs(framePadre:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 30)
            btn.BackgroundColor3 = COLORES.Morado3
            btn.BackgroundTransparency = 0.4
            btn.Text = plr.Name
            btn.TextColor3 = COLORES.Texto
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 11
            btn.BorderSizePixel = 0
            btn.Parent = framePadre
            
            local cb = Instance.new("UICorner")
            cb.CornerRadius = UDim.new(0, 5)
            cb.Parent = btn
            
            btn.MouseButton1Click:Connect(function()
                _G.UZIVERT_FLING_TARGET = plr
                botonDropdown.Text = "Fling: " .. plr.Name
                framePadre.Visible = false
            end)
        end
    end
end

-- Restaurar estado guardado
if CONFIG.RoundTimer then
    task.wait(0.5)
    _G.UZIVERT_TIMER_START()
end

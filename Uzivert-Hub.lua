-- ============================================
-- UZIVERT HUB | v4.7.7 HALLOWEEN 🎃
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

local VERSION = "v4.7.7 HALLOWEEN"

-- ============================================
-- UZIVERT HUB - HALLOWEEN DEVICE SELECTOR (v2)
-- Todo con _G.UZ_SEL_*  |  Sin emojis: todo dibujado con Frames
-- ============================================
_G.UZIVERT_GAMA_BAJA = false
_G.UZIVERT_SELECCIONADO = false

_G.UZ_SEL_CONFIG = {
    LAUGH_SOUND = "rbxassetid://8047405326",
    TEETH_SOUND = "rbxassetid://1846999567",
    CREATOR_NAME = "Uzivert",
    TIKTOK = "@Uzivert550",
    INSTAGRAM = "@hxuntedluv77",
    VERSION = "v4.7.7",
}

_G.UZ_SEL_Players = game:GetService("Players")
_G.UZ_SEL_Tween = game:GetService("TweenService")
_G.UZ_SEL_Run = game:GetService("RunService")
_G.UZ_SEL_Input = game:GetService("UserInputService")
_G.UZ_SEL_Debris = game:GetService("Debris")

_G.UZ_SEL_player = _G.UZ_SEL_Players.LocalPlayer

_G.UZ_SEL_ORANGE = Color3.fromRGB(245, 135, 35)
_G.UZ_SEL_ORANGE_LIGHT = Color3.fromRGB(255, 190, 90)
_G.UZ_SEL_PURPLE = Color3.fromRGB(150, 80, 230)
_G.UZ_SEL_GREEN = Color3.fromRGB(74, 222, 128)
_G.UZ_SEL_WEB = Color3.fromRGB(210, 200, 225)
_G.UZ_SEL_BG = Color3.fromRGB(14, 10, 18)
_G.UZ_SEL_BAR = Color3.fromRGB(20, 14, 26)
_G.UZ_SEL_CARD = Color3.fromRGB(24, 17, 30)
_G.UZ_SEL_CARD_LINE = Color3.fromRGB(58, 40, 66)
_G.UZ_SEL_GRAY = Color3.fromRGB(140, 130, 152)
_G.UZ_SEL_BONE = Color3.fromRGB(235, 228, 205)
_G.UZ_SEL_INK = Color3.fromRGB(60, 45, 30)

_G.UZ_SEL_WIN_W, _G.UZ_SEL_WIN_H = 540, 320

------------------------------------------------------------------ helpers
_G.UZ_SEL_new = function(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    o.Parent = parent
    return o
end

_G.UZ_SEL_tween = function(obj, info, goal)
    local t = _G.UZ_SEL_Tween:Create(obj, info, goal)
    t:Play()
    return t
end

_G.UZ_SEL_corner = function(parent, r)
    return _G.UZ_SEL_new("UICorner", { CornerRadius = r or UDim.new(0, 6) }, parent)
end

_G.UZ_SEL_LOOP = function(t, style)
    return TweenInfo.new(t, style or Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true)
end

-- linea entre dos puntos (Frame rotado)
_G.UZ_SEL_setLine = function(f, x1, y1, x2, y2, th)
    local dx, dy = x2 - x1, y2 - y1
    f.Size = UDim2.fromOffset(math.sqrt(dx * dx + dy * dy), th)
    f.Position = UDim2.fromOffset((x1 + x2) / 2, (y1 + y2) / 2)
    f.Rotation = math.deg(math.atan2(dy, dx))
end

_G.UZ_SEL_line = function(parent, color, z)
    return _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
        ZIndex = z or 1,
    }, parent)
end

_G.UZ_SEL_dot = function(parent, size, color, z)
    local f = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromOffset(size, size),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
        ZIndex = z or 1,
    }, parent)
    _G.UZ_SEL_corner(f, UDim.new(1, 0))
    return f
end

_G.UZ_SEL_outline = function(parent, pos, size, color, thick, radius, z)
    local f = _G.UZ_SEL_new("Frame", {
        Position = pos,
        Size = size,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = z or 10,
    }, parent)
    _G.UZ_SEL_corner(f, UDim.new(0, radius or 0))
    _G.UZ_SEL_new("UIStroke", { Thickness = thick, Color = color }, f)
    return f
end

_G.UZ_SEL_solid = function(parent, pos, size, color, radius, z)
    local f = _G.UZ_SEL_new("Frame", {
        Position = pos,
        Size = size,
        BackgroundColor3 = color,
        BorderSizePixel = 0,
        ZIndex = z or 10,
    }, parent)
    if radius then _G.UZ_SEL_corner(f, UDim.new(0, radius)) end
    return f
end

_G.UZ_SEL_hoverable = function(btn, on, off)
    btn.MouseEnter:Connect(on)
    btn.MouseLeave:Connect(off)
    btn.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch then on() end
    end)
    btn.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch then off() end
    end)
end

-- un solo Heartbeat para todas las animaciones
_G.UZ_SEL_updaters = {}
_G.UZ_SEL_addUpdater = function(fn)
    table.insert(_G.UZ_SEL_updaters, fn)
end
_G.UZ_SEL_T0 = os.clock()
_G.UZ_SEL_hb = _G.UZ_SEL_Run.Heartbeat:Connect(function(dt)
    local t = os.clock() - _G.UZ_SEL_T0
    for _, fn in ipairs(_G.UZ_SEL_updaters) do
        pcall(fn, t, dt)
    end
end)

------------------------------------------------------------------ gui + ventana
_G.UZ_SEL_pg = _G.UZ_SEL_player:WaitForChild("PlayerGui")
if _G.UZ_SEL_pg:FindFirstChild("UzivertSelectorHalloween") then
    _G.UZ_SEL_pg.UzivertSelectorHalloween:Destroy()
end

_G.UZ_SEL_gui = _G.UZ_SEL_new("ScreenGui", {
    Name = "UzivertSelectorHalloween",
    ResetOnSpawn = false,
    IgnoreGuiInset = true,
    DisplayOrder = 9999,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
}, _G.UZ_SEL_pg)

_G.UZ_SEL_root = _G.UZ_SEL_new("Frame", {
    Name = "Root",
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(_G.UZ_SEL_WIN_W, _G.UZ_SEL_WIN_H),
    BackgroundTransparency = 1,
}, _G.UZ_SEL_gui)
_G.UZ_SEL_winScale = _G.UZ_SEL_new("UIScale", { Scale = 0 }, _G.UZ_SEL_root)

-- resplandor morado pulsante alrededor
_G.UZ_SEL_glow1 = _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(1, 60, 1, 60), BackgroundColor3 = Color3.fromRGB(140, 60, 220),
    BackgroundTransparency = 0.85, BorderSizePixel = 0, ZIndex = 0,
}, _G.UZ_SEL_root)
_G.UZ_SEL_corner(_G.UZ_SEL_glow1, UDim.new(0, 40))
_G.UZ_SEL_glow2 = _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(1, 30, 1, 30), BackgroundColor3 = Color3.fromRGB(180, 80, 255),
    BackgroundTransparency = 0.7, BorderSizePixel = 0, ZIndex = 1,
}, _G.UZ_SEL_root)
_G.UZ_SEL_corner(_G.UZ_SEL_glow2, UDim.new(0, 25))
_G.UZ_SEL_glow3 = _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.new(1, 12, 1, 12), BackgroundColor3 = Color3.fromRGB(220, 130, 255),
    BackgroundTransparency = 0.55, BorderSizePixel = 0, ZIndex = 2,
}, _G.UZ_SEL_root)
_G.UZ_SEL_corner(_G.UZ_SEL_glow3, UDim.new(0, 14))

_G.UZ_SEL_addUpdater(function(t)
    _G.UZ_SEL_glow1.BackgroundTransparency = 0.88 + 0.04 * math.sin(t * 1.2)
    _G.UZ_SEL_glow2.BackgroundTransparency = 0.78 + 0.05 * math.sin(t * 1.7 + 1)
    _G.UZ_SEL_glow3.BackgroundTransparency = 0.68 + 0.06 * math.sin(t * 2.3 + 2)
end)

_G.UZ_SEL_fitScale = function()
    local cam = workspace.CurrentCamera
    local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
    return math.clamp(math.min(vp.X / (_G.UZ_SEL_WIN_W + 60), vp.Y / (_G.UZ_SEL_WIN_H + 60)), 0.5, 1.4)
end

-- CanvasGroup: recorta todo (telaranas, murcielagos) con las esquinas redondeadas
_G.UZ_SEL_main = _G.UZ_SEL_new("CanvasGroup", {
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = _G.UZ_SEL_BG,
    BackgroundTransparency = 0.15,
    ZIndex = 3,
}, _G.UZ_SEL_root)
_G.UZ_SEL_corner(_G.UZ_SEL_main, UDim.new(0, 8))

-- borde animado (degradado que gira)
_G.UZ_SEL_border = _G.UZ_SEL_new("Frame", {
    Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 20,
}, _G.UZ_SEL_root)
_G.UZ_SEL_corner(_G.UZ_SEL_border, UDim.new(0, 8))
_G.UZ_SEL_mainStroke = _G.UZ_SEL_new("UIStroke", {
    Thickness = 1.5, Color = Color3.new(1, 1, 1), ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
}, _G.UZ_SEL_border)
_G.UZ_SEL_mainStrokeGrad = _G.UZ_SEL_new("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, _G.UZ_SEL_ORANGE),
        ColorSequenceKeypoint.new(0.33, _G.UZ_SEL_PURPLE),
        ColorSequenceKeypoint.new(0.66, _G.UZ_SEL_ORANGE),
        ColorSequenceKeypoint.new(1, _G.UZ_SEL_PURPLE),
    }),
}, _G.UZ_SEL_mainStroke)
_G.UZ_SEL_addUpdater(function(t)
    _G.UZ_SEL_mainStrokeGrad.Rotation = (t * 45) % 360
end)

-- fondo con degradado
_G.UZ_SEL_bgGrad = _G.UZ_SEL_new("Frame", {
    Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1),
    BackgroundTransparency = 0.7, BorderSizePixel = 0, ZIndex = 1,
}, _G.UZ_SEL_main)
_G.UZ_SEL_new("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 10, 30)),
        ColorSequenceKeypoint.new(0.7, Color3.fromRGB(60, 25, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 45, 15)),
    }),
    Rotation = 35,
}, _G.UZ_SEL_bgGrad)

------------------------------------------------------------------ decoracion de fondo
-- telaranas dibujadas (sutiles y animadas)
_G.UZ_SEL_webs = {}
_G.UZ_SEL_createWeb = function(corner, size, yOff)
    local sx = (corner == "TL" or corner == "BL") and 1 or -1
    local sy = (corner == "TL" or corner == "TR") and 1 or -1
    local holder = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(sx == 1 and 0 or 1, sy == 1 and 0 or 1),
        Position = UDim2.new(sx == 1 and 0 or 1, 0, sy == 1 and 0 or 1, yOff or 0),
        Size = UDim2.fromOffset(size, size),
        BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 2,
    }, _G.UZ_SEL_main)
    local ox = sx == 1 and 0 or size
    local oy = sy == 1 and 0 or size
    local function pt(a, r) return ox + sx * r * math.cos(a), oy + sy * r * math.sin(a) end

    local N, RINGS = 6, 6
    local jitter = { 1.0, 0.97, 1.04, 0.99, 1.03, 1.0 }
    local strands, segs = {}, {}
    for i = 0, N - 1 do
        local a = (math.pi / 2) * i / (N - 1)
        local l = _G.UZ_SEL_line(holder, _G.UZ_SEL_WEB, 2)
        local x2, y2 = pt(a, size * 1.5)
        _G.UZ_SEL_setLine(l, ox, oy, x2, y2, 1)
        strands[#strands + 1] = l
    end
    for r = 1, RINGS do
        for i = 0, N - 2 do
            segs[#segs + 1] = {
                r = r, i = i, R = size * 1.1 * (r / RINGS) * jitter[r],
                a1 = (math.pi / 2) * i / (N - 1),
                a2 = (math.pi / 2) * (i + 1) / (N - 1),
                am = (math.pi / 2) * (i + 0.5) / (N - 1),
                l1 = _G.UZ_SEL_line(holder, _G.UZ_SEL_WEB, 1),
                l2 = _G.UZ_SEL_line(holder, _G.UZ_SEL_WEB, 1),
            }
        end
    end
    _G.UZ_SEL_addUpdater(function(t)
        for _, s in ipairs(segs) do
            local sag = 0.84 + 0.035 * math.sin(t * 1.3 + s.r * 0.8 + s.i * 0.5)
            local x1, y1 = pt(s.a1, s.R)
            local x2, y2 = pt(s.a2, s.R)
            local xm, ym = pt(s.am, s.R * sag)
            _G.UZ_SEL_setLine(s.l1, x1, y1, xm, ym, 1)
            _G.UZ_SEL_setLine(s.l2, xm, ym, x2, y2, 1)
            local tr = 0.8 + 0.08 * math.sin(t * 1.8 - s.r * 0.9)
            s.l1.BackgroundTransparency = tr
            s.l2.BackgroundTransparency = tr
        end
        for i, l in ipairs(strands) do
            l.BackgroundTransparency = 0.72 + 0.08 * math.sin(t * 1.1 + i)
        end
    end)
    table.insert(_G.UZ_SEL_webs, holder)
end
_G.UZ_SEL_createWeb("TL", 70, 50)
_G.UZ_SEL_createWeb("TR", 46, 50)
_G.UZ_SEL_createWeb("BL", 56, 0)
_G.UZ_SEL_createWeb("BR", 84, 0)

-- lapidas
_G.UZ_SEL_tombColor = Color3.fromRGB(44, 30, 56)
for _, d in ipairs({
    { 24, 16, 22 }, { 70, 3, 24, true }, { 118, 18, 28 }, { 176, 12, 16 },
    { 236, 3, 20, true }, { 300, 16, 20 }, { 372, 12, 26 }, { 430, 3, 22, true }, { 478, 18, 18 },
}) do
    local x, w, h, cross = d[1], d[2], d[3], d[4]
    if cross then
        _G.UZ_SEL_new("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.fromOffset(x, _G.UZ_SEL_WIN_H + 2),
            Size = UDim2.fromOffset(3, h), BackgroundColor3 = _G.UZ_SEL_tombColor,
            BackgroundTransparency = 0.2, BorderSizePixel = 0, ZIndex = 3,
        }, _G.UZ_SEL_main)
        _G.UZ_SEL_new("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(x, _G.UZ_SEL_WIN_H + 2 - h * 0.7),
            Size = UDim2.fromOffset(12, 3), BackgroundColor3 = _G.UZ_SEL_tombColor,
            BackgroundTransparency = 0.2, BorderSizePixel = 0, ZIndex = 3,
        }, _G.UZ_SEL_main)
    else
        local g = _G.UZ_SEL_new("Frame", {
            AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.fromOffset(x, _G.UZ_SEL_WIN_H + 12),
            Size = UDim2.fromOffset(w, h + 12), BackgroundColor3 = _G.UZ_SEL_tombColor,
            BackgroundTransparency = 0.2, BorderSizePixel = 0, ZIndex = 3,
        }, _G.UZ_SEL_main)
        _G.UZ_SEL_corner(g, UDim.new(0, w))
        _G.UZ_SEL_new("UIStroke", { Color = Color3.fromRGB(90, 60, 90), Transparency = 0.7, Thickness = 1 }, g)
    end
end

-- brasas flotantes (pool, sin crear instancias en bucle)
_G.UZ_SEL_embers = {}
for i = 1, 18 do
    local s = math.random(2, 4)
    local f = _G.UZ_SEL_new("Frame", {
        Size = UDim2.fromOffset(s, s),
        BackgroundColor3 = (i % 3 == 0) and _G.UZ_SEL_PURPLE or ((i % 2 == 0) and _G.UZ_SEL_ORANGE or _G.UZ_SEL_ORANGE_LIGHT),
        BorderSizePixel = 0, ZIndex = 3,
    }, _G.UZ_SEL_main)
    _G.UZ_SEL_corner(f, UDim.new(1, 0))
    _G.UZ_SEL_embers[i] = {
        f = f, x = math.random() * _G.UZ_SEL_WIN_W, y = math.random() * _G.UZ_SEL_WIN_H,
        speed = 8 + math.random() * 16, amp = 6 + math.random() * 10,
        ph = math.random() * 6.28, fr = 0.6 + math.random() * 0.8,
    }
end
_G.UZ_SEL_addUpdater(function(t, dt)
    for _, e in ipairs(_G.UZ_SEL_embers) do
        e.y -= e.speed * dt
        if e.y < -6 then
            e.y = _G.UZ_SEL_WIN_H + 6
            e.x = math.random() * _G.UZ_SEL_WIN_W
        end
        e.f.Position = UDim2.fromOffset(e.x + math.sin(t * e.fr + e.ph) * e.amp, e.y)
        e.f.BackgroundTransparency = 1 - 0.8 * math.sin(math.pi * math.clamp(e.y / _G.UZ_SEL_WIN_H, 0, 1))
    end
end)

-- niebla
_G.UZ_SEL_fogLayer = function(height, color, keys)
    local f = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1),
        Size = UDim2.new(1, 0, 0, height), BackgroundColor3 = color,
        BorderSizePixel = 0, ZIndex = 4,
    }, _G.UZ_SEL_main)
    return _G.UZ_SEL_new("UIGradient", { Transparency = NumberSequence.new(keys) }, f)
end
_G.UZ_SEL_new("UIGradient", {
    Rotation = 90,
    Color = ColorSequence.new(_G.UZ_SEL_PURPLE, _G.UZ_SEL_ORANGE),
    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.85) }),
}, _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1),
    Size = UDim2.new(1, 0, 0, 80), BackgroundColor3 = Color3.new(1, 1, 1),
    BorderSizePixel = 0, ZIndex = 4,
}, _G.UZ_SEL_main))
_G.UZ_SEL_wispKeys = {
    NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.2, 0.9),
    NumberSequenceKeypoint.new(0.4, 1), NumberSequenceKeypoint.new(0.65, 0.88),
    NumberSequenceKeypoint.new(0.85, 1), NumberSequenceKeypoint.new(1, 1),
}
_G.UZ_SEL_wispA = _G.UZ_SEL_fogLayer(44, Color3.fromRGB(190, 150, 255), _G.UZ_SEL_wispKeys)
_G.UZ_SEL_wispB = _G.UZ_SEL_fogLayer(28, Color3.fromRGB(255, 170, 110), _G.UZ_SEL_wispKeys)
_G.UZ_SEL_phaseA, _G.UZ_SEL_phaseB = 0, 0
_G.UZ_SEL_addUpdater(function(t, dt)
    _G.UZ_SEL_phaseA = (_G.UZ_SEL_phaseA + dt * 0.08) % 2
    _G.UZ_SEL_phaseB = (_G.UZ_SEL_phaseB + dt * 0.05) % 2
    _G.UZ_SEL_wispA.Offset = Vector2.new(_G.UZ_SEL_phaseA - 1, 0)
    _G.UZ_SEL_wispB.Offset = Vector2.new(1 - _G.UZ_SEL_phaseB, 0)
end)

-- murcielagos dibujados con lineas
_G.UZ_SEL_bats = {}
_G.UZ_SEL_batColor = Color3.fromRGB(125, 85, 175)
for i = 1, 2 do
    local b = {
        active = false, timer = 2 + i * 3, x = 0, baseY = 0, dir = 1,
        flap = 0, seed = i * 2.1, s = (i == 1) and 1 or 0.75, lines = {},
    }
    b.root = _G.UZ_SEL_new("Frame", {
        Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1, Visible = false, ZIndex = 2,
    }, _G.UZ_SEL_main)
    for k = 1, 8 do
        b.lines[k] = _G.UZ_SEL_line(b.root, _G.UZ_SEL_batColor, 1)
        b.lines[k].BackgroundTransparency = 0.25
    end
    b.body = _G.UZ_SEL_dot(b.root, 5 * b.s, _G.UZ_SEL_batColor, 2)
    _G.UZ_SEL_bats[i] = b
end
_G.UZ_SEL_addUpdater(function(t, dt)
    for _, b in ipairs(_G.UZ_SEL_bats) do
        if not b.active then
            b.timer -= dt
            if b.timer <= 0 then
                b.active = true
                b.dir = (math.random() > 0.5) and 1 or -1
                b.x = (b.dir == 1) and -24 or (_G.UZ_SEL_WIN_W + 24)
                b.baseY = math.random(64, 200)
                b.root.Visible = true
            end
        else
            b.x += b.dir * (46 + b.s * 10) * dt
            b.flap += dt * 13
            b.root.Position = UDim2.fromOffset(b.x, b.baseY + math.sin(t * 1.8 + b.seed) * 16)
            local f, s, li = math.sin(b.flap), b.s, 1
            for side = -1, 1, 2 do
                local tx, ty = side * 14 * s, -f * 9 * s - 2 * s
                local p1x, p1y = side * 9 * s, 5 * s - f * 3 * s
                local p2x, p2y = side * 4 * s, 4 * s
                _G.UZ_SEL_setLine(b.lines[li], 0, -1 * s, tx, ty, 1.5)
                _G.UZ_SEL_setLine(b.lines[li + 1], tx, ty, p1x, p1y, 1.5)
                _G.UZ_SEL_setLine(b.lines[li + 2], p1x, p1y, p2x, p2y, 1.5)
                _G.UZ_SEL_setLine(b.lines[li + 3], p2x, p2y, 0, 2 * s, 1.5)
                li += 4
            end
            if b.x < -30 or b.x > _G.UZ_SEL_WIN_W + 30 then
                b.active = false
                b.root.Visible = false
                b.timer = 5 + math.random() * 7
            end
        end
    end
end)

-- arana colgando de un hilo (sube y baja)
_G.UZ_SEL_spLayer = _G.UZ_SEL_new("Frame", {
    Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 7,
}, _G.UZ_SEL_main)
_G.UZ_SEL_spThread = _G.UZ_SEL_line(_G.UZ_SEL_spLayer, _G.UZ_SEL_WEB, 1)
_G.UZ_SEL_spThread.BackgroundTransparency = 0.35
_G.UZ_SEL_spBody = _G.UZ_SEL_new("Frame", {
    Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1,
}, _G.UZ_SEL_spLayer)
_G.UZ_SEL_spLegs = {}
for k = 0, 7 do
    _G.UZ_SEL_spLegs[k] = {
        a = _G.UZ_SEL_line(_G.UZ_SEL_spBody, Color3.fromRGB(110, 70, 160), 1),
        b = _G.UZ_SEL_line(_G.UZ_SEL_spBody, Color3.fromRGB(110, 70, 160), 1),
    }
end
_G.UZ_SEL_spAbd = _G.UZ_SEL_dot(_G.UZ_SEL_spBody, 10, Color3.fromRGB(45, 30, 70), 2)
_G.UZ_SEL_spAbd.Position = UDim2.fromOffset(0, 6)
_G.UZ_SEL_spAbd.Size = UDim2.fromOffset(10, 12)
_G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(5, 6), Size = UDim2.fromOffset(3, 5),
    BackgroundColor3 = _G.UZ_SEL_ORANGE, BorderSizePixel = 0, ZIndex = 3,
}, _G.UZ_SEL_spAbd)
_G.UZ_SEL_spHead = _G.UZ_SEL_dot(_G.UZ_SEL_spBody, 7, Color3.fromRGB(60, 42, 90), 2)
_G.UZ_SEL_spHead.Position = UDim2.fromOffset(0, -4)
_G.UZ_SEL_spEyeL = _G.UZ_SEL_dot(_G.UZ_SEL_spBody, 2, _G.UZ_SEL_GREEN, 3)
_G.UZ_SEL_spEyeL.Position = UDim2.fromOffset(-1.6, -5)
_G.UZ_SEL_spEyeR = _G.UZ_SEL_dot(_G.UZ_SEL_spBody, 2, _G.UZ_SEL_GREEN, 3)
_G.UZ_SEL_spEyeR.Position = UDim2.fromOffset(1.6, -5)

_G.UZ_SEL_sp = { x = _G.UZ_SEL_WIN_W - 30, state = "idle", timer = 3.5, drop = 0, phase = 0 }
_G.UZ_SEL_legAngles = { -55, -18, 18, 55 }
_G.UZ_SEL_addUpdater(function(t, dt)
    local s = _G.UZ_SEL_sp
    local moving = false
    s.timer -= dt
    if s.state == "idle" then
        if s.timer <= 0 then s.state, s.timer = "drop", 3.4 end
    else
        local el = 3.4 - s.timer
        local k = math.clamp(math.min(el, s.timer), 0, 1)
        s.drop = (1 - (1 - k) ^ 3) * 56
        moving = true
        if s.timer <= 0 then s.state, s.timer, s.drop = "idle", 5 + math.random() * 4, 0 end
    end
    s.phase += dt * (moving and 9 or 2)

    local len = 26 + s.drop + math.sin(t * 1.3) * 5
    local sway = math.sin(t * 0.9) * 4
    local by = 50 + len
    _G.UZ_SEL_setLine(_G.UZ_SEL_spThread, s.x, 50, s.x + sway, by, 1)
    _G.UZ_SEL_spBody.Position = UDim2.fromOffset(s.x + sway, by)
    for k = 0, 7 do
        local side = k < 4 and -1 or 1
        local ang = math.rad(_G.UZ_SEL_legAngles[(k % 4) + 1])
        local dx, dy = side * math.cos(ang), math.sin(ang)
        local wig = math.sin(s.phase + k * 0.9) * 0.22
        local kx, ky = dx * 7, dy * 7 - 5
        local fx, fy = dx * 15 * (1 + wig), dy * 15 + 4 + wig * 5
        _G.UZ_SEL_setLine(_G.UZ_SEL_spLegs[k].a, 0, 0, kx, ky, 1.2)
        _G.UZ_SEL_setLine(_G.UZ_SEL_spLegs[k].b, kx, ky, fx, fy, 1.2)
    end
    local blink = (math.sin(t * 1.7) > 0.96) and 0.9 or 0
    _G.UZ_SEL_spEyeL.BackgroundTransparency = blink
    _G.UZ_SEL_spEyeR.BackgroundTransparency = blink
end)

------------------------------------------------------------------ barra superior
_G.UZ_SEL_topbar = _G.UZ_SEL_new("Frame", {
    Size = UDim2.new(1, 0, 0, 50), BackgroundColor3 = _G.UZ_SEL_BAR,
    BackgroundTransparency = 0.2, BorderSizePixel = 0, ZIndex = 10,
}, _G.UZ_SEL_main)
_G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1), Size = UDim2.new(1, 0, 0, 1),
    BackgroundColor3 = _G.UZ_SEL_ORANGE, BackgroundTransparency = 0.6, BorderSizePixel = 0, ZIndex = 11,
}, _G.UZ_SEL_topbar)

_G.UZ_SEL_avatar = _G.UZ_SEL_new("ImageLabel", {
    Position = UDim2.fromOffset(14, 8), Size = UDim2.fromOffset(34, 34),
    BackgroundColor3 = _G.UZ_SEL_CARD, ZIndex = 12,
}, _G.UZ_SEL_topbar)
_G.UZ_SEL_corner(_G.UZ_SEL_avatar, UDim.new(1, 0))
_G.UZ_SEL_avatarStroke = _G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = Color3.new(1, 1, 1) }, _G.UZ_SEL_avatar)
_G.UZ_SEL_avatarGrad = _G.UZ_SEL_new("UIGradient", {
    Color = ColorSequence.new(_G.UZ_SEL_ORANGE, _G.UZ_SEL_ORANGE_LIGHT),
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.55, 0.85), NumberSequenceKeypoint.new(1, 0),
    }),
}, _G.UZ_SEL_avatarStroke)
task.spawn(function()
    local ok, img = pcall(function()
        return _G.UZ_SEL_Players:GetUserThumbnailAsync(_G.UZ_SEL_player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
    end)
    if ok then _G.UZ_SEL_avatar.Image = img end
end)

_G.UZ_SEL_onlineDot = _G.UZ_SEL_dot(_G.UZ_SEL_topbar, 9, _G.UZ_SEL_GREEN, 13)
_G.UZ_SEL_onlineDot.Position = UDim2.fromOffset(42.5, 40.5)
_G.UZ_SEL_new("UIStroke", { Thickness = 1.5, Color = _G.UZ_SEL_BAR }, _G.UZ_SEL_onlineDot)

_G.UZ_SEL_new("TextLabel", {
    Position = UDim2.fromOffset(56, 9), Size = UDim2.fromOffset(110, 14), BackgroundTransparency = 1,
    Text = _G.UZ_SEL_player.Name, Font = Enum.Font.GothamBold, TextSize = 11,
    TextColor3 = Color3.new(1, 1, 1), TextXAlignment = Enum.TextXAlignment.Left,
    TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 12,
}, _G.UZ_SEL_topbar)

_G.UZ_SEL_xpBack = _G.UZ_SEL_new("Frame", {
    Position = UDim2.fromOffset(56, 29), Size = UDim2.fromOffset(70, 3),
    BackgroundColor3 = Color3.fromRGB(50, 35, 50), BorderSizePixel = 0, ZIndex = 12,
}, _G.UZ_SEL_topbar)
_G.UZ_SEL_corner(_G.UZ_SEL_xpBack, UDim.new(1, 0))
_G.UZ_SEL_xpFill = _G.UZ_SEL_new("Frame", {
    Size = UDim2.fromScale(0, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 13,
}, _G.UZ_SEL_xpBack)
_G.UZ_SEL_corner(_G.UZ_SEL_xpFill, UDim.new(1, 0))
_G.UZ_SEL_xpGrad = _G.UZ_SEL_new("UIGradient", {
    Color = ColorSequence.new(_G.UZ_SEL_ORANGE, _G.UZ_SEL_ORANGE_LIGHT),
}, _G.UZ_SEL_xpFill)
_G.UZ_SEL_tween(_G.UZ_SEL_xpFill, TweenInfo.new(1.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromScale(0.65, 1) })

-- pestanas
_G.UZ_SEL_TAB_W = 90
_G.UZ_SEL_tabNames = { "INICIO", "REDES", "CREADOR" }
_G.UZ_SEL_tabHolder = _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 0),
    Size = UDim2.fromOffset(_G.UZ_SEL_TAB_W * 3, 50), BackgroundTransparency = 1, ZIndex = 12,
}, _G.UZ_SEL_topbar)
_G.UZ_SEL_tabGlow = _G.UZ_SEL_new("Frame", {
    Size = UDim2.fromOffset(_G.UZ_SEL_TAB_W, 50), BackgroundColor3 = _G.UZ_SEL_ORANGE,
    BorderSizePixel = 0, ZIndex = 12,
}, _G.UZ_SEL_tabHolder)
_G.UZ_SEL_new("UIGradient", {
    Rotation = 90,
    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.8) }),
}, _G.UZ_SEL_tabGlow)
_G.UZ_SEL_underline = _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromOffset(15, 50),
    Size = UDim2.fromOffset(_G.UZ_SEL_TAB_W - 30, 2),
    BackgroundColor3 = _G.UZ_SEL_ORANGE, BorderSizePixel = 0, ZIndex = 13,
}, _G.UZ_SEL_tabHolder)

-- FPS / ping reales
_G.UZ_SEL_stats = _G.UZ_SEL_new("TextLabel", {
    AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(100, 16),
    BackgroundTransparency = 1, Text = "-- FPS   |   -- ms", Font = Enum.Font.Gotham, TextSize = 9,
    TextColor3 = _G.UZ_SEL_GRAY, TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 12,
}, _G.UZ_SEL_topbar)
_G.UZ_SEL_statDot = _G.UZ_SEL_dot(_G.UZ_SEL_topbar, 6, _G.UZ_SEL_GREEN, 12)
_G.UZ_SEL_statDot.Position = UDim2.new(1, -120, 0.5, 0)
_G.UZ_SEL_frames, _G.UZ_SEL_acc = 0, 0
_G.UZ_SEL_addUpdater(function(t, dt)
    _G.UZ_SEL_frames += 1
    _G.UZ_SEL_acc += dt
    if _G.UZ_SEL_acc >= 0.5 then
        local fps = math.floor(_G.UZ_SEL_frames / _G.UZ_SEL_acc + 0.5)
        local ok, ping = pcall(function()
            return math.floor(_G.UZ_SEL_player:GetNetworkPing() * 1000 + 0.5)
        end)
        _G.UZ_SEL_stats.Text = string.format("%d FPS   |   %s ms", fps, ok and tostring(ping) or "--")
        _G.UZ_SEL_statDot.Position = UDim2.new(1, -14 - _G.UZ_SEL_stats.TextBounds.X - 10, 0.5, 0)
        _G.UZ_SEL_frames, _G.UZ_SEL_acc = 0, 0
    end
    _G.UZ_SEL_statDot.BackgroundTransparency = 0.4 + 0.4 * math.sin(t * 2.4)
    _G.UZ_SEL_onlineDot.BackgroundTransparency = 0.35 + 0.35 * math.sin(t * 3)
    _G.UZ_SEL_avatarGrad.Rotation = (t * 120) % 360
    _G.UZ_SEL_xpGrad.Offset = Vector2.new(math.sin(t * 2) * 0.3, 0)
end)

-- contenido y pie
_G.UZ_SEL_content = _G.UZ_SEL_new("Frame", {
    Position = UDim2.fromOffset(0, 50), Size = UDim2.new(1, 0, 1, -74),
    BackgroundTransparency = 1, ZIndex = 5,
}, _G.UZ_SEL_main)

_G.UZ_SEL_makePage = function()
    return _G.UZ_SEL_new("CanvasGroup", {
        Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1,
        GroupTransparency = 1, Visible = false, ZIndex = 5,
    }, _G.UZ_SEL_content)
end
_G.UZ_SEL_pages = { INICIO = _G.UZ_SEL_makePage(), REDES = _G.UZ_SEL_makePage(), CREADOR = _G.UZ_SEL_makePage() }

_G.UZ_SEL_new("TextLabel", {
    AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, -14, 1, -5), Size = UDim2.fromOffset(40, 14),
    BackgroundTransparency = 1, Text = "ONLINE", Font = Enum.Font.GothamMedium, TextSize = 8,
    TextColor3 = _G.UZ_SEL_GREEN, TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 12,
}, _G.UZ_SEL_main)
_G.UZ_SEL_footDot = _G.UZ_SEL_dot(_G.UZ_SEL_main, 5, _G.UZ_SEL_GREEN, 12)
_G.UZ_SEL_footDot.Position = UDim2.new(1, -62, 1, -12)
_G.UZ_SEL_new("TextLabel", {
    AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, -70, 1, -5), Size = UDim2.fromOffset(150, 14),
    BackgroundTransparency = 1, Text = "By/ " .. _G.UZ_SEL_CONFIG.CREATOR_NAME, Font = Enum.Font.Gotham,
    TextSize = 8, TextColor3 = _G.UZ_SEL_GRAY, TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 12,
}, _G.UZ_SEL_main)
_G.UZ_SEL_addUpdater(function(t)
    _G.UZ_SEL_footDot.BackgroundTransparency = 0.4 + 0.4 * math.sin(t * 2.4 + 1)
end)

-- aviso (toast)
_G.UZ_SEL_toastFrame = _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.new(0.5, 0, 1, 40), Size = UDim2.fromOffset(210, 26),
    BackgroundColor3 = _G.UZ_SEL_CARD, BorderSizePixel = 0, ZIndex = 30,
}, _G.UZ_SEL_main)
_G.UZ_SEL_corner(_G.UZ_SEL_toastFrame, UDim.new(0, 13))
_G.UZ_SEL_new("UIStroke", { Color = _G.UZ_SEL_ORANGE, Thickness = 1, Transparency = 0.3 }, _G.UZ_SEL_toastFrame)
_G.UZ_SEL_toastText = _G.UZ_SEL_new("TextLabel", {
    Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", Font = Enum.Font.GothamMedium,
    TextSize = 10, TextColor3 = Color3.new(1, 1, 1), ZIndex = 31,
}, _G.UZ_SEL_toastFrame)
_G.UZ_SEL_toastToken = 0
_G.UZ_SEL_toast = function(msg)
    _G.UZ_SEL_toastToken += 1
    local my = _G.UZ_SEL_toastToken
    _G.UZ_SEL_toastText.Text = msg
    _G.UZ_SEL_tween(_G.UZ_SEL_toastFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.new(0.5, 0, 1, -30) })
    task.delay(2.2, function()
        if my == _G.UZ_SEL_toastToken then
            _G.UZ_SEL_tween(_G.UZ_SEL_toastFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quint), { Position = UDim2.new(0.5, 0, 1, 40) })
        end
    end)
end

_G.UZ_SEL_copy = function(text, okMsg)
    local ok = pcall(function() setclipboard(text) end)
    _G.UZ_SEL_toast(ok and okMsg or "No se pudo copiar")
end

------------------------------------------------------------------ iconos dibujados (caja de 34x34)
_G.UZ_SEL_iconDesktop = function(p, c)
    _G.UZ_SEL_outline(p, UDim2.fromOffset(6, 7), UDim2.fromOffset(22, 15), c, 2, 3)
    _G.UZ_SEL_solid(p, UDim2.fromOffset(10, 12), UDim2.fromOffset(14, 2), c, 1)
    _G.UZ_SEL_solid(p, UDim2.fromOffset(10, 16), UDim2.fromOffset(8, 2), c, 1)
    _G.UZ_SEL_solid(p, UDim2.fromOffset(15, 22), UDim2.fromOffset(4, 4), c)
    _G.UZ_SEL_solid(p, UDim2.fromOffset(11, 26), UDim2.fromOffset(12, 2), c, 1)
end

_G.UZ_SEL_iconPhone = function(p, c)
    _G.UZ_SEL_outline(p, UDim2.fromOffset(10, 5), UDim2.fromOffset(14, 24), c, 2, 4)
    _G.UZ_SEL_solid(p, UDim2.fromOffset(14, 8), UDim2.fromOffset(6, 2), c, 1)
    _G.UZ_SEL_solid(p, UDim2.fromOffset(14, 24), UDim2.fromOffset(6, 2), c, 1)
end

_G.UZ_SEL_iconTikTok = function(p, c)
    _G.UZ_SEL_solid(p, UDim2.fromOffset(19, 7), UDim2.fromOffset(3, 16), c)
    _G.UZ_SEL_setLine(_G.UZ_SEL_line(p, c, 10), 21, 8, 27, 13, 3)
    local head = _G.UZ_SEL_dot(p, 9, c, 10)
    head.Position = UDim2.fromOffset(15.5, 23)
end

_G.UZ_SEL_iconInstagram = function(p, c)
    _G.UZ_SEL_outline(p, UDim2.fromOffset(6, 6), UDim2.fromOffset(22, 22), c, 2, 7)
    local lens = _G.UZ_SEL_dot(p, 10, c, 10)
    lens.BackgroundTransparency = 1
    lens.Position = UDim2.fromOffset(17, 17)
    _G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = c }, lens)
    local pt = _G.UZ_SEL_dot(p, 3, c, 10)
    pt.Position = UDim2.fromOffset(23.5, 10.5)
end

------------------------------------------------------------------ efectos: chispas y ondas
_G.UZ_SEL_sparkColors = { _G.UZ_SEL_ORANGE, _G.UZ_SEL_ORANGE_LIGHT, _G.UZ_SEL_PURPLE, Color3.fromRGB(255, 255, 255) }

_G.UZ_SEL_burst = function(origin)
    local main = _G.UZ_SEL_main
    local pos = (origin.AbsolutePosition + origin.AbsoluteSize / 2 - main.AbsolutePosition) / math.max(_G.UZ_SEL_winScale.Scale, 0.05)
    local ring = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(pos.X, pos.Y),
        Size = UDim2.fromOffset(10, 10), BackgroundTransparency = 1, ZIndex = 40,
    }, main)
    _G.UZ_SEL_corner(ring, UDim.new(1, 0))
    local rs = _G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_ORANGE_LIGHT }, ring)
    _G.UZ_SEL_tween(ring, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(96, 96) })
    _G.UZ_SEL_tween(rs, TweenInfo.new(0.5), { Transparency = 1 })
    _G.UZ_SEL_Debris:AddItem(ring, 0.6)
    for _ = 1, 10 do
        local s = math.random(4, 7)
        local p = _G.UZ_SEL_new("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(pos.X, pos.Y),
            Size = UDim2.fromOffset(s, s), Rotation = 45, BorderSizePixel = 0, ZIndex = 41,
            BackgroundColor3 = _G.UZ_SEL_sparkColors[math.random(#_G.UZ_SEL_sparkColors)],
        }, main)
        local a, d = math.random() * math.pi * 2, 36 + math.random() * 50
        _G.UZ_SEL_tween(p, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.fromOffset(pos.X + math.cos(a) * d, pos.Y + math.sin(a) * d),
            BackgroundTransparency = 1, Rotation = 45 + math.random(-200, 200), Size = UDim2.fromOffset(1, 1),
        })
        _G.UZ_SEL_Debris:AddItem(p, 0.7)
    end
end

------------------------------------------------------------------ botones del menu
_G.UZ_SEL_menuItem = function(parentFrame, order, drawIcon, accent, title, subtitle, callback)
    local btn = _G.UZ_SEL_new("TextButton", {
        LayoutOrder = order, Size = UDim2.new(1, 0, 0, 52), BackgroundColor3 = _G.UZ_SEL_CARD,
        BackgroundTransparency = 0.1, AutoButtonColor = false, Text = "", ClipsDescendants = true, ZIndex = 8,
    }, parentFrame)
    _G.UZ_SEL_corner(btn, UDim.new(0, 8))
    local st = _G.UZ_SEL_new("UIStroke", { Thickness = 1, Color = _G.UZ_SEL_CARD_LINE }, btn)
    local sc = _G.UZ_SEL_new("UIScale", { Scale = 0 }, btn)
    local bar = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(3, 0),
        BackgroundColor3 = accent, BorderSizePixel = 0, ZIndex = 10,
    }, btn)

    local textX = 18
    local boxStroke
    if drawIcon then
        textX = 54
        local box = _G.UZ_SEL_new("Frame", {
            Position = UDim2.fromOffset(9, 9), Size = UDim2.fromOffset(34, 34), BackgroundColor3 = accent,
            BackgroundTransparency = 0.8, BorderSizePixel = 0, ZIndex = 9,
        }, btn)
        _G.UZ_SEL_corner(box, UDim.new(0, 6))
        boxStroke = _G.UZ_SEL_new("UIStroke", { Thickness = 1, Color = accent, Transparency = 0.3 }, box)
        drawIcon(box, accent)
    end

    local tl = _G.UZ_SEL_new("TextLabel", {
        Position = UDim2.fromOffset(textX, 9), Size = UDim2.new(1, -textX - 24, 0, 16), BackgroundTransparency = 1,
        Text = title, Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 9,
    }, btn)
    _G.UZ_SEL_new("TextLabel", {
        Position = UDim2.fromOffset(textX, 28), Size = UDim2.new(1, -textX - 24, 0, 14), BackgroundTransparency = 1,
        Text = subtitle, Font = Enum.Font.Gotham, TextSize = 10, TextColor3 = _G.UZ_SEL_GRAY,
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 9,
    }, btn)

    local shine = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, -30, 0.5, 0), Size = UDim2.fromOffset(26, 100),
        BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9, BorderSizePixel = 0, Rotation = 20, ZIndex = 9,
    }, btn)

    local chev = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, -8, 0.5, 0),
        Size = UDim2.fromOffset(10, 12), BackgroundTransparency = 1, ZIndex = 10,
    }, btn)
    local c1 = _G.UZ_SEL_line(chev, accent, 10)
    local c2 = _G.UZ_SEL_line(chev, accent, 10)
    _G.UZ_SEL_setLine(c1, 2, 1, 8, 6, 2)
    _G.UZ_SEL_setLine(c2, 8, 6, 2, 11, 2)
    c1.BackgroundTransparency, c2.BackgroundTransparency = 1, 1

    _G.UZ_SEL_hoverable(btn, function()
        _G.UZ_SEL_tween(btn, TweenInfo.new(0.2), { BackgroundColor3 = _G.UZ_SEL_CARD:Lerp(accent, 0.2) })
        _G.UZ_SEL_tween(st, TweenInfo.new(0.2), { Color = accent })
        _G.UZ_SEL_tween(sc, TweenInfo.new(0.2, Enum.EasingStyle.Back), { Scale = 1.03 })
        _G.UZ_SEL_tween(bar, TweenInfo.new(0.3, Enum.EasingStyle.Back), { Size = UDim2.fromOffset(3, 26) })
        _G.UZ_SEL_tween(tl, TweenInfo.new(0.2), { TextColor3 = accent:Lerp(Color3.new(1, 1, 1), 0.4) })
        if boxStroke then _G.UZ_SEL_tween(boxStroke, TweenInfo.new(0.2), { Transparency = 0 }) end
        shine.Position = UDim2.new(0, -30, 0.5, 0)
        _G.UZ_SEL_tween(shine, TweenInfo.new(0.55, Enum.EasingStyle.Quad), { Position = UDim2.new(1, 40, 0.5, 0) })
        chev.Position = UDim2.new(1, -2, 0.5, 0)
        _G.UZ_SEL_tween(chev, TweenInfo.new(0.3, Enum.EasingStyle.Back), { Position = UDim2.new(1, -16, 0.5, 0) })
        _G.UZ_SEL_tween(c1, TweenInfo.new(0.2), { BackgroundTransparency = 0 })
        _G.UZ_SEL_tween(c2, TweenInfo.new(0.2), { BackgroundTransparency = 0 })
    end, function()
        _G.UZ_SEL_tween(btn, TweenInfo.new(0.25), { BackgroundColor3 = _G.UZ_SEL_CARD })
        _G.UZ_SEL_tween(st, TweenInfo.new(0.25), { Color = _G.UZ_SEL_CARD_LINE })
        _G.UZ_SEL_tween(sc, TweenInfo.new(0.2), { Scale = 1 })
        _G.UZ_SEL_tween(bar, TweenInfo.new(0.2), { Size = UDim2.fromOffset(3, 0) })
        _G.UZ_SEL_tween(tl, TweenInfo.new(0.25), { TextColor3 = Color3.new(1, 1, 1) })
        if boxStroke then _G.UZ_SEL_tween(boxStroke, TweenInfo.new(0.25), { Transparency = 0.3 }) end
        _G.UZ_SEL_tween(c1, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
        _G.UZ_SEL_tween(c2, TweenInfo.new(0.2), { BackgroundTransparency = 1 })
    end)

    btn.Activated:Connect(function()
        _G.UZ_SEL_tween(sc, TweenInfo.new(0.07), { Scale = 0.96 })
        task.delay(0.07, function()
            _G.UZ_SEL_tween(sc, TweenInfo.new(0.2, Enum.EasingStyle.Back), { Scale = 1.03 })
        end)
        _G.UZ_SEL_burst(btn)
        if callback then task.spawn(callback) end
    end)

    task.delay(0.4 + order * 0.1, function()
        _G.UZ_SEL_tween(sc, TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 })
    end)
    return btn
end

_G.UZ_SEL_elegirGama = function(gamaBaja)
    _G.UZIVERT_GAMA_BAJA = gamaBaja
    _G.UZIVERT_SELECCIONADO = true
    print("[Uzivert] Seleccionado: " .. (gamaBaja and "GAMA BAJA" or "GAMA ALTA"))

    _G.UZ_SEL_tween(_G.UZ_SEL_winScale, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), { Scale = 0 })
    task.wait(0.4)
    if _G.UZ_SEL_hb then _G.UZ_SEL_hb:Disconnect() end
    _G.UZ_SEL_gui:Destroy()
    print("[Uzivert] Iniciando Uzivert Hub " .. (gamaBaja and "GAMA BAJA" or "GAMA ALTA"))
end

------------------------------------------------------------------ pagina INICIO
_G.UZ_SEL_home = _G.UZ_SEL_pages.INICIO

_G.UZ_SEL_new("TextLabel", {
    Position = UDim2.fromOffset(16, 10), Size = UDim2.fromOffset(200, 12), BackgroundTransparency = 1,
    Text = "ELEGÍ TU DISPOSITIVO", Font = Enum.Font.GothamBold, TextSize = 8, TextColor3 = Color3.new(1, 1, 1),
    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8,
}, _G.UZ_SEL_home)
_G.UZ_SEL_new("TextLabel", {
    Position = UDim2.new(0, 206, 0, 10), Size = UDim2.fromOffset(60, 12), BackgroundTransparency = 1,
    Text = _G.UZ_SEL_CONFIG.VERSION, Font = Enum.Font.GothamBold, TextSize = 8, TextColor3 = _G.UZ_SEL_ORANGE,
    TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 8,
}, _G.UZ_SEL_home)

_G.UZ_SEL_menuList = _G.UZ_SEL_new("Frame", {
    Position = UDim2.fromOffset(16, 28), Size = UDim2.fromOffset(250, 112), BackgroundTransparency = 1, ZIndex = 8,
}, _G.UZ_SEL_home)
_G.UZ_SEL_new("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, _G.UZ_SEL_menuList)

_G.UZ_SEL_menuItem(_G.UZ_SEL_menuList, 1, _G.UZ_SEL_iconDesktop, Color3.fromRGB(60, 120, 255),
    "GAMA ALTA", "Todas las funciones del hub",
    function()
        task.wait(0.3)
        _G.UZ_SEL_elegirGama(false)
    end)

_G.UZ_SEL_menuItem(_G.UZ_SEL_menuList, 2, _G.UZ_SEL_iconPhone, _G.UZ_SEL_ORANGE,
    "GAMA BAJA", "Solo funciones esenciales",
    function()
        task.wait(0.3)
        _G.UZ_SEL_elegirGama(true)
    end)

-- logo con brillo y parpadeo de vela
_G.UZ_SEL_logo = _G.UZ_SEL_new("TextLabel", {
    Position = UDim2.fromOffset(16, 150), Size = UDim2.fromOffset(250, 44), BackgroundTransparency = 1,
    Text = "UZIVERT HUB", Font = Enum.Font.Creepster, TextSize = 38, TextColor3 = Color3.new(1, 1, 1),
    TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8,
}, _G.UZ_SEL_home)
_G.UZ_SEL_logoGrad = _G.UZ_SEL_new("UIGradient", {
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 50)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 225, 170)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 50)),
    }),
}, _G.UZ_SEL_logo)
_G.UZ_SEL_addUpdater(function(t)
    _G.UZ_SEL_logoGrad.Offset = Vector2.new(math.sin(t * 0.9) * 0.7, 0)
    _G.UZ_SEL_logo.TextTransparency = ((t % 6) < 0.3 and math.sin(t * 90) > 0) and 0.55 or 0
end)

-- pieza central: aura, sellos giratorios, chispas orbitando, craneo
_G.UZ_SEL_showcase = _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.77, 0, 0.47, 0),
    Size = UDim2.fromOffset(190, 190), BackgroundTransparency = 1, ZIndex = 6,
}, _G.UZ_SEL_home)

_G.UZ_SEL_aura = {}
for i, sz in ipairs({ 186, 150, 112 }) do
    local c = _G.UZ_SEL_dot(_G.UZ_SEL_showcase, sz, _G.UZ_SEL_ORANGE, 5)
    c.Position = UDim2.fromScale(0.5, 0.5)
    c.BackgroundTransparency = 0.9 - i * 0.012
    _G.UZ_SEL_aura[i] = c
end

_G.UZ_SEL_halo = _G.UZ_SEL_dot(_G.UZ_SEL_showcase, 150, _G.UZ_SEL_ORANGE, 6)
_G.UZ_SEL_halo.Position = UDim2.fromScale(0.5, 0.5)
_G.UZ_SEL_halo.BackgroundTransparency = 0.85
_G.UZ_SEL_new("UIStroke", { Thickness = 1.5, Color = _G.UZ_SEL_ORANGE, Transparency = 0.4 }, _G.UZ_SEL_halo)

_G.UZ_SEL_squares = {}
for i = 1, 2 do
    local sq = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(i == 1 and 140 or 128, i == 1 and 140 or 128),
        BackgroundTransparency = 1, ZIndex = 7,
    }, _G.UZ_SEL_showcase)
    _G.UZ_SEL_new("UIStroke", { Thickness = 1.5, Color = _G.UZ_SEL_ORANGE, Transparency = (i == 1) and 0.1 or 0.35 }, sq)
    if i == 1 then
        for _, p in ipairs({ { 0, 0 }, { 1, 0 }, { 0, 1 }, { 1, 1 } }) do
            _G.UZ_SEL_new("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(p[1], p[2]), Size = UDim2.fromOffset(5, 5),
                BackgroundColor3 = _G.UZ_SEL_ORANGE_LIGHT, BorderSizePixel = 0, ZIndex = 8,
            }, sq)
        end
    end
    _G.UZ_SEL_squares[i] = sq
end

_G.UZ_SEL_orbiters = {}
for i = 1, 8 do
    local c = _G.UZ_SEL_dot(_G.UZ_SEL_showcase, 3 + (i % 3), (i % 3 == 0) and _G.UZ_SEL_PURPLE or _G.UZ_SEL_ORANGE_LIGHT, 8)
    _G.UZ_SEL_orbiters[i] = {
        f = c, r = 80 + (i % 3) * 7, sp = ((i % 2 == 0) and 1 or -1) * (0.3 + i * 0.06), ph = i * 0.8,
    }
end

_G.UZ_SEL_skullHolder = _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(92, 102), BackgroundTransparency = 1, ZIndex = 9,
}, _G.UZ_SEL_showcase)
_G.UZ_SEL_skull = _G.UZ_SEL_new("Frame", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 9,
}, _G.UZ_SEL_skullHolder)
_G.UZ_SEL_skullScale = _G.UZ_SEL_new("UIScale", { Scale = 1 }, _G.UZ_SEL_skull)

_G.UZ_SEL_bone = function(props, parent)
    props.BackgroundColor3 = props.BackgroundColor3 or _G.UZ_SEL_BONE
    props.BorderSizePixel = 0
    props.ZIndex = props.ZIndex or 10
    return _G.UZ_SEL_new("Frame", props, parent)
end

_G.UZ_SEL_cranium = _G.UZ_SEL_bone({
    AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0.02), Size = UDim2.fromScale(0.88, 0.68),
}, _G.UZ_SEL_skull)
_G.UZ_SEL_corner(_G.UZ_SEL_cranium, UDim.new(0.5, 0))
_G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_INK }, _G.UZ_SEL_cranium)

_G.UZ_SEL_cheek = _G.UZ_SEL_bone({
    AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.62, 0.3),
}, _G.UZ_SEL_skull)
_G.UZ_SEL_corner(_G.UZ_SEL_cheek, UDim.new(0.3, 0))
_G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_INK }, _G.UZ_SEL_cheek)

_G.UZ_SEL_mouth = _G.UZ_SEL_bone({
    AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.fromScale(0.5, 0.66), Size = UDim2.fromScale(0.5, 0.2),
    BackgroundColor3 = Color3.fromRGB(10, 5, 10),
}, _G.UZ_SEL_skull)
_G.UZ_SEL_corner(_G.UZ_SEL_mouth, UDim.new(0.3, 0))

_G.UZ_SEL_eyes, _G.UZ_SEL_pupils = {}, {}
for i = 1, 2 do
    local socket = _G.UZ_SEL_bone({
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(i == 1 and 0.34 or 0.66, 0.33),
        Size = UDim2.fromScale(0.24, 0.24), BackgroundColor3 = Color3.fromRGB(8, 4, 8),
        Rotation = i == 1 and 12 or -12, ZIndex = 12,
    }, _G.UZ_SEL_skull)
    _G.UZ_SEL_corner(socket, UDim.new(0.45, 0))
    local pupil = _G.UZ_SEL_bone({
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.35, 0.35),
        BackgroundColor3 = _G.UZ_SEL_ORANGE, ZIndex = 13,
    }, socket)
    _G.UZ_SEL_corner(pupil, UDim.new(1, 0))
    _G.UZ_SEL_tween(pupil, _G.UZ_SEL_LOOP(0.5), { BackgroundColor3 = Color3.fromRGB(255, 40, 30), Size = UDim2.fromScale(0.5, 0.5) })
    _G.UZ_SEL_eyes[i] = socket
    _G.UZ_SEL_pupils[i] = pupil
end

-- nariz (triangulo dibujado con un rombo)
_G.UZ_SEL_nose = _G.UZ_SEL_bone({
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.56), Size = UDim2.fromOffset(7, 7),
    BackgroundColor3 = Color3.fromRGB(10, 5, 10), Rotation = 45, ZIndex = 12,
}, _G.UZ_SEL_skull)

_G.UZ_SEL_teethRow = function(parent, pos, size, z)
    local row = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0), Position = pos, Size = size, BackgroundTransparency = 1, ZIndex = z,
    }, parent)
    _G.UZ_SEL_new("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0.02, 0),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
    }, row)
    for _ = 1, 6 do
        local t = _G.UZ_SEL_bone({ Size = UDim2.fromScale(0.13, 1), ZIndex = z }, row)
        _G.UZ_SEL_corner(t, UDim.new(0.2, 0))
        _G.UZ_SEL_new("UIStroke", { Thickness = 1, Color = _G.UZ_SEL_INK }, t)
    end
end
_G.UZ_SEL_teethRow(_G.UZ_SEL_skull, UDim2.fromScale(0.5, 0.64), UDim2.fromScale(0.5, 0.1), 12)

_G.UZ_SEL_JAW_CLOSED = UDim2.fromScale(0.5, 0.74)
_G.UZ_SEL_JAW_OPEN = UDim2.fromScale(0.5, 0.9)
_G.UZ_SEL_jaw = _G.UZ_SEL_bone({
    AnchorPoint = Vector2.new(0.5, 0), Position = _G.UZ_SEL_JAW_CLOSED, Size = UDim2.fromScale(0.56, 0.2), ZIndex = 11,
}, _G.UZ_SEL_skull)
_G.UZ_SEL_corner(_G.UZ_SEL_jaw, UDim.new(0.35, 0))
_G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_INK }, _G.UZ_SEL_jaw)
_G.UZ_SEL_teethRow(_G.UZ_SEL_jaw, UDim2.fromScale(0.5, 0.05), UDim2.fromScale(0.9, 0.45), 12)

_G.UZ_SEL_laughText = _G.UZ_SEL_new("TextLabel", {
    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.06), Size = UDim2.fromOffset(150, 24),
    BackgroundTransparency = 1, Text = "", Font = Enum.Font.Creepster, TextScaled = true,
    TextColor3 = _G.UZ_SEL_ORANGE_LIGHT, TextTransparency = 1, ZIndex = 20,
}, _G.UZ_SEL_showcase)
_G.UZ_SEL_laughStroke = _G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = Color3.fromRGB(80, 0, 0), Transparency = 1 }, _G.UZ_SEL_laughText)

-- animacion continua de la pieza central (flota, gira, orbita, ojos siguen el cursor)
_G.UZ_SEL_eyeX, _G.UZ_SEL_eyeY = 0, 0
_G.UZ_SEL_addUpdater(function(t, dt)
    _G.UZ_SEL_squares[1].Rotation = (t * 22) % 360
    _G.UZ_SEL_squares[2].Rotation = (-t * 15) % 360
    local pulse = math.sin(t * 2.2)
    _G.UZ_SEL_halo.Size = UDim2.fromOffset(150 + pulse * 6, 150 + pulse * 6)
    _G.UZ_SEL_halo.BackgroundTransparency = 0.88 + pulse * 0.03
    for i, c in ipairs(_G.UZ_SEL_aura) do
        c.BackgroundTransparency = 0.9 - i * 0.012 + 0.02 * math.sin(t * 1.6 + i)
    end
    for _, o in ipairs(_G.UZ_SEL_orbiters) do
        local a = t * o.sp + o.ph
        o.f.Position = UDim2.fromScale(0.5, 0.5) + UDim2.fromOffset(math.cos(a) * o.r, math.sin(a) * o.r * 0.92)
        o.f.BackgroundTransparency = 0.1 + 0.4 * (0.5 + 0.5 * math.sin(t * 2 + o.ph))
    end
    _G.UZ_SEL_skullHolder.Position = UDim2.fromScale(0.5, 0.5 + math.sin(t * 1.8) * 0.025)

    local sh = _G.UZ_SEL_showcase
    local c = sh.AbsolutePosition + sh.AbsoluteSize / 2
    local d = _G.UZ_SEL_Input:GetMouseLocation() - c
    local m = d.Magnitude
    local k = math.min(m, 300) / 300
    local dir = (m > 0) and d.Unit or Vector2.new(0, 0)
    local a = math.min(1, dt * 10)
    _G.UZ_SEL_eyeX += (dir.X * 0.18 * k - _G.UZ_SEL_eyeX) * a
    _G.UZ_SEL_eyeY += (dir.Y * 0.18 * k - _G.UZ_SEL_eyeY) * a
    for _, p in ipairs(_G.UZ_SEL_pupils) do
        p.Position = UDim2.fromScale(0.5 + _G.UZ_SEL_eyeX, 0.5 + _G.UZ_SEL_eyeY)
    end
end)

_G.UZ_SEL_playSound = function(id, speed)
    if id == "" then return end
    pcall(function()
        local s = _G.UZ_SEL_new("Sound", { SoundId = id, Volume = 1, PlaybackSpeed = speed or 1 }, _G.UZ_SEL_root)
        s:Play()
        _G.UZ_SEL_Debris:AddItem(s, 4)
    end)
end

_G.UZ_SEL_ripple = function()
    local ring = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(60, 60), BackgroundTransparency = 1, ZIndex = 6,
    }, _G.UZ_SEL_showcase)
    _G.UZ_SEL_corner(ring, UDim.new(1, 0))
    local rs = _G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_ORANGE_LIGHT }, ring)
    _G.UZ_SEL_tween(ring, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(200, 200) })
    _G.UZ_SEL_tween(rs, TweenInfo.new(0.7), { Transparency = 1 })
    _G.UZ_SEL_Debris:AddItem(ring, 0.8)
end

_G.UZ_SEL_laughTexts = { "HA HA HA!", "MUAJAJAJA!", "JE JE JE!", "HAHAHAHA!" }
_G.UZ_SEL_isLaughing = false

_G.UZ_SEL_laugh = function()
    if _G.UZ_SEL_isLaughing then return end
    _G.UZ_SEL_isLaughing = true
    _G.UZ_SEL_laughText.Text = _G.UZ_SEL_laughTexts[math.random(#_G.UZ_SEL_laughTexts)]
    _G.UZ_SEL_laughText.TextTransparency = 1
    _G.UZ_SEL_laughText.Position = UDim2.fromScale(0.5, 0.1)
    _G.UZ_SEL_laughText.Rotation = -6
    _G.UZ_SEL_tween(_G.UZ_SEL_laughText, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        TextTransparency = 0, Position = UDim2.fromScale(0.5, 0.0), Rotation = 6,
    })
    _G.UZ_SEL_tween(_G.UZ_SEL_laughStroke, TweenInfo.new(0.3), { Transparency = 0 })
    _G.UZ_SEL_playSound(_G.UZ_SEL_CONFIG.LAUGH_SOUND, 1)

    for i = 1, 8 do
        if i % 3 == 1 then _G.UZ_SEL_ripple() end
        _G.UZ_SEL_tween(_G.UZ_SEL_jaw, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = _G.UZ_SEL_JAW_OPEN })
        _G.UZ_SEL_tween(_G.UZ_SEL_skull, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { Rotation = (i % 2 == 0) and 7 or -7 })
        _G.UZ_SEL_tween(_G.UZ_SEL_skullScale, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { Scale = 1.08 })
        for _, e in ipairs(_G.UZ_SEL_eyes) do
            _G.UZ_SEL_tween(e, TweenInfo.new(0.1), { Size = UDim2.fromScale(0.24, 0.17) })
        end
        task.wait(0.11)
        _G.UZ_SEL_tween(_G.UZ_SEL_jaw, TweenInfo.new(0.09, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = _G.UZ_SEL_JAW_CLOSED })
        _G.UZ_SEL_tween(_G.UZ_SEL_skullScale, TweenInfo.new(0.09, Enum.EasingStyle.Quad), { Scale = 1 })
        for _, e in ipairs(_G.UZ_SEL_eyes) do
            _G.UZ_SEL_tween(e, TweenInfo.new(0.09), { Size = UDim2.fromScale(0.24, 0.24) })
        end
        _G.UZ_SEL_playSound(_G.UZ_SEL_CONFIG.TEETH_SOUND, 0.9 + math.random() * 0.4)
        task.wait(0.09)
    end

    _G.UZ_SEL_tween(_G.UZ_SEL_skull, TweenInfo.new(0.25, Enum.EasingStyle.Back), { Rotation = 0 })
    _G.UZ_SEL_tween(_G.UZ_SEL_laughText, TweenInfo.new(0.4), { TextTransparency = 1 })
    _G.UZ_SEL_tween(_G.UZ_SEL_laughStroke, TweenInfo.new(0.4), { Transparency = 1 })
    _G.UZ_SEL_isLaughing = false
end

task.spawn(function()
    task.wait(1.2)
    while _G.UZ_SEL_gui.Parent do
        if _G.UZ_SEL_home.Visible and _G.UZ_SEL_home.GroupTransparency < 0.5 then
            pcall(_G.UZ_SEL_laugh)
        end
        task.wait(1.5 + math.random() * 1.5)
    end
end)

_G.UZ_SEL_skullBtn = _G.UZ_SEL_new("TextButton", {
    Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", ZIndex = 25,
}, _G.UZ_SEL_skullHolder)
_G.UZ_SEL_skullBtn.Activated:Connect(function()
    _G.UZ_SEL_burst(_G.UZ_SEL_skullHolder)
    _G.UZ_SEL_laugh()
end)

------------------------------------------------------------------ pagina REDES
do
    local r = _G.UZ_SEL_pages.REDES
    _G.UZ_SEL_new("TextLabel", {
        Position = UDim2.fromOffset(16, 10), Size = UDim2.fromOffset(200, 12), BackgroundTransparency = 1,
        Text = "MIS REDES", Font = Enum.Font.GothamBold, TextSize = 8, TextColor3 = Color3.new(1, 1, 1),
        TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8,
    }, r)

    _G.UZ_SEL_redesList = _G.UZ_SEL_new("Frame", {
        Position = UDim2.fromOffset(16, 28), Size = UDim2.fromOffset(250, 112), BackgroundTransparency = 1, ZIndex = 8,
    }, r)
    _G.UZ_SEL_new("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, _G.UZ_SEL_redesList)

    _G.UZ_SEL_menuItem(_G.UZ_SEL_redesList, 1, _G.UZ_SEL_iconTikTok, Color3.fromRGB(70, 220, 230),
        "TIKTOK", _G.UZ_SEL_CONFIG.TIKTOK,
        function()
            _G.UZ_SEL_copy("https://tiktok.com/" .. _G.UZ_SEL_CONFIG.TIKTOK, "Link de TikTok copiado")
        end)

    _G.UZ_SEL_menuItem(_G.UZ_SEL_redesList, 2, _G.UZ_SEL_iconInstagram, Color3.fromRGB(230, 80, 150),
        "INSTAGRAM", _G.UZ_SEL_CONFIG.INSTAGRAM,
        function()
            _G.UZ_SEL_copy("https://instagram.com/" .. _G.UZ_SEL_CONFIG.INSTAGRAM, "Link de Instagram copiado")
        end)

    _G.UZ_SEL_new("TextLabel", {
        Position = UDim2.fromOffset(16, 150), Size = UDim2.fromOffset(250, 20), BackgroundTransparency = 1,
        Text = "Tocá un botón para copiar el link", Font = Enum.Font.Gotham, TextSize = 9,
        TextColor3 = _G.UZ_SEL_GRAY, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8,
    }, r)

    -- adorno a la derecha: rombo giratorio con anillos
    _G.UZ_SEL_redesDeco = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.77, 0, 0.47, 0),
        Size = UDim2.fromOffset(150, 150), BackgroundTransparency = 1, ZIndex = 6,
    }, r)
    _G.UZ_SEL_redesRings = {}
    for i = 1, 3 do
        local sq = _G.UZ_SEL_outline(_G.UZ_SEL_redesDeco, UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(40 + i * 14, 40 + i * 14),
            UDim2.fromOffset(80 + i * 28, 80 + i * 28), (i == 2) and _G.UZ_SEL_PURPLE or _G.UZ_SEL_ORANGE, 1.5, 6, 7)
        _G.UZ_SEL_redesRings[i] = sq
    end
    _G.UZ_SEL_redesCore = _G.UZ_SEL_dot(_G.UZ_SEL_redesDeco, 26, _G.UZ_SEL_ORANGE, 8)
    _G.UZ_SEL_redesCore.Position = UDim2.fromScale(0.5, 0.5)
    _G.UZ_SEL_addUpdater(function(t)
        for i, sq in ipairs(_G.UZ_SEL_redesRings) do
            sq.Rotation = (t * (i % 2 == 0 and -16 or 20) + i * 15) % 360
        end
        local p = 0.5 + 0.5 * math.sin(t * 2.4)
        _G.UZ_SEL_redesCore.BackgroundTransparency = 0.2 + 0.5 * p
        _G.UZ_SEL_redesCore.Size = UDim2.fromOffset(22 + p * 8, 22 + p * 8)
    end)
end

------------------------------------------------------------------ pagina CREADOR
do
    local c = _G.UZ_SEL_pages.CREADOR
    _G.UZ_SEL_credTitle = _G.UZ_SEL_new("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.3), Size = UDim2.fromOffset(300, 56),
        BackgroundTransparency = 1, Text = "UZIVERT HUB", Font = Enum.Font.Creepster, TextScaled = true,
        TextColor3 = Color3.new(1, 1, 1), ZIndex = 8,
    }, c)
    _G.UZ_SEL_credGrad = _G.UZ_SEL_new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 50)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 225, 170)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 50)),
        }),
    }, _G.UZ_SEL_credTitle)

    -- divisor con rombo central
    _G.UZ_SEL_divL = _G.UZ_SEL_solid(c, UDim2.new(0.5, -90, 0.5, -4), UDim2.fromOffset(78, 1), _G.UZ_SEL_ORANGE, nil, 8)
    _G.UZ_SEL_divR = _G.UZ_SEL_solid(c, UDim2.new(0.5, 12, 0.5, -4), UDim2.fromOffset(78, 1), _G.UZ_SEL_ORANGE, nil, 8)
    _G.UZ_SEL_divD = _G.UZ_SEL_new("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, -3.5), Size = UDim2.fromOffset(8, 8),
        BackgroundColor3 = _G.UZ_SEL_ORANGE, BorderSizePixel = 0, Rotation = 45, ZIndex = 8,
    }, c)

    _G.UZ_SEL_new("TextLabel", {
        AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0.5, 14), Size = UDim2.fromOffset(300, 70),
        BackgroundTransparency = 1, RichText = true,
        Text = "Hecho por <b>" .. _G.UZ_SEL_CONFIG.CREATOR_NAME .. "</b>\nTruco o trato\n\nVersión: " .. _G.UZ_SEL_CONFIG.VERSION,
        Font = Enum.Font.Gotham, TextSize = 11, TextColor3 = _G.UZ_SEL_GRAY, ZIndex = 8,
    }, c)

    _G.UZ_SEL_addUpdater(function(t)
        _G.UZ_SEL_credGrad.Offset = Vector2.new(math.sin(t * 0.9) * 0.7, 0)
        _G.UZ_SEL_credTitle.TextTransparency = ((t % 5) < 0.25 and math.sin(t * 90) > 0) and 0.5 or 0
        _G.UZ_SEL_divD.Rotation = 45 + math.sin(t * 1.5) * 20
        _G.UZ_SEL_divD.BackgroundTransparency = 0.1 + 0.3 * (0.5 + 0.5 * math.sin(t * 2.2))
    end)
end

------------------------------------------------------------------ pestanas: logica
_G.UZ_SEL_currentTab = nil
_G.UZ_SEL_tabButtons = {}

_G.UZ_SEL_setTab = function(name)
    if _G.UZ_SEL_currentTab == name then return end
    local prev = _G.UZ_SEL_currentTab
    _G.UZ_SEL_currentTab = name
    local idx = table.find(_G.UZ_SEL_tabNames, name)
    local x = (idx - 1) * _G.UZ_SEL_TAB_W
    _G.UZ_SEL_tween(_G.UZ_SEL_underline, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.fromOffset(x + 15, 50),
    })
    _G.UZ_SEL_tween(_G.UZ_SEL_tabGlow, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.fromOffset(x, 0),
    })
    for n, b in pairs(_G.UZ_SEL_tabButtons) do
        _G.UZ_SEL_tween(b, TweenInfo.new(0.2), { TextColor3 = (n == name) and _G.UZ_SEL_ORANGE or _G.UZ_SEL_GRAY })
    end
    if prev then
        local old = _G.UZ_SEL_pages[prev]
        _G.UZ_SEL_tween(old, TweenInfo.new(0.18, Enum.EasingStyle.Quint), {
            GroupTransparency = 1, Position = UDim2.fromOffset(-24, 0),
        })
        task.delay(0.18, function()
            if _G.UZ_SEL_currentTab ~= prev then old.Visible = false end
        end)
    end
    local new = _G.UZ_SEL_pages[name]
    new.Position = UDim2.fromOffset(24, 0)
    new.GroupTransparency = 1
    new.Visible = true
    _G.UZ_SEL_tween(new, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        GroupTransparency = 0, Position = UDim2.fromOffset(0, 0),
    })
end

for i, name in ipairs(_G.UZ_SEL_tabNames) do
    local b = _G.UZ_SEL_new("TextButton", {
        Position = UDim2.fromOffset((i - 1) * _G.UZ_SEL_TAB_W, 0), Size = UDim2.fromOffset(_G.UZ_SEL_TAB_W, 50),
        BackgroundTransparency = 1, Text = name, Font = Enum.Font.GothamBold, TextSize = 9,
        TextColor3 = _G.UZ_SEL_GRAY, ZIndex = 14,
    }, _G.UZ_SEL_tabHolder)
    b.Activated:Connect(function()
        _G.UZ_SEL_setTab(name)
    end)
    _G.UZ_SEL_tabButtons[name] = b
end

-- arrastrar ventana
do
    local dragging, dragStart, startPos
    _G.UZ_SEL_topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = _G.UZ_SEL_root.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    _G.UZ_SEL_Input.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local d = (input.Position - dragStart) / math.max(_G.UZ_SEL_winScale.Scale, 0.1)
            _G.UZ_SEL_root.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
end

------------------------------------------------------------------ abrir
_G.UZ_SEL_setTab("INICIO")
_G.UZ_SEL_tween(_G.UZ_SEL_winScale, TweenInfo.new(0.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _G.UZ_SEL_fitScale() })

_G.UZ_SEL_cam = workspace.CurrentCamera
if _G.UZ_SEL_cam then
    _G.UZ_SEL_cam:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        _G.UZ_SEL_winScale.Scale = _G.UZ_SEL_fitScale()
    end)
end

-- esperar a que el usuario elija
while not _G.UZIVERT_SELECCIONADO do
    task.wait(0.1)
end

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
    AimWall = false,
    AimFOV = false,
    AimFOVRadius = 250,
    AimSmooth = 25,
    AimHoriz = false,
    AimPart = "Head",
    AimPred = 0.145,
    AimBtnShow = true,
    AimBtnPos = nil,
    AutoStab = false,
    AutoStabRango = 6,
    ModoNoche = false,
    AutoGetGun = false,
    RoundTimer = false,
    MusicVolumen = 0.5,
    CancionesCustom = {},
    GunAura = false,
    GunAuraRango = 25,
    SilentAim = false,
    SilentPred = 0.10,
    AntiAim = false,
    AntiAimIgnore = true,
    AntiAimSlot1 = "None",
    AntiAimSlot2 = "None",
    AntiAimSlot3 = "None",
    SpeedGlitch = false,
    SpeedGlitchValor = 50,
    Headless = false,
    KorbloxRight = false,
    KorbloxLeft = false,
    InventoryUnlimiter = false,
    InventoryMaxItems = 10,
    AutoGetTools = false,
    AutoToySlot1 = "None",
    AutoToySlot2 = "None",
    AutoToySlot3 = "None",
    AutoToySlot4 = "None",
    FireflyClutch = false,
    FireflyTimer = true,
    FireflyTimerSize = 5,
    ShootTPVisible = false,
    ShootTPPos = nil,
}

local CONFIG = {}

local function cargarConfig()
    if isfile and isfile(ARCHIVO_CONFIG) then
        local ok, data = pcall(function()
            return HttpService:JSONDecode(readfile(ARCHIVO_CONFIG))
        end)
        if ok and data then
            CONFIG = data
            print("🎃 Configuración v4.7.4 cargada")
            return true
        end
    end
    CONFIG = CONFIG_DEFAULT
    print("📝 Configuración v4.7.4 por defecto")
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

print("🎃 Parte 1/10 cargada - v4.7.4 HALLOWEEN")

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
if PlayerGui:FindFirstChild("UzivertHub") then PlayerGui.UzivertHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UzivertHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = PlayerGui

local Panel, crearPagina, crearToggle, crearBoton, crearSlider, crearSelector, crearTarjeta
local Paginas = {}

do
	local LITE = (_G.UZIVERT_GAMA_BAJA == true) -- gama baja: menos efectos
	local UI = {}
	_G.UZ_UI = UI
	UI.visible = false
	UI.abierto = false

	local WIN_W, WIN_H, SIDE_W = 520, 340, 132
	local BACK = Enum.EasingStyle.Back

	local C = {
		bg = Color3.fromRGB(14, 10, 18),
		card = Color3.fromRGB(26, 17, 32),
		cardHi = Color3.fromRGB(44, 26, 40),
		dark = Color3.fromRGB(18, 11, 24),
		line = Color3.fromRGB(70, 46, 60),
		off = Color3.fromRGB(50, 38, 64),
		web = Color3.fromRGB(210, 200, 225),
		or1 = COLORES.Naranja1, or2 = COLORES.Naranja2, or3 = COLORES.Naranja3,
		pu1 = COLORES.Morado1, pu2 = COLORES.Morado2, pu3 = COLORES.Morado3,
		text = COLORES.Texto, sub = COLORES.Sub,
		red = COLORES.Rojo, green = COLORES.Verde, yellow = COLORES.Amarillo,
	}

	---------------------------------------------------------------- helpers
	local function N(class, props, parent)
		local o = Instance.new(class)
		for k, v in pairs(props) do o[k] = v end
		o.Parent = parent
		return o
	end

	local function TW(o, t, goal, style, dir)
		local tw = TweenService:Create(o, TweenInfo.new(t, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), goal)
		tw:Play()
		return tw
	end

	local function corner(p, r)
		return N("UICorner", { CornerRadius = UDim.new(0, r) }, p)
	end

	local function setLine(f, x1, y1, x2, y2, th)
		local dx, dy = x2 - x1, y2 - y1
		f.Size = UDim2.fromOffset(math.sqrt(dx * dx + dy * dy), th)
		f.Position = UDim2.fromOffset((x1 + x2) / 2, (y1 + y2) / 2)
		f.Rotation = math.deg(math.atan2(dy, dx))
	end

	local function line(parent, color, z)
		return N("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = color, BorderSizePixel = 0, ZIndex = z or 1,
		}, parent)
	end

	local function dot(parent, size, color, z)
		local f = N("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(size, size),
			BackgroundColor3 = color, BorderSizePixel = 0, ZIndex = z or 1,
		}, parent)
		corner(f, 999)
		return f
	end

	local function lum(c) return 0.299 * c.R + 0.587 * c.G + 0.114 * c.B end

	local function accentOf(color)
		if not color then return C.pu2 end
		if lum(color) < 0.2 then return C.or1 end
		return color
	end

	local function hoverable(btn, on, off)
		btn.MouseEnter:Connect(on)
		btn.MouseLeave:Connect(off)
		btn.InputBegan:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.Touch then on() end
		end)
		btn.InputEnded:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.Touch then off() end
		end)
	end

	local function ripple(parent, color, z, size)
		local r = dot(parent, 10, color, z or 12)
		r.Position = UDim2.fromScale(0.5, 0.5)
		r.BackgroundTransparency = 0.6
		TW(r, 0.5, { Size = UDim2.fromOffset(size or 260, size or 260), BackgroundTransparency = 1 })
		Debris:AddItem(r, 0.6)
	end

	---------------------------------------------------------------- animador global
	local upAlways, upPanel = {}, {}
	UI.addUpdater = function(fn, always)
		table.insert(always and upAlways or upPanel, fn)
	end
	local T0 = os.clock()
	UI.hb = RunService.Heartbeat:Connect(function(dt)
		local t = os.clock() - T0
		for _, fn in ipairs(upAlways) do pcall(fn, t, dt) end
		if UI.visible then
			for _, fn in ipairs(upPanel) do pcall(fn, t, dt) end
		end
	end)

	---------------------------------------------------------------- ventana
	Panel = N("Frame", {
		Name = "UzivertPanel", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromOffset(WIN_W, WIN_H), BackgroundTransparency = 1, Visible = false,
	}, ScreenGui)
	local winScale = N("UIScale", { Scale = 0.9 }, Panel)

	local function fitScale()
		local cam = workspace.CurrentCamera
		local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
		return math.clamp(math.min(vp.X / (WIN_W + 30), vp.Y / (WIN_H + 30)), 0.55, 1.3)
	end
	UI.base = fitScale()

	-- resplandor morado
	local glows = {}
	local glowDefs = LITE
		and { { 30, 0.9, 30 } }
		or { { 60, 0.85, 40 }, { 30, 0.72, 25 }, { 12, 0.58, 14 } }
	for i, d in ipairs(glowDefs) do
		local g = N("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, d[1], 1, d[1]), BackgroundColor3 = Color3.fromRGB(150 + i * 25, 60 + i * 25, 230),
			BackgroundTransparency = d[2], BorderSizePixel = 0, ZIndex = i,
		}, Panel)
		corner(g, d[3])
		glows[i] = { g, d[2] }
	end
	if not LITE then
		UI.addUpdater(function(t)
			for i, g in ipairs(glows) do
				g[1].BackgroundTransparency = g[2] + 0.04 * math.sin(t * (1.1 + i * 0.5) + i)
			end
		end)
	end

	local surface = N(LITE and "Frame" or "CanvasGroup", {
		Name = "Surface", Size = UDim2.fromScale(1, 1), BackgroundColor3 = C.bg,
		BackgroundTransparency = 0.1, BorderSizePixel = 0, ZIndex = 5, ClipsDescendants = true,
	}, Panel)
	corner(surface, 14)
	UI.surface = surface

	-- borde animado
	local border = N("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 30 }, Panel)
	corner(border, 14)
	local bstroke = N("UIStroke", {
		Thickness = 1.5, Color = Color3.new(1, 1, 1), ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	}, border)
	local bgrad = N("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, C.or1), ColorSequenceKeypoint.new(0.33, C.pu2),
			ColorSequenceKeypoint.new(0.66, C.or1), ColorSequenceKeypoint.new(1, C.pu2),
		}),
	}, bstroke)
	UI.addUpdater(function(t) bgrad.Rotation = (t * 45) % 360 end)

	-- fondo
	N("UIGradient", {
		Rotation = 35,
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 10, 30)),
			ColorSequenceKeypoint.new(0.7, Color3.fromRGB(60, 25, 20)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 45, 15)),
		}),
	}, N("Frame", {
		Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = 0.72, BorderSizePixel = 0, ZIndex = 1,
	}, surface))

	---------------------------------------------------------------- decoracion
	local function createWeb(esq, size, yOff)
		local sx = (esq == "TL" or esq == "BL") and 1 or -1
		local sy = (esq == "TL" or esq == "TR") and 1 or -1
		local holder = N("Frame", {
			AnchorPoint = Vector2.new(sx == 1 and 0 or 1, sy == 1 and 0 or 1),
			Position = UDim2.new(sx == 1 and 0 or 1, 0, sy == 1 and 0 or 1, yOff or 0),
			Size = UDim2.fromOffset(size, size), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 2,
		}, surface)
		local ox = sx == 1 and 0 or size
		local oy = sy == 1 and 0 or size
		local function pt(a, r) return ox + sx * r * math.cos(a), oy + sy * r * math.sin(a) end
		local NS, RINGS = 5, 5
		local strands, segs = {}, {}
		for i = 0, NS - 1 do
			local a = (math.pi / 2) * i / (NS - 1)
			local l = line(holder, C.web, 2)
			local x2, y2 = pt(a, size * 1.5)
			setLine(l, ox, oy, x2, y2, 1)
			strands[#strands + 1] = l
		end
		for r = 1, RINGS do
			for i = 0, NS - 2 do
				segs[#segs + 1] = {
					r = r, i = i, R = size * 1.1 * (r / RINGS),
					a1 = (math.pi / 2) * i / (NS - 1), a2 = (math.pi / 2) * (i + 1) / (NS - 1),
					am = (math.pi / 2) * (i + 0.5) / (NS - 1),
					l1 = line(holder, C.web, 1), l2 = line(holder, C.web, 1),
				}
			end
		end
		local function render(t)
			for _, s in ipairs(segs) do
				local sag = 0.84 + (t and 0.035 * math.sin(t * 1.3 + s.r * 0.8 + s.i * 0.5) or 0)
				local x1, y1 = pt(s.a1, s.R)
				local x2, y2 = pt(s.a2, s.R)
				local xm, ym = pt(s.am, s.R * sag)
				setLine(s.l1, x1, y1, xm, ym, 1)
				setLine(s.l2, xm, ym, x2, y2, 1)
				local tr = 0.8 + (t and 0.08 * math.sin(t * 1.8 - s.r * 0.9) or 0)
				s.l1.BackgroundTransparency = tr
				s.l2.BackgroundTransparency = tr
			end
			for i, l in ipairs(strands) do
				l.BackgroundTransparency = 0.72 + (t and 0.08 * math.sin(t * 1.1 + i) or 0)
			end
		end
		render(nil)
		if not LITE then
			local n = 0
			UI.addUpdater(function(t)
				n += 1
				if n % 3 == 0 then render(t) end
			end)
		end
	end
	createWeb("TL", 70, 0)
	createWeb("TR", 46, 0)
	createWeb("BL", 56, 0)
	createWeb("BR", 84, 0)

	-- brillo inferior (siempre) + niebla / brasas / murcielagos (solo gama alta)
	N("UIGradient", {
		Rotation = 90, Color = ColorSequence.new(C.pu1, C.or1),
		Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.86) }),
	}, N("Frame", {
		AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1), Size = UDim2.new(1, 0, 0, 70),
		BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 4,
	}, surface))

	if not LITE then
		-- brasas
		local embers = {}
		for i = 1, 12 do
			local s = math.random(2, 4)
			local f = N("Frame", {
				Size = UDim2.fromOffset(s, s), BorderSizePixel = 0, ZIndex = 3,
				BackgroundColor3 = (i % 3 == 0) and C.pu2 or ((i % 2 == 0) and C.or1 or C.or2),
			}, surface)
			corner(f, 4)
			embers[i] = {
				f = f, x = math.random() * WIN_W, y = math.random() * WIN_H, speed = 8 + math.random() * 16,
				amp = 6 + math.random() * 10, ph = math.random() * 6.28, fr = 0.6 + math.random() * 0.8,
			}
		end
		UI.addUpdater(function(t, dt)
			for _, e in ipairs(embers) do
				e.y -= e.speed * dt
				if e.y < -6 then e.y = WIN_H + 6; e.x = math.random() * WIN_W end
				e.f.Position = UDim2.fromOffset(e.x + math.sin(t * e.fr + e.ph) * e.amp, e.y)
				e.f.BackgroundTransparency = 1 - 0.8 * math.sin(math.pi * math.clamp(e.y / WIN_H, 0, 1))
			end
		end)

		-- niebla que se mueve
		local wispKeys = {
			NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.2, 0.9), NumberSequenceKeypoint.new(0.4, 1),
			NumberSequenceKeypoint.new(0.65, 0.88), NumberSequenceKeypoint.new(0.85, 1), NumberSequenceKeypoint.new(1, 1),
		}
		local function wisp(h, col)
			local f = N("Frame", {
				AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 1), Size = UDim2.new(1, 0, 0, h),
				BackgroundColor3 = col, BorderSizePixel = 0, ZIndex = 4,
			}, surface)
			return N("UIGradient", { Transparency = NumberSequence.new(wispKeys) }, f)
		end
		local wA, wB = wisp(44, Color3.fromRGB(190, 150, 255)), wisp(28, Color3.fromRGB(255, 170, 110))
		local pA, pB = 0, 0
		UI.addUpdater(function(t, dt)
			pA = (pA + dt * 0.08) % 2
			pB = (pB + dt * 0.05) % 2
			wA.Offset = Vector2.new(pA - 1, 0)
			wB.Offset = Vector2.new(1 - pB, 0)
		end)

		-- murcielagos dibujados con lineas
		local batColor = Color3.fromRGB(125, 85, 175)
		local bats = {}
		for i = 1, 2 do
			local b = { active = false, timer = 2 + i * 3, x = 0, baseY = 0, dir = 1, flap = 0, seed = i * 2.1, s = (i == 1) and 1 or 0.75, lines = {} }
			b.root = N("Frame", { Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1, Visible = false, ZIndex = 2 }, surface)
			for k = 1, 10 do
				b.lines[k] = line(b.root, batColor, 1)
				b.lines[k].BackgroundTransparency = 0.25
			end
			dot(b.root, 5 * b.s, batColor, 2)
			bats[i] = b
		end
		UI.addUpdater(function(t, dt)
			for _, b in ipairs(bats) do
				if not b.active then
					b.timer -= dt
					if b.timer <= 0 then
						b.active = true
						b.dir = (math.random() > 0.5) and 1 or -1
						b.x = (b.dir == 1) and -24 or (WIN_W + 24)
						b.baseY = math.random(60, WIN_H - 80)
						b.root.Visible = true
					end
				else
					b.x += b.dir * (46 + b.s * 10) * dt
					b.flap += dt * 13
					b.root.Position = UDim2.fromOffset(b.x, b.baseY + math.sin(t * 1.8 + b.seed) * 16)
					local f, s, li = math.sin(b.flap), b.s, 1
					for side = -1, 1, 2 do
						local tx, ty = side * 14 * s, -f * 9 * s - 2 * s
						local p1x, p1y = side * 9 * s, 5 * s - f * 3 * s
						local p2x, p2y = side * 4 * s, 4 * s
						setLine(b.lines[li], 0, -1 * s, tx, ty, 1.5)
						setLine(b.lines[li + 1], tx, ty, p1x, p1y, 1.5)
						setLine(b.lines[li + 2], p1x, p1y, p2x, p2y, 1.5)
						setLine(b.lines[li + 3], p2x, p2y, 0, 2 * s, 1.5)
						li += 4
					end
					if b.x < -30 or b.x > WIN_W + 30 then
						b.active = false
						b.root.Visible = false
						b.timer = 5 + math.random() * 7
					end
				end
			end
		end)
	end

	---------------------------------------------------------------- barra lateral
	local side = N("Frame", {
		Size = UDim2.new(0, SIDE_W, 1, 0), BackgroundColor3 = Color3.fromRGB(10, 5, 16),
		BackgroundTransparency = 0.35, BorderSizePixel = 0, ZIndex = 6,
	}, surface)
	N("Frame", {
		Position = UDim2.new(1, -1, 0, 0), Size = UDim2.new(0, 1, 1, 0), BackgroundColor3 = C.or1,
		BackgroundTransparency = 0.7, BorderSizePixel = 0, ZIndex = 7,
	}, side)

	-- logo (luna + sellos giratorios)
	local logoBox = N("Frame", { Position = UDim2.fromOffset(12, 12), Size = UDim2.fromOffset(34, 34), BackgroundTransparency = 1, ZIndex = 8 }, side)
	local function sello(sz, col, tr)
		local f = N("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(sz, sz), BackgroundTransparency = 1, ZIndex = 8,
		}, logoBox)
		corner(f, 6)
		N("UIStroke", { Thickness = 1.5, Color = col, Transparency = tr }, f)
		return f
	end
	local lr1, lr2 = sello(32, C.or1, 0.2), sello(25, C.pu2, 0.4)
	local lMoon = dot(logoBox, 15, C.or2, 9)
	lMoon.Position = UDim2.fromScale(0.5, 0.5)
	local lCut = dot(logoBox, 13, Color3.fromRGB(14, 9, 20), 10)
	lCut.Position = UDim2.new(0.5, 4, 0.5, -3)
	UI.addUpdater(function(t)
		lr1.Rotation = (t * 22) % 360
		lr2.Rotation = (-t * 30) % 360
	end)

	local sTitulo = N("TextLabel", {
		Position = UDim2.fromOffset(52, 12), Size = UDim2.fromOffset(76, 22), BackgroundTransparency = 1,
		Text = "Uzivert Hub", Font = Enum.Font.Creepster, TextScaled = true, TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8,
	}, side)
	N("UITextSizeConstraint", { MaxTextSize = 19, MinTextSize = 8 }, sTitulo)
	local sTituloGrad = N("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 50)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 225, 170)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 50)),
		}),
	}, sTitulo)
	UI.addUpdater(function(t)
		sTituloGrad.Offset = Vector2.new(math.sin(t * 0.9) * 0.7, 0)
		sTitulo.TextTransparency = ((t % 6) < 0.25 and math.sin(t * 90) > 0) and 0.5 or 0
	end)
	N("TextLabel", {
		Position = UDim2.fromOffset(52, 34), Size = UDim2.fromOffset(78, 12), BackgroundTransparency = 1,
		Text = VERSION, Font = Enum.Font.GothamBold, TextSize = 7, TextColor3 = C.pu2,
		TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 8,
	}, side)
	N("TextLabel", {
		Position = UDim2.fromOffset(14, 54), Size = UDim2.new(1, -20, 0, 14), BackgroundTransparency = 1,
		Text = "By Uzivert 🇵🇾", Font = Enum.Font.GothamMedium, TextSize = 10, TextColor3 = C.sub,
		TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8,
	}, side)
	local sepL = N("Frame", {
		Position = UDim2.fromOffset(12, 78), Size = UDim2.new(1, -24, 0, 1), BackgroundColor3 = C.or1,
		BackgroundTransparency = 0.4, BorderSizePixel = 0, ZIndex = 8,
	}, side)
	N("UIGradient", { Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) }) }, sepL)

	local sideScroll = N("ScrollingFrame", {
		Position = UDim2.fromOffset(0, 86), Size = UDim2.new(1, 0, 1, -86), BackgroundTransparency = 1, BorderSizePixel = 0,
		ScrollBarThickness = 2, ScrollBarImageColor3 = C.or1, ScrollBarImageTransparency = 0.4,
		CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollingDirection = Enum.ScrollingDirection.Y, Active = true, ZIndex = 7,
	}, side)
	N("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Center }, sideScroll)
	N("UIPadding", { PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 14), PaddingLeft = UDim.new(0, 6), PaddingRight = UDim.new(0, 6) }, sideScroll)

	---------------------------------------------------------------- encabezado
	local head = N("Frame", {
		Position = UDim2.fromOffset(SIDE_W, 0), Size = UDim2.new(1, -SIDE_W, 0, 42), BackgroundTransparency = 1, ZIndex = 8,
	}, surface)
	N("Frame", {
		Position = UDim2.new(0, 0, 1, -1), Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = C.or1,
		BackgroundTransparency = 0.75, BorderSizePixel = 0, ZIndex = 9,
	}, head)
	UI.titulo = N("TextLabel", {
		Position = UDim2.fromOffset(14, 4), Size = UDim2.fromOffset(220, 32), BackgroundTransparency = 1, Text = "",
		Font = Enum.Font.Creepster, TextSize = 26, TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 9,
	}, head)
	local tGrad = N("UIGradient", { Color = ColorSequence.new(C.or1, C.or2) }, UI.titulo)
	UI.titleBar = N("Frame", {
		Position = UDim2.fromOffset(16, 35), Size = UDim2.fromOffset(46, 2), BackgroundColor3 = C.or1,
		BorderSizePixel = 0, ZIndex = 9,
	}, head)
	corner(UI.titleBar, 1)
	UI.addUpdater(function(t) tGrad.Offset = Vector2.new(math.sin(t * 1.1) * 0.4, 0) end)

	local function iconButton(x, kind, hover)
		local b = N("TextButton", {
			Position = UDim2.new(1, x, 0, 9), Size = UDim2.fromOffset(24, 24), BackgroundColor3 = C.card,
			BackgroundTransparency = 0.2, Text = "", AutoButtonColor = false, BorderSizePixel = 0, ZIndex = 10,
		}, head)
		corner(b, 12)
		local st = N("UIStroke", { Color = hover, Thickness = 1, Transparency = 0.55 }, b)
		local ic = N("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(12, 12), BackgroundTransparency = 1, ZIndex = 11,
		}, b)
		if kind == "min" then
			setLine(line(ic, C.text, 11), 1, 6, 11, 6, 2)
		else
			setLine(line(ic, C.text, 11), 1, 1, 11, 11, 2)
			setLine(line(ic, C.text, 11), 11, 1, 1, 11, 2)
		end
		hoverable(b, function()
			TW(b, 0.18, { BackgroundColor3 = hover, BackgroundTransparency = 0.05 })
			TW(st, 0.18, { Transparency = 0 })
			TW(ic, 0.3, { Rotation = 90 }, BACK)
		end, function()
			TW(b, 0.22, { BackgroundColor3 = C.card, BackgroundTransparency = 0.2 })
			TW(st, 0.22, { Transparency = 0.55 })
			TW(ic, 0.3, { Rotation = 0 }, BACK)
		end)
		return b
	end
	local minBtn = iconButton(-62, "min", C.yellow)
	local closeBtn = iconButton(-32, "close", C.red)
	minBtn.Activated:Connect(function() UI.cerrar() end)
	closeBtn.Activated:Connect(function() UI.cerrar() end)

	-- arrastrar desde el encabezado y el logo
	local function makeDrag(handle)
		local dragging, dragStart, startPos
		handle.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging, dragStart, startPos = true, input.Position, Panel.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then dragging = false end
				end)
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				local d = (input.Position - dragStart) / math.max(winScale.Scale, 0.1)
				Panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
			end
		end)
	end
	makeDrag(head)
	makeDrag(side)

	local veil = N("Frame", {
		Position = UDim2.fromOffset(SIDE_W + 6, 46), Size = UDim2.new(1, -(SIDE_W + 12), 1, -54),
		BackgroundColor3 = C.bg, BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 9,
	}, surface)

	---------------------------------------------------------------- iconos dibujados
	local function rect(parts, box, x, y, w, h, col, r, rot)
		local f = N("Frame", {
			Position = UDim2.fromOffset(x, y), Size = UDim2.fromOffset(w, h), BackgroundColor3 = col,
			BorderSizePixel = 0, ZIndex = 10, Rotation = rot or 0,
		}, box)
		if r then corner(f, r) end
		parts[#parts + 1] = { f, "bg" }
		return f
	end
	local function rectF(box, x, y, w, h, col, r)
		local f = N("Frame", {
			Position = UDim2.fromOffset(x, y), Size = UDim2.fromOffset(w, h), BackgroundColor3 = col, BorderSizePixel = 0, ZIndex = 11,
		}, box)
		if r and r > 0 then corner(f, r) end
		return f
	end
	local function ring(parts, box, x, y, w, h, col, th, r, rot)
		local f = N("Frame", {
			Position = UDim2.fromOffset(x, y), Size = UDim2.fromOffset(w, h), BackgroundTransparency = 1,
			BorderSizePixel = 0, ZIndex = 10, Rotation = rot or 0,
		}, box)
		if r then corner(f, r) end
		local s = N("UIStroke", { Thickness = th, Color = col }, f)
		parts[#parts + 1] = { s, "stroke" }
		return f
	end
	local function seg(parts, box, x1, y1, x2, y2, col, th)
		local l = line(box, col, 10)
		setLine(l, x1, y1, x2, y2, th)
		parts[#parts + 1] = { l, "bg" }
		return l
	end

	local ICONS = {}
	ICONS.Visual = function(p, b, c)
		ring(p, b, 2, 6, 20, 12, c, 2, 6)
		rect(p, b, 9, 9, 6, 6, c, 3)
	end
	ICONS.Combat = function(p, b, c)
		ring(p, b, 4, 4, 16, 16, c, 2, 8)
		seg(p, b, 12, 1, 12, 7, c, 2); seg(p, b, 12, 17, 12, 23, c, 2)
		seg(p, b, 1, 12, 7, 12, c, 2); seg(p, b, 17, 12, 23, 12, c, 2)
		rect(p, b, 10, 10, 4, 4, c, 2)
	end
	ICONS.Crab = function(p, b, c)
		rect(p, b, 4, 2, 16, 14, c, 7)
		rect(p, b, 8, 13, 8, 7, c, 2)
		rectF(b, 7, 8, 4, 4, C.dark, 2); rectF(b, 13, 8, 4, 4, C.dark, 2)
		rectF(b, 11, 13, 2, 2, C.dark, 1)
		rectF(b, 10, 17, 1, 3, C.dark, 0); rectF(b, 13, 17, 1, 3, C.dark, 0)
	end
	ICONS.Jugador = function(p, b, c)
		rect(p, b, 10, 8, 4, 9, c, 2)
		seg(p, b, 10, 9, 9, 5, c, 1.5); seg(p, b, 14, 9, 15, 5, c, 1.5)
		for _, s in ipairs({ -1, 1 }) do
			local function x(v) return 12 + s * v end
			seg(p, b, x(1), 10, x(10), 6, c, 2)
			seg(p, b, x(10), 6, x(10), 13, c, 2)
			seg(p, b, x(10), 13, x(6), 11, c, 2)
			seg(p, b, x(6), 11, x(3), 16, c, 2)
			seg(p, b, x(3), 16, x(1), 12, c, 2)
		end
	end
	ICONS.Fling = function(p, b, c)
		ring(p, b, 2, 2, 20, 20, c, 2, 10)
		ring(p, b, 6, 6, 12, 12, c, 2, 6)
		rect(p, b, 10, 10, 4, 4, c, 2)
	end
	ICONS.Anims = function(p, b, c)
		ring(p, b, 3, 5, 18, 14, c, 2, 3)
		rect(p, b, 9, 9, 6, 6, c, 1, 45)
		seg(p, b, 6, 5, 6, 19, c, 1)
		seg(p, b, 18, 5, 18, 19, c, 1)
	end
	ICONS.Clutchs = function(p, b, c)
		rect(p, b, 6, 10, 12, 12, c, 6)
		rect(p, b, 8, 2, 8, 8, c, 1, 45)
		rectF(b, 10, 14, 4, 6, C.dark, 2)
	end
	ICONS.Utilidades = function(p, b, c)
		ring(p, b, 5, 5, 14, 14, c, 2.5, 7)
		rect(p, b, 10, 1, 4, 4, c, 1); rect(p, b, 10, 19, 4, 4, c, 1)
		rect(p, b, 1, 10, 4, 4, c, 1); rect(p, b, 19, 10, 4, 4, c, 1)
		rect(p, b, 10, 10, 4, 4, c, 2)
	end
	ICONS.Apariencia = function(p, b, c)
		ring(p, b, 2, 3, 20, 18, c, 2, 9)
		rect(p, b, 6, 8, 3, 3, c, 2); rect(p, b, 11, 6, 3, 3, c, 2)
		rect(p, b, 15, 9, 3, 3, c, 2); rect(p, b, 8, 13, 3, 3, c, 2)
	end
	ICONS.Info = function(p, b, c)
		ring(p, b, 2, 2, 20, 20, c, 2, 10)
		rect(p, b, 11, 10, 2, 8, c, 1); rect(p, b, 11, 6, 2, 2, c, 1)
	end
	ICONS.Update = function(p, b, c)
		ring(p, b, 5, 3, 14, 18, c, 2, 3)
		seg(p, b, 8, 8, 16, 8, c, 2); seg(p, b, 8, 12, 16, 12, c, 2); seg(p, b, 8, 16, 13, 16, c, 2)
	end
	ICONS.Avisos = function(p, b, c)
		ring(p, b, 4, 4, 16, 16, c, 2, 2, 45)
		rect(p, b, 11, 8, 2, 6, c, 1); rect(p, b, 11, 16, 2, 2, c, 1)
	end
	ICONS.Creador = function(p, b, c)
		rect(p, b, 4, 16, 16, 4, c, 1)
		seg(p, b, 4, 16, 3, 7, c, 2); seg(p, b, 3, 7, 9, 12, c, 2)
		seg(p, b, 9, 12, 12, 5, c, 2); seg(p, b, 12, 5, 15, 12, c, 2)
		seg(p, b, 15, 12, 21, 7, c, 2); seg(p, b, 21, 7, 20, 16, c, 2)
	end
ICONS.AutoFarm = function(p, b, c)
    -- Bolsa de monedas
    ring(p, b, 3, 9, 18, 14, c, 2, 7)
    seg(p, b, 8, 9, 16, 9, c, 1.5)
    rect(p, b, 11, 4, 2, 6, c, 1)
    rect(p, b, 9, 2, 6, 3, c, 1)
    -- Moneda con $
    ring(p, b, 9, 12, 6, 6, c, 1, 3)
    seg(p, b, 12, 13, 12, 17, c, 1)
    seg(p, b, 10, 14, 14, 14, c, 1)
end
	UI.icon = function(name, box, col)
		local parts = {}
		local fn = ICONS[name]
		if fn then
			fn(parts, box, col)
		else
			ring(parts, box, 4, 4, 16, 16, col, 2, 8)
			rect(parts, box, 10, 10, 4, 4, col, 2)
		end
		return parts
	end
	UI.recolor = function(parts, color)
		for _, p in ipairs(parts) do
			if p[2] == "stroke" then TW(p[1], 0.2, { Color = color }) else TW(p[1], 0.2, { BackgroundColor3 = color }) end
		end
	end

	---------------------------------------------------------------- boton flotante (orbe)
	local orb = N("TextButton", {
		Name = "UzivertOrb", Size = UDim2.fromOffset(60, 60), Position = UDim2.new(0, 30, 0.5, -30),
		BackgroundTransparency = 1, Text = "", AutoButtonColor = false, ZIndex = 50,
	}, ScreenGui)
	local orbScale = N("UIScale", { Scale = 1 }, orb)
	local orbGlow = dot(orb, 90, C.pu1, 1)
	orbGlow.Position = UDim2.fromScale(0.5, 0.5)
	orbGlow.BackgroundTransparency = 0.85
	local orbRing = N("Frame", {
		AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(58, 58),
		BackgroundTransparency = 1, ZIndex = 2,
	}, orb)
	corner(orbRing, 29)
	local orbStroke = N("UIStroke", { Thickness = 2.5, Color = Color3.new(1, 1, 1) }, orbRing)
	local orbRingGrad = N("UIGradient", {
		Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, C.or1), ColorSequenceKeypoint.new(0.5, C.pu2), ColorSequenceKeypoint.new(1, C.or1),
		}),
		Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.55, 0.65), NumberSequenceKeypoint.new(1, 0) }),
	}, orbStroke)
	local orbCoreColor = Color3.fromRGB(22, 13, 30)
	local orbCore = dot(orb, 50, orbCoreColor, 3)
	orbCore.Position = UDim2.fromScale(0.5, 0.5)
	local function orbSq(sz, col, tr)
		local f = N("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(sz, sz),
			BackgroundTransparency = 1, ZIndex = 4,
		}, orb)
		corner(f, 4)
		N("UIStroke", { Thickness = 1.2, Color = col, Transparency = tr }, f)
		return f
	end
	local orbSq1, orbSq2 = orbSq(36, C.or1, 0.35), orbSq(30, C.pu2, 0.5)
	local orbMoon = dot(orb, 20, C.or2, 5)
	orbMoon.Position = UDim2.new(0.5, -1, 0.5, 0)
	local orbCut = dot(orb, 17, orbCoreColor, 6)
	orbCut.Position = UDim2.new(0.5, 4, 0.5, -3)
	local orbiters = {}
	for i = 1, 3 do
		local d = dot(orb, 3 + (i % 2), (i % 2 == 0) and C.or2 or C.pu2, 7)
		orbiters[i] = { f = d, r = 29, sp = (i % 2 == 0 and 1 or -1) * (0.9 + i * 0.35), ph = i * 2.1 }
	end
	UI.addUpdater(function(t)
		orbGlow.BackgroundTransparency = (UI.abierto and 0.92 or 0.84) + 0.04 * math.sin(t * 2)
		orbRingGrad.Rotation = (t * 90) % 360
		orbSq1.Rotation = (t * 24) % 360
		orbSq2.Rotation = (-t * 16) % 360
		for _, o in ipairs(orbiters) do
			local a = t * o.sp + o.ph
			o.f.Position = UDim2.fromScale(0.5, 0.5) + UDim2.fromOffset(math.cos(a) * o.r, math.sin(a) * o.r)
		end
	end, true)

	do
		local dragging, moved, dragStart, startPos, dragInput = false, false, nil, nil, nil
		orb.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging, moved = true, false
  dragStart, startPos = input.Position, orb.Position
  dragInput = input
				TW(orbScale, 0.12, { Scale = 0.9 })
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
						TW(orbScale, 0.25, { Scale = 1 }, BACK)
						if not moved then
    ripple(orb, C.or2, 8, 120)
    UI.abrir()
end
dragInput = nil
					end
				end)
			end
		end)
	UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local d = input.Position - dragStart
        if moved or d.Magnitude > 8 then
            moved = true
            orb.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end
end)
end
	---------------------------------------------------------------- abrir / cerrar
	local function setFade(v)
		if surface:IsA("CanvasGroup") then surface.GroupTransparency = v end
	end
	UI.abrir = function()
		if UI.abierto then return end
		UI.abierto = true
		UI.visible = true
		Panel.Visible = true
		winScale.Scale = UI.base * 0.9
		setFade(1)
		if surface:IsA("CanvasGroup") then TW(surface, 0.35, { GroupTransparency = 0 }) end
		TW(winScale, 0.45, { Scale = UI.base }, BACK)
		TW(orbScale, 0.2, { Scale = 0 })
		task.delay(0.2, function() if UI.abierto then orb.Visible = false end end)
	end
	UI.cerrar = function()
		if not UI.abierto then return end
		UI.abierto = false
		orb.Visible = true
		orbScale.Scale = 0
		TW(orbScale, 0.4, { Scale = 1 }, BACK)
		if surface:IsA("CanvasGroup") then TW(surface, 0.2, { GroupTransparency = 1 }) end
		TW(winScale, 0.22, { Scale = UI.base * 0.9 })
		task.delay(0.24, function()
			if not UI.abierto then
				Panel.Visible = false
				UI.visible = false
			end
		end)
	end
	do
		local cam = workspace.CurrentCamera
		if cam then
			cam:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				UI.base = fitScale()
				if UI.abierto then winScale.Scale = UI.base end
			end)
		end
	end

	---------------------------------------------------------------- paginas (pestanas)
	UI.mostrar = function(entry, instant)
		local prev = UI.actual
		if prev == entry then return end
		UI.actual = entry
		if prev then
			prev[2].Visible = false
			TW(prev[1], 0.2, { BackgroundTransparency = 0.6 })
			TW(prev.st, 0.2, { Transparency = 0.8 })
			TW(prev.bar, 0.2, { Size = UDim2.fromOffset(3, 0) })
			TW(prev[3], 0.2, { TextColor3 = C.sub })
			UI.recolor(prev[4], C.sub)
		end
		TW(entry[1], 0.25, { BackgroundTransparency = 0.3 })
		TW(entry.st, 0.25, { Transparency = 0.3 })
		TW(entry.bar, 0.35, { Size = UDim2.fromOffset(3, 18) }, BACK)
		TW(entry[3], 0.25, { TextColor3 = C.text })
		UI.recolor(entry[4], C.or2)
		entry[2].Visible = true
		UI.titulo.Text = string.upper(entry.nombre)
		if instant then
			entry[2].Position = UDim2.fromOffset(SIDE_W + 6, 46)
		else
			entry[2].Position = UDim2.fromOffset(SIDE_W + 28, 46)
			TW(entry[2], 0.38, { Position = UDim2.fromOffset(SIDE_W + 6, 46) })
			veil.BackgroundTransparency = 0.3
			TW(veil, 0.32, { BackgroundTransparency = 1 })
			UI.titulo.Position = UDim2.fromOffset(14, 14)
			UI.titulo.TextTransparency = 1
			TW(UI.titulo, 0.35, { Position = UDim2.fromOffset(14, 4), TextTransparency = 0 })
			UI.titleBar.Size = UDim2.fromOffset(0, 2)
			TW(UI.titleBar, 0.5, { Size = UDim2.fromOffset(46, 2) })
		end
	end

	crearPagina = function(nombre, icono, orden)
		local btn = N("TextButton", {
			Size = UDim2.new(1, 0, 0, 32), LayoutOrder = orden, BackgroundColor3 = C.card, BackgroundTransparency = 0.6,
			Text = "", AutoButtonColor = false, BorderSizePixel = 0, ZIndex = 8, ClipsDescendants = true,
		}, sideScroll)
		btn:SetAttribute("UZ", true)
		corner(btn, 8)
		local st = N("UIStroke", { Color = C.or1, Thickness = 1, Transparency = 0.8 }, btn)
		local bar = N("Frame", {
			AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(3, 0),
			BackgroundColor3 = C.or1, BorderSizePixel = 0, ZIndex = 10,
		}, btn)
		corner(bar, 2)
		local box = N("Frame", { Position = UDim2.fromOffset(8, 4), Size = UDim2.fromOffset(24, 24), BackgroundTransparency = 1, ZIndex = 9 }, btn)
		local parts = UI.icon(icono, box, C.sub)
		local texto = N("TextLabel", {
			Position = UDim2.fromOffset(38, 0), Size = UDim2.new(1, -42, 1, 0), BackgroundTransparency = 1,
			Text = nombre, TextColor3 = C.sub, Font = Enum.Font.GothamMedium, TextSize = 11,
			TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 9,
		}, btn)

		local pagina = N("ScrollingFrame", {
			Name = "Pagina_" .. nombre, Position = UDim2.fromOffset(SIDE_W + 6, 46), Size = UDim2.new(1, -(SIDE_W + 12), 1, -54),
			BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = C.or1,
			ScrollBarImageTransparency = 0.3, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y, ScrollingEnabled = true, Active = true, ClipsDescendants = true,
			ElasticBehavior = Enum.ElasticBehavior.WhenScrollable, Visible = false, ZIndex = 6,
		}, surface)
		N("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Center }, pagina)
		N("UIPadding", { PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 40), PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 8) }, pagina)

		local entry = { btn, pagina, texto, parts, bar = bar, st = st, nombre = nombre }
		table.insert(Paginas, entry)

		hoverable(btn, function()
			if UI.actual ~= entry then
				TW(btn, 0.15, { BackgroundTransparency = 0.45 })
				TW(st, 0.15, { Transparency = 0.5 })
			end
		end, function()
			if UI.actual ~= entry then
				TW(btn, 0.2, { BackgroundTransparency = 0.6 })
				TW(st, 0.2, { Transparency = 0.8 })
			end
		end)
		btn.Activated:Connect(function()
			ripple(btn, C.or2, 11, 120)
			UI.mostrar(entry)
		end)
		if #Paginas == 1 then UI.mostrar(entry, true) end
		return pagina
	end

	---------------------------------------------------------------- toggle
	crearToggle = function(padre, texto, estadoInicial, callback)
		local estado = estadoInicial and true or false
		local frame = N("Frame", {
			Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = C.card, BackgroundTransparency = 0.35, BorderSizePixel = 0, ZIndex = 7,
		}, padre)
		frame:SetAttribute("UZ", true)
		corner(frame, 9)
		local st = N("UIStroke", { Color = C.line, Thickness = 1, Transparency = 0.3 }, frame)
		local bar = N("Frame", {
			AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(3, estado and 20 or 8),
			BackgroundColor3 = C.or1, BackgroundTransparency = estado and 0 or 0.6, BorderSizePixel = 0, ZIndex = 8,
		}, frame)
		corner(bar, 2)
		local label = N("TextLabel", {
			Position = UDim2.fromOffset(14, 0), Size = UDim2.new(1, -86, 1, 0), BackgroundTransparency = 1, Text = texto,
			TextColor3 = estado and C.text or C.sub, Font = Enum.Font.GothamMedium, TextSize = 11,
			TextXAlignment = Enum.TextXAlignment.Left, TextWrapped = true, ZIndex = 8,
		}, frame)
		local sw = N("Frame", {
			Position = UDim2.new(1, -58, 0.5, -11), Size = UDim2.fromOffset(46, 22),
			BackgroundColor3 = estado and C.or1 or C.off, BorderSizePixel = 0, ZIndex = 9,
		}, frame)
		corner(sw, 11)
		local swSt = N("UIStroke", { Color = C.or2, Thickness = 1.5, Transparency = estado and 0.4 or 1 }, sw)
		local knob = dot(sw, 16, Color3.new(1, 1, 1), 10)
		knob.Position = estado and UDim2.new(1, -12, 0.5, 0) or UDim2.new(0, 12, 0.5, 0)
		local hit = N("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", ZIndex = 11 }, frame)

		hit.Activated:Connect(function()
			estado = not estado
			TW(knob, 0.3, { Position = estado and UDim2.new(1, -12, 0.5, 0) or UDim2.new(0, 12, 0.5, 0) }, BACK)
			knob.Size = UDim2.fromOffset(22, 14)
			TW(knob, 0.3, { Size = UDim2.fromOffset(16, 16) }, BACK)
			TW(sw, 0.25, { BackgroundColor3 = estado and C.or1 or C.off })
			TW(swSt, 0.25, { Transparency = estado and 0.4 or 1 })
			TW(bar, 0.3, { Size = UDim2.fromOffset(3, estado and 20 or 8), BackgroundTransparency = estado and 0 or 0.6 }, BACK)
			TW(label, 0.25, { TextColor3 = estado and C.text or C.sub })
			ripple(sw, estado and C.or2 or C.pu2, 12, 70)
			callback(estado)
		end)
		hoverable(hit, function()
			TW(st, 0.15, { Color = C.or1 })
			TW(frame, 0.15, { BackgroundTransparency = 0.2 })
		end, function()
			TW(st, 0.2, { Color = C.line })
			TW(frame, 0.2, { BackgroundTransparency = 0.35 })
		end)
		return frame
	end

	---------------------------------------------------------------- boton
	crearBoton = function(padre, texto, callback, color)
		local accent = accentOf(color)
		local btn = N("TextButton", {
			Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = C.card, BackgroundTransparency = 0.25, Text = "",
			AutoButtonColor = false, BorderSizePixel = 0, ClipsDescendants = true, ZIndex = 7,
		}, padre)
		btn:SetAttribute("UZ", true)
		corner(btn, 9)
		local st = N("UIStroke", { Thickness = 1.5, Color = Color3.new(1, 1, 1), Transparency = 0.2 }, btn)
		local sg = N("UIGradient", { Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, accent),
    ColorSequenceKeypoint.new(0.5, C.pu2),
    ColorSequenceKeypoint.new(1, accent),
}) }, st)
		local fill = N("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = accent, BorderSizePixel = 0, ZIndex = 7 }, btn)
		N("UIGradient", { Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.72), NumberSequenceKeypoint.new(1, 0.95) }) }, fill)
		local bar = N("Frame", {
			AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(3, 16),
			BackgroundColor3 = accent, BorderSizePixel = 0, ZIndex = 9,
		}, btn)
		corner(bar, 2)
		N("TextLabel", {
			Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = texto, TextColor3 = C.text,
			Font = Enum.Font.GothamBold, TextSize = 12, ZIndex = 10,
		}, btn)
		local shine = N("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, -30, 0.5, 0), Size = UDim2.fromOffset(24, 90),
			BackgroundColor3 = Color3.new(1, 1, 1), BackgroundTransparency = 0.9, BorderSizePixel = 0, Rotation = 20, ZIndex = 9,
		}, btn)
		local sc = N("UIScale", { Scale = 1 }, btn)
		UI.addUpdater(function(t)
			if btn.Parent then sg.Rotation = (t * 80) % 360 end
		end)
		hoverable(btn, function()
			TW(btn, 0.2, { BackgroundColor3 = C.cardHi })
			TW(sc, 0.2, { Scale = 1.015 }, BACK)
			TW(bar, 0.25, { Size = UDim2.fromOffset(3, 26) }, BACK)
			shine.Position = UDim2.new(0, -30, 0.5, 0)
			TW(shine, 0.55, { Position = UDim2.new(1, 40, 0.5, 0) }, Enum.EasingStyle.Quad)
		end, function()
			TW(btn, 0.25, { BackgroundColor3 = C.card })
			TW(sc, 0.2, { Scale = 1 })
			TW(bar, 0.2, { Size = UDim2.fromOffset(3, 16) })
		end)
		btn.InputBegan:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
				TW(sc, 0.08, { Scale = 0.97 })
			end
		end)
		btn.Activated:Connect(function()
			TW(sc, 0.25, { Scale = 1.015 }, BACK)
			ripple(btn, accent, 8, 300)
			callback()
		end)
		return btn
	end

	---------------------------------------------------------------- slider
	UserInputService.InputChanged:Connect(function(input)
	if UI.sliderDragHandlers then
		for _, fn in ipairs(UI.sliderDragHandlers) do
			pcall(fn, input)
		end
	end
	if UI.drag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		UI.drag(input.Position.X)
	end
end)
UserInputService.InputEnded:Connect(function(input)
	if UI.sliderDragEndHandlers then
		for _, fn in ipairs(UI.sliderDragEndHandlers) do
			pcall(fn, input)
		end
	end
	if UI.drag and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
		UI.drag = nil
		if UI.dragEnd then
			UI.dragEnd()
			UI.dragEnd = nil
		end
	end
end)

	crearSlider = function(padre, texto, min, max, inicial, callback)
		local range = math.max(max - min, 1)
		local frame = N("Frame", {
			Size = UDim2.new(1, 0, 0, 54), BackgroundColor3 = C.card, BackgroundTransparency = 0.35, BorderSizePixel = 0, ZIndex = 7,
		}, padre)
		frame:SetAttribute("UZ", true)
		corner(frame, 9)
		local st = N("UIStroke", { Color = C.line, Thickness = 1, Transparency = 0.3 }, frame)
		N("TextLabel", {
			Position = UDim2.fromOffset(12, 6), Size = UDim2.new(1, -84, 0, 18), BackgroundTransparency = 1, Text = texto,
			TextColor3 = C.text, Font = Enum.Font.GothamMedium, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 8,
		}, frame)
		local pill = N("Frame", {
			Position = UDim2.new(1, -66, 0, 6), Size = UDim2.fromOffset(54, 18), BackgroundColor3 = C.or1,
			BackgroundTransparency = 0.82, BorderSizePixel = 0, ZIndex = 8,
		}, frame)
		corner(pill, 9)
		N("UIStroke", { Color = C.or1, Thickness = 1, Transparency = 0.5 }, pill)
		local valLbl = N("TextLabel", {
			Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = tostring(inicial), TextColor3 = C.or2,
			Font = Enum.Font.GothamBold, TextSize = 11, ZIndex = 9,
		}, pill)

		local frac0 = math.clamp((inicial - min) / range, 0, 1)
		local track = N("Frame", {
			Position = UDim2.new(0, 12, 0, 36), Size = UDim2.new(1, -24, 0, 6), BackgroundColor3 = C.off, BorderSizePixel = 0, ZIndex = 8,
		}, frame)
		corner(track, 3)
		local fill = N("Frame", {
			Size = UDim2.fromScale(frac0, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 9,
		}, track)
		corner(fill, 3)
		N("UIGradient", { Color = ColorSequence.new(C.or3, C.or2) }, fill)
		local knob = dot(track, 16, Color3.new(1, 1, 1), 11)
		knob.Position = UDim2.new(frac0, 0, 0.5, 0)
		local kst = N("UIStroke", { Thickness = 2, Color = C.or1 }, knob)
		local tip = N("Frame", {
			AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.new(frac0, 0, 0, -8), Size = UDim2.fromOffset(38, 18),
			BackgroundColor3 = C.or1, BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 12,
		}, track)
		corner(tip, 6)
		local tipLbl = N("TextLabel", {
			Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = tostring(inicial), TextColor3 = C.bg,
			Font = Enum.Font.GothamBold, TextSize = 10, TextTransparency = 1, ZIndex = 13,
		}, tip)
		local hit = N("TextButton", {
			Position = UDim2.new(0, 6, 0, 26), Size = UDim2.new(1, -12, 0, 26), BackgroundTransparency = 1, Text = "", ZIndex = 14,
		}, frame)

		local valor = inicial
		local function setFromX(x)
			local posX = math.clamp((x - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)
			local nv = math.floor(min + (max - min) * posX)
			fill.Size = UDim2.fromScale(posX, 1)
			knob.Position = UDim2.new(posX, 0, 0.5, 0)
			tip.Position = UDim2.new(posX, 0, 0, -8)
			if nv ~= valor then
				valor = nv
				valLbl.Text = tostring(nv)
				tipLbl.Text = tostring(nv)
				callback(nv)
			end
		end

	local dragStartPos = nil
	local isHorizontal = nil
	local dragDeadzone = 8
	local dragging = false

	hit.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStartPos = input.Position
			isHorizontal = nil
			UI.drag = nil
			UI.dragEnd = nil
		end
	end)

	UI.sliderDragHandlers = UI.sliderDragHandlers or {}
	table.insert(UI.sliderDragHandlers, function(input)
		if not dragging then return end
		if input.UserInputType ~= Enum.UserInputType.Touch and input.UserInputType ~= Enum.UserInputType.MouseMovement then return end
		if isHorizontal == nil then
			local delta = input.Position - dragStartPos
			if delta.Magnitude > dragDeadzone then
				if math.abs(delta.X) > math.abs(delta.Y) then
					isHorizontal = true
					UI.drag = setFromX
					if padre:IsA("ScrollingFrame") then padre.ScrollingEnabled = false end
					TW(knob, 0.15, { Size = UDim2.fromOffset(22, 22) }, BACK)
					TW(tip, 0.15, { BackgroundTransparency = 0 })
					TW(tipLbl, 0.15, { TextTransparency = 0 })
					TW(st, 0.15, { Color = C.or1 })
					UI.dragEnd = function()
						if padre:IsA("ScrollingFrame") then padre.ScrollingEnabled = true end
						TW(knob, 0.2, { Size = UDim2.fromOffset(16, 16) }, BACK)
						TW(tip, 0.2, { BackgroundTransparency = 1 })
						TW(tipLbl, 0.2, { TextTransparency = 1 })
						TW(st, 0.2, { Color = C.line })
						TW(pill, 0.12, { BackgroundTransparency = 0.6 })
						task.delay(0.12, function() TW(pill, 0.3, { BackgroundTransparency = 0.82 }) end)
					end
				else
					isHorizontal = false
					dragging = false
				end
			end
		elseif isHorizontal then
			setFromX(input.Position.X)
		end
	end)

	UI.sliderDragEndHandlers = UI.sliderDragEndHandlers or {}
	table.insert(UI.sliderDragEndHandlers, function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
			isHorizontal = nil
		end
	end)

	return frame
end
	---------------------------------------------------------------- selector (desplegable)
	crearSelector = function(padre, titulo, opciones, callback)
		local listH = math.min(#opciones * 28 + 8, 170)
		local wrap = N("Frame", { Size = UDim2.new(1, 0, 0, 40), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 7 }, padre)
		wrap:SetAttribute("UZ", true)
		local head2 = N("TextButton", {
			Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = C.card, BackgroundTransparency = 0.35, Text = "",
			AutoButtonColor = false, BorderSizePixel = 0, ZIndex = 8,
		}, wrap)
		corner(head2, 9)
		local st = N("UIStroke", { Color = C.line, Thickness = 1, Transparency = 0.3 }, head2)
		N("TextLabel", {
			Position = UDim2.fromOffset(12, 0), Size = UDim2.new(0.5, -12, 1, 0), BackgroundTransparency = 1, Text = titulo,
			TextColor3 = C.text, Font = Enum.Font.GothamMedium, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 9,
		}, head2)
		local valLbl = N("TextLabel", {
			Position = UDim2.new(0.5, 0, 0, 0), Size = UDim2.new(0.5, -36, 1, 0), BackgroundTransparency = 1, Text = "",
			TextColor3 = C.or2, Font = Enum.Font.GothamBold, TextSize = 11, TextXAlignment = Enum.TextXAlignment.Right,
			TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 9,
		}, head2)
		local chev = N("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, -18, 0.5, 0), Size = UDim2.fromOffset(10, 10),
			BackgroundTransparency = 1, ZIndex = 9,
		}, head2)
		setLine(line(chev, C.or2, 9), 1, 3, 5, 7, 2)
		setLine(line(chev, C.or2, 9), 9, 3, 5, 7, 2)

		local list = N("ScrollingFrame", {
			Position = UDim2.fromOffset(0, 46), Size = UDim2.new(1, 0, 0, listH), BackgroundColor3 = C.card,
			BackgroundTransparency = 0.25, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = C.or1,
			CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ZIndex = 8,
		}, wrap)
		corner(list, 9)
		N("UIStroke", { Color = C.or1, Thickness = 1, Transparency = 0.6 }, list)
		N("UIListLayout", { Padding = UDim.new(0, 2) }, list)
		N("UIPadding", { PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4), PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 6) }, list)

		local abierto = false
		local function toggle()
			abierto = not abierto
			TW(wrap, 0.3, { Size = UDim2.new(1, 0, 0, abierto and (46 + listH + 4) or 40) })
			TW(chev, 0.3, { Rotation = abierto and 180 or 0 }, BACK)
			TW(st, 0.2, { Color = abierto and C.or1 or C.line })
		end
		head2.Activated:Connect(toggle)
		hoverable(head2, function() TW(head2, 0.15, { BackgroundTransparency = 0.2 }) end, function() TW(head2, 0.2, { BackgroundTransparency = 0.35 }) end)

		local seleccionado
		for _, opcion in ipairs(opciones) do
			local ob = N("TextButton", {
				Size = UDim2.new(1, 0, 0, 26), BackgroundColor3 = C.pu3, BackgroundTransparency = 0.7, Text = opcion,
				TextColor3 = C.text, Font = Enum.Font.GothamMedium, TextSize = 10, AutoButtonColor = false,
				BorderSizePixel = 0, ZIndex = 9,
			}, list)
			corner(ob, 6)
			hoverable(ob, function() TW(ob, 0.12, { BackgroundColor3 = C.or1, BackgroundTransparency = 0.5 }) end, function()
				TW(ob, 0.15, { BackgroundColor3 = C.pu3, BackgroundTransparency = (seleccionado == ob) and 0.45 or 0.7 })
			end)
			ob.Activated:Connect(function()
				if seleccionado then TW(seleccionado, 0.15, { BackgroundTransparency = 0.7 }) end
				seleccionado = ob
				TW(ob, 0.15, { BackgroundTransparency = 0.45 })
				valLbl.Text = opcion
				callback(opcion)
				toggle()
			end)
		end
		return wrap
	end

	---------------------------------------------------------------- tarjeta de informacion
	crearTarjeta = function(padre, titulo, contenido, colorBorde)
		local accent = colorBorde and accentOf(colorBorde) or C.or1
		local fr = N("Frame", {
			Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.new(1, 1, 1),
			BackgroundTransparency = 0.25, BorderSizePixel = 0, ZIndex = 7,
		}, padre)
		fr:SetAttribute("UZ", true)
		corner(fr, 10)
		N("UIGradient", { Rotation = 20, Color = ColorSequence.new(C.cardHi:Lerp(accent, 0.18), C.card) }, fr)
		N("UIStroke", { Color = accent, Thickness = 1.2, Transparency = 0.45 }, fr)
		N("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, fr)
		N("UIPadding", { PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10), PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12) }, fr)
		if titulo and titulo ~= "" then
			local row = N("Frame", { Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, LayoutOrder = 1, ZIndex = 8 }, fr)
			local d = N("Frame", {
				AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(5, 10), Size = UDim2.fromOffset(7, 7),
				BackgroundColor3 = accent, BorderSizePixel = 0, Rotation = 45, ZIndex = 9,
			}, row)
			table.insert(UI.shimmers, { d, nil })
			N("TextLabel", {
				Position = UDim2.fromOffset(16, 0), Size = UDim2.new(1, -16, 1, 0), BackgroundTransparency = 1, Text = titulo,
				TextColor3 = accent, Font = Enum.Font.GothamBold, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 9,
			}, row)
		end
		N("TextLabel", {
			Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, Text = contenido,
			TextColor3 = C.text, Font = Enum.Font.GothamMedium, TextSize = 11, TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, LayoutOrder = 2, ZIndex = 8,
		}, fr)
		return fr
	end

	---------------------------------------------------------------- secciones
	UI.shimmers = UI.shimmers or {}
	UI.decorarSeccion = function(fr)
		local d = N("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(10, 14), Size = UDim2.fromOffset(8, 8),
			BackgroundColor3 = C.or1, BorderSizePixel = 0, Rotation = 45, ZIndex = 4,
		}, fr)
		local ln = N("Frame", {
			Position = UDim2.new(0, 0, 1, -2), Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = C.or1, BorderSizePixel = 0, ZIndex = 3,
		}, fr)
		N("UIGradient", { Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 1) }) }, ln)
		table.insert(UI.shimmers, { d, nil })
	end
	UI.addUpdater(function(t)
		for i = #UI.shimmers, 1, -1 do
			local d = UI.shimmers[i][1]
			if d.Parent then
				d.Rotation = 45 + math.sin(t * 1.6 + i) * 25
				d.BackgroundTransparency = 0.1 + 0.3 * (0.5 + 0.5 * math.sin(t * 2.2 + i))
			else
				table.remove(UI.shimmers, i)
			end
		end
	end)

	_G.crearSeccion = function(padre, texto)
		local fr = N("Frame", { Size = UDim2.new(1, 0, 0, 30), BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 7 }, padre)
		fr:SetAttribute("UZ", true)
		N("TextLabel", {
			Position = UDim2.fromOffset(24, 0), Size = UDim2.new(1, -30, 1, -2), BackgroundTransparency = 1, Text = texto,
			TextColor3 = C.or2, Font = Enum.Font.GothamBlack, TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 5,
		}, fr)
		UI.decorarSeccion(fr)
		return fr
	end

	---------------------------------------------------------------- limpiador de emojis + skins automaticos
	local MAPA = {
		[0x2713] = "•", [0x25B6] = ">", [0x25C0] = "<", [0x23F8] = "||", [0x23F9] = "[]",
	}
	local RANGOS = {
		{ 0x1F000, 0x1F1E5 }, { 0x1F200, 0x1FAFF }, { 0x2190, 0x21FF }, { 0x2300, 0x23FF }, { 0x25A0, 0x25FF },
		{ 0x2600, 0x27BF }, { 0x2B00, 0x2BFF }, { 0xFE00, 0xFE0F }, { 0x200D, 0x200D }, { 0x20E3, 0x20E3 },
	}
	local function soltar(cp)
		for _, r in ipairs(RANGOS) do
			if cp >= r[1] and cp <= r[2] then return true end
		end
		return false
	end
	local function limpiar(s)
		if type(s) ~= "string" or s == "" then return s end
		local ok, res = pcall(function()
			local out = {}
			for _, cp in utf8.codes(s) do
				if MAPA[cp] then
					out[#out + 1] = MAPA[cp]
				elseif not soltar(cp) then
					out[#out + 1] = utf8.char(cp)
				end
			end
			return table.concat(out)
		end)
		if not ok then return s end
		res = res:gsub("^%?%? ", "")
		res = res:gsub("[ \t]+\n", "\n")
		res = res:gsub("\n[ \t]+", "\n")
		res = res:gsub("  +", " ")
		res = res:gsub("^%s+", "")
		res = res:gsub("%s+$", "")
		return res
	end

	local CP_LOCK, CP_UNLOCK = utf8.char(0x1F512), utf8.char(0x1F513)
	local CP_DOWN, CP_UP, CP_PUMPKIN = utf8.char(0x25BC), utf8.char(0x25B2), utf8.char(0x1F383)

	-- candado dibujado (reemplaza los emojis de bloqueo)
	UI.lockIcon = function(btn, locked)
	local ic = btn:FindFirstChild("UZLock")
	if not ic then
		ic = N("Frame", {
			Name = "UZLock", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(14, 14), BackgroundTransparency = 1, ZIndex = 2,
		}, btn)
		local sh = N("Frame", {
			Name = "Sh", Position = UDim2.fromOffset(3, 0), Size = UDim2.fromOffset(8, 8),
			BackgroundTransparency = 1, BorderSizePixel = 0,
		}, ic)
		corner(sh, 4)
		N("UIStroke", { Thickness = 1.6, Color = C.text }, sh)
		local body = N("Frame", {
			Name = "Body", Position = UDim2.fromOffset(1, 6), Size = UDim2.fromOffset(12, 8),
			BackgroundColor3 = C.text, BorderSizePixel = 0, ZIndex = 2,
		}, ic)
		corner(body, 2)
		N("Frame", {
			Position = UDim2.fromOffset(5, 2), Size = UDim2.fromOffset(2, 4),
			BackgroundColor3 = C.dark, BorderSizePixel = 0, ZIndex = 3,
		}, body)
	end
	local sh = ic:FindFirstChild("Sh")
	if sh then
		if locked then
			TW(sh, 0.25, {
				Position = UDim2.fromOffset(3, 0),
				Size = UDim2.fromOffset(8, 8),
			})
		else
			TW(sh, 0.25, {
				Position = UDim2.fromOffset(4, -3),
				Size = UDim2.fromOffset(6, 6),
			})
		end
	end
end

	UI.chev = function(btn)
		if btn:FindFirstChild("UZChev") then return end
		local c = N("Frame", {
			Name = "UZChev", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, -16, 0.5, 0),
			Size = UDim2.fromOffset(10, 10), BackgroundTransparency = 1, ZIndex = 3,
		}, btn)
		setLine(line(c, C.or2, 3), 1, 3, 5, 7, 2)
		setLine(line(c, C.or2, 3), 9, 3, 5, 7, 2)
	end

	UI.avatarIcon = function(lbl)
		if lbl:FindFirstChild("UZAv") then return end
		local box = N("Frame", {
			Name = "UZAv", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.fromOffset(24, 24), BackgroundTransparency = 1, ZIndex = 2,
		}, lbl)
		N("UIScale", { Scale = 2 }, box)
		UI.icon("Crab", box, C.or2)
	end

	local function procesarTexto(inst)
		if inst:IsA("TextBox") then return end
		local raw = inst.Text
		if raw == "" then return end
		if inst:IsA("TextButton") then
			local locked = string.find(raw, CP_LOCK, 1, true) ~= nil
			if locked or string.find(raw, CP_UNLOCK, 1, true) then UI.lockIcon(inst, locked) end
			if (string.find(raw, CP_DOWN, 1, true) or string.find(raw, CP_UP, 1, true)) and not inst:GetAttribute("UZ") then UI.chev(inst) end
		end
		if inst:IsA("TextLabel") and raw == CP_PUMPKIN and inst.Size.X.Offset == 60 then UI.avatarIcon(inst) end
		local clean = limpiar(raw)
		if clean ~= raw then inst.Text = clean end
	end

	local function esPropio(inst)
		local p = inst
		while p and p ~= ScreenGui do
			if p:GetAttribute("UZ") then return true end
			p = p.Parent
		end
		return false
	end

	local function enPagina(inst)
		local pg = inst:FindFirstAncestorWhichIsA("ScrollingFrame")
		return pg ~= nil and string.sub(pg.Name, 1, 7) == "Pagina_"
	end

	local function skinBoton(btn)
		if btn:GetAttribute("UZsk") then return end
		btn:SetAttribute("UZsk", true)
		btn.ClipsDescendants = true
		if not btn:FindFirstChildOfClass("UICorner") then corner(btn, 8) end
		local st = btn:FindFirstChildOfClass("UIStroke")
		local base = btn.BackgroundTransparency
		local sc = N("UIScale", { Scale = 1 }, btn)
		hoverable(btn, function()
			TW(btn, 0.15, { BackgroundTransparency = math.max(base - 0.15, 0) })
			TW(sc, 0.15, { Scale = 1.015 }, BACK)
		end, function()
			TW(btn, 0.2, { BackgroundTransparency = base })
			TW(sc, 0.2, { Scale = 1 })
		end)
		btn.InputBegan:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then TW(sc, 0.08, { Scale = 0.97 }) end
		end)
		btn.Activated:Connect(function()
			TW(sc, 0.25, { Scale = 1.015 }, BACK)
			ripple(btn, C.or2, 12, 240)
		end)
	end

	local function skinTextBox(tb)
		if tb:GetAttribute("UZsk") then return end
		tb:SetAttribute("UZsk", true)
		tb.Focused:Connect(function()
			local s = tb:FindFirstChildOfClass("UIStroke")
			if s then TW(s, 0.2, { Color = C.or2, Transparency = 0 }) end
		end)
		tb.FocusLost:Connect(function()
			local s = tb:FindFirstChildOfClass("UIStroke")
			if s then TW(s, 0.25, { Color = C.or1, Transparency = 0.4 }) end
		end)
	end

	local function skinSeccionManual(fr)
		if fr:GetAttribute("UZsk") or not fr.Parent then return end
		fr:SetAttribute("UZsk", true)
		fr.BackgroundTransparency = 1
		local s = fr:FindFirstChildOfClass("UIStroke")
		if s then s.Transparency = 1 end
		local lbl = fr:FindFirstChildOfClass("TextLabel")
		if lbl then
			lbl.Position = UDim2.fromOffset(24, 0)
			lbl.Size = UDim2.new(1, -30, 1, -2)
		end
		UI.decorarSeccion(fr)
	end

	local function skinHud(btn)
		if btn == orb or btn:GetAttribute("UZsk") then return end
		btn:SetAttribute("UZsk", true)
		local sc = N("UIScale", { Scale = 1 }, btn)
		btn.MouseEnter:Connect(function() TW(sc, 0.15, { Scale = 1.04 }, BACK) end)
		btn.MouseLeave:Connect(function() TW(sc, 0.2, { Scale = 1 }) end)
		btn.InputBegan:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then TW(sc, 0.08, { Scale = 0.94 }) end
		end)
		btn.InputEnded:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then TW(sc, 0.25, { Scale = 1 }, BACK) end
		end)
	end

	local function alAgregar(inst)
		if inst:IsA("TextLabel") or inst:IsA("TextButton") then
			procesarTexto(inst)
			inst:GetPropertyChangedSignal("Text"):Connect(function() procesarTexto(inst) end)
		end
		if inst:IsA("TextButton") then
			if inst.Parent == ScreenGui then
				skinHud(inst)
			elseif not esPropio(inst) and enPagina(inst) then
				skinBoton(inst)
			end
		elseif inst:IsA("TextBox") then
			if not esPropio(inst) and enPagina(inst) then skinTextBox(inst) end
		elseif inst:IsA("Frame") then
			local p = inst.Parent
			if p and p:IsA("ScrollingFrame") and inst.Size.Y.Offset == 30 and inst.Size.X.Scale == 1
				and inst.BackgroundColor3 == Color3.fromRGB(20, 15, 25) then
				task.defer(skinSeccionManual, inst)
			end
		end
	end
	ScreenGui.DescendantAdded:Connect(alAgregar)
end

print("🎃 Parte 2/10 cargada - Halloween UI")

-- ============================================
-- 🌾 AUTO FARM COINS (sistema god6767 - adaptado)
-- ============================================

_G.FARM_ON = false
_G.FARM_AFK = false
_G.FARM_NOCLIP = true
_G.FARM_ANTIVOID = true
_G.FARM_SPEED = 23
_G.FARM_MAXDIST = 1000
_G.FARM_RESET_DELAY = 5.0

_G.FARM_ESTADO = "idle"
_G.FARM_BAG_FULL = false
_G.FARM_WAITING = false
_G.FARM_ACTIVE_COINS = {}
_G.FARM_BLACKLIST = {}
_G.FARM_CURRENT = nil
_G.FARM_NOCOINS_TIME = nil
_G.FARM_COLLECTED = false

_G.FARM_LV = nil
_G.FARM_ATTACH = nil
_G.FARM_CONNECTIONS = {}
_G.FARM_CHAR_CONN = nil
_G.FARM_TARGET_THREAD = nil

_G.FARM_CHAR = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
_G.FARM_ROOT = _G.FARM_CHAR:WaitForChild("HumanoidRootPart")
_G.FARM_HUM = _G.FARM_CHAR:WaitForChild("Humanoid")

_G.FARM_ADD_CONN = function(conn)
    table.insert(_G.FARM_CONNECTIONS, conn)
end

_G.FARM_CLEAN_CONNS = function()
    for _, conn in ipairs(_G.FARM_CONNECTIONS) do
        pcall(function() conn:Disconnect() end)
    end
    _G.FARM_CONNECTIONS = {}
end

_G.FARM_STOP_MOVE = function()
    if _G.FARM_LV then
        _G.FARM_LV.VectorVelocity = Vector3.zero
        _G.FARM_LV.Enabled = false
    end
    if _G.FARM_ROOT then
        _G.FARM_ROOT.AssemblyLinearVelocity = Vector3.zero
        _G.FARM_ROOT.AssemblyAngularVelocity = Vector3.zero
    end
end

_G.FARM_SETUP_VEL = function()
    if not _G.FARM_ROOT then return end
    
    _G.FARM_ATTACH = _G.FARM_ROOT:FindFirstChild("FarmAttachment")
    if not _G.FARM_ATTACH then
        _G.FARM_ATTACH = Instance.new("Attachment")
        _G.FARM_ATTACH.Name = "FarmAttachment"
        _G.FARM_ATTACH.Parent = _G.FARM_ROOT
    end
    
    _G.FARM_LV = _G.FARM_ROOT:FindFirstChild("FarmLinearVelocity")
    if not _G.FARM_LV then
        _G.FARM_LV = Instance.new("LinearVelocity")
        _G.FARM_LV.Name = "FarmLinearVelocity"
        _G.FARM_LV.Attachment0 = _G.FARM_ATTACH
        _G.FARM_LV.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
        _G.FARM_LV.RelativeTo = Enum.ActuatorRelativeTo.World
        _G.FARM_LV.VectorVelocity = Vector3.zero
        _G.FARM_LV.Enabled = false
        _G.FARM_LV.ForceLimitMode = Enum.ForceLimitMode.PerAxis
        _G.FARM_LV.MaxAxesForce = Vector3.new(100000, 100000, 100000)
        _G.FARM_LV.Parent = _G.FARM_ROOT
    end
end

_G.FARM_REMOVE_VEL = function()
    if _G.FARM_LV then _G.FARM_LV:Destroy() _G.FARM_LV = nil end
    if _G.FARM_ATTACH then _G.FARM_ATTACH:Destroy() _G.FARM_ATTACH = nil end
end

_G.FARM_IS_COIN = function(part)
    if not part:IsA("BasePart") or _G.FARM_BLACKLIST[part] then return false end
    local name = part.Name:lower()
    return name:find("coin") or name:find("cash") or name:find("money") or name:find("collect")
end

_G.FARM_CHECK_FULL = function()
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    if not pg then return false end
    for _, gui in ipairs(pg:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Name ~= "UzivertHub" and gui.Name ~= "UzivertSelectorNew" then
            local cont = gui:FindFirstChild("Container", true)
            if cont then
                for _, fr in ipairs(cont:GetChildren()) do
                    if fr:IsA("Frame") and fr.Visible then
                        local ico = fr:FindFirstChild("FullBagIcon", true)
                        local txt = fr:FindFirstChild("Full", true)
                        if (ico and ico.Visible) or (txt and txt.Visible) then
                            return true
                        end
                    end
                end
            end
        end
    end
    return false
end

_G.FARM_TRIGGER_RESET = function()
    if _G.FARM_BAG_FULL then return end
    _G.FARM_BAG_FULL = true
    _G.FARM_STOP_MOVE()
    task.wait(0.2)
    if _G.FARM_HUM and _G.FARM_HUM.Health > 0 then
        _G.FARM_HUM.Health = 0
    end
end

_G.FARM_TRACK = function(part)
    if _G.FARM_IS_COIN(part) then
        _G.FARM_ACTIVE_COINS[part] = true
    end
end

_G.FARM_UNTRACK = function(part)
    _G.FARM_ACTIVE_COINS[part] = nil
    if _G.FARM_CURRENT == part then _G.FARM_CURRENT = nil end
end

_G.FARM_INIT_COINS = function()
    _G.FARM_ACTIVE_COINS = {}
    for _, v in ipairs(Workspace:GetDescendants()) do
        if _G.FARM_IS_COIN(v) then _G.FARM_ACTIVE_COINS[v] = true end
    end
    _G.FARM_ADD_CONN(Workspace.DescendantAdded:Connect(_G.FARM_TRACK))
    _G.FARM_ADD_CONN(Workspace.DescendantRemoving:Connect(_G.FARM_UNTRACK))
    
    local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
    local gameplay = remotes and remotes:FindFirstChild("Gameplay")
    if gameplay then
        local coinsStarted = gameplay:FindFirstChild("CoinsStarted")
        local coinCollected = gameplay:FindFirstChild("CoinCollected")
        if coinsStarted then
            _G.FARM_ADD_CONN(coinsStarted.OnClientEvent:Connect(function()
                _G.FARM_WAITING = true
                _G.FARM_STOP_MOVE()
                _G.FARM_CURRENT = nil
                _G.FARM_ACTIVE_COINS = {}
                _G.FARM_BLACKLIST = {}
                _G.FARM_BAG_FULL = false
                task.wait(1.5)
                for _, v in ipairs(Workspace:GetDescendants()) do
                    if _G.FARM_IS_COIN(v) then _G.FARM_ACTIVE_COINS[v] = true end
                end
                _G.FARM_WAITING = false
            end))
        end
        if coinCollected then
            _G.FARM_ADD_CONN(coinCollected.OnClientEvent:Connect(function(_, cur, max)
                local c = tonumber(cur)
                local m = tonumber(max)
                if c and m and c >= m then _G.FARM_TRIGGER_RESET() end
            end))
        end
    end
end

_G.FARM_FINDER = function()
    if _G.FARM_TARGET_THREAD then task.cancel(_G.FARM_TARGET_THREAD) end
    _G.FARM_TARGET_THREAD = task.spawn(function()
        while true do
            task.wait(0.1)
            if not _G.FARM_ON then break end
            
            if _G.FARM_ON and not _G.FARM_BAG_FULL and _G.FARM_CHECK_FULL() then
                _G.FARM_TRIGGER_RESET()
            end
            
            if _G.FARM_ON and not _G.FARM_BAG_FULL and not _G.FARM_WAITING and _G.FARM_ROOT then
                local pos = _G.FARM_ROOT.Position
                local nearest = nil
                local nearestDist = _G.FARM_MAXDIST + 1
                for coin, _ in pairs(_G.FARM_ACTIVE_COINS) do
                    if coin and coin.Parent and not _G.FARM_BLACKLIST[coin] then
                        local d = (coin.Position - pos).Magnitude
                        if d < nearestDist then nearestDist = d nearest = coin end
                    else
                        _G.FARM_ACTIVE_COINS[coin] = nil
                    end
                end
                if nearest and not nearest:FindFirstChild("CoinVisual") then
                    _G.FARM_ACTIVE_COINS[nearest] = nil
                    nearest = nil
                end
                _G.FARM_CURRENT = nearest
            end
        end
    end)
end

_G.FARM_AFK_LOOP = function()
    while _G.FARM_AFK and _G.FARM_ON do
        task.wait(30)
        if not _G.FARM_AFK or not _G.FARM_ON then break end
        pcall(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
end

_G.FARM_ENGINE = function()
    _G.FARM_CLEAN_CONNS()
    _G.FARM_SETUP_VEL()
    _G.FARM_INIT_COINS()
    _G.FARM_NOCOINS_TIME = nil
    
    _G.FARM_ADD_CONN(RunService.Heartbeat:Connect(function()
        if not _G.FARM_ON or _G.FARM_BAG_FULL or _G.FARM_WAITING or not _G.FARM_ROOT or not _G.FARM_ROOT.Parent or not _G.FARM_HUM or _G.FARM_HUM.Health <= 0 then
            _G.FARM_STOP_MOVE()
            return
        end
        
        if _G.FARM_CURRENT and _G.FARM_CURRENT.Parent and not _G.FARM_BLACKLIST[_G.FARM_CURRENT] then
            _G.FARM_NOCOINS_TIME = nil
            local targetPos = _G.FARM_CURRENT.Position
            local rootPos = _G.FARM_ROOT.Position
            local dist = (targetPos - rootPos).Magnitude
            if dist <= 1.2 then
                _G.FARM_ROOT.CFrame = CFrame.new(targetPos)
                _G.FARM_STOP_MOVE()
                _G.FARM_COLLECTED = true
                _G.FARM_BLACKLIST[_G.FARM_CURRENT] = true
                _G.FARM_ACTIVE_COINS[_G.FARM_CURRENT] = nil
                _G.FARM_CURRENT = nil
            else
                if _G.FARM_LV then
                    _G.FARM_LV.Enabled = true
                    _G.FARM_LV.VectorVelocity = (targetPos - rootPos).Unit * _G.FARM_SPEED
                end
            end
        else
            _G.FARM_STOP_MOVE()
            if _G.FARM_COLLECTED then
                if not _G.FARM_NOCOINS_TIME then
                    _G.FARM_NOCOINS_TIME = os.clock()
                elseif os.clock() - _G.FARM_NOCOINS_TIME >= _G.FARM_RESET_DELAY then
                    _G.FARM_NOCOINS_TIME = nil
                    _G.FARM_CLEAN_CONNS()
                    if _G.FARM_HUM then _G.FARM_HUM.Health = 0 end
                end
            else
                _G.FARM_NOCOINS_TIME = nil
            end
        end
    end))
end

-- Anti-Void
_G.FARM_ANTIVOID_APPLY = function()
    if _G.FARM_ANTIVOID then
        Workspace.FallenPartsDestroyHeight = 0/0
    end
end

-- Noclip
_G.FARM_NOCLIP_CONN = nil
_G.FARM_NOCLIP_START = function()
    if _G.FARM_NOCLIP_CONN then return end
    _G.FARM_NOCLIP_CONN = RunService.Stepped:Connect(function()
        if not _G.FARM_ON or not _G.FARM_NOCLIP then return end
        local char = LocalPlayer.Character
        if char then
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end)
end

_G.FARM_NOCLIP_STOP = function()
    if _G.FARM_NOCLIP_CONN then
        _G.FARM_NOCLIP_CONN:Disconnect()
        _G.FARM_NOCLIP_CONN = nil
    end
    local char = LocalPlayer.Character
    if char then
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = true end
        end
    end
end

-- Iniciar / Parar
_G.FARM_LOAD = function()
    _G.FARM_BAG_FULL = false
    _G.FARM_WAITING = false
    _G.FARM_COLLECTED = false
    _G.FARM_BLACKLIST = {}
    _G.FARM_NOCOINS_TIME = nil
    
    _G.FARM_CHAR = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    _G.FARM_ROOT = _G.FARM_CHAR:WaitForChild("HumanoidRootPart")
    _G.FARM_HUM = _G.FARM_CHAR:WaitForChild("Humanoid")
    
    _G.FARM_ANTIVOID_APPLY()
    _G.FARM_NOCLIP_START()
    _G.FARM_FINDER()
    _G.FARM_ENGINE()
    
    if _G.FARM_CHAR_CONN then _G.FARM_CHAR_CONN:Disconnect() end
    _G.FARM_CHAR_CONN = LocalPlayer.CharacterAdded:Connect(function(newChar)
        _G.FARM_CLEAN_CONNS()
        _G.FARM_REMOVE_VEL()
        _G.FARM_CHAR = newChar
        _G.FARM_ROOT = newChar:WaitForChild("HumanoidRootPart")
        _G.FARM_HUM = newChar:WaitForChild("Humanoid")
        _G.FARM_BAG_FULL = false
        _G.FARM_WAITING = false
        _G.FARM_COLLECTED = false
        _G.FARM_BLACKLIST = {}
        task.wait(1.5)
        if _G.FARM_ON then _G.FARM_ENGINE() end
    end)
end

_G.FARM_UNLOAD = function()
    _G.FARM_ON = false
    _G.FARM_CLEAN_CONNS()
    _G.FARM_NOCLIP_STOP()
    _G.FARM_REMOVE_VEL()
    if _G.FARM_TARGET_THREAD then
        task.cancel(_G.FARM_TARGET_THREAD)
        _G.FARM_TARGET_THREAD = nil
    end
    if _G.FARM_CHAR_CONN then
        _G.FARM_CHAR_CONN:Disconnect()
        _G.FARM_CHAR_CONN = nil
    end
    _G.FARM_ACTIVE_COINS = {}
    _G.FARM_BLACKLIST = {}
    _G.FARM_CURRENT = nil
end

local PaginaVisual = crearPagina("Visual", "Visual", 1)
local PaginaAim = crearPagina("Combat", "Combat", 2)
local PaginaAura = crearPagina("Crab", "Crab", 3)
local PaginaPlayer = crearPagina("Jugador", "Jugador", 4)
local PaginaBomb = crearPagina("Clutchs", "Clutchs", 7)
local PaginaAutoFarm = crearPagina("Auto Farm", "AutoFarm", 10)
local PaginaInfo = crearPagina("Info", "Info", 11)
local PaginaUpdate = crearPagina("Update", "Update", 12)
local PaginaAvisos = crearPagina("Avisos", "Avisos", 13)
local PaginaCreador = crearPagina("Creador", "Creador", 14)

-- Pestañas solo de GAMA ALTA
if not _G.UZIVERT_GAMA_BAJA then
    PaginaFling = crearPagina("Fling", "Fling", 5)
    PaginaAnims = crearPagina("Anims", "Anims", 6)
    PaginaUtilidades = crearPagina("Utilidades", "Utilidades", 8)
    PaginaRend = crearPagina("Apariencia", "Apariencia", 9)
end

Paginas[1][2].Visible = true
Paginas[1][1].BackgroundTransparency = 0.3

-- Controles del Auto Farm
crearToggle(PaginaAutoFarm, "🌾 Auto Farm", false, function(v)
    _G.FARM_ON = v
    if v then
        _G.FARM_LOAD()
        if _G.FARM_AFK then task.spawn(_G.FARM_AFK_LOOP) end
    else
        _G.FARM_UNLOAD()
    end
end)

crearToggle(PaginaAutoFarm, "🌙 Anti-AFK", false, function(v)
    _G.FARM_AFK = v
    if v and _G.FARM_ON then task.spawn(_G.FARM_AFK_LOOP) end
end)

crearToggle(PaginaAutoFarm, "👻 Noclip", true, function(v)
    _G.FARM_NOCLIP = v
    if v and _G.FARM_ON then
        _G.FARM_NOCLIP_START()
    else
        _G.FARM_NOCLIP_STOP()
    end
end)

crearToggle(PaginaAutoFarm, "🛡️ Anti-Void", true, function(v)
    _G.FARM_ANTIVOID = v
    _G.FARM_ANTIVOID_APPLY()
end)

crearSlider(PaginaAutoFarm, "🚶 Velocidad", 10, 30, 23, function(v)
    _G.FARM_SPEED = v
end)

crearSlider(PaginaAutoFarm, "📏 Distancia Máx", 100, 2000, 1000, function(v)
    _G.FARM_MAXDIST = v
end)

-- ============================================
-- 🧰 UTILIDADES: INVENTORY UNLIMITER + AUTO GET TOOLS
-- ============================================
if not _G.UZIVERT_GAMA_BAJA then

-- Variables globales
_G.UZIVERT_INV_ON = CONFIG.InventoryUnlimiter or false
_G.UZIVERT_INV_LIMIT = CONFIG.InventoryMaxItems or 10
_G.UZIVERT_AUTOGET_ON = CONFIG.AutoGetTools or false
_G.UZIVERT_TOYS = {
    CONFIG.AutoToySlot1 or "None",
    CONFIG.AutoToySlot2 or "None",
    CONFIG.AutoToySlot3 or "None",
    CONFIG.AutoToySlot4 or "None",
}
_G.UZIVERT_TOY_ATTEMPTS = {}
_G.UZIVERT_TARGET_FUNCTIONS = {}
_G.UZIVERT_TARGETS_SCANNED = false
_G.UZIVERT_RECOVERY_TOKEN = 0
_G.UZIVERT_RECOVERY_RUNNING = false
_G.UZIVERT_OBSERVED_BACKPACK = nil
_G.UZIVERT_TOY_ORDER_DIRTY = true

-- Funciones auxiliares
local getupvaluesLocal = (debug and debug.getupvalues) or getupvalues
local setupvalueLocal = (debug and debug.setupvalue) or setupvalue
local getinfoLocal = (debug and debug.getinfo) or getinfo
local getconstantsLocal = (debug and debug.getconstants) or getconstants

_G.UZIVERT_DISCOVER_TARGETS = function(force)
    if _G.UZIVERT_TARGETS_SCANNED and not force then return end
    _G.UZIVERT_TARGETS_SCANNED = false
    table.clear(_G.UZIVERT_TARGET_FUNCTIONS)
    
    if not (type(getgc) == "function" and type(getupvaluesLocal) == "function"
        and type(setupvalueLocal) == "function" and type(getinfoLocal) == "function") then
        return
    end
    
    local okGc, objects = pcall(getgc)
    if not okGc or type(objects) ~= "table" then return end
    
    for _, f in ipairs(objects) do
        if type(f) == "function" then
            local success, info = pcall(getinfoLocal, f)
            if success and type(info) == "table" then
                local isTarget = (info.name == "updateItemFrame" or info.name == "onItemEquipped")
                if not isTarget and type(getconstantsLocal) == "function" then
                    local cSuccess, constants = pcall(getconstantsLocal, f)
                    if cSuccess and type(constants) == "table" then
                        local hasTouch, hasEquip = false, false
                        for _, value in pairs(constants) do
                            if value == "TouchBinding" then hasTouch = true
                            elseif value == "EquipButton" then hasEquip = true end
                        end
                        isTarget = hasTouch and hasEquip
                    end
                end
                if isTarget then table.insert(_G.UZIVERT_TARGET_FUNCTIONS, f) end
            end
        end
    end
    _G.UZIVERT_TARGETS_SCANNED = #_G.UZIVERT_TARGET_FUNCTIONS > 0
end

_G.UZIVERT_APPLY_INV_LIMIT = function(force)
    if not _G.UZIVERT_INV_ON then return end
    _G.UZIVERT_DISCOVER_TARGETS(force)
    for _, f in ipairs(_G.UZIVERT_TARGET_FUNCTIONS) do
        local ok, upvalues = pcall(getupvaluesLocal, f)
        if ok and type(upvalues) == "table" then
            for index, value in pairs(upvalues) do
                if type(index) == "number" and type(value) == "number" and value >= 2 and value <= 10 then
                    pcall(setupvalueLocal, f, index, _G.UZIVERT_INV_LIMIT)
                end
            end
        end
    end
end

_G.UZIVERT_GET_BACKPACK = function()
    if _G.UZIVERT_OBSERVED_BACKPACK and _G.UZIVERT_OBSERVED_BACKPACK.Parent == LocalPlayer then
        return _G.UZIVERT_OBSERVED_BACKPACK
    end
    return LocalPlayer:FindFirstChildOfClass("Backpack")
end

_G.UZIVERT_FIND_TOY_FOLDER = function()
    local backpack = _G.UZIVERT_GET_BACKPACK()
    return backpack and backpack:FindFirstChild("Toys") or nil
end

_G.UZIVERT_GET_TOY_NAMES = function()
    local names = {"None"}
    local folder = _G.UZIVERT_FIND_TOY_FOLDER()
    if folder then
        for _, toy in ipairs(folder:GetChildren()) do
            if not table.find(names, toy.Name) then names[#names+1] = toy.Name end
        end
    end
    table.sort(names, function(a, b)
        if a == b then return false end
        if a == "None" then return true end
        if b == "None" then return false end
        return a:lower() < b:lower()
    end)
    return names
end

_G.UZIVERT_HAS_TOOL = function(name, char, backpack)
    local inChar = char and char:FindFirstChild(name)
    local inBackpack = backpack and backpack:FindFirstChild(name)
    return (inChar and inChar:IsA("Tool")) or (inBackpack and inBackpack:IsA("Tool")) or false
end

_G.UZIVERT_TOY_REMOTE = function()
    local rs = game:GetService("ReplicatedStorage")
    local remotes = rs:FindFirstChild("Remotes")
    local extras = remotes and remotes:FindFirstChild("Extras")
    local remote = extras and extras:FindFirstChild("ReplicateToy")
    if remote and remote:IsA("RemoteFunction") then return remote end
end

_G.UZIVERT_CANCEL_TOY_REQUESTS = function()
    for _, attempt in pairs(_G.UZIVERT_TOY_ATTEMPTS) do
        if attempt.thread and type(task.cancel) == "function" then pcall(task.cancel, attempt.thread) end
    end
    table.clear(_G.UZIVERT_TOY_ATTEMPTS)
    _G.UZIVERT_ACTIVE_REQUEST = nil
end

_G.UZIVERT_REQUEST_RECOVERY = function(forceScan)
    if not _G.UZIVERT_INV_ON and not _G.UZIVERT_AUTOGET_ON then return end
    local char = LocalPlayer.Character
    if not char then return end
    
    if forceScan then 
        _G.UZIVERT_TARGETS_SCANNED = false 
        table.clear(_G.UZIVERT_TOY_ATTEMPTS)
    end
    
    if _G.UZIVERT_RECOVERY_RUNNING then
        _G.UZIVERT_RECOVERY_TOKEN = _G.UZIVERT_RECOVERY_TOKEN + 1
    end
    
    _G.UZIVERT_RECOVERY_RUNNING = true
    _G.UZIVERT_RECOVERY_TOKEN = _G.UZIVERT_RECOVERY_TOKEN + 1
    local token = _G.UZIVERT_RECOVERY_TOKEN
    
    task.spawn(function()
        local startedAt = os.clock()
        local scanTimes = {0, 0.5, 1, 2, 3, 5, 8, 12, 16}
        local scanIndex = 1
        local nextInventoryApply = 0
        local nextToyRequest = 0
        
        while token == _G.UZIVERT_RECOVERY_TOKEN and os.clock() - startedAt < 25 do
            local now = os.clock()
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            
            if humanoid and humanoid.Health > 0 then
                local force = false
                if scanTimes[scanIndex] and now - startedAt >= scanTimes[scanIndex] then
                    force = true
                    repeat scanIndex = scanIndex + 1
                    until not scanTimes[scanIndex] or now - startedAt < scanTimes[scanIndex]
                end
                
                if _G.UZIVERT_INV_ON and (force or (_G.UZIVERT_TARGETS_SCANNED and now >= nextInventoryApply)) then
                    _G.UZIVERT_APPLY_INV_LIMIT(force)
                    nextInventoryApply = now + 1
                end
                
                if _G.UZIVERT_AUTOGET_ON and not _G.UZIVERT_ACTIVE_REQUEST and now >= nextToyRequest then
                    local backpack = _G.UZIVERT_GET_BACKPACK()
                    local folder = _G.UZIVERT_FIND_TOY_FOLDER()
                    local remote = _G.UZIVERT_TOY_REMOTE()
                    
                    if backpack and folder and remote then
                        for slot = 1, 4 do
                            local name = _G.UZIVERT_TOYS[slot]
                            if name and name ~= "None" then
                                if not _G.UZIVERT_HAS_TOOL(name, char, backpack) then
                                    local attempt = _G.UZIVERT_TOY_ATTEMPTS[name]
                                    if not attempt then
                                        attempt = {count = 0, nextAt = 0, inFlight = false}
                                        _G.UZIVERT_TOY_ATTEMPTS[name] = attempt
                                    end
                                    
                                    if folder:FindFirstChild(name) and not attempt.inFlight and attempt.count < 12 and now >= attempt.nextAt then
                                        attempt.count = attempt.count + 1
                                        attempt.nextAt = now + 0.5
                                        attempt.inFlight = true
                                        _G.UZIVERT_ACTIVE_REQUEST = attempt
                                        nextToyRequest = now + 0.15
                                        
                                        attempt.thread = task.spawn(function()
                                            pcall(function() remote:InvokeServer(name) end)
                                            task.wait(0.3)
                                            attempt.inFlight = false
                                            if _G.UZIVERT_ACTIVE_REQUEST == attempt then _G.UZIVERT_ACTIVE_REQUEST = nil end
                                        end)
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
            end
            task.wait(0.15)
        end
        if token == _G.UZIVERT_RECOVERY_TOKEN then _G.UZIVERT_RECOVERY_RUNNING = false end
    end)
end

-- Watchers
local invConns = {}
_G.UZIVERT_WATCH_TOY_FOLDER = function(folder)
    for _, conn in ipairs(invConns) do pcall(function() conn:Disconnect() end) end
    table.clear(invConns)
    if not folder then return end
    invConns[#invConns+1] = folder.ChildAdded:Connect(function() _G.UZIVERT_REQUEST_RECOVERY(false) end)
    invConns[#invConns+1] = folder.ChildRemoved:Connect(function() _G.UZIVERT_REQUEST_RECOVERY(false) end)
end

_G.UZIVERT_WATCH_BACKPACK = function(backpack)
    _G.UZIVERT_OBSERVED_BACKPACK = backpack
    if backpack then
        _G.UZIVERT_WATCH_TOY_FOLDER(backpack:FindFirstChild("Toys"))
        backpack.ChildAdded:Connect(function(child)
            if child.Name == "Toys" then
                _G.UZIVERT_WATCH_TOY_FOLDER(child)
                _G.UZIVERT_REQUEST_RECOVERY(false)
            end
        end)
        backpack.ChildRemoved:Connect(function(child)
            if child.Name == "Toys" then _G.UZIVERT_WATCH_TOY_FOLDER(nil) end
        end)
    end
end

_G.UZIVERT_WATCH_BACKPACK(LocalPlayer:FindFirstChildOfClass("Backpack"))

LocalPlayer.CharacterAdded:Connect(function(char)
    -- Esperar a que el personaje tenga los componentes clave
    local timeout = tick() + 10
    repeat
        task.wait(0.1)
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        if humanoid and humanoid.Health > 0 and backpack then
            break
        end
    until tick() > timeout
    
    -- Esperar un poco más para que cargue todo
    task.wait(1.5)
    
    -- Watch backpack
    _G.UZIVERT_WATCH_BACKPACK(LocalPlayer:FindFirstChildOfClass("Backpack"))
    
    -- Forzar recovery
    _G.UZIVERT_REQUEST_RECOVERY(true)
    
    -- Reintentos adicionales por si el primero falla
    task.delay(3, function()
        if _G.UZIVERT_AUTOGET_ON then
            _G.UZIVERT_REQUEST_RECOVERY(true)
        end
    end)
    
    task.delay(6, function()
        if _G.UZIVERT_AUTOGET_ON then
            local backpack = _G.UZIVERT_GET_BACKPACK()
            if backpack then
                local faltantes = false
                for slot = 1, 4 do
                    local name = _G.UZIVERT_TOYS[slot]
                    if name and name ~= "None" then
                        if not _G.UZIVERT_HAS_TOOL(name, char, backpack) then
                            faltantes = true
                            break
                        end
                    end
                end
                if faltantes then
                    _G.UZIVERT_REQUEST_RECOVERY(true)
                end
            end
        end
    end)
end)

if _G.UZIVERT_INV_ON or _G.UZIVERT_AUTOGET_ON then
    task.defer(function() _G.UZIVERT_REQUEST_RECOVERY(false) end)
end

-- ============================================
-- UI: SECCIÓN
-- ============================================
_G.secUtil = Instance.new("Frame")
_G.secUtil.Size = UDim2.new(1, 0, 0, 30)
_G.secUtil.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secUtil.BackgroundTransparency = 0.3
_G.secUtil.BorderSizePixel = 0
_G.secUtil.ZIndex = 2
_G.secUtil.Parent = PaginaUtilidades

_G.cSecUtil = Instance.new("UICorner")
_G.cSecUtil.CornerRadius = UDim.new(0, 7)
_G.cSecUtil.Parent = _G.secUtil

_G.sSecUtil = Instance.new("UIStroke")
_G.sSecUtil.Color = COLORES.Morado3
_G.sSecUtil.Thickness = 1.5
_G.sSecUtil.Transparency = 0.2
_G.sSecUtil.Parent = _G.secUtil

_G.lblSecUtil = Instance.new("TextLabel")
_G.lblSecUtil.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecUtil.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecUtil.BackgroundTransparency = 1
_G.lblSecUtil.Text = "🧰 INVENTORY + AUTO GET TOOLS"
_G.lblSecUtil.TextColor3 = COLORES.Naranja2
_G.lblSecUtil.Font = Enum.Font.GothamBlack
_G.lblSecUtil.TextSize = 12
_G.lblSecUtil.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecUtil.ZIndex = 3
_G.lblSecUtil.Parent = _G.secUtil

-- Toggle Inventory Unlimiter
crearToggle(PaginaUtilidades, "🎒 Unlimit Inventory (3→10)", CONFIG.InventoryUnlimiter or false, function(e)
    _G.UZIVERT_INV_ON = e
    CONFIG.InventoryUnlimiter = e
    guardarConfig()
    if e then _G.UZIVERT_REQUEST_RECOVERY(true) end
end)

-- Slider Max Items
crearSlider(PaginaUtilidades, "Máx Items", 3, 10, CONFIG.InventoryMaxItems or 10, function(v)
    _G.UZIVERT_INV_LIMIT = math.clamp(math.floor(v), 3, 10)
    CONFIG.InventoryMaxItems = _G.UZIVERT_INV_LIMIT
    guardarConfig()
    if _G.UZIVERT_INV_ON then _G.UZIVERT_REQUEST_RECOVERY(true) end
end)

-- Toggle Auto Get Tools
crearToggle(PaginaUtilidades, "🎒 Auto Get Tools", CONFIG.AutoGetTools or false, function(e)
    _G.UZIVERT_AUTOGET_ON = e
    CONFIG.AutoGetTools = e
    guardarConfig()
    if e then
        _G.UZIVERT_REQUEST_RECOVERY(false)
    else
        _G.UZIVERT_CANCEL_TOY_REQUESTS()
    end
end)

-- Función para crear dropdowns de toys (CORREGIDA)
_G.UZIVERT_TOY_DD_BUTTONS = {}

_G.UZIVERT_CREAR_TOY_DD = function(slot)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = COLORES.Morado3
    btn.BackgroundTransparency = 0.5
    btn.Text = "Toy Slot " .. slot .. ": " .. (_G.UZIVERT_TOYS[slot] or "None") .. " ▼"
    btn.TextColor3 = COLORES.Texto
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.BorderSizePixel = 0
    btn.ZIndex = 2
    btn.Parent = PaginaUtilidades
    
    local cDD = Instance.new("UICorner")
    cDD.CornerRadius = UDim.new(0, 8)
    cDD.Parent = btn
    
    -- Guardar el botón en su propia variable
    _G.UZIVERT_TOY_DD_BUTTONS[slot] = btn
    
    -- Closure: cada botón sabe su propio slot
    btn.MouseButton1Click:Connect(function()
        local lista = _G.UZIVERT_GET_TOY_NAMES()
        local actual = _G.UZIVERT_TOYS[slot]
        local idx = table.find(lista, actual)
        if not idx then idx = 0 end
        idx = idx % #lista + 1
        local nuevo = lista[idx]
        _G.UZIVERT_TOYS[slot] = nuevo
        CONFIG["AutoToySlot" .. slot] = nuevo
        guardarConfig()
        btn.Text = "Toy Slot " .. slot .. ": " .. nuevo .. " ▼"
        if _G.UZIVERT_AUTOGET_ON then _G.UZIVERT_REQUEST_RECOVERY(false) end
    end)
end

_G.UZIVERT_CREAR_TOY_DD(1)
_G.UZIVERT_CREAR_TOY_DD(2)
_G.UZIVERT_CREAR_TOY_DD(3)
_G.UZIVERT_CREAR_TOY_DD(4)

-- Botón Refresh
crearBoton(PaginaUtilidades, "🔄 Refrescar Lista de Toys", function()
    print("🎒 Toys disponibles:")
    for _, toy in ipairs(_G.UZIVERT_GET_TOY_NAMES()) do
        print("  • " .. toy)
    end
end, COLORES.Naranja1)

-- ==================================================
-- 💀 FE HEADLESS (3 VERSIONES)
-- ==================================================

_G.UZIVERT_FEHL_CONFIGS = {
    {id="78837807518622",  on=CONFIG["FEHeadless"]   or false, track=nil, freeze=nil, stopped=nil, name="Headless"},
    {id="117080641351340", on=CONFIG["FEHeadlessV2"] or false, track=nil, freeze=nil, stopped=nil, name="Headless V2"},
    {id="136055001302601", on=CONFIG["FEHeadlessV3"] or false, track=nil, freeze=nil, stopped=nil, name="Headless V3"}
}

_G.UZIVERT_FEHL_STOP = function(cfg)
    if cfg.stopped then cfg.stopped:Disconnect() cfg.stopped = nil end
    if cfg.track then cfg.track:Stop() cfg.track:Destroy() cfg.track = nil end
end

_G.UZIVERT_FEHL_PLAY = function(cfg, hum)
    if not hum or not hum.Parent then return end
    local ani = hum:FindFirstChildOfClass("Animator")
    if not ani then return end
    _G.UZIVERT_FEHL_STOP(cfg)
    local a = Instance.new("Animation")
    a.AnimationId = "rbxassetid://"..cfg.id
    cfg.track = ani:LoadAnimation(a)
    cfg.track.Priority = Enum.AnimationPriority.Action
    cfg.track.Looped = true
    cfg.track:Play()
    cfg.stopped = cfg.track.Stopped:Connect(function()
        if cfg.on and hum.Parent then task.wait(0.1) _G.UZIVERT_FEHL_PLAY(cfg, hum) end
    end)
end

_G.UZIVERT_FEHL_FREEZE = function(cfg, hum)
    if cfg.freeze then cfg.freeze:Disconnect() end
    cfg.freeze = hum.StateChanged:Connect(function()
        if cfg.on and hum.Parent and (not cfg.track or not cfg.track.IsPlaying) then
            task.wait(0.05)
            if cfg.on and hum.Parent then _G.UZIVERT_FEHL_PLAY(cfg, hum) end
        end
    end)
end

_G.UZIVERT_FEHL_ENABLE = function(cfg)
    local c = game.Players.LocalPlayer.Character
    if not c then return end
    local h = c:FindFirstChild("Humanoid")
    if not h then return end
    _G.UZIVERT_FEHL_FREEZE(cfg, h)
    _G.UZIVERT_FEHL_PLAY(cfg, h)
end

_G.UZIVERT_FEHL_DISABLE = function(cfg)
    _G.UZIVERT_FEHL_STOP(cfg)
    if cfg.freeze then cfg.freeze:Disconnect() cfg.freeze = nil end
end

game.Players.LocalPlayer.CharacterRemoving:Connect(function()
    for _, cfg in ipairs(_G.UZIVERT_FEHL_CONFIGS) do
        _G.UZIVERT_FEHL_STOP(cfg)
        if cfg.freeze then cfg.freeze:Disconnect() cfg.freeze = nil end
    end
end)

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    for _, cfg in ipairs(_G.UZIVERT_FEHL_CONFIGS) do
        if cfg.on then _G.UZIVERT_FEHL_ENABLE(cfg) end
    end
end)

-- Título visual FE Headless
local _g_secFehl = Instance.new("Frame")
_g_secFehl.Size = UDim2.new(1, 0, 0, 30)
_g_secFehl.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_g_secFehl.BackgroundTransparency = 0.3
_g_secFehl.BorderSizePixel = 0
_g_secFehl.ZIndex = 2
_g_secFehl.Parent = PaginaUtilidades

local _g_cSecFehl = Instance.new("UICorner")
_g_cSecFehl.CornerRadius = UDim.new(0, 7)
_g_cSecFehl.Parent = _g_secFehl

local _g_sSecFehl = Instance.new("UIStroke")
_g_sSecFehl.Color = COLORES.Morado3
_g_sSecFehl.Thickness = 1.5
_g_sSecFehl.Transparency = 0.2
_g_sSecFehl.Parent = _g_secFehl

local _g_lblSecFehl = Instance.new("TextLabel")
_g_lblSecFehl.Size = UDim2.new(1, -20, 1, 0)
_g_lblSecFehl.Position = UDim2.new(0, 10, 0, 0)
_g_lblSecFehl.BackgroundTransparency = 1
_g_lblSecFehl.Text = "💀 FE HEADLESS (3 VERSIONES)"
_g_lblSecFehl.TextColor3 = COLORES.Naranja2
_g_lblSecFehl.Font = Enum.Font.GothamBlack
_g_lblSecFehl.TextSize = 12
_g_lblSecFehl.TextXAlignment = Enum.TextXAlignment.Left
_g_lblSecFehl.ZIndex = 3
_g_lblSecFehl.Parent = _g_secFehl

crearToggle(PaginaUtilidades, "💀 Headless (V1)", CONFIG.FEHeadless or false, function(e)
    local cfg = _G.UZIVERT_FEHL_CONFIGS[1]
    cfg.on = e
    CONFIG.FEHeadless = e
    guardarConfig()
    if e then _G.UZIVERT_FEHL_ENABLE(cfg)
    else _G.UZIVERT_FEHL_DISABLE(cfg) end
end)

crearToggle(PaginaUtilidades, "💀 Headless V2", CONFIG.FEHeadlessV2 or false, function(e)
    local cfg = _G.UZIVERT_FEHL_CONFIGS[2]
    cfg.on = e
    CONFIG.FEHeadlessV2 = e
    guardarConfig()
    if e then _G.UZIVERT_FEHL_ENABLE(cfg)
    else _G.UZIVERT_FEHL_DISABLE(cfg) end
end)

crearToggle(PaginaUtilidades, "💀 Headless V3", CONFIG.FEHeadlessV3 or false, function(e)
    local cfg = _G.UZIVERT_FEHL_CONFIGS[3]
    cfg.on = e
    CONFIG.FEHeadlessV3 = e
    guardarConfig()
    if e then _G.UZIVERT_FEHL_ENABLE(cfg)
    else _G.UZIVERT_FEHL_DISABLE(cfg) end
end)

end

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

-- ============================================
-- 🎯 AIMLOCK V4 (Smooth + FOV + Select)
-- ============================================
_G.AIM_ON = CONFIG.AimLock or false
_G.AIM_WALL = CONFIG.AimWall or false
_G.AIM_FOV_ON = CONFIG.AimFOV or false
_G.AIM_FOV_RADIUS = CONFIG.AimFOVRadius or 250
_G.AIM_SMOOTH = CONFIG.AimSmooth or 25
_G.AIM_HORIZ = CONFIG.AimHoriz or false
_G.AIM_PART = CONFIG.AimPart or "Head"
_G.AIM_PRED = CONFIG.AimPred or 0.145
_G.AIM_SELECTED = nil
_G.AIM_TARGET = nil
_G.AIM_LAST_POS = nil
_G.AIM_LAST_TARGET = nil
_G.AIM_LAST_SEARCH = 0
_G.AIM_FOV_CIRCLE = nil

_G.AIM_FIND_MURDERER = function()
    local candidates = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                local role = nil
                local char = player.Character
                for _, tool in ipairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        local n = tool.Name:lower()
                        if n == "knife" or n == "default knife" then
                            role = "Murderer"
                            break
                        end
                    end
                end
                if not role and player:FindFirstChild("Backpack") then
                    for _, tool in ipairs(player.Backpack:GetChildren()) do
                        if tool:IsA("Tool") then
                            local n = tool.Name:lower()
                            if n == "knife" or n == "default knife" then
                                role = "Murderer"
                                break
                            end
                        end
                    end
                end
                if role == "Murderer" then
                    table.insert(candidates, player)
                end
            end
        end
    end
    if #candidates > 0 then
        local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if myRoot then
            local closest, closestDist = nil, math.huge
            for _, p in ipairs(candidates) do
                local root = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    local dist = (root.Position - myRoot.Position).Magnitude
                    if dist < closestDist then
                        closestDist = dist
                        closest = p
                    end
                end
            end
            return closest
        end
        return candidates[1]
    end
    return nil
end

_G.AIM_IS_VISIBLE = function(targetPart, targetPlayer)
    if not _G.AIM_WALL then return true end
    if not targetPart or not targetPlayer or not targetPlayer.Character then return false end
    local filterList = {}
    if LocalPlayer.Character then table.insert(filterList, LocalPlayer.Character) end
    table.insert(filterList, targetPlayer.Character)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = filterList
    params.IgnoreWater = true
    local origin = workspace.CurrentCamera.CFrame.Position
    local checkParts = {"Head", "UpperTorso", "Torso", "HumanoidRootPart"}
    local visible = 0
    local checked = 0
    for _, partName in ipairs(checkParts) do
        local part = targetPlayer.Character:FindFirstChild(partName)
        if part then
            checked = checked + 1
            local result = workspace:Raycast(origin, part.Position - origin, params)
            if not result then visible = visible + 1 end
        end
    end
    if checked == 0 then return true end
    return visible >= (checked > 2 and 2 or 1)
end

_G.AIM_IN_FOV = function(worldPos)
    if not _G.AIM_FOV_ON then return true end
    local cam = workspace.CurrentCamera
    if not cam then return true end
    local screenPos, onScreen = cam:WorldToViewportPoint(worldPos)
    if not onScreen then return false end
    local screen = cam.ViewportSize
    local center = Vector2.new(screen.X / 2, screen.Y / 2)
    local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
    return dist <= _G.AIM_FOV_RADIUS
end

_G.AIM_UPDATE_FOV = function()
    if not _G.AIM_FOV_ON then
        if _G.AIM_FOV_CIRCLE then _G.AIM_FOV_CIRCLE.Visible = false end
        return
    end
    if not _G.AIM_FOV_CIRCLE then
        local frame = Instance.new("Frame")
        frame.Name = "@AIM_FOV"
        frame.AnchorPoint = Vector2.new(0.5, 0.5)
        frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        frame.Size = UDim2.new(0, _G.AIM_FOV_RADIUS * 2, 0, _G.AIM_FOV_RADIUS * 2)
        frame.BackgroundTransparency = 1
        frame.BorderSizePixel = 0
        frame.ZIndex = 9999
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(0, 255, 120)
        stroke.Thickness = 2
        stroke.Transparency = 0
        stroke.Parent = frame
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = frame
        frame.Parent = ScreenGui
        _G.AIM_FOV_CIRCLE = frame
    end
    _G.AIM_FOV_CIRCLE.Visible = true
    _G.AIM_FOV_CIRCLE.Size = UDim2.new(0, _G.AIM_FOV_RADIUS * 2, 0, _G.AIM_FOV_RADIUS * 2)
end

_G.UZIVERT_aim_loop = function(dt)
    if not _G.AIM_ON then return end

    local ahora = tick()
    if ahora - _G.AIM_LAST_SEARCH > 0.1 then
        _G.AIM_LAST_SEARCH = ahora
        if _G.AIM_SELECTED then
            if not _G.AIM_SELECTED.Character or not _G.AIM_SELECTED.Character:FindFirstChildOfClass("Humanoid") 
               or _G.AIM_SELECTED.Character:FindFirstChildOfClass("Humanoid").Health <= 0 
               or not Players:FindFirstChild(_G.AIM_SELECTED.Name) then
                _G.AIM_SELECTED = nil
                _G.AIM_TARGET = _G.AIM_FIND_MURDERER()
            end
        else
            _G.AIM_TARGET = _G.AIM_FIND_MURDERER()
        end
    end

    local target = _G.AIM_SELECTED or _G.AIM_TARGET
    if not target or not target.Character then
        _G.AIM_LAST_POS = nil
        return
    end

    local aimPart
    if _G.AIM_PART == "HumanoidRootPart" then
        aimPart = target.Character:FindFirstChild("HumanoidRootPart")
    else
        aimPart = target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart")
    end
    if not aimPart then
        _G.AIM_LAST_POS = nil
        return
    end

    if _G.AIM_LAST_TARGET ~= target then
        _G.AIM_LAST_POS = nil
        _G.AIM_LAST_TARGET = target
    end

    if not _G.AIM_IS_VISIBLE(aimPart, target) then
        _G.AIM_LAST_POS = nil
        return
    end

    local vel = aimPart.AssemblyLinearVelocity or Vector3.new()
    local predX, predZ = 0, 0
    if _G.AIM_HORIZ then
        predX, predZ = vel.X * _G.AIM_PRED, vel.Z * _G.AIM_PRED
    end
    local pred = Vector3.new(predX, vel.Y * 0.3 * _G.AIM_PRED, predZ)
    local aimPos = aimPart.Position + pred

    if not _G.AIM_IN_FOV(aimPos) then
        _G.AIM_LAST_POS = nil
        return
    end

    local cam = workspace.CurrentCamera
    if _G.AIM_LAST_POS and _G.AIM_SMOOTH > 0 then
        local pct = _G.AIM_SMOOTH / 100
        local rate
        if pct <= 0.001 then
            rate = 1000
        else
            rate = math.clamp(24 * (1 - pct) + 1, 1, 1000)
        end
        local alpha = 1 - math.exp(-rate * dt)
        alpha = math.clamp(alpha, 0, 1)
        aimPos = _G.AIM_LAST_POS:Lerp(aimPos, alpha)
    end
    _G.AIM_LAST_POS = aimPos

    cam.CFrame = CFrame.lookAt(cam.CFrame.Position, aimPos, Vector3.new(0, 1, 0))
end

_G.UZIVERT_aim_con = RunService.RenderStepped:Connect(function(dt)
    _G.UZIVERT_aim_loop(dt)
end)

-- ============================================
-- 🗡️ AUTO STAB
-- ============================================
_G.UZIVERT_AUTO_STAB_ON = false
_G.UZIVERT_STAB_RANGO = 6

_G.UZIVERT_AUTO_STAB_LOOP = RunService.Heartbeat:Connect(function()
    if not _G.UZIVERT_AUTO_STAB_ON then return end
    
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local knife = char:FindFirstChild("Knife") 
                or (LocalPlayer:FindFirstChild("Backpack") and LocalPlayer.Backpack:FindFirstChild("Knife"))
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
                    if knife.Events and knife.Events:FindFirstChild("KnifeStabbed") and knife.Events:FindFirstChild("HandleTouched") then
                        pcall(function()
                            knife.Events.KnifeStabbed:FireServer()
                            knife.Events.HandleTouched:FireServer(eRoot)
                        end)
                    end
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

-- ============================================
-- 🎯 ESP OPTIMIZADO v2 (funcional)
-- ============================================
local ESP_CACHE = {}

local function aplicarESP(jugador)
    if jugador == LocalPlayer then return end
    local char = jugador.Character
    if not char then return end
    
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum or hum.Health <= 0 then return end
    
    local rol = "Lobby"
    if RoleCache and RoleCache[jugador.Name] then
        rol = RoleCache[jugador.Name]
        if rol == "" then rol = "Lobby" end
    end
    
    local color = COLORES_ESP[rol] or COLORES_ESP.Lobby
    local cache = ESP_CACHE[jugador.Name]
    
    -- Si el Highlight no existe o está roto → crear
    if not cache or not cache.Highlight or not cache.Highlight.Parent or cache.Highlight.Adornee ~= char then
        if cache and cache.Highlight then
            pcall(function() cache.Highlight:Destroy() end)
        end
        
        local hl = Instance.new("Highlight")
        hl.Name = "ESP_Highlight"
        hl.Adornee = char
        hl.Parent = char
        hl.FillColor = color
        hl.FillTransparency = 0.35
        hl.OutlineColor = color
        hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        
        ESP_CACHE[jugador.Name] = {Highlight = hl, ColorAnterior = color}
        return
    end
    
    -- ✅ SIEMPRE actualizar el color (por si cambió el rol)
    if cache.ColorAnterior ~= color then
        cache.Highlight.FillColor = color
        cache.Highlight.OutlineColor = color
        cache.ColorAnterior = color
    end
    
    -- ✅ Asegurar que el Adornee esté bien
    if cache.Highlight.Adornee ~= char then
        cache.Highlight.Adornee = char
    end
end

local function limpiarESP()
    for name, cache in pairs(ESP_CACHE) do
        if cache.Highlight then pcall(function() cache.Highlight:Destroy() end) end
    end
    ESP_CACHE = {}
end

Players.PlayerRemoving:Connect(function(plr)
    local cache = ESP_CACHE[plr.Name]
    if cache and cache.Highlight then pcall(function() cache.Highlight:Destroy() end) end
    ESP_CACHE[plr.Name] = nil
end)

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        local cache = ESP_CACHE[plr.Name]
        if cache and cache.Highlight then
            pcall(function() cache.Highlight:Destroy() end)
        end
        ESP_CACHE[plr.Name] = nil
    end)
end)

task.spawn(function()
    while task.wait(0.3) do  -- ⬅️ volvemos a 0.3 para que sea rápido
        if ESP_ACTIVO then
            for _, jugador in ipairs(Players:GetPlayers()) do
                if jugador ~= LocalPlayer and jugador.Character then
                    aplicarESP(jugador)
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
-- 🔫 AUTO GET GUN (OPTIMIZADO)
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
        
        -- Buscar GunDrop MÁS LIVIANO
        local gunDrop = workspace:FindFirstChild("GunDrop")
        if not gunDrop then
            for _, obj in ipairs(workspace:GetChildren()) do
                if obj.Name == "GunDrop" then
                    gunDrop = obj
                    break
                end
                local hijo = obj:FindFirstChild("GunDrop")
                if hijo then
                    gunDrop = hijo
                    break
                end
            end
        end
        if not gunDrop then return end
        
        firetouchinterest(hrp, gunDrop, 0)
        task.wait()
        firetouchinterest(hrp, gunDrop, 1)
    end)
end

_G.UZIVERT_AUTO_GET_GUN_LOOP = task.spawn(function()
    while task.wait(0.10) do  -- ⬅️ antes 0.5, ahora 1 (menos lag)
        if not _G.UZIVERT_AUTO_GET_GUN_ON then continue end
        _G.UZIVERT_AGARRAR_GUN()
    end
end)

-- ============================================
-- 🎯 GUN AURA (OPTIMIZADO)
-- ============================================
_G.UZIVERT_GUN_AURA_ON = false
_G.UZIVERT_GUN_AURA_RANGO = CONFIG.GunAuraRango or 25

_G.UZIVERT_GUN_AURA_LOOP = task.spawn(function()
    while task.wait(0.5) do  -- ⬅️ antes 0.2, ahora 0.5 (menos lag)
        if not _G.UZIVERT_GUN_AURA_ON then continue end
        if soyMurderer() or tengoGun() then continue end
        
        local char = LocalPlayer.Character
        if not char then continue end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        
        -- Buscar GunDrop MÁS LIVIANO (sin GetDescendants)
        local gunDrop = workspace:FindFirstChild("GunDrop")
        if not gunDrop then
            -- Fallback: buscar en el primer nivel
            for _, obj in ipairs(workspace:GetChildren()) do
                if obj.Name == "GunDrop" then
                    gunDrop = obj
                    break
                end
                local hijo = obj:FindFirstChild("GunDrop")
                if hijo then
                    gunDrop = hijo
                    break
                end
            end
        end
        if not gunDrop then continue end
        
        local posGun
        if gunDrop:IsA("BasePart") then
            posGun = gunDrop.Position
        elseif gunDrop:FindFirstChild("Handle") then
            posGun = gunDrop.Handle.Position
        end
        if not posGun then continue end
        
        local dist = (hrp.Position - posGun).Magnitude
        if dist <= _G.UZIVERT_GUN_AURA_RANGO then
            pcall(function()
                if gunDrop:IsA("BasePart") then
                    gunDrop.CanCollide = false
                    gunDrop.CFrame = hrp.CFrame
                    gunDrop.Velocity = Vector3.new(0, 0, 0)
                    gunDrop.RotVelocity = Vector3.new(0, 0, 0)
                elseif gunDrop:FindFirstChild("Handle") then
                    gunDrop.Handle.CanCollide = false
                    gunDrop.Handle.CFrame = hrp.CFrame
                    gunDrop.Handle.Velocity = Vector3.new(0, 0, 0)
                    gunDrop.Handle.RotVelocity = Vector3.new(0, 0, 0)
                end
            end)
        end
    end
end)

-- ============================================
-- 🎯 SILENT AIM v4.0 — LÓGICA
-- ============================================

_G.UZIVERT_SA_ON = CONFIG.SilentAim or false
_G.UZIVERT_SA_AUTO_PING = CONFIG.SilentAutoPing ~= false
_G.UZIVERT_SA_MULTI = CONFIG.SilentMultiPoint ~= false
_G.UZIVERT_SA_ANTIHACK = CONFIG.SilentAntiHack ~= false

_G.UZIVERT_SA_OFF_X = CONFIG.SilentOffX or 0
_G.UZIVERT_SA_OFF_Y = CONFIG.SilentOffY or -0.10
_G.UZIVERT_SA_OFF_Z = CONFIG.SilentOffZ or 0
_G.UZIVERT_SA_PRED_H = CONFIG.SilentPredH or 1.5
_G.UZIVERT_SA_PRED_V = CONFIG.SilentPredV or 0.5
_G.UZIVERT_SA_MAX_SIM = CONFIG.SilentMaxSim or 0.080
_G.UZIVERT_SA_PRED_PING = CONFIG.SilentPredPing or 0.060

_G.UZIVERT_SA_TARGET = nil
_G.UZIVERT_SA_ORIGIN = nil
_G.UZIVERT_SA_REMOTE = nil

-- ============================================
-- 🎯 SILENT AIM v5.0 — MOTOR NOIR (Predicción completa)
-- ============================================

-- Ping Profiles del NOIR (interpolados por ping)
local UZNOIR_PingProfiles = {
    { Ping = 20,  Sim = 52,  Interval = 70, H = 156, V = 146, X = -5,  Y = -14, Z = 0 },
    { Ping = 50,  Sim = 60,  Interval = 66, H = 166, V = 156, X = -6,  Y = -14, Z = 0 },
    { Ping = 100, Sim = 72,  Interval = 60, H = 180, V = 170, X = -8,  Y = -15, Z = 0 },
    { Ping = 150, Sim = 82,  Interval = 64, H = 188, V = 176, X = -9,  Y = -12, Z = 0 },
    { Ping = 200, Sim = 94,  Interval = 70, H = 198, V = 184, X = -10, Y = -11, Z = 0 },
    { Ping = 250, Sim = 104, Interval = 74, H = 206, V = 192, X = -11, Y = -10, Z = 0 },
    { Ping = 300, Sim = 114, Interval = 78, H = 214, V = 200, X = -12, Y = -9,  Z = 0 },
    { Ping = 350, Sim = 124, Interval = 82, H = 222, V = 206, X = -13, Y = -8,  Z = 0 },
    { Ping = 450, Sim = 138, Interval = 86, H = 232, V = 214, X = -14, Y = -7,  Z = 0 },
}

-- Config interno del motor NOIR (usa las variables del v4.0)
_G.UZNOIR_CFG = {
    adaptive = true,
    fixedLead = 0.075,
    extraLead = _G.UZIVERT_SA_PRED or 0.02,  -- el slider lo controla
    prioritizePing = _G.UZIVERT_SA_AUTO_PING ~= false,
    predictJump = true,
    predictLag = true,
    maxSimulationMs = math.floor((_G.UZIVERT_SA_MAX_SIM or 0.180) * 1000),
    predictionIntervalMs = 72,
    manualPingMs = 80,
    offsetX = 0,
    offsetY = 0,
    offsetZ = 0,
    horizontalMultiplier = 100,
    verticalMultiplier = 100,
    hitPart = "Head",
}

-- cachedPing EXACTO del NOIR (solo Data Ping, cada 0.5s, 0.7/0.3)
_G.UZNOIR_cachedPing = 0.05
_G.UZNOIR_lastAutoTune = 0

local function UZNOIR_updatePing()
    pcall(function()
        local network = Stats:FindFirstChild("Network")
        local items = network and network:FindFirstChild("ServerStatsItem")
        local pingItem = items and items:FindFirstChild("Data Ping")
        if pingItem then
            local measured = pingItem:GetValue() / 1000
            if measured > 0 and measured < 2 then
                _G.UZNOIR_cachedPing = _G.UZNOIR_cachedPing * 0.7 + measured * 0.3
            end
        end
    end)
end

local function UZNOIR_GetPingMs()
    return math.clamp(math.floor(_G.UZNOIR_cachedPing * 1000 + 0.5), 5, 1000)
end

-- getConfig EXACTO (interpola perfil por ping)
local function UZNOIR_getConfig(ping)
    local first, second, blend
    first, second = UZNOIR_PingProfiles[1], UZNOIR_PingProfiles[1]
    if ping >= UZNOIR_PingProfiles[#UZNOIR_PingProfiles].Ping then
        first, second = UZNOIR_PingProfiles[#UZNOIR_PingProfiles], UZNOIR_PingProfiles[#UZNOIR_PingProfiles]
    elseif ping > first.Ping then
        for i = 1, #UZNOIR_PingProfiles - 1 do
            if ping <= UZNOIR_PingProfiles[i + 1].Ping then
                first, second = UZNOIR_PingProfiles[i], UZNOIR_PingProfiles[i + 1]
                blend = (ping - first.Ping) / (second.Ping - first.Ping)
                blend = blend * blend * (3 - 2 * blend)
                break
            end
        end
    end
    blend = blend or 0
    local function mix(key)
        return math.floor(first[key] + (second[key] - first[key]) * blend + 0.5)
    end
    return {
        Sim = mix("Sim"), Interval = mix("Interval"),
        H = mix("H"), V = mix("V"),
        X = mix("X"), Y = mix("Y"), Z = mix("Z"),
    }
end

-- autoTuneForPing EXACTO
local function UZNOIR_autoTune()
    local now = os.clock()
    if now - _G.UZNOIR_lastAutoTune < 0.4 then return end
    _G.UZNOIR_lastAutoTune = now
    local pingMs = UZNOIR_GetPingMs()
    local p = UZNOIR_getConfig(pingMs)
    local cfg = _G.UZNOIR_CFG
    cfg.maxSimulationMs = p.Sim
    cfg.predictionIntervalMs = p.Interval
    cfg.offsetX, cfg.offsetY, cfg.offsetZ = p.X, p.Y, p.Z
    cfg.horizontalMultiplier, cfg.verticalMultiplier = p.H, p.V
    cfg.manualPingMs = pingMs
end

-- leadTime EXACTO
local function UZNOIR_leadTime()
    local cfg = _G.UZNOIR_CFG
    local observedPing = cfg.prioritizePing and _G.UZNOIR_cachedPing or (cfg.manualPingMs / 1000)
    local prediction
    if cfg.adaptive then
        prediction = observedPing + cfg.extraLead + observedPing * 0.06
        if cfg.predictLag then
            local samplingDelay = math.clamp(cfg.predictionIntervalMs / 2000, 0, 0.05)
            prediction = prediction + samplingDelay + math.max(0, observedPing - 0.10) * 0.22
        end
    else
        prediction = cfg.fixedLead
    end
    local simulationCap = cfg.maxSimulationMs / 1000
    if cfg.adaptive then
        simulationCap = math.min(0.52, simulationCap + math.clamp(observedPing - 0.10, 0, 0.40) * 0.62)
    end
    return math.clamp(prediction, 0.02, simulationCap)
end

-- sampleMotion EXACTO (buffer de 8)
local UZNOIR_motionPart = nil
local UZNOIR_motionSamples = {}
local UZNOIR_measuredVelocity = Vector3.zero
local UZNOIR_estimatedAcceleration = Vector3.zero

local function UZNOIR_sampleMotion(part, settings)
    settings = settings or _G.UZNOIR_CFG
    local now = os.clock()
    if UZNOIR_motionPart ~= part then
        UZNOIR_motionPart = part
        UZNOIR_motionSamples = {}
        UZNOIR_measuredVelocity = part.AssemblyLinearVelocity
        UZNOIR_estimatedAcceleration = Vector3.zero
    end
    local last = UZNOIR_motionSamples[#UZNOIR_motionSamples]
    if not last or now - last.time >= math.max(0.016, settings.predictionIntervalMs / 1000) then
        UZNOIR_motionSamples[#UZNOIR_motionSamples + 1] = { position = part.Position, time = now }
        while #UZNOIR_motionSamples > 8 or (#UZNOIR_motionSamples > 2 and now - UZNOIR_motionSamples[1].time > 0.35) do
            table.remove(UZNOIR_motionSamples, 1)
        end
        if #UZNOIR_motionSamples >= 2 then
            local first = UZNOIR_motionSamples[1]
            local newest = UZNOIR_motionSamples[#UZNOIR_motionSamples]
            local delta = newest.time - first.time
            if delta > 0.015 then
                local sampled = (newest.position - first.position) / delta
                if sampled.Magnitude < 150 then
                    local oldVelocity = UZNOIR_measuredVelocity
                    UZNOIR_measuredVelocity = UZNOIR_measuredVelocity:Lerp(sampled, 0.55)
                    local sampleDelta = last and math.max(now - last.time, 0.016) or delta
                    local accel = (UZNOIR_measuredVelocity - oldVelocity) / sampleDelta
                    if accel.Magnitude < 120 then
                        UZNOIR_estimatedAcceleration = UZNOIR_estimatedAcceleration:Lerp(accel, 0.25)
                    else
                        UZNOIR_estimatedAcceleration = Vector3.zero
                    end
                end
            end
        end
    end
end

-- calculateAim EXACTO
local function UZNOIR_calculateAim(part)
    UZNOIR_sampleMotion(part)
    local cfg = _G.UZNOIR_CFG
    local assembly = part.AssemblyLinearVelocity
    local velocity = assembly
    local acceleration = Vector3.zero

    if cfg.predictLag and UZNOIR_motionPart == part and #UZNOIR_motionSamples >= 2 then
        local disagreement = (assembly - UZNOIR_measuredVelocity).Magnitude
        local measuredWeight = math.clamp(0.75 - disagreement / 120, 0.35, 0.75)
        velocity = assembly:Lerp(UZNOIR_measuredVelocity, measuredWeight)
        acceleration = UZNOIR_estimatedAcceleration
    end

    local horizontal = cfg.horizontalMultiplier / 100
    local vertical = cfg.verticalMultiplier / 100
    local time = UZNOIR_leadTime()

    local displacement = Vector3.new(velocity.X * horizontal * time, 0, velocity.Z * horizontal * time)

    if cfg.predictLag then
        local ha = Vector3.new(acceleration.X, 0, acceleration.Z)
        displacement = displacement + ha * (0.5 * time * time)
    end

    if cfg.predictJump then
        local verticalTime = time * vertical
        local verticalDisplacement = velocity.Y * verticalTime
        local humanoid = part.Parent and part.Parent:FindFirstChildWhichIsA("Humanoid")
        local isAir = false
        if humanoid then
            local state = humanoid:GetState()
            isAir = humanoid.FloorMaterial == Enum.Material.Air
                or state == Enum.HumanoidStateType.Freefall
                or state == Enum.HumanoidStateType.Jumping
                or math.abs(velocity.Y) > 6
        else
            isAir = math.abs(velocity.Y) > 6
        end
        if isAir then
            verticalDisplacement = verticalDisplacement - 0.5 * Workspace.Gravity * verticalTime * verticalTime
        end
        displacement = displacement + Vector3.new(0, verticalDisplacement, 0)
    end

    if displacement.Magnitude > 26 then
        displacement = displacement.Unit * 26
    end

    local offset = Vector3.new(
        part.Size.X * cfg.offsetX / 100,
        part.Size.Y * cfg.offsetY / 100,
        part.Size.Z * cfg.offsetZ / 100
    )

    return part.Position + displacement + offset
end

-- FIND (target) — usa RoleCache igual que antes
_G.UZIVERT_SA_FIND = function()
    for plrName, role in pairs(RoleCache) do
        if role == "Murderer" then
            return Players:FindFirstChild(plrName)
        end
    end
    return nil
end

-- GET_REMOTE — igual que antes
_G.UZIVERT_SA_GET_REMOTE = function()
    local char = LocalPlayer.Character
    if not char then return nil end
    local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")
    if gun then
        local shoot = gun:FindFirstChild("Shoot", true)
        if shoot then return shoot end
    end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        gun = backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")
        if gun then
            local shoot = gun:FindFirstChild("Shoot", true)
            if shoot then return shoot end
        end
    end
    return nil
end

-- Loop que actualiza ping y calcula el aim (RenderStepped)
_G.UZIVERT_SA_LOOP = RunService.RenderStepped:Connect(function(dt)
    if not _G.UZIVERT_SA_ON then return end

    _G.UZIVERT_SA_REMOTE = _G.UZIVERT_SA_GET_REMOTE()

    local char = LocalPlayer.Character
    if char then
        local miHrp = char:FindFirstChild("HumanoidRootPart")
        if miHrp then _G.UZIVERT_SA_ORIGIN = miHrp.CFrame end
    end

    local murderer = _G.UZIVERT_SA_FIND()
    if not murderer or not murderer.Character then
        _G.UZIVERT_SA_TARGET = nil
        return
    end

    local targetChar = murderer.Character
    local targetHum = targetChar:FindFirstChildOfClass("Humanoid")
    if not targetHum or targetHum.Health <= 0 then
        _G.UZIVERT_SA_TARGET = nil
        return
    end

    local aimPart
    if _G.UZNOIR_CFG.hitPart == "Head" then
        aimPart = targetChar:FindFirstChild("Head") or targetChar:FindFirstChild("HumanoidRootPart")
    else
        aimPart = targetChar:FindFirstChild("HumanoidRootPart") or targetChar:FindFirstChild("Head")
    end
    if not aimPart then
        _G.UZIVERT_SA_TARGET = nil
        return
    end

    local aimPos = UZNOIR_calculateAim(aimPart)

    if _G.UZIVERT_SA_MULTI then
        local t = 0.25
        _G.UZIVERT_SA_TARGET = {
            CFrame.new(aimPos),
            CFrame.new(aimPos + Vector3.new(0, t, 0)),
            CFrame.new(aimPos + Vector3.new(0, -t, 0)),
            CFrame.new(aimPos + Vector3.new(t, 0, 0)),
            CFrame.new(aimPos + Vector3.new(-t, 0, 0)),
            CFrame.new(aimPos + Vector3.new(0, 0, t)),
            CFrame.new(aimPos + Vector3.new(0, 0, -t)),
        }
    else
        _G.UZIVERT_SA_TARGET = { CFrame.new(aimPos) }
    end
end)

-- Worker de ping (cada 0.5s como el NOIR)
task.spawn(function()
    while task.wait(0.5) do
        UZNOIR_updatePing()
        UZNOIR_autoTune()
    end
end)

-- ============================================
-- 🎯 HOOK UNIFICADO (Gun SA + Knife SA)
-- ============================================
_G.UZIVERT_KNIFE_REMOTE = nil
_G.UZIVERT_KNIFE_AIM = nil
_G.UZIVERT_KNIFE_ORIGIN = nil
_G.UZIVERT_KNIFE_INSTANT_LAST = 0

-- Actualiza el remote del knife cada 0.25s
task.spawn(function()
    while task.wait(0.25) do
        local char = LocalPlayer.Character
        local knife
        if char then
            knife = char:FindFirstChild("Knife")
        end
        if not knife then
            local bp = LocalPlayer:FindFirstChild("Backpack")
            knife = bp and bp:FindFirstChild("Knife")
        end
        if knife then
            local remote
            for _, obj in ipairs(knife:GetDescendants()) do
                if obj:IsA("RemoteEvent") and obj.Name == "KnifeThrown" then
                    remote = obj
                    break
                end
            end
            _G.UZIVERT_KNIFE_REMOTE = remote
        else
            _G.UZIVERT_KNIFE_REMOTE = nil
        end
    end
end)

-- swallowKnifeRemote (bloquea doble throw)
local function UZNOIR_swallowKnife(self)
    if typeof(self) ~= "Instance" then return false end
    if self.ClassName ~= "RemoteEvent" then return false end
    if not (_G.UZIVERT_KNIFE_INSTANT or _G.UZIVERT_KNIFE_FAST) then return false end
    local now = tick()
    if now - _G.UZIVERT_KNIFE_INSTANT_LAST < 0.48 then
        return true
    end
    return false
end

if not _G.UZIVERT_SA_HOOKED then
    _G.UZIVERT_SA_HOOKED = true
    pcall(function()
        local mt = getrawmetatable(game)
        local oldNamecall = mt.__namecall
        setreadonly(mt, false)

        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()

            if method == "FireServer" then
                -- 🗡️ SWALLOW: bloquea doble throw del knife
                if UZNOIR_swallowKnife(self) then
                    return
                end

                -- 🎯 GUN SILENT AIM
                if _G.UZIVERT_SA_ON and _G.UZIVERT_SA_REMOTE and self == _G.UZIVERT_SA_REMOTE then
                    if not _G.UZIVERT_SA_TARGET or not _G.UZIVERT_SA_TARGET[1] then
                        return oldNamecall(self, ...)
                    end
                    local args = {...}
                    if #args >= 2 then
                        for _, punto in ipairs(_G.UZIVERT_SA_TARGET) do
                            args[2] = punto
                            oldNamecall(self, unpack(args))
                        end
                    end
                    return
                end

                -- 🗡️ KNIFE SILENT AIM
                if _G.UZIVERT_KNIFE_SA and _G.UZIVERT_KNIFE_REMOTE and self == _G.UZIVERT_KNIFE_REMOTE then
                    if not _G.UZIVERT_KNIFE_AIM or not _G.UZIVERT_KNIFE_ORIGIN then
                        return oldNamecall(self, ...)
                    end
                    local args = {...}
                    if #args >= 2 and typeof(args[1]) == "CFrame" then
                        args[1] = CFrame.lookAt(_G.UZIVERT_KNIFE_ORIGIN, _G.UZIVERT_KNIFE_AIM)
                        args[2] = CFrame.new(_G.UZIVERT_KNIFE_AIM)
                    end
                    return oldNamecall(self, unpack(args))
                end
            end

            return oldNamecall(self, ...)
        end)

        setreadonly(mt, true)
    end)
    print("🎯 [HOOK UNIFICADO Gun+Knife] activado")
end

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
    ["Mage"] = {idle1="http://www.roblox.com/asset/?id=707742142", idle2="http://www.roblox.com/asset/?id=707855907", walk="http://www.roblox.com/asset/?id=707897309", run="http://www.roblox.com/asset/?id=707861613", jump="http://www.roblox.com/asset/?id=707853694", climb="http://www.roblox.com/asset/?id=707826056", fall="http://www.roblox.com/asset/?id=707829716"},
    ["Ghost"] = {idle1="http://www.roblox.com/asset/?id=616006778", idle2="http://www.roblox.com/asset/?id=616008087", walk="http://www.roblox.com/asset/?id=616010382", run="http://www.roblox.com/asset/?id=616013216", jump="http://www.roblox.com/asset/?id=616008936", climb="http://www.roblox.com/asset/?id=616003713", fall="http://www.roblox.com/asset/?id=616005863"},
    ["Elder"] = {idle1="http://www.roblox.com/asset/?id=845397899", idle2="http://www.roblox.com/asset/?id=845400520", walk="http://www.roblox.com/asset/?id=845403856", run="http://www.roblox.com/asset/?id=845386501", jump="http://www.roblox.com/asset/?id=845398858", climb="http://www.roblox.com/asset/?id=845392038", fall="http://www.roblox.com/asset/?id=845396048"},
    ["Levitation"] = {idle1="http://www.roblox.com/asset/?id=616006778", idle2="http://www.roblox.com/asset/?id=616008087", walk="http://www.roblox.com/asset/?id=616013216", run="http://www.roblox.com/asset/?id=616010382", jump="http://www.roblox.com/asset/?id=616008936", climb="http://www.roblox.com/asset/?id=616003713", fall="http://www.roblox.com/asset/?id=616005863"},
    ["Sneaky"] = {idle1="http://www.roblox.com/asset/?id=1132473842", idle2="http://www.roblox.com/asset/?id=1132477671", walk="http://www.roblox.com/asset/?id=1132510133", run="http://www.roblox.com/asset/?id=1132494274", jump="http://www.roblox.com/asset/?id=1132489853", climb="http://www.roblox.com/asset/?id=1132461372", fall="http://www.roblox.com/asset/?id=1132469004"},
    ["Toy"] = {idle1="http://www.roblox.com/asset/?id=782841498", idle2="http://www.roblox.com/asset/?id=782845736", walk="http://www.roblox.com/asset/?id=782843345", run="http://www.roblox.com/asset/?id=782842708", jump="http://www.roblox.com/asset/?id=782847020", climb="http://www.roblox.com/asset/?id=782843869", fall="http://www.roblox.com/asset/?id=782846423"},
    ["Knight"] = {idle1="http://www.roblox.com/asset/?id=657595757", idle2="http://www.roblox.com/asset/?id=657568135", walk="http://www.roblox.com/asset/?id=657552124", run="http://www.roblox.com/asset/?id=657564596", jump="http://www.roblox.com/asset/?id=658409194", climb="http://www.roblox.com/asset/?id=658360781", fall="http://www.roblox.com/asset/?id=657600338"},
    ["Confident"] = {idle1="http://www.roblox.com/asset/?id=1069977950", idle2="http://www.roblox.com/asset/?id=1069987858", walk="http://www.roblox.com/asset/?id=1070017263", run="http://www.roblox.com/asset/?id=1070001516", jump="http://www.roblox.com/asset/?id=1069984524", climb="http://www.roblox.com/asset/?id=1069946257", fall="http://www.roblox.com/asset/?id=1069973677"},
    ["Popstar"] = {idle1="http://www.roblox.com/asset/?id=1212900985", idle2="http://www.roblox.com/asset/?id=1212900985", walk="http://www.roblox.com/asset/?id=1212980338", run="http://www.roblox.com/asset/?id=1212980348", jump="http://www.roblox.com/asset/?id=1212954642", climb="http://www.roblox.com/asset/?id=1213044953", fall="http://www.roblox.com/asset/?id=1212900995"},
    ["Princess"] = {idle1="http://www.roblox.com/asset/?id=941003647", idle2="http://www.roblox.com/asset/?id=941013098", walk="http://www.roblox.com/asset/?id=941028902", run="http://www.roblox.com/asset/?id=941015281", jump="http://www.roblox.com/asset/?id=941008832", climb="http://www.roblox.com/asset/?id=940996062", fall="http://www.roblox.com/asset/?id=941000007"},
    ["Cowboy"] = {idle1="http://www.roblox.com/asset/?id=1014390418", idle2="http://www.roblox.com/asset/?id=1014398616", walk="http://www.roblox.com/asset/?id=1014421541", run="http://www.roblox.com/asset/?id=1014401683", jump="http://www.roblox.com/asset/?id=1014394726", climb="http://www.roblox.com/asset/?id=1014380606", fall="http://www.roblox.com/asset/?id=1014384571"},
    ["Patrol"] = {idle1="http://www.roblox.com/asset/?id=1149612882", idle2="http://www.roblox.com/asset/?id=1150842221", walk="http://www.roblox.com/asset/?id=1151231493", run="http://www.roblox.com/asset/?id=1150967949", jump="http://www.roblox.com/asset/?id=1150944216", climb="http://www.roblox.com/asset/?id=1148811837", fall="http://www.roblox.com/asset/?id=1148863382"},
    ["Zombie FE"] = {idle1="http://www.roblox.com/asset/?id=3489171152", idle2="http://www.roblox.com/asset/?id=3489171152", walk="http://www.roblox.com/asset/?id=3489174223", run="http://www.roblox.com/asset/?id=3489173414", jump="http://www.roblox.com/asset/?id=616161997", climb="http://www.roblox.com/asset/?id=616156119", fall="http://www.roblox.com/asset/?id=616157476"},
    ["Amazon Unboxed"] = {idle1="http://www.roblox.com/asset/?id=98281136301627", idle2="http://www.roblox.com/asset/?id=98281136301627", walk="http://www.roblox.com/asset/?id=90478085024465", run="http://www.roblox.com/asset/?id=134824450619865", jump="http://www.roblox.com/asset/?id=121454505477205", climb="http://www.roblox.com/asset/?id=121145883950231", fall="http://www.roblox.com/asset/?id=94788218468396"},
    ["Bubbly"] = {idle1="https://www.roblox.com/asset/?id=10921054344", idle2="https://www.roblox.com/asset/?id=10921054344", walk="http://www.roblox.com/asset/?id=10980888364", run="http://www.roblox.com/asset/?id=10921057244", jump="http://www.roblox.com/asset/?id=10921062673", climb="http://www.roblox.com/asset/?id=10921053544", fall="https://www.roblox.com/asset/?id=10921061530"},
    ["Adidas Comm"] = {idle1="https://www.roblox.com/asset/?id=122257458498464", idle2="https://www.roblox.com/asset/?id=122257458498464", walk="http://www.roblox.com/asset/?id=122150855457006", run="http://www.roblox.com/asset/?id=82598234841035", jump="http://www.roblox.com/asset/?id=75290611992385", climb="http://www.roblox.com/asset/?id=88763136693023", fall="https://www.roblox.com/asset/?id=98600215928904"},
    ["KATSEYE"] = {idle1="https://www.roblox.com/asset/?id=108187809145790", idle2="https://www.roblox.com/asset/?id=108187809145790", walk="http://www.roblox.com/asset/?id=99182913548783", run="http://www.roblox.com/asset/?id=73117360545482", jump="http://www.roblox.com/asset/?id=103632305262747", climb="http://www.roblox.com/asset/?id=106213237973858", fall="https://www.roblox.com/asset/?id=127802717128367"},
    ["Wicked Popular"] = {idle1="https://www.roblox.com/asset/?id=118832222982049", idle2="https://www.roblox.com/asset/?id=118832222982049", walk="http://www.roblox.com/asset/?id=92072849924640", run="http://www.roblox.com/asset/?id=72301599441680", jump="http://www.roblox.com/asset/?id=104325245285198", climb="http://www.roblox.com/asset/?id=131326830509784", fall="https://www.roblox.com/asset/?id=121152442762481"},
    ["Dizzy"] = {idle1="http://www.roblox.com/asset/?id=132806359718468", idle2="http://www.roblox.com/asset/?id=132806359718468", walk="http://www.roblox.com/asset/?id=110106034100313", run="http://www.roblox.com/asset/?id=138305342272849", jump="http://www.roblox.com/asset/?id=108564434408211", climb="http://www.roblox.com/asset/?id=93550710314258", fall="http://www.roblox.com/asset/?id=138967706335414"},
    ["WDTL"] = {idle1="http://www.roblox.com/asset/?id=92849173543269", idle2="http://www.roblox.com/asset/?id=92849173543269", walk="http://www.roblox.com/asset/?id=73718308412641", run="http://www.roblox.com/asset/?id=135515454877967", jump="http://www.roblox.com/asset/?id=78508480717326", climb="http://www.roblox.com/asset/?id=129447497744818", fall="http://www.roblox.com/asset/?id=78147885297412"},
    ["Billie Eilish"] = {idle1="http://www.roblox.com/asset/?id=102934602884410", idle2="http://www.roblox.com/asset/?id=102934602884410", walk="http://www.roblox.com/asset/?id=81877886552514", run="http://www.roblox.com/asset/?id=100920560634123", jump="http://www.roblox.com/asset/?id=117602630922781", climb="http://www.roblox.com/asset/?id=117873469361430", fall="http://www.roblox.com/asset/?id=81072141180299"},
    ["Cute Bouncy"] = {idle1="http://www.roblox.com/asset/?id=88464649697812", idle2="http://www.roblox.com/asset/?id=88464649697812", walk="http://www.roblox.com/asset/?id=98713727778027", run="http://www.roblox.com/asset/?id=133955346539948", jump="http://www.roblox.com/asset/?id=124147147418885", climb="http://www.roblox.com/asset/?id=95542189442725", fall="http://www.roblox.com/asset/?id=128620818122982"},
    ["Cute"] = {idle1="http://www.roblox.com/asset/?id=85735421117197", idle2="http://www.roblox.com/asset/?id=85735421117197", walk="http://www.roblox.com/asset/?id=140409718187215", run="http://www.roblox.com/asset/?id=118375157537412", jump="http://www.roblox.com/asset/?id=132381016103721", climb="http://www.roblox.com/asset/?id=86318575131600", fall="http://www.roblox.com/asset/?id=77496925287217"},
}

local allOptions = {
    "Default", "Vampire", "Hero", "Zombie", "Ninja", "Astronaut", "Cartoon", "Pirate", "Werewolf",
    "OG Run", "Jolly", "Cute Kawaii", "Doll 3.0", "Victoria Model", "Bike/Bicyclist", "Animal",
    "It-Girl Essential Model", "Oldschool", "Spider", "Joy", "Flying Aura", "FHA V2",
    "Silent Nurse", "Supermodel", "Enchanted Fairy", "Furry", "Vlada Model", "R6 Converter",
    "Mage", "Ghost", "Elder", "Levitation", "Sneaky", "Toy", "Knight", "Confident",
    "Popstar", "Princess", "Cowboy", "Patrol", "Zombie FE", "Amazon Unboxed", "Bubbly",
    "Adidas Comm", "KATSEYE", "Wicked Popular", "Dizzy", "WDTL", "Billie Eilish",
    "Cute Bouncy", "Cute"
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
            BotonGrab.Text = "🍬 GRAB GUN"
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

-- ============================================
-- 🎯 SHOOT MURDERER v9 — PREDICCIÓN NOIR COMPLETA
-- ============================================

_G.UZSHOOT_PingProfiles = _G.UZSHOOT_PingProfiles or {
    { Ping = 20,  Sim = 48, Interval = 70, H = 154, V = 144, X = -5,  Y = -14, Z = 0 },
    { Ping = 50,  Sim = 54, Interval = 66, H = 162, V = 152, X = -6,  Y = -14, Z = 0 },
    { Ping = 100, Sim = 68, Interval = 60, H = 176, V = 166, X = -8,  Y = -15, Z = 0 },
    { Ping = 150, Sim = 72, Interval = 64, H = 182, V = 170, X = -9,  Y = -12, Z = 0 },
    { Ping = 200, Sim = 76, Interval = 70, H = 188, V = 174, X = -10, Y = -11, Z = 0 },
    { Ping = 300, Sim = 82, Interval = 76, H = 196, V = 180, X = -12, Y = -10, Z = 0 },
}

_G.UZSHOOT_CFG = _G.UZSHOOT_CFG or {
    adaptive = true,
    fixedLead = 0.075,
    extraLead = 0.02,
    maxLead = 0.18,
    prioritizePing = true,
    predictJump = false,
    predictLag = true,
    maxSimulationMs = 180,
    predictionIntervalMs = 72,
    manualPingMs = 80,
    offsetX = 0, offsetY = 0, offsetZ = 0,
    horizontalMultiplier = 100,
    verticalMultiplier = 100,
    wallCheck = false,
    autoUnequip = true,
    cooldown = 0.2,
}

_G.UZSHOOT_motionPart = nil
_G.UZSHOOT_motionSamples = {}
_G.UZSHOOT_measuredVel = Vector3.new(0, 0, 0)
_G.UZSHOOT_previousVel = Vector3.new(0, 0, 0)
_G.UZSHOOT_accel = Vector3.new(0, 0, 0)
_G.UZSHOOT_shootBusy = false

_G.UZSHOOT_interpProfile = function(ping)
    local arr = _G.UZSHOOT_PingProfiles
    local a, b = arr[1], arr[1]
    if ping >= arr[#arr].Ping then
        a = arr[#arr]
        b = arr[#arr]
    else
        for i = 1, #arr - 1 do
            if ping >= arr[i].Ping and ping <= arr[i + 1].Ping then
                a = arr[i]
                b = arr[i + 1]
                break
            end
        end
    end
    local span = b.Ping - a.Ping
    local alpha = span > 0 and math.clamp((ping - a.Ping) / span, 0, 1) or 0
    alpha = alpha * alpha * (3 - 2 * alpha)
    local function mix(k) return a[k] + (b[k] - a[k]) * alpha end
    return {
        Sim = math.floor(mix("Sim") + 0.5),
        Interval = math.floor(mix("Interval") + 0.5),
        H = math.floor(mix("H") + 0.5),
        V = math.floor(mix("V") + 0.5),
        X = math.floor(mix("X") + 0.5),
        Y = math.floor(mix("Y") + 0.5),
        Z = math.floor(mix("Z") + 0.5),
    }
end

_G.UZSHOOT_leadTime = function()
    local cfg = _G.UZSHOOT_CFG
    local prediction
    if cfg.adaptive then
        local ping = cfg.prioritizePing and (_G.UZNOIR_cachedPing or 0.08) or (cfg.manualPingMs / 1000)
        prediction = ping + cfg.extraLead
        if cfg.predictLag then
            local samplingDelay = math.clamp(cfg.predictionIntervalMs / 2000, 0, 0.05)
            prediction = prediction + samplingDelay + math.max(0, ping - 0.10) * 0.15
        end
    else
        prediction = cfg.fixedLead
    end
    return math.clamp(prediction, 0.02, math.min(cfg.maxLead, cfg.maxSimulationMs / 1000))
end

_G.UZSHOOT_sampleMotion = function(part)
    local cfg = _G.UZSHOOT_CFG
    local now = os.clock()
    if _G.UZSHOOT_motionPart ~= part then
        _G.UZSHOOT_motionPart = part
        _G.UZSHOOT_motionSamples = {}
        _G.UZSHOOT_measuredVel = part.AssemblyLinearVelocity
        _G.UZSHOOT_previousVel = _G.UZSHOOT_measuredVel
        _G.UZSHOOT_accel = Vector3.new(0, 0, 0)
    end
    local samples = _G.UZSHOOT_motionSamples
    local last = samples[#samples]
    if not last or now - last.time >= math.max(0.016, cfg.predictionIntervalMs / 1000) then
        table.insert(samples, { position = part.Position, time = now })
        while #samples > 8 or (#samples > 2 and now - samples[1].time > 0.35) do
            table.remove(samples, 1)
        end
        if #samples >= 2 then
            local first = samples[1]
            local newest = samples[#samples]
            local delta = newest.time - first.time
            if delta > 0.015 then
                local sampled = (newest.position - first.position) / delta
                if sampled.Magnitude < 150 then
                    local oldVel = _G.UZSHOOT_measuredVel
                    _G.UZSHOOT_measuredVel = _G.UZSHOOT_measuredVel:Lerp(sampled, 0.55)
                    local sampleDelta = last and math.max(now - last.time, 0.016) or delta
                    local accel = (_G.UZSHOOT_measuredVel - oldVel) / sampleDelta
                    if accel.Magnitude < 120 then
                        _G.UZSHOOT_accel = _G.UZSHOOT_accel:Lerp(accel, 0.25)
                    else
                        _G.UZSHOOT_accel = Vector3.new(0, 0, 0)
                    end
                    _G.UZSHOOT_previousVel = oldVel
                end
            end
        end
    end
end

_G.UZSHOOT_calculateAim = function(part)
    local cfg = _G.UZSHOOT_CFG
    _G.UZSHOOT_sampleMotion(part)
    local assembly = part.AssemblyLinearVelocity
    local velocity = assembly
    local accel = Vector3.new(0, 0, 0)
    if cfg.predictLag and _G.UZSHOOT_motionPart == part and #_G.UZSHOOT_motionSamples >= 2 then
        local dis = (assembly - _G.UZSHOOT_measuredVel).Magnitude
        local w = math.clamp(0.75 - dis / 120, 0.35, 0.75)
        velocity = assembly:Lerp(_G.UZSHOOT_measuredVel, w)
        accel = _G.UZSHOOT_accel
    end
    local h = cfg.horizontalMultiplier / 100
    local v = cfg.verticalMultiplier / 100
    local yVel = cfg.predictJump and velocity.Y * v or 0
    local predictedVel = Vector3.new(velocity.X * h, yVel, velocity.Z * h)
    local time = _G.UZSHOOT_leadTime()
    local displacement = predictedVel * time
    if cfg.predictLag then
        local hAccel = Vector3.new(accel.X, 0, accel.Z)
        displacement = displacement + hAccel * (0.5 * time * time)
    end
    if cfg.predictJump then
        local humanoid = part.Parent and part.Parent:FindFirstChildWhichIsA("Humanoid")
        if humanoid and humanoid.FloorMaterial == Enum.Material.Air then
            displacement = displacement + Vector3.new(0, -0.5 * workspace.Gravity * time * time, 0)
        end
    end
    if displacement.Magnitude > 18 then
        displacement = displacement.Unit * 18
    end
    local offset = Vector3.new(
        part.Size.X * cfg.offsetX / 100,
        part.Size.Y * cfg.offsetY / 100,
        part.Size.Z * cfg.offsetZ / 100
    )
    return part.Position + displacement + offset
end

_G.UZSHOOT_getAimPart = function(player)
    local char = player and player.Character
    if not char then return nil end
    return char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
end

_G.UZSHOOT_targetVisible = function(part)
    if not _G.UZSHOOT_CFG.wallCheck then return true end
    local char = LocalPlayer.Character
    local origin = char and (char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart"))
    if not origin or not part then return false end
    local rp = RaycastParams.new()
    rp.FilterType = Enum.RaycastFilterType.Exclude
    rp.FilterDescendantsInstances = { char }
    local result = workspace:Raycast(origin.Position, part.Position - origin.Position, rp)
    return result == nil or result.Instance:IsDescendantOf(part.Parent)
end

_G.UZSHOOT_getGun = function()
    local char = LocalPlayer.Character
    if not char then return nil end
    local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")
    if gun then return gun end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        gun = backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")
    end
    return gun
end

_G.UZSHOOT_findGunRemote = function()
    local gun = _G.UZSHOOT_getGun()
    if not gun then return nil end
    local best, bestScore
    for _, obj in ipairs(gun:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            local name = obj.Name
            local score = #name
            if name == "Shoot" then score += 50 end
            if name == "GunFired" or name == "KnifeThrown" then score = -1 end
            if score >= (bestScore or 0) then
                best, bestScore = obj, score
            end
        end
    end
    return best
end

_G.UZSHOOT_getHandle = function(gun)
    if not gun then return nil end
    local h = gun:FindFirstChild("Handle", true)
    if h and h:IsA("BasePart") then return h end
    return nil
end

_G.UZSHOOT_fireGunAt = function(player)
    if _G.UZSHOOT_shootBusy then return false end
    _G.UZSHOOT_shootBusy = true
    local success = false

    pcall(function()
        if not player or not player.Character then return end
        local part = _G.UZSHOOT_getAimPart(player)
        local char = LocalPlayer.Character
        local humanoid = char and char:FindFirstChildWhichIsA("Humanoid")
        local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
        if not part or not char or not humanoid then return end
        if _G.UZSHOOT_CFG.wallCheck and not _G.UZSHOOT_targetVisible(part) then return end

        local autoEquipped = false
        local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")
        if not gun and backpack then
            gun = backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")
            if gun then
                humanoid:EquipTool(gun)
                autoEquipped = true
                task.wait(0.12)
            end
        end
        if not gun or not gun:IsA("Tool") then
            if autoEquipped and humanoid.Parent then humanoid:UnequipTools() end
            return
        end
        local remote = _G.UZSHOOT_findGunRemote()
        local handle = _G.UZSHOOT_getHandle(gun)
        if not remote or not handle then
            if autoEquipped and humanoid.Parent then humanoid:UnequipTools() end
            return
        end
        local aim = _G.UZSHOOT_calculateAim(part)
        local origin = handle.Position
        success = pcall(function()
            remote:FireServer(CFrame.lookAt(origin, aim), CFrame.new(aim))
        end)
        task.wait(0.16)
        if autoEquipped and _G.UZSHOOT_CFG.autoUnequip and humanoid.Parent then
            task.wait(0.08)
            humanoid:UnequipTools()
        end
    end)

    task.wait(_G.UZSHOOT_CFG.cooldown)
    _G.UZSHOOT_shootBusy = false
    return success
end

-- Loop de sampleMotion 30Hz
task.spawn(function()
    while task.wait(1 / 30) do
        local murderer = detectarMurderer()
        if murderer and murderer.Character then
            local part = _G.UZSHOOT_getAimPart(murderer)
            if part then _G.UZSHOOT_sampleMotion(part) end
        end
    end
end)

-- Función dispararV1 (reemplaza la vieja)
local function dispararV1()
    if _G.UZSHOOT_shootBusy then return end
    if _G.UZIVERT_SHOOT_ULTIMA and tick() - _G.UZIVERT_SHOOT_ULTIMA < 0.15 then return end
    _G.UZIVERT_SHOOT_ULTIMA = tick()

    local murderer = detectarMurderer()
    if not murderer or not murderer.Character then
        print("❌ Sin murderer")
        return
    end

    task.spawn(function()
        local ok = _G.UZSHOOT_fireGunAt(murderer)
        print(ok and ("💥 Disparo a " .. murderer.Name) or "❌ Fallo")
    end)
end

task.spawn(function()
    while task.wait(0.3) do
        if SHOOT_AUTO then pcall(dispararV1) end
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
-- 🔫 SHOOT TELEPORT (SHOOT TP)
-- ============================================
if not _G.UZIVERT_GAMA_BAJA then

-- Variables globales
_G.UZIVERT_SHOOT_TP_ACTIVO = false
_G.UZIVERT_SHOOT_TP_DISTANCIA = 5.5
_G.UZIVERT_SHOOT_TP_DURACION = 1.0
_G.UZIVERT_SHOOT_TP_INTERVALO = 0.10
_G.UZIVERT_SHOOT_TP_LOCK = 0.03

-- ============================================
-- FUNCIÓN: BUSCAR GUN
-- ============================================
_G.UZIVERT_STP_BUSCAR_GUN = function()
    local char = LocalPlayer.Character
    if not char then return nil, nil end
    
    local gun = char:FindFirstChild("Gun") or char:FindFirstChild("Revolver")
    if gun then return gun, "equipada" end
    
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        gun = backpack:FindFirstChild("Gun") or backpack:FindFirstChild("Revolver")
        if gun then return gun, "backpack" end
    end
    
    return nil, nil
end

_G.UZIVERT_STP_EQUIPAR = function(gun)
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum and gun then
        pcall(function() hum:EquipTool(gun) end)
        task.wait(0.1)
    end
end

_G.UZIVERT_STP_DESEQUIPAR = function()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        pcall(function() hum:UnequipTools() end)
    end
end

-- ============================================
-- FUNCIÓN: BUSCAR MURDERER
-- ============================================
_G.UZIVERT_STP_BUSCAR_MURDERER = function()
    for plrName, role in pairs(RoleCache) do
        if role == "Murderer" then
            return Players:FindFirstChild(plrName)
        end
    end
    return nil
end

-- ============================================
-- FUNCIÓN PRINCIPAL: SHOOT TELEPORT
-- ============================================
_G.UZIVERT_SHOOT_TP = function()
    if _G.UZIVERT_SHOOT_TP_ACTIVO then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "⚠️ Shoot TP", Text = "Ya en progreso", Duration = 2
            })
        end)
        return false
    end
    
    -- 1. Buscar murderer
    local murderer = _G.UZIVERT_STP_BUSCAR_MURDERER()
    if not murderer or not murderer.Character then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "❌ Shoot TP", Text = "No hay Murderer", Duration = 2
            })
        end)
        return false
    end
    
    local murdererHum = murderer.Character:FindFirstChildOfClass("Humanoid")
    if not murdererHum or murdererHum.Health <= 0 then
        return false
    end
    
    -- 2. Buscar gun
    local gun, ubicacion = _G.UZIVERT_STP_BUSCAR_GUN()
    if not gun then
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "❌ Shoot TP", Text = "No tenés gun", Duration = 2
            })
        end)
        return false
    end
    
    -- 3. Chequear personaje
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    local myHum = myChar and myChar:FindFirstChildOfClass("Humanoid")
    if not myRoot then return false end
    
    -- 4. Guardar estado
    local posOriginal = myRoot.CFrame
    local estabaEquipada = (ubicacion == "equipada")
    local walkSpeedOriginal = myHum and myHum.WalkSpeed or 16
    local jumpPowerOriginal = myHum and myHum.JumpPower or 50
    
    _G.UZIVERT_SHOOT_TP_ACTIVO = true
    
    -- 5. Equipar gun
    if not estabaEquipada then
        _G.UZIVERT_STP_EQUIPAR(gun)
    end
    
    -- 6. Buscar remote Shoot
    local shootRemote = gun:FindFirstChild("Shoot", true)
    if not shootRemote then
        if not estabaEquipada then _G.UZIVERT_STP_DESEQUIPAR() end
        _G.UZIVERT_SHOOT_TP_ACTIVO = false
        return false
    end
    
    -- 7. Bloquear movimiento
    if myHum then
        myHum.WalkSpeed = 0
        myHum.JumpPower = 0
    end
    
    -- 8. Lock + disparos
    local tiempoInicio = tick()
    local ultimoTiro = 0
    local tirosDisparados = 0
    local ultimoLock = 0
    
    while (tick() - tiempoInicio) < _G.UZIVERT_SHOOT_TP_DURACION do
        if not murderer.Character or not murdererHum.Parent or murdererHum.Health <= 0 then
            break
        end
        if not myRoot or not myRoot.Parent then break end
        
        local ahora = tick() - tiempoInicio
        
        -- Lock
        if ahora - ultimoLock >= _G.UZIVERT_SHOOT_TP_LOCK then
            local mRootActual = murderer.Character:FindFirstChild("HumanoidRootPart")
            if mRootActual then
                myRoot.CFrame = mRootActual.CFrame * CFrame.new(0, 1, _G.UZIVERT_SHOOT_TP_DISTANCIA)
                myRoot.Velocity = Vector3.new(0, 0, 0)
                myRoot.RotVelocity = Vector3.new(0, 0, 0)
            end
            ultimoLock = ahora
        end
        
        -- Disparar
        if ahora - ultimoTiro >= _G.UZIVERT_SHOOT_TP_INTERVALO then
            local mHeadActual = murderer.Character:FindFirstChild("Head")
            if mHeadActual then
                local handle = gun:FindFirstChild("Handle")
                local originCF = handle and handle.CFrame or myRoot.CFrame
                
                pcall(function()
                    shootRemote:FireServer(originCF, CFrame.new(mHeadActual.Position))
                end)
                tirosDisparados = tirosDisparados + 1
            end
            ultimoTiro = ahora
        end
        
        RunService.Heartbeat:Wait()
    end
    
    -- 9. Restaurar movimiento
    if myHum and myHum.Parent then
        myHum.WalkSpeed = walkSpeedOriginal
        myHum.JumpPower = jumpPowerOriginal
    end
    
    -- 10. Volver posición
    if myRoot and myRoot.Parent then
        myRoot.CFrame = posOriginal
        myRoot.Velocity = Vector3.new(0, 0, 0)
    end
    
    -- 11. Desequipar gun
    task.wait(0.1)
    if not estabaEquipada then
        _G.UZIVERT_STP_DESEQUIPAR()
    end
    
    _G.UZIVERT_SHOOT_TP_ACTIVO = false
    print("🔫 Shoot TP → " .. murderer.Name .. " | " .. tirosDisparados .. " tiros")
    return true
end

-- ============================================
-- SECCIÓN EN PESTAÑA COMBAT
-- ============================================
_G.secSTP = Instance.new("Frame")
_G.secSTP.Size = UDim2.new(1, 0, 0, 30)
_G.secSTP.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secSTP.BackgroundTransparency = 0.3
_G.secSTP.BorderSizePixel = 0
_G.secSTP.ZIndex = 2
_G.secSTP.Parent = PaginaAim

_G.cSecSTP = Instance.new("UICorner")
_G.cSecSTP.CornerRadius = UDim.new(0, 7)
_G.cSecSTP.Parent = _G.secSTP

_G.sSecSTP = Instance.new("UIStroke")
_G.sSecSTP.Color = COLORES.Morado3
_G.sSecSTP.Thickness = 1.5
_G.sSecSTP.Transparency = 0.2
_G.sSecSTP.Parent = _G.secSTP

_G.lblSecSTP = Instance.new("TextLabel")
_G.lblSecSTP.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecSTP.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecSTP.BackgroundTransparency = 1
_G.lblSecSTP.Text = "🔫 SHOOT TELEPORT"
_G.lblSecSTP.TextColor3 = COLORES.Naranja2
_G.lblSecSTP.Font = Enum.Font.GothamBlack
_G.lblSecSTP.TextSize = 12
_G.lblSecSTP.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecSTP.ZIndex = 3
_G.lblSecSTP.Parent = _G.secSTP

-- Botón principal STP (mismo estilo SHOOT MURDERER)
local BotonSTP = Instance.new("TextButton")
BotonSTP.Name = "UzivertShootTP"
BotonSTP.Size = UDim2.new(1, 0, 0, 50)
BotonSTP.BackgroundColor3 = COLORES.Fondo
BotonSTP.BackgroundTransparency = 0.3
BotonSTP.Text = "🔫 SHOOT TP"
BotonSTP.TextColor3 = COLORES.Texto
BotonSTP.Font = Enum.Font.GothamBold
BotonSTP.TextSize = 14
BotonSTP.BorderSizePixel = 0
BotonSTP.Active = true
BotonSTP.ClipsDescendants = true
BotonSTP.ZIndex = 2
BotonSTP.Parent = PaginaAim

local cBSTP = Instance.new("UICorner")
cBSTP.CornerRadius = UDim.new(0, 10)
cBSTP.Parent = BotonSTP

local sBSTP = Instance.new("UIStroke")
sBSTP.Color = COLORES.Naranja1
sBSTP.Thickness = 2
sBSTP.Transparency = 0.2
sBSTP.Parent = BotonSTP

-- Animación RGB
task.spawn(function()
    while BotonSTP.Parent do
        local t = tick()
        local a = (math.sin(t * 1.5) + 1) / 2
        sBSTP.Color = COLORES.Naranja1:Lerp(COLORES.Morado2, a)
        sBSTP.Transparency = 0.4 - a * 0.3
        task.wait(0.05)
    end
end)

BotonSTP.MouseButton1Click:Connect(function()
    if _G.UZIVERT_SHOOT_TP_ACTIVO then return end
    BotonSTP.Text = "⚡ EJECUTANDO..."
    task.spawn(function()
        _G.UZIVERT_SHOOT_TP()
        task.wait(0.3)
        BotonSTP.Text = "🔫 SHOOT TP"
    end)
end)

-- Toggle mostrar bindable STP
crearToggle(PaginaAim, "📌 Mostrar botón flotante STP", CONFIG.ShootTPVisible or false, function(e)
    CONFIG.ShootTPVisible = e
    guardarConfig()
    
    if e then
        -- Crear bindable si no existe
        if not _G.UZIVERT_STP_BINDABLE or not _G.UZIVERT_STP_BINDABLE.Parent then
            local btn = Instance.new("TextButton")
            btn.Name = "STP_Bindable"
            btn.Size = UDim2.new(0, 40, 0, 40)
            
            if CONFIG.ShootTPPos then
                btn.Position = UDim2.new(CONFIG.ShootTPPos[1], CONFIG.ShootTPPos[2], CONFIG.ShootTPPos[3], CONFIG.ShootTPPos[4])
            else
                btn.Position = UDim2.new(0, 30, 0.6, 0)
            end
            
            btn.BackgroundColor3 = COLORES.Fondo
            btn.BackgroundTransparency = 0.3
            btn.Text = "STP"
            btn.TextColor3 = COLORES.Texto
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 11
            btn.BorderSizePixel = 0
            btn.Active = true
            btn.Draggable = true
            btn.ClipsDescendants = true
            btn.ZIndex = 998
            btn.Parent = ScreenGui
            
            local c = Instance.new("UICorner")
            c.CornerRadius = UDim.new(0, 10)
            c.Parent = btn
            
            local s = Instance.new("UIStroke")
            s.Color = COLORES.Naranja1
            s.Thickness = 2
            s.Transparency = 0.2
            s.Parent = btn
            
            -- Animación RGB
            task.spawn(function()
                while btn.Parent do
                    local t = tick()
                    local a = (math.sin(t * 1.5) + 1) / 2
                    s.Color = COLORES.Naranja1:Lerp(COLORES.Morado2, a)
                    s.Transparency = 0.4 - a * 0.3
                    task.wait(0.05)
                end
            end)
            
            btn.MouseButton1Click:Connect(function()
                if _G.UZIVERT_SHOOT_TP_ACTIVO then return end
                btn.Text = "⚡"
                task.spawn(function()
                    _G.UZIVERT_SHOOT_TP()
                    task.wait(0.3)
                    btn.Text = "STP"
                end)
            end)
            
            _G.UZIVERT_STP_BINDABLE = btn
            
            -- Guardar posición cada 2s
            task.spawn(function()
                while btn.Parent do
                    task.wait(2)
                    if btn.Parent then
                        CONFIG.ShootTPPos = {
                            btn.Position.X.Scale,
                            btn.Position.X.Offset,
                            btn.Position.Y.Scale,
                            btn.Position.Y.Offset
                        }
                        guardarConfig()
                    end
                end
            end)
        end
    else
        -- Destruir bindable
        if _G.UZIVERT_STP_BINDABLE then
            _G.UZIVERT_STP_BINDABLE:Destroy()
            _G.UZIVERT_STP_BINDABLE = nil
        end
    end
end)

-- Arrancar bindable si estaba guardado activo
if CONFIG.ShootTPVisible then
    task.wait(0.5)
    -- Simular toggle para crear el bindable
    if not _G.UZIVERT_STP_BINDABLE or not _G.UZIVERT_STP_BINDABLE.Parent then
        local btn = Instance.new("TextButton")
        btn.Name = "STP_Bindable"
        btn.Size = UDim2.new(0, 40, 0, 40)
        
        if CONFIG.ShootTPPos then
            btn.Position = UDim2.new(CONFIG.ShootTPPos[1], CONFIG.ShootTPPos[2], CONFIG.ShootTPPos[3], CONFIG.ShootTPPos[4])
        else
            btn.Position = UDim2.new(0, 30, 0.6, 0)
        end
        
        btn.BackgroundColor3 = COLORES.Fondo
        btn.BackgroundTransparency = 0.3
        btn.Text = "STP"
        btn.TextColor3 = COLORES.Texto
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 11
        btn.BorderSizePixel = 0
        btn.Active = true
        btn.Draggable = true
        btn.ClipsDescendants = true
        btn.ZIndex = 998
        btn.Parent = ScreenGui
        
        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(0, 10)
        c.Parent = btn
        
        local s = Instance.new("UIStroke")
        s.Color = COLORES.Naranja1
        s.Thickness = 2
        s.Transparency = 0.2
        s.Parent = btn
        
        task.spawn(function()
            while btn.Parent do
                local t = tick()
                local a = (math.sin(t * 1.5) + 1) / 2
                s.Color = COLORES.Naranja1:Lerp(COLORES.Morado2, a)
                s.Transparency = 0.4 - a * 0.3
                task.wait(0.05)
            end
        end)
        
        btn.MouseButton1Click:Connect(function()
            if _G.UZIVERT_SHOOT_TP_ACTIVO then return end
            btn.Text = "⚡"
            task.spawn(function()
                _G.UZIVERT_SHOOT_TP()
                task.wait(0.3)
                btn.Text = "STP"
            end)
        end)
        
        _G.UZIVERT_STP_BINDABLE = btn
        
        task.spawn(function()
            while btn.Parent do
                task.wait(2)
                if btn.Parent then
                    CONFIG.ShootTPPos = {
                        btn.Position.X.Scale,
                        btn.Position.X.Offset,
                        btn.Position.Y.Scale,
                        btn.Position.Y.Offset
                    }
                    guardarConfig()
                end
            end
        end)
    end
end

end
-- Fin del bloque SHOOT TP

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
    if not e then limpiarESP() end
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

-- 🎯 SECCIÓN 1: SHOOT MURDERER
_G.secAim1 = Instance.new("Frame")
_G.secAim1.Size = UDim2.new(1, 0, 0, 30)
_G.secAim1.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secAim1.BackgroundTransparency = 0.3
_G.secAim1.BorderSizePixel = 0
_G.secAim1.ZIndex = 2
_G.secAim1.Parent = PaginaAim

_G.cSecAim1 = Instance.new("UICorner")
_G.cSecAim1.CornerRadius = UDim.new(0, 7)
_G.cSecAim1.Parent = _G.secAim1

_G.sSecAim1 = Instance.new("UIStroke")
_G.sSecAim1.Color = COLORES.Morado3
_G.sSecAim1.Thickness = 1.5
_G.sSecAim1.Transparency = 0.2
_G.sSecAim1.Parent = _G.secAim1

_G.lblSecAim1 = Instance.new("TextLabel")
_G.lblSecAim1.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecAim1.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecAim1.BackgroundTransparency = 1
_G.lblSecAim1.Text = "🎯 SHOOT MURDERER (Inestable)"
_G.lblSecAim1.TextColor3 = COLORES.Naranja2
_G.lblSecAim1.Font = Enum.Font.GothamBlack
_G.lblSecAim1.TextSize = 12
_G.lblSecAim1.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecAim1.ZIndex = 3
_G.lblSecAim1.Parent = _G.secAim1

if not _G.UZIVERT_GAMA_BAJA then
    crearToggle(PaginaAim, "👻 Auto Shoot (logica avanzada)", CONFIG.ShootAuto, function(e)
        SHOOT_AUTO = e
        CONFIG.ShootAuto = e
        guardarConfig()
    end)
end

crearToggle(PaginaAim, "🎯 Mostrar boton SHOOT MURDERER", CONFIG.ShootMostrar ~= false, function(e)
    SHOOT_MOSTRAR = e
    CONFIG.ShootMostrar = e
    guardarConfig()
    if BotonShoot then BotonShoot.Visible = e end
end)

-- 🎯 SECCIÓN: AIMLOCK V2
_G.secAim2 = Instance.new("Frame")
_G.secAim2.Size = UDim2.new(1, 0, 0, 30)
_G.secAim2.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secAim2.BackgroundTransparency = 0.3
_G.secAim2.BorderSizePixel = 0
_G.secAim2.ZIndex = 2
_G.secAim2.Parent = PaginaAim

_G.cSecAim2 = Instance.new("UICorner")
_G.cSecAim2.CornerRadius = UDim.new(0, 7)
_G.cSecAim2.Parent = _G.secAim2

_G.sSecAim2 = Instance.new("UIStroke")
_G.sSecAim2.Color = COLORES.Morado3
_G.sSecAim2.Thickness = 1.5
_G.sSecAim2.Transparency = 0.2
_G.sSecAim2.Parent = _G.secAim2

_G.lblSecAim2 = Instance.new("TextLabel")
_G.lblSecAim2.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecAim2.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecAim2.BackgroundTransparency = 1
_G.lblSecAim2.Text = "🎯 AIMLOCK V2"
_G.lblSecAim2.TextColor3 = COLORES.Naranja2
_G.lblSecAim2.Font = Enum.Font.GothamBlack
_G.lblSecAim2.TextSize = 12
_G.lblSecAim2.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecAim2.ZIndex = 3
_G.lblSecAim2.Parent = _G.secAim2

crearToggle(PaginaAim, "🎯 Enable Aimlock", CONFIG.AimLock or false, function(e)
    _G.AIM_ON = e
    CONFIG.AimLock = e
    guardarConfig()
    if e then _G.AIM_TARGET = _G.AIM_FIND_MURDERER() end
    if _G.AIM_ACTUALIZAR_BTN then _G.AIM_ACTUALIZAR_BTN() end
end)

crearToggle(PaginaAim, "📱 Mostrar botón flotante (AIM)", CONFIG.AimBtnShow ~= false, function(e)
    CONFIG.AimBtnShow = e
    guardarConfig()
    if e then
        _G.AIM_CREAR_BTN()
    else
        if _G.AIM_BTN then
            _G.AIM_BTN:Destroy()
            _G.AIM_BTN = nil
        end
    end
end)

crearToggle(PaginaAim, "🧱 Wall Check", CONFIG.AimWall or false, function(e)
    _G.AIM_WALL = e
    CONFIG.AimWall = e
    guardarConfig()
end)

crearToggle(PaginaAim, "🎯 FOV Check", CONFIG.AimFOV or false, function(e)
    _G.AIM_FOV_ON = e
    CONFIG.AimFOV = e
    guardarConfig()
    _G.AIM_UPDATE_FOV()
end)

crearToggle(PaginaAim, "↔️ Horizontal Prediction", CONFIG.AimHoriz or false, function(e)
    _G.AIM_HORIZ = e
    CONFIG.AimHoriz = e
    guardarConfig()
end)

crearSlider(PaginaAim, "🌀 Smoothness (0=instant)", 0, 95, CONFIG.AimSmooth or 25, function(v)
    _G.AIM_SMOOTH = v
    CONFIG.AimSmooth = v
    guardarConfig()
end)

crearSlider(PaginaAim, "🎯 FOV Radius (px)", 50, 800, CONFIG.AimFOVRadius or 250, function(v)
    _G.AIM_FOV_RADIUS = v
    CONFIG.AimFOVRadius = v
    guardarConfig()
    _G.AIM_UPDATE_FOV()
end)

crearSlider(PaginaAim, "⚡ Prediction (x1000)", 0, 300, math.floor((CONFIG.AimPred or 0.145) * 1000), function(v)
    _G.AIM_PRED = v / 1000
    CONFIG.AimPred = v / 1000
    guardarConfig()
end)

-- Select Player
_G.AIM_SELBTN = Instance.new("TextButton")
_G.AIM_SELBTN.Size = UDim2.new(1, 0, 0, 32)
_G.AIM_SELBTN.BackgroundColor3 = COLORES.Morado3
_G.AIM_SELBTN.BackgroundTransparency = 0.5
_G.AIM_SELBTN.Text = "👤 Select Player: Auto Murderer"
_G.AIM_SELBTN.TextColor3 = COLORES.Texto
_G.AIM_SELBTN.Font = Enum.Font.GothamBold
_G.AIM_SELBTN.TextSize = 11
_G.AIM_SELBTN.BorderSizePixel = 0
_G.AIM_SELBTN.ZIndex = 2
_G.AIM_SELBTN.Parent = PaginaAim

_G.cAimSel = Instance.new("UICorner")
_G.cAimSel.CornerRadius = UDim.new(0, 8)
_G.cAimSel.Parent = _G.AIM_SELBTN

_G.AIM_SELBTN.MouseButton1Click:Connect(function()
    local lista = {"Auto Murderer"}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then table.insert(lista, p.Name) end
    end
    local actual = _G.AIM_SELECTED and _G.AIM_SELECTED.Name or "Auto Murderer"
    local idx = table.find(lista, actual) or 1
    idx = idx % #lista + 1
    local nuevo = lista[idx]
    if nuevo == "Auto Murderer" then
        _G.AIM_SELECTED = nil
        _G.AIM_SELBTN.Text = "👤 Select Player: Auto Murderer"
    else
        _G.AIM_SELECTED = Players:FindFirstChild(nuevo)
        _G.AIM_SELBTN.Text = "👤 Select Player: " .. nuevo
    end
end)

-- Target Part
_G.AIM_PARTBTN = Instance.new("TextButton")
_G.AIM_PARTBTN.Size = UDim2.new(1, 0, 0, 32)
_G.AIM_PARTBTN.BackgroundColor3 = COLORES.Morado3
_G.AIM_PARTBTN.BackgroundTransparency = 0.5
_G.AIM_PARTBTN.Text = "🎯 Part: " .. (_G.AIM_PART == "Head" and "Head" or "Torso")
_G.AIM_PARTBTN.TextColor3 = COLORES.Texto
_G.AIM_PARTBTN.Font = Enum.Font.GothamBold
_G.AIM_PARTBTN.TextSize = 11
_G.AIM_PARTBTN.BorderSizePixel = 0
_G.AIM_PARTBTN.ZIndex = 2
_G.AIM_PARTBTN.Parent = PaginaAim

_G.cAimPart = Instance.new("UICorner")
_G.cAimPart.CornerRadius = UDim.new(0, 8)
_G.cAimPart.Parent = _G.AIM_PARTBTN

_G.AIM_PARTBTN.MouseButton1Click:Connect(function()
    if _G.AIM_PART == "Head" then
        _G.AIM_PART = "HumanoidRootPart"
        _G.AIM_PARTBTN.Text = "🎯 Part: Torso"
    else
        _G.AIM_PART = "Head"
        _G.AIM_PARTBTN.Text = "🎯 Part: Head"
    end
    CONFIG.AimPart = _G.AIM_PART
    guardarConfig()
end)

-- ============================================
-- BOTÓN BINDABLE "AIM" con ON/OFF + guardar posición
-- ============================================
_G.AIM_BTN = nil

_G.AIM_ACTUALIZAR_BTN = function()
    if not _G.AIM_BTN then return end
    if _G.AIM_ON then
        _G.AIM_BTN.Text = "ON"
    else
        _G.AIM_BTN.Text = "AIM"
    end
end

_G.AIM_CREAR_BTN = function()
    if _G.AIM_BTN then return end

    local btn = Instance.new("TextButton")
    btn.Name = "AimBind"
    btn.Size = UDim2.new(0, 40, 0, 40)
    btn.Position = UDim2.new(0, 30, 0.4, 0)
    btn.BackgroundColor3 = COLORES.Fondo
    btn.BackgroundTransparency = 0.3
    btn.Text = "AIM"
    btn.TextColor3 = COLORES.Texto
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.BorderSizePixel = 0
    btn.Active = true
    btn.Draggable = true
    btn.ZIndex = 998
    btn.Parent = ScreenGui

    -- 🎯 Cargar posición guardada
    if CONFIG.AimBtnPos then
        pcall(function()
            btn.Position = UDim2.new(
                CONFIG.AimBtnPos[1],
                CONFIG.AimBtnPos[2],
                CONFIG.AimBtnPos[3],
                CONFIG.AimBtnPos[4]
            )
        end)
    end

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 10)
    c.Parent = btn

    local s = Instance.new("UIStroke")
    s.Name = "@Stroke"
    s.Color = Color3.fromRGB(100, 100, 100)
    s.Thickness = 2
    s.Transparency = 0.2
    s.Parent = btn

    task.spawn(function()
        while btn.Parent do
            local t = tick()
            local a = (math.sin(t * 1.5) + 1) / 2
            if _G.AIM_ON then
                s.Color = COLORES.Naranja1:Lerp(COLORES.Morado2, a)
                s.Transparency = 0.4 - a * 0.3
            else
                s.Color = Color3.fromRGB(100, 100, 100)
                s.Transparency = 0.4
            end
            task.wait(0.05)
        end
    end)

    btn.MouseButton1Click:Connect(function()
        _G.AIM_ON = not _G.AIM_ON
        CONFIG.AimLock = _G.AIM_ON
        guardarConfig()
        if _G.AIM_ON then
            _G.AIM_TARGET = _G.AIM_FIND_MURDERER()
        end
        _G.AIM_ACTUALIZAR_BTN()
    end)

    -- 🎯 Guardar posición cada 2s
    task.spawn(function()
        while btn.Parent do
            task.wait(2)
            if btn.Parent then
                CONFIG.AimBtnPos = {
                    btn.Position.X.Scale,
                    btn.Position.X.Offset,
                    btn.Position.Y.Scale,
                    btn.Position.Y.Offset
                }
                guardarConfig()
            end
        end
    end)

    _G.AIM_BTN = btn
    _G.AIM_ACTUALIZAR_BTN()
end

-- Arrancar botón bindable si estaba activo
if CONFIG.AimBtnShow ~= false then
    task.wait(0.3)
    _G.AIM_CREAR_BTN()
end

-- Arrancar FOV circle si estaba activo
if CONFIG.AimFOV then
    task.wait(0.5)
    _G.AIM_UPDATE_FOV()
end

-- 🎯 SECCIÓN: SILENT AIM v4
_G.secSA = Instance.new("Frame")
_G.secSA.Size = UDim2.new(1, 0, 0, 30)
_G.secSA.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secSA.BackgroundTransparency = 0.3
_G.secSA.BorderSizePixel = 0
_G.secSA.ZIndex = 2
_G.secSA.Parent = PaginaAim

_G.cSecSA = Instance.new("UICorner")
_G.cSecSA.CornerRadius = UDim.new(0, 7)
_G.cSecSA.Parent = _G.secSA

_G.sSecSA = Instance.new("UIStroke")
_G.sSecSA.Color = COLORES.Morado3
_G.sSecSA.Thickness = 1.5
_G.sSecSA.Transparency = 0.2
_G.sSecSA.Parent = _G.secSA

_G.lblSecSA = Instance.new("TextLabel")
_G.lblSecSA.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecSA.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecSA.BackgroundTransparency = 1
_G.lblSecSA.Text = "🎯 SILENT AIM v4 (Inestable)"
_G.lblSecSA.TextColor3 = COLORES.Naranja2
_G.lblSecSA.Font = Enum.Font.GothamBlack
_G.lblSecSA.TextSize = 12
_G.lblSecSA.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecSA.ZIndex = 3
_G.lblSecSA.Parent = _G.secSA

crearToggle(PaginaAim, "🎯 Silent Aim", CONFIG.SilentAim or false, function(e)
    _G.UZIVERT_SA_ON = e
    CONFIG.SilentAim = e
    guardarConfig()
end)



crearToggle(PaginaAim, "🎯 Multi-Point (7 tiros)", CONFIG.SilentMultiPoint ~= false, function(e)
    _G.UZIVERT_SA_MULTI = e
    CONFIG.SilentMultiPoint = e
    guardarConfig()
end)

crearSlider(PaginaAim, "🎯 Extra Lead (x1000)", 0, 100, math.floor((CONFIG.SilentPred or 0.02) * 1000), function(v)
    _G.UZIVERT_SA_PRED = v / 1000
    CONFIG.SilentPred = v / 1000
    if _G.UZNOIR_CFG then
        _G.UZNOIR_CFG.extraLead = v / 1000
    end
    guardarConfig()
end)

crearToggle(PaginaAim, "🦘 Predict Jump", CONFIG.SilentPredictJump ~= false, function(e)
    CONFIG.SilentPredictJump = e
    if _G.UZNOIR_CFG then _G.UZNOIR_CFG.predictJump = e end
    guardarConfig()
end)

crearToggle(PaginaAim, "🏃 Predict Lag", CONFIG.SilentPredictLag ~= false, function(e)
    CONFIG.SilentPredictLag = e
    if _G.UZNOIR_CFG then _G.UZNOIR_CFG.predictLag = e end
    guardarConfig()
end)

crearSlider(PaginaAim, "⚙️ Max Simulation (ms)", 50, 500, CONFIG.SilentMaxSimMs or 180, function(v)
    CONFIG.SilentMaxSimMs = v
    if _G.UZNOIR_CFG then _G.UZNOIR_CFG.maxSimulationMs = v end
    guardarConfig()
end)

crearSlider(PaginaAim, "↔️ Horizontal Mult (%)", 50, 250, CONFIG.SilentHMult or 100, function(v)
    CONFIG.SilentHMult = v
    if _G.UZNOIR_CFG then _G.UZNOIR_CFG.horizontalMultiplier = v end
    guardarConfig()
end)

crearSlider(PaginaAim, "↕️ Vertical Mult (%)", 50, 250, CONFIG.SilentVMult or 100, function(v)
    CONFIG.SilentVMult = v
    if _G.UZNOIR_CFG then _G.UZNOIR_CFG.verticalMultiplier = v end
    guardarConfig()
end)

crearSlider(PaginaAim, "🎯 Prediction Interval (ms)", 30, 200, CONFIG.SilentPredInterval or 72, function(v)
    CONFIG.SilentPredInterval = v
    if _G.UZNOIR_CFG then _G.UZNOIR_CFG.predictionIntervalMs = v end
    guardarConfig()
end)

_G.UZNOIR_PING_LABEL = Instance.new("TextLabel")
_G.UZNOIR_PING_LABEL.Size = UDim2.new(1, 0, 0, 30)
_G.UZNOIR_PING_LABEL.BackgroundColor3 = COLORES.Morado3
_G.UZNOIR_PING_LABEL.BackgroundTransparency = 0.5
_G.UZNOIR_PING_LABEL.Text = "📡 Ping: -- ms"
_G.UZNOIR_PING_LABEL.TextColor3 = COLORES.Texto
_G.UZNOIR_PING_LABEL.Font = Enum.Font.GothamBold
_G.UZNOIR_PING_LABEL.TextSize = 11
_G.UZNOIR_PING_LABEL.BorderSizePixel = 0
_G.UZNOIR_PING_LABEL.ZIndex = 2
_G.UZNOIR_PING_LABEL.Parent = PaginaAim

local _cUZNOIRPingLbl = Instance.new("UICorner")
_cUZNOIRPingLbl.CornerRadius = UDim.new(0, 8)
_cUZNOIRPingLbl.Parent = _G.UZNOIR_PING_LABEL

task.spawn(function()
    while task.wait(0.5) do
        if _G.UZNOIR_PING_LABEL and _G.UZNOIR_PING_LABEL.Parent then
            local pingMs = 0
            pcall(function()
                pingMs = math.floor((_G.UZNOIR_cachedPing or 0.08) * 1000 + 0.5)
            end)
            _G.UZNOIR_PING_LABEL.Text = string.format("📡 Ping: %d ms | Lead: %.3f", pingMs, (_G.UZNOIR_CFG and _G.UZNOIR_CFG.extraLead) or 0.02)
        end
    end
end)

if not _G.UZIVERT_GAMA_BAJA then

-- 🎯 SECCIÓN 3: MATAR
_G.secAim3 = Instance.new("Frame")
_G.secAim3.Size = UDim2.new(1, 0, 0, 30)
_G.secAim3.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secAim3.BackgroundTransparency = 0.3
_G.secAim3.BorderSizePixel = 0
_G.secAim3.ZIndex = 2
_G.secAim3.Parent = PaginaAim

_G.cSecAim3 = Instance.new("UICorner")
_G.cSecAim3.CornerRadius = UDim.new(0, 7)
_G.cSecAim3.Parent = _G.secAim3

_G.sSecAim3 = Instance.new("UIStroke")
_G.sSecAim3.Color = COLORES.Morado3
_G.sSecAim3.Thickness = 1.5
_G.sSecAim3.Transparency = 0.2
_G.sSecAim3.Parent = _G.secAim3

_G.lblSecAim3 = Instance.new("TextLabel")
_G.lblSecAim3.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecAim3.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecAim3.BackgroundTransparency = 1
_G.lblSecAim3.Text = "🔪 MATAR"
_G.lblSecAim3.TextColor3 = COLORES.Naranja2
_G.lblSecAim3.Font = Enum.Font.GothamBlack
_G.lblSecAim3.TextSize = 12
_G.lblSecAim3.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecAim3.ZIndex = 3
_G.lblSecAim3.Parent = _G.secAim3

crearToggle(PaginaAim, "💥 Activar KILL ALL (Murderer)", CONFIG.KillAllActivo or false, function(e)
    KILL_ALL_ACTIVO = e
    CONFIG.KillAllActivo = e
    guardarConfig()
    print(e and "💥 Kill All ACTIVADO" or "❌ Kill All DESACTIVADO")
end)

crearBoton(PaginaAim, "Matar Sheriff", function()
    _G.UZIVERT_MATAR_SHERIFF()
end, COLORES.Naranja1)

-- 🎯 SECCIÓN 4: AJUSTES DE SHOOT
_G.secAim4 = Instance.new("Frame")
_G.secAim4.Size = UDim2.new(1, 0, 0, 30)
_G.secAim4.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secAim4.BackgroundTransparency = 0.3
_G.secAim4.BorderSizePixel = 0
_G.secAim4.ZIndex = 2
_G.secAim4.Parent = PaginaAim

_G.cSecAim4 = Instance.new("UICorner")
_G.cSecAim4.CornerRadius = UDim.new(0, 7)
_G.cSecAim4.Parent = _G.secAim4

_G.sSecAim4 = Instance.new("UIStroke")
_G.sSecAim4.Color = COLORES.Morado3
_G.sSecAim4.Thickness = 1.5
_G.sSecAim4.Transparency = 0.2
_G.sSecAim4.Parent = _G.secAim4

_G.lblSecAim4 = Instance.new("TextLabel")
_G.lblSecAim4.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecAim4.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecAim4.BackgroundTransparency = 1
_G.lblSecAim4.Text = "⚙️ AJUSTES DE SHOOT"
_G.lblSecAim4.TextColor3 = COLORES.Naranja2
_G.lblSecAim4.Font = Enum.Font.GothamBlack
_G.lblSecAim4.TextSize = 12
_G.lblSecAim4.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecAim4.ZIndex = 3
_G.lblSecAim4.Parent = _G.secAim4

crearToggle(PaginaAim, "🏃 Predict Lag", CONFIG.ShootPredictLag ~= false, function(e)
    _G.UZSHOOT_CFG.predictLag = e
    CONFIG.ShootPredictLag = e
    guardarConfig()
end)

crearToggle(PaginaAim, "🦘 Predict Jump", CONFIG.ShootPredictJump or false, function(e)
    _G.UZSHOOT_CFG.predictJump = e
    CONFIG.ShootPredictJump = e
    guardarConfig()
end)

crearToggle(PaginaAim, "📡 Prioritize Ping", CONFIG.ShootPrioritizePing ~= false, function(e)
    _G.UZSHOOT_CFG.prioritizePing = e
    CONFIG.ShootPrioritizePing = e
    guardarConfig()
end)

crearToggle(PaginaAim, "🧱 Wall Check", CONFIG.ShootWallCheck ~= false, function(e)
    _G.UZSHOOT_CFG.wallCheck = e
    CONFIG.ShootWallCheck = e
    guardarConfig()
end)

crearToggle(PaginaAim, "🔫 Auto-unequip", CONFIG.ShootAutoUnequip ~= false, function(e)
    _G.UZSHOOT_CFG.autoUnequip = e
    CONFIG.ShootAutoUnequip = e
    guardarConfig()
end)

crearSlider(PaginaAim, "🎯 Extra Lead (x1000)", 0, 100, math.floor((CONFIG.ShootExtraLead or 0.02) * 1000), function(v)
    _G.UZSHOOT_CFG.extraLead = v / 1000
    CONFIG.ShootExtraLead = v / 1000
    guardarConfig()
end)

crearSlider(PaginaAim, "⚙️ Max Sim (ms)", 50, 500, CONFIG.ShootMaxSim or 180, function(v)
    _G.UZSHOOT_CFG.maxSimulationMs = v
    CONFIG.ShootMaxSim = v
    guardarConfig()
end)

crearSlider(PaginaAim, "🎯 Pred Interval (ms)", 30, 200, CONFIG.ShootPredInterval or 72, function(v)
    _G.UZSHOOT_CFG.predictionIntervalMs = v
    CONFIG.ShootPredInterval = v
    guardarConfig()
end)

crearSlider(PaginaAim, "↔️ H Mult (%)", 50, 250, CONFIG.ShootHMult or 100, function(v)
    _G.UZSHOOT_CFG.horizontalMultiplier = v
    CONFIG.ShootHMult = v
    guardarConfig()
end)

crearSlider(PaginaAim, "↕️ V Mult (%)", 50, 250, CONFIG.ShootVMult or 100, function(v)
    _G.UZSHOOT_CFG.verticalMultiplier = v
    CONFIG.ShootVMult = v
    guardarConfig()
end)

-- Aplicar config guardada al arrancar
task.defer(function()
    _G.UZSHOOT_CFG.predictLag = CONFIG.ShootPredictLag ~= false
    _G.UZSHOOT_CFG.predictJump = CONFIG.ShootPredictJump or false
    _G.UZSHOOT_CFG.prioritizePing = CONFIG.ShootPrioritizePing ~= false
    _G.UZSHOOT_CFG.wallCheck = CONFIG.ShootWallCheck ~= false
    _G.UZSHOOT_CFG.autoUnequip = CONFIG.ShootAutoUnequip ~= false
    _G.UZSHOOT_CFG.extraLead = CONFIG.ShootExtraLead or 0.02
    _G.UZSHOOT_CFG.maxSimulationMs = CONFIG.ShootMaxSim or 180
    _G.UZSHOOT_CFG.predictionIntervalMs = CONFIG.ShootPredInterval or 72
    _G.UZSHOOT_CFG.horizontalMultiplier = CONFIG.ShootHMult or 100
    _G.UZSHOOT_CFG.verticalMultiplier = CONFIG.ShootVMult or 100
end)

end

-- 🎯 SECCIÓN 1: KNIFE (Murderer)
_G.secCrab1 = Instance.new("Frame")
_G.secCrab1.Size = UDim2.new(1, 0, 0, 30)
_G.secCrab1.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secCrab1.BackgroundTransparency = 0.3
_G.secCrab1.BorderSizePixel = 0
_G.secCrab1.ZIndex = 2
_G.secCrab1.Parent = PaginaAura

_G.cSecCrab1 = Instance.new("UICorner")
_G.cSecCrab1.CornerRadius = UDim.new(0, 7)
_G.cSecCrab1.Parent = _G.secCrab1

_G.sSecCrab1 = Instance.new("UIStroke")
_G.sSecCrab1.Color = COLORES.Morado3
_G.sSecCrab1.Thickness = 1.5
_G.sSecCrab1.Transparency = 0.2
_G.sSecCrab1.Parent = _G.secCrab1

_G.lblSecCrab1 = Instance.new("TextLabel")
_G.lblSecCrab1.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecCrab1.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecCrab1.BackgroundTransparency = 1
_G.lblSecCrab1.Text = "🔪 KNIFE (Murderer)"
_G.lblSecCrab1.TextColor3 = COLORES.Naranja2
_G.lblSecCrab1.Font = Enum.Font.GothamBlack
_G.lblSecCrab1.TextSize = 12
_G.lblSecCrab1.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecCrab1.ZIndex = 3
_G.lblSecCrab1.Parent = _G.secCrab1

crearToggle(PaginaAura, "🔪 Knife Aura", CONFIG.KnifeAura or false, function(e)
    CONFIG.KnifeAura = e
    guardarConfig()
end)

crearSlider(PaginaAura, "Distancia Knife Aura", 5, 50, CONFIG.KnifeAuraDist or 15, function(v)
    CONFIG.KnifeAuraDist = v
    guardarConfig()
end)

if not _G.UZIVERT_GAMA_BAJA then
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
end

-- 🎯 SECCIÓN 2: GUN (Sheriff / Innocent)
_G.secCrab2 = Instance.new("Frame")
_G.secCrab2.Size = UDim2.new(1, 0, 0, 30)
_G.secCrab2.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secCrab2.BackgroundTransparency = 0.3
_G.secCrab2.BorderSizePixel = 0
_G.secCrab2.ZIndex = 2
_G.secCrab2.Parent = PaginaAura

_G.cSecCrab2 = Instance.new("UICorner")
_G.cSecCrab2.CornerRadius = UDim.new(0, 7)
_G.cSecCrab2.Parent = _G.secCrab2

_G.sSecCrab2 = Instance.new("UIStroke")
_G.sSecCrab2.Color = COLORES.Morado3
_G.sSecCrab2.Thickness = 1.5
_G.sSecCrab2.Transparency = 0.2
_G.sSecCrab2.Parent = _G.secCrab2

_G.lblSecCrab2 = Instance.new("TextLabel")
_G.lblSecCrab2.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecCrab2.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecCrab2.BackgroundTransparency = 1
_G.lblSecCrab2.Text = "🔫 GUN (Sheriff / Innocent)"
_G.lblSecCrab2.TextColor3 = COLORES.Naranja2
_G.lblSecCrab2.Font = Enum.Font.GothamBlack
_G.lblSecCrab2.TextSize = 12
_G.lblSecCrab2.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecCrab2.ZIndex = 3
_G.lblSecCrab2.Parent = _G.secCrab2

crearToggle(PaginaAura, "🍬 Mostrar boton GRAB GUN", CONFIG.AutoGrabMostrar ~= false, function(e)
    CONFIG.AutoGrabMostrar = e
    guardarConfig()
end)

crearToggle(PaginaAura, "🔫 Auto Get Gun (lejano)", CONFIG.AutoGetGun or false, function(e)
    _G.UZIVERT_AUTO_GET_GUN_ON = e
    CONFIG.AutoGetGun = e
    guardarConfig()
end)

crearToggle(PaginaAura, "🎯 Gun Aura (cerca)", CONFIG.GunAura or false, function(e)
    _G.UZIVERT_GUN_AURA_ON = e
    CONFIG.GunAura = e
    guardarConfig()
end)

crearSlider(PaginaAura, "Rango Gun Aura", 5, 100, CONFIG.GunAuraRango or 25, function(v)
    _G.UZIVERT_GUN_AURA_RANGO = v
    CONFIG.GunAuraRango = v
    guardarConfig()
end)

crearBoton(PaginaAura, "Agarrar Gun Ahora", function()
    _G.UZIVERT_AGARRAR_GUN()
end, COLORES.Naranja1)

-- 🎯 SECCIÓN 1: MOVIMIENTO
_G.secJug1 = Instance.new("Frame")
_G.secJug1.Size = UDim2.new(1, 0, 0, 30)
_G.secJug1.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secJug1.BackgroundTransparency = 0.3
_G.secJug1.BorderSizePixel = 0
_G.secJug1.ZIndex = 2
_G.secJug1.Parent = PaginaPlayer

_G.cSecJug1 = Instance.new("UICorner")
_G.cSecJug1.CornerRadius = UDim.new(0, 7)
_G.cSecJug1.Parent = _G.secJug1

_G.sSecJug1 = Instance.new("UIStroke")
_G.sSecJug1.Color = COLORES.Morado3
_G.sSecJug1.Thickness = 1.5
_G.sSecJug1.Transparency = 0.2
_G.sSecJug1.Parent = _G.secJug1

_G.lblSecJug1 = Instance.new("TextLabel")
_G.lblSecJug1.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecJug1.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecJug1.BackgroundTransparency = 1
_G.lblSecJug1.Text = "🚀 MOVIMIENTO"
_G.lblSecJug1.TextColor3 = COLORES.Naranja2
_G.lblSecJug1.Font = Enum.Font.GothamBlack
_G.lblSecJug1.TextSize = 12
_G.lblSecJug1.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecJug1.ZIndex = 3
_G.lblSecJug1.Parent = _G.secJug1

if not _G.UZIVERT_GAMA_BAJA then
    crearSlider(PaginaPlayer, "Walkspeed", 16, 200, CONFIG.Walkspeed, function(v)
        WALKSPEED_VALOR = v
        CONFIG.Walkspeed = v
        guardarConfig()
    end)

    crearToggle(PaginaPlayer, "👻 Noclip", CONFIG.Noclip, function(e)
        NOCLIP_ACTIVO = e
        CONFIG.Noclip = e
        guardarConfig()
    end)

    crearToggle(PaginaPlayer, "🌀 Spinbot (Anti-Aim)", CONFIG.Spinbot, function(e)
        SPINBOT_ACTIVO = e
        CONFIG.Spinbot = e
        guardarConfig()
    end)
end

crearToggle(PaginaPlayer, "⚡ Speed Glitch (Shift Lock)", CONFIG.SpeedGlitch or false, function(e)
    _G.UZIVERT_SG_ON = e
    CONFIG.SpeedGlitch = e
    guardarConfig()
end)

crearSlider(PaginaPlayer, "Velocidad Speed Glitch", 1, 300, CONFIG.SpeedGlitchValor or 50, function(v)
    _G.UZIVERT_SG_VALOR = v
    CONFIG.SpeedGlitchValor = v
    guardarConfig()
end)

-- 🎯 SECCIÓN 2: DEFENSA (Anti-Fling + Invisibilidad → AMBAS)
_G.secJug2 = Instance.new("Frame")
_G.secJug2.Size = UDim2.new(1, 0, 0, 30)
_G.secJug2.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secJug2.BackgroundTransparency = 0.3
_G.secJug2.BorderSizePixel = 0
_G.secJug2.ZIndex = 2
_G.secJug2.Parent = PaginaPlayer

_G.cSecJug2 = Instance.new("UICorner")
_G.cSecJug2.CornerRadius = UDim.new(0, 7)
_G.cSecJug2.Parent = _G.secJug2

_G.sSecJug2 = Instance.new("UIStroke")
_G.sSecJug2.Color = COLORES.Morado3
_G.sSecJug2.Thickness = 1.5
_G.sSecJug2.Transparency = 0.2
_G.sSecJug2.Parent = _G.secJug2

_G.lblSecJug2 = Instance.new("TextLabel")
_G.lblSecJug2.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecJug2.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecJug2.BackgroundTransparency = 1
_G.lblSecJug2.Text = "🛡️ DEFENSA"
_G.lblSecJug2.TextColor3 = COLORES.Naranja2
_G.lblSecJug2.Font = Enum.Font.GothamBlack
_G.lblSecJug2.TextSize = 12
_G.lblSecJug2.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecJug2.ZIndex = 3
_G.lblSecJug2.Parent = _G.secJug2

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

crearToggle(PaginaPlayer, "👻 Activar Boton de Invisibilidad", false, function(e)
    if e then
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-FE-19153"))()
        end)
    end
end)

-- 🎯 SECCIÓN: ANTI-AIM
_G.secAntiAim = Instance.new("Frame")
_G.secAntiAim.Size = UDim2.new(1, 0, 0, 30)
_G.secAntiAim.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secAntiAim.BackgroundTransparency = 0.3
_G.secAntiAim.BorderSizePixel = 0
_G.secAntiAim.ZIndex = 2
_G.secAntiAim.Parent = PaginaPlayer

_G.cSecAntiAim = Instance.new("UICorner")
_G.cSecAntiAim.CornerRadius = UDim.new(0, 7)
_G.cSecAntiAim.Parent = _G.secAntiAim

_G.sSecAntiAim = Instance.new("UIStroke")
_G.sSecAntiAim.Color = COLORES.Morado3
_G.sSecAntiAim.Thickness = 1.5
_G.sSecAntiAim.Transparency = 0.2
_G.sSecAntiAim.Parent = _G.secAntiAim

_G.lblSecAntiAim = Instance.new("TextLabel")
_G.lblSecAntiAim.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecAntiAim.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecAntiAim.BackgroundTransparency = 1
_G.lblSecAntiAim.Text = "🎯 ANTI-AIM"
_G.lblSecAntiAim.TextColor3 = COLORES.Naranja2
_G.lblSecAntiAim.Font = Enum.Font.GothamBlack
_G.lblSecAntiAim.TextSize = 12
_G.lblSecAntiAim.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecAntiAim.ZIndex = 3
_G.lblSecAntiAim.Parent = _G.secAntiAim

-- Variables globales del Anti-Aim
_G.UZIVERT_AA_ON = false
_G.UZIVERT_AA_IGNORE = true
_G.UZIVERT_AA_CON = nil
_G.UZIVERT_AA_HAD_KNIFE = false
_G.UZIVERT_AA_SLOT1 = nil
_G.UZIVERT_AA_SLOT2 = nil
_G.UZIVERT_AA_SLOT3 = nil

-- Funciones auxiliares del Anti-Aim
_G.UZIVERT_AA_FIND = function(name)
    if not name or name == "None" then return nil end
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name == name then return p end
    end
    return nil
end

_G.UZIVERT_AA_HAS_KNIFE = function()
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    local character = LocalPlayer.Character
    if backpack and backpack:FindFirstChild("Knife") then return true end
    if character and character:FindFirstChild("Knife") then return true end
    return false
end

_G.UZIVERT_AA_NEARBY = function(hrp)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local otherHrp = player.Character.HumanoidRootPart
            if (otherHrp.Position - hrp.Position).Magnitude <= 6 then
                return true
            end
        end
    end
    return false
end

_G.UZIVERT_AA_WATER = function(humanoid)
    local state = humanoid:GetState()
    return state == Enum.HumanoidStateType.Swimming or humanoid.FloorMaterial == Enum.Material.Water
end

_G.UZIVERT_AA_IGNORED = function()
    if not _G.UZIVERT_AA_IGNORE then return false end
    local targets = {_G.UZIVERT_AA_SLOT1, _G.UZIVERT_AA_SLOT2, _G.UZIVERT_AA_SLOT3}
    for _, player in ipairs(targets) do
        if player and player.Parent then
            local backpack = player:FindFirstChild("Backpack")
            local character = player.Character
            if backpack then
                for _, item in ipairs(backpack:GetChildren()) do
                    if item:IsA("Tool") then return true end
                end
            end
            if character then
                for _, item in ipairs(character:GetChildren()) do
                    if item:IsA("Tool") then return true end
                end
            end
        end
    end
    return false
end

_G.UZIVERT_AA_ROLE_STEP = function(humanoid)
    task.spawn(function()
        local randomX = math.random() > 0.5 and 1 or -1
        local randomZ = math.random() > 0.5 and 1 or -1
        local moveDir = Vector3.new(randomX, 0, randomZ).Unit
        local startTime = tick()
        while tick() - startTime < 0.15 do
            if humanoid and humanoid.Parent then
                humanoid:Move(moveDir, false)
            end
            RunService.RenderStepped:Wait()
        end
    end)
end

_G.UZIVERT_AA_STOP = function()
    if _G.UZIVERT_AA_CON then
        _G.UZIVERT_AA_CON:Disconnect()
        _G.UZIVERT_AA_CON = nil
    end
    _G.UZIVERT_AA_HAD_KNIFE = false
end

_G.UZIVERT_AA_START = function()
    if _G.UZIVERT_AA_CON then return end
    
    _G.UZIVERT_AA_CON = RunService.Heartbeat:Connect(function()
        if _G.UZIVERT_AA_IGNORED() then return end

        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            if humanoid.Health > 0 then
                local hrp = character.HumanoidRootPart
                local currentlyHasKnife = _G.UZIVERT_AA_HAS_KNIFE()

                if currentlyHasKnife and not _G.UZIVERT_AA_HAD_KNIFE then
                    _G.UZIVERT_AA_ROLE_STEP(humanoid)
                end
                _G.UZIVERT_AA_HAD_KNIFE = currentlyHasKnife

                if currentlyHasKnife and not _G.UZIVERT_AA_NEARBY(hrp) and not _G.UZIVERT_AA_WATER(humanoid) then
                    local oldVelocity = hrp.AssemblyLinearVelocity
                    local state = humanoid:GetState()
                    local isJumping = (state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall)
                    local isStopped = (humanoid.MoveDirection.Magnitude == 0)
                    local multiplier = math.random(1, 2) == 1 and 320 or -320
                    
                    if isJumping then
                        local jumpMultY = math.random(1, 2) == 1 and 250 or -250
                        hrp.AssemblyLinearVelocity = Vector3.new(multiplier, jumpMultY, multiplier)
                    elseif isStopped then
                        local stopMult = math.random(1, 2) == 1 and 400 or -400
                        hrp.AssemblyLinearVelocity = Vector3.new(stopMult, 0, stopMult)
                    else
                        hrp.AssemblyLinearVelocity = Vector3.new(multiplier, 0, multiplier)
                    end
                    
                    RunService.RenderStepped:Wait()
                    hrp.AssemblyLinearVelocity = oldVelocity
                end
            end
        else
            _G.UZIVERT_AA_HAD_KNIFE = false
        end
    end)
end

LocalPlayer.CharacterAdded:Connect(function()
    _G.UZIVERT_AA_HAD_KNIFE = false
end)

-- 🎯 Toggle principal
crearToggle(PaginaPlayer, "🎯 Anti-Aim", CONFIG.AntiAim or false, function(e)
    _G.UZIVERT_AA_ON = e
    CONFIG.AntiAim = e
    guardarConfig()
    if e then
        _G.UZIVERT_AA_START()
    else
        _G.UZIVERT_AA_STOP()
    end
end)

-- 🎯 Toggle Ignore List
crearToggle(PaginaPlayer, "🛡️ Anti-Aim Ignore List", CONFIG.AntiAimIgnore or true, function(e)
    _G.UZIVERT_AA_IGNORE = e
    CONFIG.AntiAimIgnore = e
    guardarConfig()
end)

-- Función para armar dropdowns
_G.UZIVERT_AA_GET_LIST = function()
    local list = {"None"}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(list, p.Name)
        end
    end
    return list
end

-- Dropdowns de ignorados
_G.UZIVERT_AA_DD1 = Instance.new("TextButton")
_G.UZIVERT_AA_DD1.Size = UDim2.new(1, 0, 0, 38)
_G.UZIVERT_AA_DD1.BackgroundColor3 = COLORES.Morado3
_G.UZIVERT_AA_DD1.BackgroundTransparency = 0.5
_G.UZIVERT_AA_DD1.Text = "Ignorar 1: None ▼"
_G.UZIVERT_AA_DD1.TextColor3 = COLORES.Texto
_G.UZIVERT_AA_DD1.Font = Enum.Font.GothamBold
_G.UZIVERT_AA_DD1.TextSize = 11
_G.UZIVERT_AA_DD1.BorderSizePixel = 0
_G.UZIVERT_AA_DD1.ZIndex = 2
_G.UZIVERT_AA_DD1.Parent = PaginaPlayer

_G.cAADD1 = Instance.new("UICorner")
_G.cAADD1.CornerRadius = UDim.new(0, 8)
_G.cAADD1.Parent = _G.UZIVERT_AA_DD1

_G.UZIVERT_AA_DD1.MouseButton1Click:Connect(function()
    local list = _G.UZIVERT_AA_GET_LIST()
    local idx = table.find(list, _G.UZIVERT_AA_SLOT1 and _G.UZIVERT_AA_SLOT1.Name or "None")
    idx = (idx or 1) % #list + 1
    local newName = list[idx]
    _G.UZIVERT_AA_SLOT1 = _G.UZIVERT_AA_FIND(newName)
    _G.UZIVERT_AA_DD1.Text = "Ignorar 1: " .. newName .. " ▼"
    CONFIG.AntiAimSlot1 = newName
    guardarConfig()
end)

_G.UZIVERT_AA_DD2 = Instance.new("TextButton")
_G.UZIVERT_AA_DD2.Size = UDim2.new(1, 0, 0, 38)
_G.UZIVERT_AA_DD2.BackgroundColor3 = COLORES.Morado3
_G.UZIVERT_AA_DD2.BackgroundTransparency = 0.5
_G.UZIVERT_AA_DD2.Text = "Ignorar 2: None ▼"
_G.UZIVERT_AA_DD2.TextColor3 = COLORES.Texto
_G.UZIVERT_AA_DD2.Font = Enum.Font.GothamBold
_G.UZIVERT_AA_DD2.TextSize = 11
_G.UZIVERT_AA_DD2.BorderSizePixel = 0
_G.UZIVERT_AA_DD2.ZIndex = 2
_G.UZIVERT_AA_DD2.Parent = PaginaPlayer

_G.cAADD2 = Instance.new("UICorner")
_G.cAADD2.CornerRadius = UDim.new(0, 8)
_G.cAADD2.Parent = _G.UZIVERT_AA_DD2

_G.UZIVERT_AA_DD2.MouseButton1Click:Connect(function()
    local list = _G.UZIVERT_AA_GET_LIST()
    local idx = table.find(list, _G.UZIVERT_AA_SLOT2 and _G.UZIVERT_AA_SLOT2.Name or "None")
    idx = (idx or 1) % #list + 1
    local newName = list[idx]
    _G.UZIVERT_AA_SLOT2 = _G.UZIVERT_AA_FIND(newName)
    _G.UZIVERT_AA_DD2.Text = "Ignorar 2: " .. newName .. " ▼"
    CONFIG.AntiAimSlot2 = newName
    guardarConfig()
end)

_G.UZIVERT_AA_DD3 = Instance.new("TextButton")
_G.UZIVERT_AA_DD3.Size = UDim2.new(1, 0, 0, 38)
_G.UZIVERT_AA_DD3.BackgroundColor3 = COLORES.Morado3
_G.UZIVERT_AA_DD3.BackgroundTransparency = 0.5
_G.UZIVERT_AA_DD3.Text = "Ignorar 3: None ▼"
_G.UZIVERT_AA_DD3.TextColor3 = COLORES.Texto
_G.UZIVERT_AA_DD3.Font = Enum.Font.GothamBold
_G.UZIVERT_AA_DD3.TextSize = 11
_G.UZIVERT_AA_DD3.BorderSizePixel = 0
_G.UZIVERT_AA_DD3.ZIndex = 2
_G.UZIVERT_AA_DD3.Parent = PaginaPlayer

_G.cAADD3 = Instance.new("UICorner")
_G.cAADD3.CornerRadius = UDim.new(0, 8)
_G.cAADD3.Parent = _G.UZIVERT_AA_DD3

_G.UZIVERT_AA_DD3.MouseButton1Click:Connect(function()
    local list = _G.UZIVERT_AA_GET_LIST()
    local idx = table.find(list, _G.UZIVERT_AA_SLOT3 and _G.UZIVERT_AA_SLOT3.Name or "None")
    idx = (idx or 1) % #list + 1
    local newName = list[idx]
    _G.UZIVERT_AA_SLOT3 = _G.UZIVERT_AA_FIND(newName)
    _G.UZIVERT_AA_DD3.Text = "Ignorar 3: " .. newName .. " ▼"
    CONFIG.AntiAimSlot3 = newName
    guardarConfig()
end)

-- Restaurar valores guardados
if CONFIG.AntiAimSlot1 and CONFIG.AntiAimSlot1 ~= "None" then
    _G.UZIVERT_AA_SLOT1 = _G.UZIVERT_AA_FIND(CONFIG.AntiAimSlot1)
    _G.UZIVERT_AA_DD1.Text = "Ignorar 1: " .. CONFIG.AntiAimSlot1 .. " ▼"
end
if CONFIG.AntiAimSlot2 and CONFIG.AntiAimSlot2 ~= "None" then
    _G.UZIVERT_AA_SLOT2 = _G.UZIVERT_AA_FIND(CONFIG.AntiAimSlot2)
    _G.UZIVERT_AA_DD2.Text = "Ignorar 2: " .. CONFIG.AntiAimSlot2 .. " ▼"
end
if CONFIG.AntiAimSlot3 and CONFIG.AntiAimSlot3 ~= "None" then
    _G.UZIVERT_AA_SLOT3 = _G.UZIVERT_AA_FIND(CONFIG.AntiAimSlot3)
    _G.UZIVERT_AA_DD3.Text = "Ignorar 3: " .. CONFIG.AntiAimSlot3 .. " ▼"
end

-- Arrancar si estaba activo
if CONFIG.AntiAim then
    _G.UZIVERT_AA_ON = true
    task.wait(0.5)
    _G.UZIVERT_AA_START()
end

if not _G.UZIVERT_GAMA_BAJA then

-- 🎯 SECCIÓN 3: MUSIC PLAYER
_G.secJug3 = Instance.new("Frame")
_G.secJug3.Size = UDim2.new(1, 0, 0, 30)
_G.secJug3.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secJug3.BackgroundTransparency = 0.3
_G.secJug3.BorderSizePixel = 0
_G.secJug3.ZIndex = 2
_G.secJug3.Parent = PaginaPlayer

_G.cSecJug3 = Instance.new("UICorner")
_G.cSecJug3.CornerRadius = UDim.new(0, 7)
_G.cSecJug3.Parent = _G.secJug3

_G.sSecJug3 = Instance.new("UIStroke")
_G.sSecJug3.Color = COLORES.Morado3
_G.sSecJug3.Thickness = 1.5
_G.sSecJug3.Transparency = 0.2
_G.sSecJug3.Parent = _G.secJug3

_G.lblSecJug3 = Instance.new("TextLabel")
_G.lblSecJug3.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecJug3.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecJug3.BackgroundTransparency = 1
_G.lblSecJug3.Text = "🎧 MUSIC PLAYER"
_G.lblSecJug3.TextColor3 = COLORES.Naranja2
_G.lblSecJug3.Font = Enum.Font.GothamBlack
_G.lblSecJug3.TextSize = 12
_G.lblSecJug3.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecJug3.ZIndex = 3
_G.lblSecJug3.Parent = _G.secJug3

-- ============================================
-- 🎧 MUSIC PLAYER
-- ============================================
_G.UZIVERT_MUSIC_CANCIONES = {
    {Nombre = "Canción 1", ID = "84944985070181"},
    {Nombre = "Canción 2", ID = "87570666848900"},
    {Nombre = "Canción 3", ID = "82746224492420"},
    {Nombre = "Canción 4", ID = "71393805905055"},
    {Nombre = "Canción 5", ID = "75688616622595"},
    {Nombre = "Canción 6", ID = "135609653444873"},
    {Nombre = "Canción 7", ID = "93699644879957"},
    {Nombre = "Canción 8", ID = "110398343528156"},
    {Nombre = "Canción 9", ID = "138863509657081"},
    {Nombre = "Canción 10", ID = "115440201770223"},
    {Nombre = "Canción 11", ID = "128048502331483"},
    {Nombre = "Canción 12", ID = "135321902579514"},
    {Nombre = "Canción 13", ID = "131465489873214"},
}

if CONFIG.CancionesCustom then
    for _, c in ipairs(CONFIG.CancionesCustom) do
        table.insert(_G.UZIVERT_MUSIC_CANCIONES, c)
    end
end

_G.UZIVERT_MUSIC_INDEX = 1
_G.UZIVERT_MUSIC_SHUFFLE = false
_G.UZIVERT_MUSIC_REPEAT = false
_G.UZIVERT_MUSIC_VOLUMEN = CONFIG.MusicVolumen or 0.5

_G.UZIVERT_MUSIC_SOUND = Instance.new("Sound")
_G.UZIVERT_MUSIC_SOUND.Name = "UzivertMusicPlayer"
_G.UZIVERT_MUSIC_SOUND.Looped = false
_G.UZIVERT_MUSIC_SOUND.Volume = _G.UZIVERT_MUSIC_VOLUMEN
_G.UZIVERT_MUSIC_SOUND.Parent = game:GetService("SoundService")

_G.UZIVERT_MUSIC_LABEL = nil

_G.UZIVERT_MUSIC_PLAY = function(index)
    if not _G.UZIVERT_MUSIC_CANCIONES[index] then return end
    _G.UZIVERT_MUSIC_INDEX = index
    _G.UZIVERT_MUSIC_SOUND:Stop()
    _G.UZIVERT_MUSIC_SOUND.SoundId = "rbxassetid://" .. _G.UZIVERT_MUSIC_CANCIONES[index].ID
    _G.UZIVERT_MUSIC_SOUND:Play()
    if _G.UZIVERT_MUSIC_LABEL then
        _G.UZIVERT_MUSIC_LABEL.Text = "🎵 " .. _G.UZIVERT_MUSIC_CANCIONES[index].Nombre
    end
end

_G.UZIVERT_MUSIC_SIGUIENTE = function()
    if _G.UZIVERT_MUSIC_SHUFFLE then
        local n = _G.UZIVERT_MUSIC_INDEX
        while n == _G.UZIVERT_MUSIC_INDEX and #_G.UZIVERT_MUSIC_CANCIONES > 1 do
            n = math.random(1, #_G.UZIVERT_MUSIC_CANCIONES)
        end
        _G.UZIVERT_MUSIC_PLAY(n)
    else
        local n = _G.UZIVERT_MUSIC_INDEX + 1
        if n > #_G.UZIVERT_MUSIC_CANCIONES then n = 1 end
        _G.UZIVERT_MUSIC_PLAY(n)
    end
end

_G.UZIVERT_MUSIC_ANTERIOR = function()
    if _G.UZIVERT_MUSIC_SHUFFLE then
        local n = _G.UZIVERT_MUSIC_INDEX
        while n == _G.UZIVERT_MUSIC_INDEX and #_G.UZIVERT_MUSIC_CANCIONES > 1 do
            n = math.random(1, #_G.UZIVERT_MUSIC_CANCIONES)
        end
        _G.UZIVERT_MUSIC_PLAY(n)
    else
        local n = _G.UZIVERT_MUSIC_INDEX - 1
        if n < 1 then n = #_G.UZIVERT_MUSIC_CANCIONES end
        _G.UZIVERT_MUSIC_PLAY(n)
    end
end

_G.UZIVERT_MUSIC_SOUND.Ended:Connect(function()
    if _G.UZIVERT_MUSIC_REPEAT then
        _G.UZIVERT_MUSIC_PLAY(_G.UZIVERT_MUSIC_INDEX)
    else
        _G.UZIVERT_MUSIC_SIGUIENTE()
    end
end)

_G.UZIVERT_MUSIC_LABEL = Instance.new("TextLabel")
_G.UZIVERT_MUSIC_LABEL.Size = UDim2.new(1, 0, 0, 40)
_G.UZIVERT_MUSIC_LABEL.BackgroundColor3 = Color3.fromRGB(10, 5, 15)
_G.UZIVERT_MUSIC_LABEL.BackgroundTransparency = 0.3
_G.UZIVERT_MUSIC_LABEL.Text = "🎵 Sin canción"
_G.UZIVERT_MUSIC_LABEL.TextColor3 = COLORES.Texto
_G.UZIVERT_MUSIC_LABEL.Font = Enum.Font.GothamBold
_G.UZIVERT_MUSIC_LABEL.TextSize = 11
_G.UZIVERT_MUSIC_LABEL.TextWrapped = true
_G.UZIVERT_MUSIC_LABEL.ZIndex = 2
_G.UZIVERT_MUSIC_LABEL.Parent = PaginaPlayer

_G.cMusLabel = Instance.new("UICorner")
_G.cMusLabel.CornerRadius = UDim.new(0, 8)
_G.cMusLabel.Parent = _G.UZIVERT_MUSIC_LABEL

_G.musFilaPlay = Instance.new("Frame")
_G.musFilaPlay.Size = UDim2.new(1, 0, 0, 38)
_G.musFilaPlay.BackgroundTransparency = 1
_G.musFilaPlay.ZIndex = 2
_G.musFilaPlay.Parent = PaginaPlayer

_G.musLayoutPlay = Instance.new("UIListLayout")
_G.musLayoutPlay.FillDirection = Enum.FillDirection.Horizontal
_G.musLayoutPlay.Padding = UDim.new(0, 6)
_G.musLayoutPlay.SortOrder = Enum.SortOrder.LayoutOrder
_G.musLayoutPlay.Parent = _G.musFilaPlay

_G.UZIVERT_MUSIC_PLAYBTN = Instance.new("TextButton")
_G.UZIVERT_MUSIC_PLAYBTN.Size = UDim2.new(0.5, -3, 1, 0)
_G.UZIVERT_MUSIC_PLAYBTN.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
_G.UZIVERT_MUSIC_PLAYBTN.BackgroundTransparency = 0.3
_G.UZIVERT_MUSIC_PLAYBTN.Text = "▶ PLAY"
_G.UZIVERT_MUSIC_PLAYBTN.TextColor3 = COLORES.Texto
_G.UZIVERT_MUSIC_PLAYBTN.Font = Enum.Font.GothamBold
_G.UZIVERT_MUSIC_PLAYBTN.TextSize = 12
_G.UZIVERT_MUSIC_PLAYBTN.BorderSizePixel = 0
_G.UZIVERT_MUSIC_PLAYBTN.LayoutOrder = 1
_G.UZIVERT_MUSIC_PLAYBTN.ZIndex = 2
_G.UZIVERT_MUSIC_PLAYBTN.Parent = _G.musFilaPlay

_G.cMusPlay = Instance.new("UICorner")
_G.cMusPlay.CornerRadius = UDim.new(0, 9)
_G.cMusPlay.Parent = _G.UZIVERT_MUSIC_PLAYBTN

_G.UZIVERT_MUSIC_PLAYBTN.MouseButton1Click:Connect(function()
    if _G.UZIVERT_MUSIC_SOUND.Playing then
        _G.UZIVERT_MUSIC_SOUND:Pause()
        _G.UZIVERT_MUSIC_PLAYBTN.Text = "▶ PLAY"
    else
        if _G.UZIVERT_MUSIC_SOUND.SoundId == "" then
            _G.UZIVERT_MUSIC_PLAY(_G.UZIVERT_MUSIC_INDEX)
        else
            _G.UZIVERT_MUSIC_SOUND:Resume()
        end
        _G.UZIVERT_MUSIC_PLAYBTN.Text = "⏸ PAUSE"
    end
end)

_G.UZIVERT_MUSIC_STOPBTN = Instance.new("TextButton")
_G.UZIVERT_MUSIC_STOPBTN.Size = UDim2.new(0.5, -3, 1, 0)
_G.UZIVERT_MUSIC_STOPBTN.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
_G.UZIVERT_MUSIC_STOPBTN.BackgroundTransparency = 0.3
_G.UZIVERT_MUSIC_STOPBTN.Text = "⏹ STOP"
_G.UZIVERT_MUSIC_STOPBTN.TextColor3 = COLORES.Texto
_G.UZIVERT_MUSIC_STOPBTN.Font = Enum.Font.GothamBold
_G.UZIVERT_MUSIC_STOPBTN.TextSize = 12
_G.UZIVERT_MUSIC_STOPBTN.BorderSizePixel = 0
_G.UZIVERT_MUSIC_STOPBTN.LayoutOrder = 2
_G.UZIVERT_MUSIC_STOPBTN.ZIndex = 2
_G.UZIVERT_MUSIC_STOPBTN.Parent = _G.musFilaPlay

_G.cMusStop = Instance.new("UICorner")
_G.cMusStop.CornerRadius = UDim.new(0, 9)
_G.cMusStop.Parent = _G.UZIVERT_MUSIC_STOPBTN

_G.UZIVERT_MUSIC_STOPBTN.MouseButton1Click:Connect(function()
    _G.UZIVERT_MUSIC_SOUND:Stop()
    _G.UZIVERT_MUSIC_SOUND.SoundId = ""
    _G.UZIVERT_MUSIC_PLAYBTN.Text = "▶ PLAY"
    _G.UZIVERT_MUSIC_LABEL.Text = "🎵 Sin canción"
end)

_G.musFilaNav = Instance.new("Frame")
_G.musFilaNav.Size = UDim2.new(1, 0, 0, 38)
_G.musFilaNav.BackgroundTransparency = 1
_G.musFilaNav.ZIndex = 2
_G.musFilaNav.Parent = PaginaPlayer

_G.musLayoutNav = Instance.new("UIListLayout")
_G.musLayoutNav.FillDirection = Enum.FillDirection.Horizontal
_G.musLayoutNav.Padding = UDim.new(0, 6)
_G.musLayoutNav.SortOrder = Enum.SortOrder.LayoutOrder
_G.musLayoutNav.Parent = _G.musFilaNav

_G.UZIVERT_MUSIC_ANTBTN = Instance.new("TextButton")
_G.UZIVERT_MUSIC_ANTBTN.Size = UDim2.new(0.5, -3, 1, 0)
_G.UZIVERT_MUSIC_ANTBTN.BackgroundColor3 = COLORES.Morado1
_G.UZIVERT_MUSIC_ANTBTN.BackgroundTransparency = 0.3
_G.UZIVERT_MUSIC_ANTBTN.Text = "◀◀ ANT"
_G.UZIVERT_MUSIC_ANTBTN.TextColor3 = COLORES.Texto
_G.UZIVERT_MUSIC_ANTBTN.Font = Enum.Font.GothamBold
_G.UZIVERT_MUSIC_ANTBTN.TextSize = 12
_G.UZIVERT_MUSIC_ANTBTN.BorderSizePixel = 0
_G.UZIVERT_MUSIC_ANTBTN.LayoutOrder = 1
_G.UZIVERT_MUSIC_ANTBTN.ZIndex = 2
_G.UZIVERT_MUSIC_ANTBTN.Parent = _G.musFilaNav

_G.cMusAnt = Instance.new("UICorner")
_G.cMusAnt.CornerRadius = UDim.new(0, 9)
_G.cMusAnt.Parent = _G.UZIVERT_MUSIC_ANTBTN

_G.UZIVERT_MUSIC_ANTBTN.MouseButton1Click:Connect(function()
    _G.UZIVERT_MUSIC_ANTERIOR()
end)

_G.UZIVERT_MUSIC_SIGBTN = Instance.new("TextButton")
_G.UZIVERT_MUSIC_SIGBTN.Size = UDim2.new(0.5, -3, 1, 0)
_G.UZIVERT_MUSIC_SIGBTN.BackgroundColor3 = COLORES.Morado1
_G.UZIVERT_MUSIC_SIGBTN.BackgroundTransparency = 0.3
_G.UZIVERT_MUSIC_SIGBTN.Text = "SIG ▶▶"
_G.UZIVERT_MUSIC_SIGBTN.TextColor3 = COLORES.Texto
_G.UZIVERT_MUSIC_SIGBTN.Font = Enum.Font.GothamBold
_G.UZIVERT_MUSIC_SIGBTN.TextSize = 12
_G.UZIVERT_MUSIC_SIGBTN.BorderSizePixel = 0
_G.UZIVERT_MUSIC_SIGBTN.LayoutOrder = 2
_G.UZIVERT_MUSIC_SIGBTN.ZIndex = 2
_G.UZIVERT_MUSIC_SIGBTN.Parent = _G.musFilaNav

_G.cMusSig = Instance.new("UICorner")
_G.cMusSig.CornerRadius = UDim.new(0, 9)
_G.cMusSig.Parent = _G.UZIVERT_MUSIC_SIGBTN

_G.UZIVERT_MUSIC_SIGBTN.MouseButton1Click:Connect(function()
    _G.UZIVERT_MUSIC_SIGUIENTE()
end)

crearToggle(PaginaPlayer, "?? Shuffle (aleatorio)", false, function(e)
    _G.UZIVERT_MUSIC_SHUFFLE = e
end)

crearToggle(PaginaPlayer, "🔁 Repeat (repetir)", false, function(e)
    _G.UZIVERT_MUSIC_REPEAT = e
    _G.UZIVERT_MUSIC_SOUND.Looped = e
end)

crearSlider(PaginaPlayer, "🔊 Volumen", 0, 100, math.floor(_G.UZIVERT_MUSIC_VOLUMEN * 100), function(v)
    _G.UZIVERT_MUSIC_VOLUMEN = v / 100
    _G.UZIVERT_MUSIC_SOUND.Volume = _G.UZIVERT_MUSIC_VOLUMEN
    CONFIG.MusicVolumen = _G.UZIVERT_MUSIC_VOLUMEN
    guardarConfig()
end)

crearBoton(PaginaPlayer, "📋 Elegir Canción", function()
    _G.UZIVERT_MUSIC_LISTA.Visible = not _G.UZIVERT_MUSIC_LISTA.Visible
end, COLORES.Morado1)

_G.UZIVERT_MUSIC_LISTA = Instance.new("Frame")
_G.UZIVERT_MUSIC_LISTA.Size = UDim2.new(1, 0, 0, 200)
_G.UZIVERT_MUSIC_LISTA.BackgroundColor3 = Color3.fromRGB(15, 10, 20)
_G.UZIVERT_MUSIC_LISTA.BackgroundTransparency = 0.1
_G.UZIVERT_MUSIC_LISTA.BorderSizePixel = 0
_G.UZIVERT_MUSIC_LISTA.Visible = false
_G.UZIVERT_MUSIC_LISTA.ZIndex = 10
_G.UZIVERT_MUSIC_LISTA.Parent = PaginaPlayer

_G.cMusListaF = Instance.new("UICorner")
_G.cMusListaF.CornerRadius = UDim.new(0, 9)
_G.cMusListaF.Parent = _G.UZIVERT_MUSIC_LISTA

_G.UZIVERT_MUSIC_LISTA_SCROLL = Instance.new("ScrollingFrame")
_G.UZIVERT_MUSIC_LISTA_SCROLL.Size = UDim2.new(1, 0, 1, 0)
_G.UZIVERT_MUSIC_LISTA_SCROLL.BackgroundTransparency = 1
_G.UZIVERT_MUSIC_LISTA_SCROLL.BorderSizePixel = 0
_G.UZIVERT_MUSIC_LISTA_SCROLL.ScrollBarThickness = 3
_G.UZIVERT_MUSIC_LISTA_SCROLL.CanvasSize = UDim2.new(0, 0, 0, 0)
_G.UZIVERT_MUSIC_LISTA_SCROLL.AutomaticCanvasSize = Enum.AutomaticSize.Y
_G.UZIVERT_MUSIC_LISTA_SCROLL.ZIndex = 11
_G.UZIVERT_MUSIC_LISTA_SCROLL.Parent = _G.UZIVERT_MUSIC_LISTA

_G.UZIVERT_MUSIC_LISTA_LAYOUT = Instance.new("UIListLayout")
_G.UZIVERT_MUSIC_LISTA_LAYOUT.Padding = UDim.new(0, 3)
_G.UZIVERT_MUSIC_LISTA_LAYOUT.Parent = _G.UZIVERT_MUSIC_LISTA_SCROLL

_G.UZIVERT_MUSIC_RECARGAR_LISTA = function()
    for _, child in ipairs(_G.UZIVERT_MUSIC_LISTA_SCROLL:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    for i, c in ipairs(_G.UZIVERT_MUSIC_CANCIONES) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -8, 0, 30)
        btn.BackgroundColor3 = Color3.fromRGB(40, 20, 50)
        btn.BackgroundTransparency = 0.4
        btn.Text = "🎵 " .. c.Nombre
        btn.TextColor3 = COLORES.Texto
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 10
        btn.TextXAlignment = Enum.TextXAlignment.Left
        btn.BorderSizePixel = 0
        btn.ZIndex = 12
        btn.Parent = _G.UZIVERT_MUSIC_LISTA_SCROLL
        local cBtn = Instance.new("UICorner")
        cBtn.CornerRadius = UDim.new(0, 5)
        cBtn.Parent = btn
        btn.MouseButton1Click:Connect(function()
            _G.UZIVERT_MUSIC_PLAY(i)
            _G.UZIVERT_MUSIC_LISTA.Visible = false
            _G.UZIVERT_MUSIC_PLAYBTN.Text = "⏸ PAUSE"
        end)
    end
end

_G.UZIVERT_MUSIC_RECARGAR_LISTA()

_G.UZIVERT_MUSIC_NOMBRE = ""
_G.UZIVERT_MUSIC_ID = ""

_G.secMusAdd = Instance.new("Frame")
_G.secMusAdd.Size = UDim2.new(1, 0, 0, 30)
_G.secMusAdd.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secMusAdd.BackgroundTransparency = 0.3
_G.secMusAdd.BorderSizePixel = 0
_G.secMusAdd.ZIndex = 2
_G.secMusAdd.Parent = PaginaPlayer

_G.cSecMusAdd = Instance.new("UICorner")
_G.cSecMusAdd.CornerRadius = UDim.new(0, 7)
_G.cSecMusAdd.Parent = _G.secMusAdd

_G.sSecMusAdd = Instance.new("UIStroke")
_G.sSecMusAdd.Color = COLORES.Morado3
_G.sSecMusAdd.Thickness = 1.5
_G.sSecMusAdd.Transparency = 0.2
_G.sSecMusAdd.Parent = _G.secMusAdd

_G.lblSecMusAdd = Instance.new("TextLabel")
_G.lblSecMusAdd.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecMusAdd.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecMusAdd.BackgroundTransparency = 1
_G.lblSecMusAdd.Text = "➕ AGREGAR CANCIÓN"
_G.lblSecMusAdd.TextColor3 = COLORES.Naranja2
_G.lblSecMusAdd.Font = Enum.Font.GothamBlack
_G.lblSecMusAdd.TextSize = 12
_G.lblSecMusAdd.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecMusAdd.ZIndex = 3
_G.lblSecMusAdd.Parent = _G.secMusAdd

_G.UZIVERT_MUSIC_INP_NOMBRE = Instance.new("TextBox")
_G.UZIVERT_MUSIC_INP_NOMBRE.Size = UDim2.new(1, 0, 0, 38)
_G.UZIVERT_MUSIC_INP_NOMBRE.BackgroundColor3 = COLORES.Morado3
_G.UZIVERT_MUSIC_INP_NOMBRE.BackgroundTransparency = 0.5
_G.UZIVERT_MUSIC_INP_NOMBRE.PlaceholderText = "Nombre de la canción"
_G.UZIVERT_MUSIC_INP_NOMBRE.Text = ""
_G.UZIVERT_MUSIC_INP_NOMBRE.TextColor3 = COLORES.Texto
_G.UZIVERT_MUSIC_INP_NOMBRE.PlaceholderColor3 = COLORES.Sub
_G.UZIVERT_MUSIC_INP_NOMBRE.Font = Enum.Font.GothamBold
_G.UZIVERT_MUSIC_INP_NOMBRE.TextSize = 11
_G.UZIVERT_MUSIC_INP_NOMBRE.BorderSizePixel = 0
_G.UZIVERT_MUSIC_INP_NOMBRE.ZIndex = 2
_G.UZIVERT_MUSIC_INP_NOMBRE.Parent = PaginaPlayer

_G.cMusInpNom = Instance.new("UICorner")
_G.cMusInpNom.CornerRadius = UDim.new(0, 9)
_G.cMusInpNom.Parent = _G.UZIVERT_MUSIC_INP_NOMBRE

_G.sMusInpNom = Instance.new("UIStroke")
_G.sMusInpNom.Color = COLORES.Naranja1
_G.sMusInpNom.Thickness = 1
_G.sMusInpNom.Transparency = 0.4
_G.sMusInpNom.Parent = _G.UZIVERT_MUSIC_INP_NOMBRE

_G.UZIVERT_MUSIC_INP_NOMBRE.FocusLost:Connect(function()
    _G.UZIVERT_MUSIC_NOMBRE = _G.UZIVERT_MUSIC_INP_NOMBRE.Text
end)

_G.UZIVERT_MUSIC_INP_ID = Instance.new("TextBox")
_G.UZIVERT_MUSIC_INP_ID.Size = UDim2.new(1, 0, 0, 38)
_G.UZIVERT_MUSIC_INP_ID.BackgroundColor3 = COLORES.Morado3
_G.UZIVERT_MUSIC_INP_ID.BackgroundTransparency = 0.5
_G.UZIVERT_MUSIC_INP_ID.PlaceholderText = "Roblox ID (ej: 1234567890)"
_G.UZIVERT_MUSIC_INP_ID.Text = ""
_G.UZIVERT_MUSIC_INP_ID.TextColor3 = COLORES.Texto
_G.UZIVERT_MUSIC_INP_ID.PlaceholderColor3 = COLORES.Sub
_G.UZIVERT_MUSIC_INP_ID.Font = Enum.Font.GothamBold
_G.UZIVERT_MUSIC_INP_ID.TextSize = 11
_G.UZIVERT_MUSIC_INP_ID.BorderSizePixel = 0
_G.UZIVERT_MUSIC_INP_ID.ZIndex = 2
_G.UZIVERT_MUSIC_INP_ID.Parent = PaginaPlayer

_G.cMusInpID = Instance.new("UICorner")
_G.cMusInpID.CornerRadius = UDim.new(0, 9)
_G.cMusInpID.Parent = _G.UZIVERT_MUSIC_INP_ID

_G.sMusInpID = Instance.new("UIStroke")
_G.sMusInpID.Color = COLORES.Naranja1
_G.sMusInpID.Thickness = 1
_G.sMusInpID.Transparency = 0.4
_G.sMusInpID.Parent = _G.UZIVERT_MUSIC_INP_ID

_G.UZIVERT_MUSIC_INP_ID.FocusLost:Connect(function()
    _G.UZIVERT_MUSIC_ID = _G.UZIVERT_MUSIC_INP_ID.Text
end)

crearBoton(PaginaPlayer, "➕ Añadir Canción", function()
    if _G.UZIVERT_MUSIC_NOMBRE == "" or _G.UZIVERT_MUSIC_ID == "" then
        print("❌ Completá nombre e ID")
        return
    end
    
    local customCount = #_G.UZIVERT_MUSIC_CANCIONES - 13
    if customCount >= 25 then
        print("❌ Lista llena (máximo 25 custom)")
        return
    end
    
    for _, c in ipairs(_G.UZIVERT_MUSIC_CANCIONES) do
        if tostring(c.ID) == tostring(_G.UZIVERT_MUSIC_ID) then
            print("❌ Esa canción ya existe")
            return
        end
    end
    
    local nueva = {Nombre = _G.UZIVERT_MUSIC_NOMBRE, ID = _G.UZIVERT_MUSIC_ID}
    table.insert(_G.UZIVERT_MUSIC_CANCIONES, nueva)
    
    if not CONFIG.CancionesCustom then CONFIG.CancionesCustom = {} end
    table.insert(CONFIG.CancionesCustom, nueva)
    guardarConfig()
    
    _G.UZIVERT_MUSIC_RECARGAR_LISTA()
    
    _G.UZIVERT_MUSIC_INP_NOMBRE.Text = ""
    _G.UZIVERT_MUSIC_INP_ID.Text = ""
    _G.UZIVERT_MUSIC_NOMBRE = ""
    _G.UZIVERT_MUSIC_ID = ""
    
    print("✅ Canción agregada: " .. nueva.Nombre)
end, COLORES.Verde)

crearBoton(PaginaPlayer, "🗑️ Vaciar Lista Custom", function()
    while #_G.UZIVERT_MUSIC_CANCIONES > 13 do
        table.remove(_G.UZIVERT_MUSIC_CANCIONES)
    end
    CONFIG.CancionesCustom = {}
    guardarConfig()
    _G.UZIVERT_MUSIC_RECARGAR_LISTA()
    print("✅ Lista custom vaciada")
end, COLORES.Rojo)

end

if not _G.UZIVERT_GAMA_BAJA then

-- 🎯 SECCIÓN 1: FLING ROLES
_G.secFling1 = Instance.new("Frame")
_G.secFling1.Size = UDim2.new(1, 0, 0, 30)
_G.secFling1.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secFling1.BackgroundTransparency = 0.3
_G.secFling1.BorderSizePixel = 0
_G.secFling1.ZIndex = 2
_G.secFling1.Parent = PaginaFling

_G.cSecFling1 = Instance.new("UICorner")
_G.cSecFling1.CornerRadius = UDim.new(0, 7)
_G.cSecFling1.Parent = _G.secFling1

_G.sSecFling1 = Instance.new("UIStroke")
_G.sSecFling1.Color = COLORES.Morado3
_G.sSecFling1.Thickness = 1.5
_G.sSecFling1.Transparency = 0.2
_G.sSecFling1.Parent = _G.secFling1

_G.lblSecFling1 = Instance.new("TextLabel")
_G.lblSecFling1.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecFling1.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecFling1.BackgroundTransparency = 1
_G.lblSecFling1.Text = "🎯 FLING ROLES"
_G.lblSecFling1.TextColor3 = COLORES.Naranja2
_G.lblSecFling1.Font = Enum.Font.GothamBlack
_G.lblSecFling1.TextSize = 12
_G.lblSecFling1.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecFling1.ZIndex = 3
_G.lblSecFling1.Parent = _G.secFling1

crearBoton(PaginaFling, "🌀 FLING MURDERER", function()
    IniciarFling("Murderer")
end, Color3.fromRGB(20, 15, 25))

crearBoton(PaginaFling, "🌀 FLING SHERIFF", function()
    IniciarFling("Sheriff")
end, Color3.fromRGB(20, 15, 25))

crearBoton(PaginaFling, "🌀 FLING ALL", function()
    IniciarFling("all")
end, Color3.fromRGB(20, 15, 25))

crearBoton(PaginaFling, "⛔ DETENER FLING", function()
    StopFling()
end, Color3.fromRGB(20, 15, 25))

-- 🎯 SECCIÓN 2: FLING PLAYER
_G.secFling2 = Instance.new("Frame")
_G.secFling2.Size = UDim2.new(1, 0, 0, 30)
_G.secFling2.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secFling2.BackgroundTransparency = 0.3
_G.secFling2.BorderSizePixel = 0
_G.secFling2.ZIndex = 2
_G.secFling2.Parent = PaginaFling

_G.cSecFling2 = Instance.new("UICorner")
_G.cSecFling2.CornerRadius = UDim.new(0, 7)
_G.cSecFling2.Parent = _G.secFling2

_G.sSecFling2 = Instance.new("UIStroke")
_G.sSecFling2.Color = COLORES.Morado3
_G.sSecFling2.Thickness = 1.5
_G.sSecFling2.Transparency = 0.2
_G.sSecFling2.Parent = _G.secFling2

_G.lblSecFling2 = Instance.new("TextLabel")
_G.lblSecFling2.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecFling2.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecFling2.BackgroundTransparency = 1
_G.lblSecFling2.Text = "🌀 FLING PLAYER"
_G.lblSecFling2.TextColor3 = COLORES.Naranja2
_G.lblSecFling2.Font = Enum.Font.GothamBlack
_G.lblSecFling2.TextSize = 12
_G.lblSecFling2.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecFling2.ZIndex = 3
_G.lblSecFling2.Parent = _G.secFling2

_G.UZIVERT_FLING_DD_BTN = Instance.new("TextButton")
_G.UZIVERT_FLING_DD_BTN.Size = UDim2.new(1, 0, 0, 42)
_G.UZIVERT_FLING_DD_BTN.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
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
_G.UZIVERT_FLING_DD_S.Color = COLORES.Morado3
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
_G.UZIVERT_FLING_DD_LS.Color = COLORES.Morado3
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
end, Color3.fromRGB(20, 15, 25))

end

print("🎃 Parte 7/10 cargada - Páginas Aim/Aura/Player/Fling")


    

if not _G.UZIVERT_GAMA_BAJA then

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

end

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

-- 🎯 SECCIÓN: BOMB JUMP
_G.secBomb = Instance.new("Frame")
_G.secBomb.Size = UDim2.new(1, 0, 0, 30)
_G.secBomb.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secBomb.BackgroundTransparency = 0.3
_G.secBomb.BorderSizePixel = 0
_G.secBomb.ZIndex = 2
_G.secBomb.Parent = PaginaBomb

_G.cSecBomb = Instance.new("UICorner")
_G.cSecBomb.CornerRadius = UDim.new(0, 7)
_G.cSecBomb.Parent = _G.secBomb

_G.sSecBomb = Instance.new("UIStroke")
_G.sSecBomb.Color = COLORES.Morado3
_G.sSecBomb.Thickness = 1.5
_G.sSecBomb.Transparency = 0.2
_G.sSecBomb.Parent = _G.secBomb

_G.lblSecBomb = Instance.new("TextLabel")
_G.lblSecBomb.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecBomb.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecBomb.BackgroundTransparency = 1
_G.lblSecBomb.Text = "AUTO BOMB JUMP"
_G.lblSecBomb.TextColor3 = COLORES.Naranja2
_G.lblSecBomb.Font = Enum.Font.GothamBlack
_G.lblSecBomb.TextSize = 12
_G.lblSecBomb.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecBomb.ZIndex = 3
_G.lblSecBomb.Parent = _G.secBomb

crearToggle(PaginaBomb, "Auto Bomb Jump", CONFIG.AutoPrankBomb or false, function(e)
    AUTO_PRANK_BOMB_ACTIVO = e
    CONFIG.AutoPrankBomb = e
    guardarConfig()
    ApplyAutoPrankBomb(e)
end)

-- 🎯 SECCIÓN: FIREFLY CLUTCH
_G.secFF = Instance.new("Frame")
_G.secFF.Size = UDim2.new(1, 0, 0, 30)
_G.secFF.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secFF.BackgroundTransparency = 0.3
_G.secFF.BorderSizePixel = 0
_G.secFF.ZIndex = 2
_G.secFF.Parent = PaginaBomb

_G.cSecFF = Instance.new("UICorner")
_G.cSecFF.CornerRadius = UDim.new(0, 7)
_G.cSecFF.Parent = _G.secFF

_G.sSecFF = Instance.new("UIStroke")
_G.sSecFF.Color = COLORES.Morado3
_G.sSecFF.Thickness = 1.5
_G.sSecFF.Transparency = 0.2
_G.sSecFF.Parent = _G.secFF

_G.lblSecFF = Instance.new("TextLabel")
_G.lblSecFF.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecFF.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecFF.BackgroundTransparency = 1
_G.lblSecFF.Text = "🔥 FIREFLY CLUTCH"
_G.lblSecFF.TextColor3 = COLORES.Naranja2
_G.lblSecFF.Font = Enum.Font.GothamBlack
_G.lblSecFF.TextSize = 12
_G.lblSecFF.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecFF.ZIndex = 3
_G.lblSecFF.Parent = _G.secFF

-- Variables globales Firefly
_G.UZIVERT_FF_ON = CONFIG.FireflyClutch or false
_G.UZIVERT_FF_TIMER = CONFIG.FireflyTimer ~= false
_G.UZIVERT_FF_SIZE = CONFIG.FireflyTimerSize or 5
_G.UZIVERT_FF_HOOKED = setmetatable({}, {__mode = "k"})
_G.UZIVERT_FF_CONNS = {}
_G.UZIVERT_FF_COOLDOWN = false
_G.UZIVERT_FF_TOKEN = 0
_G.UZIVERT_FF_COUNTDOWN_CON = nil
_G.UZIVERT_FF_COOLDOWN_CON = nil
_G.UZIVERT_FF_BLOCK_CON = nil
_G.UZIVERT_FF_COUNTDOWN_REM = nil
_G.UZIVERT_FF_COOLDOWN_END = nil
_G.UZIVERT_FF_LABEL = nil

local FF_COUNTDOWN = 3.0
local FF_COOLDOWN = 16
local FF_TRIGGER = 0.24
local FF_JUMP_GAP = 0.40
local FF_GREEN = Color3.fromRGB(0, 255, 0)
local FF_YELLOW = Color3.fromRGB(255, 200, 0)
local FF_RED = Color3.fromRGB(255, 0, 0)
local FF_BLACK = Color3.fromRGB(0, 0, 0)

_G.UZIVERT_FF_COLOR = function(remaining, total)
    total = math.max(tonumber(total) or 1, 0.001)
    local ratio = math.clamp((tonumber(remaining) or 0) / total, 0, 1)
    if ratio >= (2/3) then return FF_GREEN end
    if ratio >= (1/3) then return FF_YELLOW end
    return FF_RED
end

_G.UZIVERT_FF_UPDATE = function()
    if not _G.UZIVERT_FF_LABEL then return end
    _G.UZIVERT_FF_LABEL.Visible = _G.UZIVERT_FF_TIMER
    if not _G.UZIVERT_FF_TIMER then return end

    local now = os.clock()
    local remaining, total
    if _G.UZIVERT_FF_COUNTDOWN_REM and _G.UZIVERT_FF_COUNTDOWN_REM > 0 then
        remaining, total = _G.UZIVERT_FF_COUNTDOWN_REM, FF_COUNTDOWN
    elseif _G.UZIVERT_FF_COOLDOWN_END and now < _G.UZIVERT_FF_COOLDOWN_END then
        remaining, total = _G.UZIVERT_FF_COOLDOWN_END - now, FF_COOLDOWN
    end

    if remaining then
        _G.UZIVERT_FF_LABEL.Text = string.format("%.1fCD", math.max(0, remaining))
        _G.UZIVERT_FF_LABEL.TextColor3 = _G.UZIVERT_FF_COLOR(remaining, total)
    else
        _G.UZIVERT_FF_LABEL.Text = "Ready"
        _G.UZIVERT_FF_LABEL.TextColor3 = FF_BLACK
    end
end

_G.UZIVERT_FF_DISCONNECT = function(conn)
    if conn then pcall(function() conn:Disconnect() end) end
end

_G.UZIVERT_FF_OWNS = function(tool)
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    return (LocalPlayer.Character and tool.Parent == LocalPlayer.Character)
        or (backpack and tool.Parent == backpack) or false
end

_G.UZIVERT_FF_BLOCK_ONE = function(tool, state)
    if not _G.UZIVERT_FF_ON or not _G.UZIVERT_FF_COOLDOWN then return end
    state.blocked = true
    if tool.Enabled then pcall(function() tool.Enabled = false end) end
end

_G.UZIVERT_FF_BLOCK_ALL = function()
    for tool, state in pairs(_G.UZIVERT_FF_HOOKED) do _G.UZIVERT_FF_BLOCK_ONE(tool, state) end
end

_G.UZIVERT_FF_RELEASE = function()
    for tool, state in pairs(_G.UZIVERT_FF_HOOKED) do
        if state.blocked then
            state.blocked = false
            pcall(function()
                if not tool.Enabled then tool.Enabled = state.originalEnabled end
            end)
        end
    end
end

_G.UZIVERT_FF_BUILD = function()
    if _G.UZIVERT_FF_LABEL and _G.UZIVERT_FF_LABEL.Parent then return end

    _G.UZIVERT_FF_GUI = Instance.new("ScreenGui")
    _G.UZIVERT_FF_GUI.Name = "UzivertFireflyTimer"
    _G.UZIVERT_FF_GUI.ResetOnSpawn = false
    _G.UZIVERT_FF_GUI.IgnoreGuiInset = true
    _G.UZIVERT_FF_GUI.Parent = LocalPlayer:WaitForChild("PlayerGui")

    _G.UZIVERT_FF_LABEL = Instance.new("TextLabel")
    _G.UZIVERT_FF_LABEL.Name = "FireflyTimer"
    _G.UZIVERT_FF_LABEL.AnchorPoint = Vector2.new(0.5, 0.5)
    _G.UZIVERT_FF_LABEL.Position = UDim2.new(0.5, 0, 0.05, 0)
    _G.UZIVERT_FF_LABEL.BackgroundTransparency = 1
    _G.UZIVERT_FF_LABEL.BorderSizePixel = 0
    _G.UZIVERT_FF_LABEL.TextColor3 = Color3.new(0, 0, 0)
    _G.UZIVERT_FF_LABEL.TextStrokeTransparency = 1
    _G.UZIVERT_FF_LABEL.Font = Enum.Font.GothamBold
    _G.UZIVERT_FF_LABEL.Text = "Ready"
    _G.UZIVERT_FF_LABEL.Visible = _G.UZIVERT_FF_TIMER
    _G.UZIVERT_FF_LABEL.Active = true

    local w = 72 + ((_G.UZIVERT_FF_SIZE - 1) * 8)
    local h = 24 + ((_G.UZIVERT_FF_SIZE - 1) * 2)
    _G.UZIVERT_FF_LABEL.Size = UDim2.fromOffset(w, h)
    _G.UZIVERT_FF_LABEL.TextSize = math.max(12, math.floor(h * 0.65))

    _G.UZIVERT_FF_LABEL.Parent = _G.UZIVERT_FF_GUI
    _G.UZIVERT_FF_UPDATE()
end

_G.UZIVERT_FF_JUMP = function()
    local char = LocalPlayer.Character
    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return end
    humanoid.Jump = true
    pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end)
end

_G.UZIVERT_FF_TWO_JUMP = function(myToken)
    _G.UZIVERT_FF_JUMP()
    task.delay(FF_JUMP_GAP, function()
        if _G.UZIVERT_FF_ON and myToken == _G.UZIVERT_FF_TOKEN then
            _G.UZIVERT_FF_JUMP()
        end
    end)
end

_G.UZIVERT_FF_STOP = function()
    _G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COUNTDOWN_CON)
    _G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COOLDOWN_CON)
    _G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_BLOCK_CON)
    _G.UZIVERT_FF_COUNTDOWN_CON = nil
    _G.UZIVERT_FF_COOLDOWN_CON = nil
    _G.UZIVERT_FF_BLOCK_CON = nil
    _G.UZIVERT_FF_TOKEN = _G.UZIVERT_FF_TOKEN + 1
    _G.UZIVERT_FF_COOLDOWN = false
    _G.UZIVERT_FF_RELEASE()
    _G.UZIVERT_FF_COUNTDOWN_REM = nil
    _G.UZIVERT_FF_COOLDOWN_END = nil
    _G.UZIVERT_FF_UPDATE()
end

_G.UZIVERT_FF_START_COUNTDOWN = function()
    if not _G.UZIVERT_FF_ON then return end
    _G.UZIVERT_FF_BUILD()
    _G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COUNTDOWN_CON)
    _G.UZIVERT_FF_COUNTDOWN_CON = nil
    local myToken = _G.UZIVERT_FF_TOKEN
    local jumpDone = false
    _G.UZIVERT_FF_UPDATE()

    _G.UZIVERT_FF_COUNTDOWN_CON = RunService.Heartbeat:Connect(function(dt)
        if not _G.UZIVERT_FF_ON or myToken ~= _G.UZIVERT_FF_TOKEN or not _G.UZIVERT_FF_COUNTDOWN_REM then return end
        _G.UZIVERT_FF_COUNTDOWN_REM = math.max(0, _G.UZIVERT_FF_COUNTDOWN_REM - dt)
        if not jumpDone and _G.UZIVERT_FF_COUNTDOWN_REM <= FF_TRIGGER then
            jumpDone = true
            _G.UZIVERT_FF_TWO_JUMP(myToken)
        end
        _G.UZIVERT_FF_UPDATE()
        if _G.UZIVERT_FF_COUNTDOWN_REM <= 0 then
            _G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COUNTDOWN_CON)
            _G.UZIVERT_FF_COUNTDOWN_CON = nil
        end
    end)
end

_G.UZIVERT_FF_START_COOLDOWN = function()
    _G.UZIVERT_FF_BUILD()
    _G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COOLDOWN_CON)
    _G.UZIVERT_FF_COOLDOWN_CON = nil
    _G.UZIVERT_FF_COOLDOWN_CON = RunService.Heartbeat:Connect(function()
        if not _G.UZIVERT_FF_COOLDOWN_END then return end
        if _G.UZIVERT_FF_COUNTDOWN_REM and _G.UZIVERT_FF_COUNTDOWN_REM > 0 then return end
        local remaining = _G.UZIVERT_FF_COOLDOWN_END - os.clock()
        if remaining <= 0 then
            _G.UZIVERT_FF_UPDATE()
            _G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COOLDOWN_CON)
            _G.UZIVERT_FF_COOLDOWN_CON = nil
            return
        end
        _G.UZIVERT_FF_UPDATE()
    end)
end

_G.UZIVERT_FF_START_BLOCK = function()
    _G.UZIVERT_FF_COOLDOWN = true
    local myToken = _G.UZIVERT_FF_TOKEN
    task.defer(function()
        if _G.UZIVERT_FF_ON and _G.UZIVERT_FF_COOLDOWN and myToken == _G.UZIVERT_FF_TOKEN then
            _G.UZIVERT_FF_BLOCK_ALL()
        end
    end)
    _G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_BLOCK_CON)
    _G.UZIVERT_FF_BLOCK_CON = nil
    _G.UZIVERT_FF_BLOCK_CON = RunService.Heartbeat:Connect(function()
        if _G.UZIVERT_FF_COOLDOWN_END and os.clock() >= _G.UZIVERT_FF_COOLDOWN_END then
            _G.UZIVERT_FF_COOLDOWN = false
            _G.UZIVERT_FF_RELEASE()
            _G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_BLOCK_CON)
            _G.UZIVERT_FF_BLOCK_CON = nil
        else
            _G.UZIVERT_FF_BLOCK_ALL()
        end
    end)
end

_G.UZIVERT_FF_CYCLE = function()
    if not _G.UZIVERT_FF_ON or _G.UZIVERT_FF_COOLDOWN then return end
    _G.UZIVERT_FF_BUILD()
    _G.UZIVERT_FF_TOKEN = _G.UZIVERT_FF_TOKEN + 1
    local start = os.clock()
    _G.UZIVERT_FF_COUNTDOWN_REM = FF_COUNTDOWN
    _G.UZIVERT_FF_COOLDOWN_END = start + FF_COOLDOWN
    _G.UZIVERT_FF_START_COUNTDOWN()
    _G.UZIVERT_FF_START_COOLDOWN()
    _G.UZIVERT_FF_START_BLOCK()
end

_G.UZIVERT_FF_CONNECT_TOOL = function(tool)
    if not tool or not tool:IsA("Tool") or tool.Name ~= "Fireflies" then return end
    if _G.UZIVERT_FF_HOOKED[tool] then
        _G.UZIVERT_FF_BLOCK_ONE(tool, _G.UZIVERT_FF_HOOKED[tool])
        return
    end

    local state = {originalEnabled = tool.Enabled, blocked = false}
    _G.UZIVERT_FF_HOOKED[tool] = state

    table.insert(_G.UZIVERT_FF_CONNS, tool:GetPropertyChangedSignal("Enabled"):Connect(function()
        if _G.UZIVERT_FF_ON and _G.UZIVERT_FF_COOLDOWN then
            if tool.Enabled then state.originalEnabled = true end
            _G.UZIVERT_FF_BLOCK_ONE(tool, state)
        elseif not state.blocked then
            state.originalEnabled = tool.Enabled
        end
    end))

    table.insert(_G.UZIVERT_FF_CONNS, tool.Activated:Connect(function()
        if not _G.UZIVERT_FF_ON or _G.UZIVERT_FF_COOLDOWN then return end
        if not _G.UZIVERT_FF_OWNS(tool) then return end
        state.originalEnabled = true
        _G.UZIVERT_FF_CYCLE()
    end))
end

_G.UZIVERT_FF_SCAN = function()
    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    local character = LocalPlayer.Character
    local function scanContainer(c)
        if c then
            for _, child in ipairs(c:GetChildren()) do
                if child:IsA("Tool") and child.Name == "Fireflies" then
                    _G.UZIVERT_FF_CONNECT_TOOL(child)
                end
            end
        end
    end
    scanContainer(backpack)
    scanContainer(character)
end

_G.UZIVERT_FF_HOOK = function()
    _G.UZIVERT_FF_SCAN()

    local backpack = LocalPlayer:FindFirstChildOfClass("Backpack")
    if backpack then
        table.insert(_G.UZIVERT_FF_CONNS, backpack.ChildAdded:Connect(function(child)
            if child:IsA("Tool") and child.Name == "Fireflies" then
                _G.UZIVERT_FF_CONNECT_TOOL(child)
            end
        end))
    end

    LocalPlayer.ChildAdded:Connect(function(child)
        if child:IsA("Backpack") then
            table.insert(_G.UZIVERT_FF_CONNS, child.ChildAdded:Connect(function(t)
                if t:IsA("Tool") and t.Name == "Fireflies" then
                    _G.UZIVERT_FF_CONNECT_TOOL(t)
                end
            end))
        end
    end)

    LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(1)
        _G.UZIVERT_FF_SCAN()
    end)
end

-- Toggles
crearToggle(PaginaBomb, "🔥 Auto Firefly Clutch", CONFIG.FireflyClutch or false, function(e)
    _G.UZIVERT_FF_ON = e
    CONFIG.FireflyClutch = e
    guardarConfig()
    if e then
        _G.UZIVERT_FF_HOOK()
        _G.UZIVERT_FF_BUILD()
    else
        _G.UZIVERT_FF_STOP()
    end
end)

crearToggle(PaginaBomb, "⏰ Timer Firefly", CONFIG.FireflyTimer ~= false, function(e)
    _G.UZIVERT_FF_TIMER = e
    CONFIG.FireflyTimer = e
    guardarConfig()
    if _G.UZIVERT_FF_LABEL then _G.UZIVERT_FF_LABEL.Visible = e end
end)

crearSlider(PaginaBomb, "Tamaño Timer Firefly", 1, 10, CONFIG.FireflyTimerSize or 5, function(v)
    _G.UZIVERT_FF_SIZE = math.clamp(math.floor(v), 1, 10)
    CONFIG.FireflyTimerSize = _G.UZIVERT_FF_SIZE
    guardarConfig()
    if _G.UZIVERT_FF_LABEL then
        local w = 72 + ((_G.UZIVERT_FF_SIZE - 1) * 8)
        local h = 24 + ((_G.UZIVERT_FF_SIZE - 1) * 2)
        _G.UZIVERT_FF_LABEL.Size = UDim2.fromOffset(w, h)
        _G.UZIVERT_FF_LABEL.TextSize = math.max(12, math.floor(h * 0.65))
    end
end)

-- Arrancar si estaba activo
if _G.UZIVERT_FF_ON then
    _G.UZIVERT_FF_HOOK()
    _G.UZIVERT_FF_BUILD()
end

if not _G.UZIVERT_GAMA_BAJA then

-- ============================================
-- 💀 HEADLESS + 🦵 KORBLOX
-- ============================================
_G.UZIVERT_HEADLESS_ON = CONFIG.Headless or false
_G.UZIVERT_KORBLOX_RIGHT = CONFIG.KorbloxRight or false
_G.UZIVERT_KORBLOX_LEFT = CONFIG.KorbloxLeft or false

-- Función Headless
_G.UZIVERT_APLICAR_HEADLESS = function(char)
    if not char then return end
    local head = char:FindFirstChild("Head")
    if not head then return end
    
    if _G.UZIVERT_HEADLESS_ON then
        head.Transparency = 1
        head.LocalTransparencyModifier = 1
        for _, obj in ipairs(head:GetChildren()) do
            if obj:IsA("Decal") then obj.Transparency = 1 end
        end
    else
        head.Transparency = 0
        head.LocalTransparencyModifier = 0
        for _, obj in ipairs(head:GetChildren()) do
            if obj:IsA("Decal") then obj.Transparency = 0 end
        end
    end
end

-- Sistema Korblox (del add-on)
_G.UZIVERT_KORBLOX_RIGHT_ASSET = 139607718
_G.UZIVERT_KORBLOX_LEFT_ASSET = 139607673
_G.UZIVERT_KORBLOX_MARKER = "UzivertKorbloxSide"

_G.UZIVERT_KORBLOX_SIDE_NAMES = {
    Right = {"RightUpperLeg", "RightLowerLeg", "RightFoot"},
    Left = {"LeftUpperLeg", "LeftLowerLeg", "LeftFoot"},
}

_G.UZIVERT_KORBLOX_SIDE_ENUMS = {
    Right = {
        Enum.BodyPartR15.RightUpperLeg,
        Enum.BodyPartR15.RightLowerLeg,
        Enum.BodyPartR15.RightFoot,
    },
    Left = {
        Enum.BodyPartR15.LeftUpperLeg,
        Enum.BodyPartR15.LeftLowerLeg,
        Enum.BodyPartR15.LeftFoot,
    },
}

_G.UZIVERT_KORBLOX_STATE = nil
_G.UZIVERT_KORBLOX_TEMPLATES = nil
_G.UZIVERT_KORBLOX_BUILDING = false

_G.UZIVERT_KORBLOX_SIDE_ENABLED = function(side)
    if side == "Right" then return _G.UZIVERT_KORBLOX_RIGHT end
    return _G.UZIVERT_KORBLOX_LEFT
end

_G.UZIVERT_KORBLOX_DISCONNECT = function(conn)
    if conn then pcall(function() conn:Disconnect() end) end
end

_G.UZIVERT_KORBLOX_DESTROY_MOTORS = function(root)
    if not root then return end
    for _, obj in ipairs(root:GetDescendants()) do
        if obj:IsA("Motor6D") then pcall(function() obj:Destroy() end) end
    end
end

_G.UZIVERT_KORBLOX_CLONE_PART = function(part)
    if not part or not part:IsA("BasePart") then return nil end
    local archivable = part.Archivable
    if not archivable then pcall(function() part.Archivable = true end) end
    local ok, clone = pcall(function() return part:Clone() end)
    if not archivable then pcall(function() part.Archivable = false end) end
    if not ok or not clone then return nil end
    _G.UZIVERT_KORBLOX_DESTROY_MOTORS(clone)
    clone.Parent = nil
    return clone
end

_G.UZIVERT_KORBLOX_CLEAR_STATE = function(state)
    if not state then return end
    for _, conn in ipairs(state.Connections or {}) do _G.UZIVERT_KORBLOX_DISCONNECT(conn) end
    state.Connections = {}
    for _, side in ipairs({"Left", "Right"}) do
        for _, conn in ipairs((state.PartConnections and state.PartConnections[side]) or {}) do
            _G.UZIVERT_KORBLOX_DISCONNECT(conn)
        end
        if state.PartConnections then state.PartConnections[side] = {} end
    end
end

_G.UZIVERT_KORBLOX_GET_HUMANOID = function(char)
    if not char then return nil end
    return char:FindFirstChildOfClass("Humanoid") or char:WaitForChild("Humanoid", 2)
end

_G.UZIVERT_KORBLOX_GET_SIDE_PARTS = function(char, side)
    local names = _G.UZIVERT_KORBLOX_SIDE_NAMES[side]
    if not char or not names then return nil end
    local parts = {}
    for index, name in ipairs(names) do
        local part = char:FindFirstChild(name)
        if not part or not part:IsA("BasePart") then return nil end
        parts[index] = part
    end
    return parts
end

_G.UZIVERT_KORBLOX_WAIT_PARTS = function(char, side, timeout)
    local deadline = os.clock() + (timeout or 2.5)
    repeat
        if LocalPlayer.Character ~= char then return nil end
        local parts = _G.UZIVERT_KORBLOX_GET_SIDE_PARTS(char, side)
        if parts then return parts end
        task.wait(0.05)
    until os.clock() >= deadline
    return _G.UZIVERT_KORBLOX_GET_SIDE_PARTS(char, side)
end

_G.UZIVERT_KORBLOX_BEGIN_STATE = function(char)
    if _G.UZIVERT_KORBLOX_STATE and _G.UZIVERT_KORBLOX_STATE.Character == char then
        return _G.UZIVERT_KORBLOX_STATE
    end
    _G.UZIVERT_KORBLOX_CLEAR_STATE(_G.UZIVERT_KORBLOX_STATE)
    local humanoid = _G.UZIVERT_KORBLOX_GET_HUMANOID(char)
    _G.UZIVERT_KORBLOX_STATE = {
        Character = char,
        Humanoid = humanoid,
        Connections = {},
        PartConnections = {Left = {}, Right = {}},
        Applying = {Left = false, Right = false},
    }
    return _G.UZIVERT_KORBLOX_STATE
end

_G.UZIVERT_KORBLOX_EXTRACT = function(model)
    if not model then return nil end
    local result = {Left = {}, Right = {}}
    for _, side in ipairs({"Left", "Right"}) do
        for index, name in ipairs(_G.UZIVERT_KORBLOX_SIDE_NAMES[side]) do
            local source = model:FindFirstChild(name)
            local clone = _G.UZIVERT_KORBLOX_CLONE_PART(source)
            if not clone then return nil end
            clone.Name = name
            result[side][index] = clone
        end
    end
    return result
end

_G.UZIVERT_KORBLOX_BUILD_TEMPLATES = function()
    if _G.UZIVERT_KORBLOX_TEMPLATES then return true end
    if _G.UZIVERT_KORBLOX_BUILDING then
        local deadline = os.clock() + 4
        repeat
            if _G.UZIVERT_KORBLOX_TEMPLATES then return true end
            if not _G.UZIVERT_KORBLOX_BUILDING then break end
            task.wait(0.05)
        until os.clock() >= deadline
        return _G.UZIVERT_KORBLOX_TEMPLATES ~= nil
    end
    _G.UZIVERT_KORBLOX_BUILDING = true

    local description = Instance.new("HumanoidDescription")
    description.LeftLeg = _G.UZIVERT_KORBLOX_LEFT_ASSET
    description.RightLeg = _G.UZIVERT_KORBLOX_RIGHT_ASSET

    local model = nil
    local ok = pcall(function()
        model = Players:CreateHumanoidModelFromDescriptionAsync(
            description,
            Enum.HumanoidRigType.R15
        )
    end)

    if not ok or not model then
        ok = pcall(function()
            model = Players:CreateHumanoidModelFromDescription(
                description,
                Enum.HumanoidRigType.R15
            )
        end)
    end

    local extracted = nil
    if ok and model then
        extracted = _G.UZIVERT_KORBLOX_EXTRACT(model)
    end

    pcall(function() description:Destroy() end)
    if model then pcall(function() model:Destroy() end) end

    if extracted then _G.UZIVERT_KORBLOX_TEMPLATES = extracted end
    _G.UZIVERT_KORBLOX_BUILDING = false
    return _G.UZIVERT_KORBLOX_TEMPLATES ~= nil
end

_G.UZIVERT_KORBLOX_REPLACE_PART = function(state, side, index, source)
    if not state or not state.Humanoid or not source then return false end
    if LocalPlayer.Character ~= state.Character then return false end

    local clone = _G.UZIVERT_KORBLOX_CLONE_PART(source)
    if not clone then return false end

    clone.Name = _G.UZIVERT_KORBLOX_SIDE_NAMES[side][index]
    clone:SetAttribute(_G.UZIVERT_KORBLOX_MARKER, side)

    local ok, result = pcall(function()
        return state.Humanoid:ReplaceBodyPartR15(_G.UZIVERT_KORBLOX_SIDE_ENUMS[side][index], clone)
    end)

    if not ok or result == false then
        pcall(function() clone:Destroy() end)
        return false
    end
    return true
end

_G.UZIVERT_KORBLOX_APPLY_SIDE = function(state, side)
    if not state or not _G.UZIVERT_KORBLOX_SIDE_ENABLED(side) then return false end
    if LocalPlayer.Character ~= state.Character then return false end

    local parts = _G.UZIVERT_KORBLOX_WAIT_PARTS(state.Character, side, 2.5)
    if not parts then return false end

    if not _G.UZIVERT_KORBLOX_BUILD_TEMPLATES() then return false end

    state.Applying[side] = true
    local success = true
    for index = 1, 3 do
        if not _G.UZIVERT_KORBLOX_REPLACE_PART(state, side, index, _G.UZIVERT_KORBLOX_TEMPLATES[side][index]) then
            success = false
            break
        end
    end
    state.Applying[side] = false
    return success
end

_G.UZIVERT_APLICAR_COSMETICOS = function(char)
    if not char then return end
    task.wait(0.5)
    _G.UZIVERT_APLICAR_HEADLESS(char)

    local esR15 = char:FindFirstChild("UpperTorso") ~= nil
    if not esR15 then return end

    local state = _G.UZIVERT_KORBLOX_BEGIN_STATE(char)
    if _G.UZIVERT_KORBLOX_RIGHT then _G.UZIVERT_KORBLOX_APPLY_SIDE(state, "Right") end
    if _G.UZIVERT_KORBLOX_LEFT then _G.UZIVERT_KORBLOX_APPLY_SIDE(state, "Left") end
end

LocalPlayer.CharacterAdded:Connect(function(char)
    task.wait(1)
    if _G.UZIVERT_HEADLESS_ON or _G.UZIVERT_KORBLOX_RIGHT or _G.UZIVERT_KORBLOX_LEFT then
        _G.UZIVERT_APLICAR_COSMETICOS(char)
    end
end)

if LocalPlayer.Character and (_G.UZIVERT_HEADLESS_ON or _G.UZIVERT_KORBLOX_RIGHT or _G.UZIVERT_KORBLOX_LEFT) then
    task.spawn(function()
        _G.UZIVERT_APLICAR_COSMETICOS(LocalPlayer.Character)
    end)
end

-- 💀 SECCIÓN: HEADLESS + KORBLOX
_G.secSkin = Instance.new("Frame")
_G.secSkin.Size = UDim2.new(1, 0, 0, 30)
_G.secSkin.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secSkin.BackgroundTransparency = 0.3
_G.secSkin.BorderSizePixel = 0
_G.secSkin.ZIndex = 2
_G.secSkin.Parent = PaginaRend

_G.cSecSkin = Instance.new("UICorner")
_G.cSecSkin.CornerRadius = UDim.new(0, 7)
_G.cSecSkin.Parent = _G.secSkin

_G.sSecSkin = Instance.new("UIStroke")
_G.sSecSkin.Color = COLORES.Morado3
_G.sSecSkin.Thickness = 1.5
_G.sSecSkin.Transparency = 0.2
_G.sSecSkin.Parent = _G.secSkin

_G.lblSecSkin = Instance.new("TextLabel")
_G.lblSecSkin.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecSkin.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecSkin.BackgroundTransparency = 1
_G.lblSecSkin.Text = "💀 SKIN (Headless + Korblox)"
_G.lblSecSkin.TextColor3 = COLORES.Naranja2
_G.lblSecSkin.Font = Enum.Font.GothamBlack
_G.lblSecSkin.TextSize = 12
_G.lblSecSkin.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecSkin.ZIndex = 3
_G.lblSecSkin.Parent = _G.secSkin

crearToggle(PaginaRend, "💀 Headless", CONFIG.Headless or false, function(e)
    _G.UZIVERT_HEADLESS_ON = e
    CONFIG.Headless = e
    guardarConfig()
    if LocalPlayer.Character then
        _G.UZIVERT_APLICAR_HEADLESS(LocalPlayer.Character)
    end
end)

crearToggle(PaginaRend, "🦵 Korblox Right Leg", CONFIG.KorbloxRight or false, function(e)
    _G.UZIVERT_KORBLOX_RIGHT = e
    CONFIG.KorbloxRight = e
    guardarConfig()
    if e and LocalPlayer.Character then
        local state = _G.UZIVERT_KORBLOX_BEGIN_STATE(LocalPlayer.Character)
        _G.UZIVERT_KORBLOX_APPLY_SIDE(state, "Right")
    end
end)

crearToggle(PaginaRend, "🦵 Korblox Left Leg", CONFIG.KorbloxLeft or false, function(e)
    _G.UZIVERT_KORBLOX_LEFT = e
    CONFIG.KorbloxLeft = e
    guardarConfig()
    if e and LocalPlayer.Character then
        local state = _G.UZIVERT_KORBLOX_BEGIN_STATE(LocalPlayer.Character)
        _G.UZIVERT_KORBLOX_APPLY_SIDE(state, "Left")
    end
end)

crearBoton(PaginaRend, "🔄 Resetear Apariencia", function()
    _G.UZIVERT_HEADLESS_ON = false
    _G.UZIVERT_KORBLOX_RIGHT = false
    _G.UZIVERT_KORBLOX_LEFT = false
    CONFIG.Headless = false
    CONFIG.KorbloxRight = false
    CONFIG.KorbloxLeft = false
    guardarConfig()
    
    -- Restaurar cabeza
    if LocalPlayer.Character then
        _G.UZIVERT_APLICAR_HEADLESS(LocalPlayer.Character)
    end
    
    -- Limpiar templates (para que se regeneren si vuelve a activar)
    _G.UZIVERT_KORBLOX_TEMPLATES = nil
    _G.UZIVERT_KORBLOX_STATE = nil
    
    -- Matar el personaje (respawn limpio)
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        end
    end
    
    print("🔄 Apariencia reseteada (respawneando)")
end, COLORES.Rojo)

-- 🎯 SECCIÓN 1: SHADERS
_G.secAp1 = Instance.new("Frame")
_G.secAp1.Size = UDim2.new(1, 0, 0, 30)
_G.secAp1.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secAp1.BackgroundTransparency = 0.3
_G.secAp1.BorderSizePixel = 0
_G.secAp1.ZIndex = 2
_G.secAp1.Parent = PaginaRend

_G.cSecAp1 = Instance.new("UICorner")
_G.cSecAp1.CornerRadius = UDim.new(0, 7)
_G.cSecAp1.Parent = _G.secAp1

_G.sSecAp1 = Instance.new("UIStroke")
_G.sSecAp1.Color = COLORES.Morado3
_G.sSecAp1.Thickness = 1.5
_G.sSecAp1.Transparency = 0.2
_G.sSecAp1.Parent = _G.secAp1

_G.lblSecAp1 = Instance.new("TextLabel")
_G.lblSecAp1.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecAp1.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecAp1.BackgroundTransparency = 1
_G.lblSecAp1.Text = "🎨 SHADERS"
_G.lblSecAp1.TextColor3 = COLORES.Naranja2
_G.lblSecAp1.Font = Enum.Font.GothamBlack
_G.lblSecAp1.TextSize = 12
_G.lblSecAp1.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecAp1.ZIndex = 3
_G.lblSecAp1.Parent = _G.secAp1

crearToggle(PaginaRend, "🎨 Shaders Tokyowami", false, function(e)
    _G.UZIVERT_SHADER_TOKYO = e
    local Lighting = game:GetService("Lighting")
    if not _G.UZIVERT_SHADER_TOKYO_EFFECTS then
        _G.UZIVERT_SHADER_TOKYO_EFFECTS = {}
    end
    if e then
        for _, v in ipairs(_G.UZIVERT_SHADER_TOKYO_EFFECTS) do pcall(function() v:Destroy() end) end
        _G.UZIVERT_SHADER_TOKYO_EFFECTS = {}
        local bloom = Instance.new("BloomEffect") bloom.Intensity = 0.1 bloom.Threshold = 0 bloom.Size = 100 bloom.Parent = Lighting table.insert(_G.UZIVERT_SHADER_TOKYO_EFFECTS, bloom)
        local blur = Instance.new("BlurEffect") blur.Size = 2 blur.Parent = Lighting table.insert(_G.UZIVERT_SHADER_TOKYO_EFFECTS, blur)
        local cc = Instance.new("ColorCorrectionEffect") cc.Saturation = 0.05 cc.TintColor = Color3.fromRGB(255, 224, 219) cc.Parent = Lighting table.insert(_G.UZIVERT_SHADER_TOKYO_EFFECTS, cc)
        local sky = Instance.new("Sky") sky.Name = "UzivertTokyowami" sky.SkyboxUp = "rbxassetid://323493360" sky.SkyboxLf = "rbxassetid://323494252" sky.SkyboxBk = "rbxassetid://323494035" sky.SkyboxFt = "rbxassetid://323494130" sky.SkyboxDn = "rbxassetid://323494368" sky.SkyboxRt = "rbxassetid://323494067" sky.Parent = Lighting table.insert(_G.UZIVERT_SHADER_TOKYO_EFFECTS, sky)
        Lighting.Brightness = 2.14
        Lighting.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
        Lighting.ColorShift_Top = Color3.fromRGB(240, 127, 14)
        Lighting.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
        Lighting.ClockTime = 6.7
        Lighting.FogColor = Color3.fromRGB(94, 76, 106)
        Lighting.FogEnd = 1000
        Lighting.ExposureCompensation = 0.24
        Lighting.Ambient = Color3.fromRGB(59, 33, 27)
    else
        for _, v in ipairs(_G.UZIVERT_SHADER_TOKYO_EFFECTS) do pcall(function() v:Destroy() end) end
        _G.UZIVERT_SHADER_TOKYO_EFFECTS = {}
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.ExposureCompensation = 0
    end
end)

crearToggle(PaginaRend, "🌸 Pink Hour", false, function(e)
    _G.UZIVERT_PINK_HOUR = e
    local Lighting = game:GetService("Lighting")
    if not _G.UZIVERT_PINK_EFFECTS then
        _G.UZIVERT_PINK_EFFECTS = {}
    end
    if e then
        for _, v in ipairs(_G.UZIVERT_PINK_EFFECTS) do pcall(function() v:Destroy() end) end
        _G.UZIVERT_PINK_EFFECTS = {}
        local cc = Instance.new("ColorCorrectionEffect") cc.TintColor = Color3.fromRGB(255, 100, 200) cc.Saturation = 0.4 cc.Parent = Lighting table.insert(_G.UZIVERT_PINK_EFFECTS, cc)
        local bloom = Instance.new("BloomEffect") bloom.Intensity = 0.3 bloom.Size = 25 bloom.Threshold = 0.85 bloom.Parent = Lighting table.insert(_G.UZIVERT_PINK_EFFECTS, bloom)
        local blur = Instance.new("BlurEffect") blur.Size = 2 blur.Parent = Lighting table.insert(_G.UZIVERT_PINK_EFFECTS, blur)
        Lighting.Brightness = 2
        Lighting.ClockTime = 6.7
        Lighting.FogColor = Color3.fromRGB(120, 20, 150)
        Lighting.FogEnd = 1200
        Lighting.ColorShift_Top = Color3.fromRGB(255, 100, 220)
        Lighting.ColorShift_Bottom = Color3.fromRGB(100, 0, 150)
    else
        for _, v in ipairs(_G.UZIVERT_PINK_EFFECTS) do pcall(function() v:Destroy() end) end
        _G.UZIVERT_PINK_EFFECTS = {}
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.ColorShift_Top = Color3.fromRGB(0, 0, 0)
        Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
    end
end)

-- 🎯 SECCIÓN 2: AMBIENTE
_G.secAp2 = Instance.new("Frame")
_G.secAp2.Size = UDim2.new(1, 0, 0, 30)
_G.secAp2.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secAp2.BackgroundTransparency = 0.3
_G.secAp2.BorderSizePixel = 0
_G.secAp2.ZIndex = 2
_G.secAp2.Parent = PaginaRend

_G.cSecAp2 = Instance.new("UICorner")
_G.cSecAp2.CornerRadius = UDim.new(0, 7)
_G.cSecAp2.Parent = _G.secAp2

_G.sSecAp2 = Instance.new("UIStroke")
_G.sSecAp2.Color = COLORES.Morado3
_G.sSecAp2.Thickness = 1.5
_G.sSecAp2.Transparency = 0.2
_G.sSecAp2.Parent = _G.secAp2

_G.lblSecAp2 = Instance.new("TextLabel")
_G.lblSecAp2.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecAp2.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecAp2.BackgroundTransparency = 1
_G.lblSecAp2.Text = "🌙 AMBIENTE"
_G.lblSecAp2.TextColor3 = COLORES.Naranja2
_G.lblSecAp2.Font = Enum.Font.GothamBlack
_G.lblSecAp2.TextSize = 12
_G.lblSecAp2.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecAp2.ZIndex = 3
_G.lblSecAp2.Parent = _G.secAp2

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

-- 🎯 SECCIÓN 3: RENDIMIENTO
_G.secAp3 = Instance.new("Frame")
_G.secAp3.Size = UDim2.new(1, 0, 0, 30)
_G.secAp3.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secAp3.BackgroundTransparency = 0.3
_G.secAp3.BorderSizePixel = 0
_G.secAp3.ZIndex = 2
_G.secAp3.Parent = PaginaRend

_G.cSecAp3 = Instance.new("UICorner")
_G.cSecAp3.CornerRadius = UDim.new(0, 7)
_G.cSecAp3.Parent = _G.secAp3

_G.sSecAp3 = Instance.new("UIStroke")
_G.sSecAp3.Color = COLORES.Morado3
_G.sSecAp3.Thickness = 1.5
_G.sSecAp3.Transparency = 0.2
_G.sSecAp3.Parent = _G.secAp3

_G.lblSecAp3 = Instance.new("TextLabel")
_G.lblSecAp3.Size = UDim2.new(1, -20, 1, 0)
_G.lblSecAp3.Position = UDim2.new(0, 10, 0, 0)
_G.lblSecAp3.BackgroundTransparency = 1
_G.lblSecAp3.Text = "⚙️ RENDIMIENTO"
_G.lblSecAp3.TextColor3 = COLORES.Naranja2
_G.lblSecAp3.Font = Enum.Font.GothamBlack
_G.lblSecAp3.TextSize = 12
_G.lblSecAp3.TextXAlignment = Enum.TextXAlignment.Left
_G.lblSecAp3.ZIndex = 3
_G.lblSecAp3.Parent = _G.secAp3

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

end

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
mantInfo.Text = "TODO OPERATIVO\n\nTodos los sistemas funcionando.\nReportá cualquier bug en Discord."
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
    local texto = "REPORTE DE BUG - UZIVERT HUB v4.7.7\nJugador: " .. LocalPlayer.Name .. "\nFecha: " .. os.date("%d/%m/%Y %H:%M") .. "\nVersion: " .. VERSION
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

crearTarjeta(PaginaUpdate, "📅 Última actualización: 17/10/2026", "Uzivert Hub v4.7.7 HALLOWEEN", COLORES.Naranja2)

crearTarjeta(PaginaUpdate, "🟢 NUEVO EN v4.7.7",
    "🎯 SHOOT MURDERER v9 (Motor NOIR Completo)\n" ..
    "• PingProfiles interpolados por ping (20ms a 300ms)\n" ..
    "• sampleMotion con buffer de 8 posiciones\n" ..
    "• estimatedAcceleration (predicción de lag)\n" ..
    "• leadTime con samplingDelay (más preciso)\n" ..
    "• predictLag con peso dinámico\n" ..
    "• predictJump con gravedad real del juego\n" ..
    "• Loop 30Hz alimentando sampleMotion\n" ..
    "• Wall Check integrado\n" ..
    "• Auto-equip / Auto-unequip\n\n" ..
    
    "🎯 SILENT AIM v4 NOIR\n" ..
    "• Motor completo del NOIR integrado\n" ..
    "• Hook __namecall unificado (Gun + Knife)\n" ..
    "• Predicción completa con PingProfiles\n" ..
    "• cachedPing EXACTO (0.7/0.3 cada 0.5s)\n" ..
    "• Multi-Point (7 tiros) opcional\n" ..
    "• Sliders: Extra Lead, Max Sim, Pred Interval, H Mult, V Mult\n" ..
    "• Toggles: Predict Jump, Predict Lag\n" ..
    "• Label de Ping en vivo",
    COLORES.Verde)

crearTarjeta(PaginaUpdate, "🗡️ NOVEDADES DEL KNIFE Y LIMPIEZA",
    "⚙️ NUEVOS CONTROLES DE PREDICCIÓN\n" ..
    "• 5 toggles: Predict Lag/Jump, Prioritize Ping, Wall Check, Auto-unequip\n" ..
    "• 5 sliders: Extra Lead, Max Sim, Pred Interval, H Mult, V Mult\n" ..
    "• Todo guarda config con guardarConfig()\n\n" ..
    
    "🗡️ KNIFE NOIR COMPLETO\n" ..
    "• Knife Silent Aim integrado al hook\n" ..
    "• Predicción con travelTime (distancia/110)\n" ..
    "• SwallowKnifeRemote (bloquea doble throw)\n" ..
    "• Instant Throw / Fast Throw\n" ..
    "• Auto Throw + Auto Kill Everyone / Sheriff\n" ..
    "• Kill Player (dropdown)\n" ..
    "• Knife Throw Aura + Sheriff Bind Button\n\n" ..
    
    "🔥 LIMPIEZA DE CÓDIGO\n" ..
    "• SHOOT AVANZADO (V2) eliminado por completo\n" ..
    "• Auto Shoot ahora usa el motor NOIR\n" ..
    "• Menos código, menos lag, más estable",
    COLORES.Verde)

crearTarjeta(PaginaUpdate, "🐛 BUGS ARREGLADOS EN v4.7.7",
    "✓ Error de sintaxis (end)i en Knife que mataba el script\n" ..
    "✓ Orden de funciones en dispararV1 (ya no crashea)\n" ..
    "✓ Motor NOIR integrado correctamente\n" ..
    "✓ Sección 4 reemplazada sin errores\n" ..
    "✓ Botón SHOOT MURDERER funcionando con motor nuevo\n" ..
    "✓ Config del Shoot guardada y restaurada al arrancar\n" ..
    "✓ Hook __namecall manejando Gun y Knife a la vez\n" ..
    "✓ Predicción del Knife con travelTime real",
    COLORES.Verde)

crearTarjeta(PaginaUpdate, "🟢 NUEVO EN v4.7.5",
    "🌾 AUTO FARM COINS\n" ..
    "• Recolecta monedas automáticamente\n" ..
    "• Sistema LinearVelocity (estable)\n" ..
    "• Anti-AFK + Noclip + Anti-Void\n" ..
    "• Auto-Reset cuando llena la mochila\n\n" ..
    "🎨 UI HALLOWEEN (REDISEÑO)\n" ..
    "• Sistema de íconos dibujados con frames\n" ..
    "• Luna + telarañas + murciélagos animados\n" ..
    "• Borde animado RGB\n" ..
    "• Optimizado para gama alta y baja\n\n" ..
    "🎯 AIMLOCK V2\n" ..
    "• Smoothing ajustable + FOV Check\n" ..
    "• Select Player + Wall Check mejorado\n" ..
    "• Botón flotante AIM con ON/OFF\n" ..
    "• Guarda la posición del botón",
    COLORES.Verde)

crearTarjeta(PaginaUpdate, "🟢 NUEVO EN v4.7.4",
    "🎯 AIMLOCK V2\n" ..
    "• Smoothing + FOV Check\n" ..
    "• Select Player + Wall Check mejorado\n" ..
    "• Botón flotante AIM\n\n" ..
    "🎬 23 ANIMACIONES NUEVAS\n" ..
    "• Total: 51 animaciones\n\n" ..
    "🎯 SILENT AIM MEJORADO\n" ..
    "• Auto Ping adaptativo\n" ..
    "• Multi-Point (7 tiros)\n" ..
    "• Anti-Hack (vuelo/tp)\n\n" ..
    "🔫 SHOOT TELEPORT\n" ..
    "• Teletransporte detrás del murderer\n\n" ..
    "💀 FE HEADLESS (3 versiones)",
    COLORES.Verde)

crearTarjeta(PaginaUpdate, "🟢 NUEVO EN v4.7.3",
    "🎮 SELECTOR DE GAMA\n" ..
    "• Elegís GAMA ALTA o GAMA BAJA al iniciar\n" ..
    "• GAMA BAJA → solo lo esencial (menos lag)\n" ..
    "• GAMA ALTA → todas las funciones\n\n" ..
    "🎯 NUEVAS FUNCIONES:\n" ..
    "• 🎯 Anti-Aim\n" ..
    "• ⚡ Speed Glitch\n" ..
    "• 💀 Headless + 🦵 Korblox\n" ..
    "• 🎒 Inventory Unlimiter\n" ..
    "• 🎒 Auto Get Tools\n" ..
    "• 🔥 Firefly Clutch\n\n" ..
    "📋 NUEVAS PESTAÑAS:\n" ..
    "• 🧰 Utilidades\n" ..
    "• 🔥 Clutchs (antes Bomb Jump)",
    COLORES.Verde)

crearTarjeta(PaginaUpdate, "🔴 DESCARTADO",
    "- Silent Aim con Mouse.Hit\n" ..
    "- Silent Aim con Camera\n" ..
    "- Shoot Murderer con Camera Snap\n" ..
    "- Speed Glitch manual\n" ..
    "- Headless / Korblox con ID viejo\n" ..
    "- Dual Wield\n" ..
    "- ESP Skeleton\n" ..
    "- Skin Copier\n" ..
    "- Anti Silent Aim\n" ..
    "- Herobrine\n" ..
    "- SHOOT AVANZADO (V2) → Descontinuado en v4.7.7\n",
    COLORES.Rojo)

crearTarjeta(PaginaUpdate, "🎯 ROADMAP PRÓXIMAS VERSIONES",
    "🔜 Próximamente:\n\n" ..
    "• 🛡️ God Mode\n" ..
    "• ✈️ Fly con slider\n" ..
    "• 🦘 Infinity Jump\n" ..
    "• 📦 Hitbox Expander\n" ..
    "• 🌀 TP Enemies (Imán)\n" ..
    "• 💬 Exponer Roles en Chat\n" ..
    "• 🔔 Gun Drop Sound\n" ..
    "• 👻 Spoof Name + Tag + Arcoíris\n" ..
    "• 💾 Gestor de Configs\n" ..
    "• 🔒 Lock por UserId\n" ..
    "• 📢 Aviso de update en pantalla\n" ..
    "• 📊 Contador de usuarios en pantalla\n" ..
    "• 🎯 Target Modes (Sheriff/Nearest/Crosshair)\n" ..
    "• 👁️ ESP Tracer / Chams / Box\n\n" ..
    "💬 Sugerencias → Discord oficial",
    COLORES.Naranja2)

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
    "• TikTok: Uzivert550\n" ..
    "• Instagram: hxuntedluv77\n\n" ..
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

print("🎃 Parte 10/10 cargada - SCRIPT COMPLETO v4.7.4")

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

-- ============================================
-- ⚡ SPEED GLITCH
-- ============================================
_G.UZIVERT_SG_ON = false
_G.UZIVERT_SG_VALOR = CONFIG.SpeedGlitchValor or 50

if not _G.UZIVERT_GAMA_BAJA then
    RunService.Heartbeat:Connect(function()
        if not _G.UZIVERT_SG_ON then return end
        
        local shiftLock = UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter
        if not shiftLock then return end
        
        local char = LocalPlayer.Character
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        
        if humanoid and hrp and humanoid.FloorMaterial == Enum.Material.Air then
            local moveDir = humanoid.MoveDirection
            if moveDir.Magnitude > 0 then
                local vel = hrp.AssemblyLinearVelocity
                hrp.AssemblyLinearVelocity = Vector3.new(
                    moveDir.X * _G.UZIVERT_SG_VALOR,
                    vel.Y,
                    moveDir.Z * _G.UZIVERT_SG_VALOR
                )
            end
        end
    end)
end

-- 🎯 Restaurar estados guardados
task.wait(0.5)

if CONFIG.AutoGetGun then
    _G.UZIVERT_AUTO_GET_GUN_ON = true
end

if CONFIG.AimLock then
    _G.AIM_ON = true
end

if CONFIG.GunAura then
    _G.UZIVERT_GUN_AURA_ON = true
end

if CONFIG.SilentAim then
    _G.UZIVERT_SILENT_AIM_ON = true
end

if not _G.UZIVERT_GAMA_BAJA then
    if CONFIG.RoundTimer then
        _G.UZIVERT_TIMER_START()
    end
    if CONFIG.ModoNoche then
        _G.UZIVERT_MODO_NOCHE(true)
    end
    if CONFIG.AutoStab then
        _G.UZIVERT_AUTO_STAB_ON = true
    end
    if CONFIG.AntiFling then
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anti-fling-73205"))()
        end)
    end
end

if CONFIG.AntiAim then
    _G.UZIVERT_AA_ON = true
    _G.UZIVERT_AA_START()
end

if CONFIG.SpeedGlitch then
    _G.UZIVERT_SG_ON = true
end
if CONFIG.SpeedGlitchValor then
    _G.UZIVERT_SG_VALOR = CONFIG.SpeedGlitchValor
end

if CONFIG.Headless or CONFIG.KorbloxRight or CONFIG.KorbloxLeft then
    task.wait(1)
    if LocalPlayer.Character then
        _G.UZIVERT_APLICAR_COSMETICOS(LocalPlayer.Character)
    end
end

if CONFIG.InventoryUnlimiter then
    _G.UZIVERT_INV_ON = true
    _G.UZIVERT_REQUEST_RECOVERY(true)
end
if CONFIG.AutoGetTools then
    _G.UZIVERT_AUTOGET_ON = true
end
if CONFIG.InventoryMaxItems then
    _G.UZIVERT_INV_LIMIT = CONFIG.InventoryMaxItems
end

-- ============================================
-- 🗡️ KNIFE NOIR COMPLETO (Motor + UI) — TODO _G.
-- ============================================

-- ============================================
-- VARIABLES GLOBALES
-- ============================================
_G.UZIVERT_KNIFE_SA = false
_G.UZIVERT_KNIFE_WALL_CHECK = false
_G.UZIVERT_KNIFE_PRIORITIZE_SHERIFF = false
_G.UZIVERT_KNIFE_PREDICT_JUMP = true
_G.UZIVERT_KNIFE_PREDICT_LAG = true
_G.UZIVERT_KNIFE_EXTRA_LEAD = 0.02
_G.UZIVERT_KNIFE_FIXED_LEAD = 0.075
_G.UZIVERT_KNIFE_MANUAL_PING = 80
_G.UZIVERT_KNIFE_PRIORITIZE_PING = true
_G.UZIVERT_KNIFE_ADAPTIVE = true
_G.UZIVERT_KNIFE_MAX_SIM = 180
_G.UZIVERT_KNIFE_PRED_INTERVAL = 72
_G.UZIVERT_KNIFE_H_MULT = 100
_G.UZIVERT_KNIFE_V_MULT = 100
_G.UZIVERT_KNIFE_OFF_X = 0
_G.UZIVERT_KNIFE_OFF_Y = 0
_G.UZIVERT_KNIFE_OFF_Z = 0
_G.UZIVERT_KNIFE_HIT_PART = "Head"

_G.UZIVERT_KNIFE_INSTANT = false
_G.UZIVERT_KNIFE_FAST = false
_G.UZIVERT_KNIFE_AUTO_THROW = false
_G.UZIVERT_KNIFE_AUTO_THROW_RADIUS = 25

_G.UZIVERT_KNIFE_AUTO_KILL_ALL = false
_G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = false
_G.UZIVERT_KNIFE_KILL_PLAYER = "None"

_G.UZIVERT_KNIFE_THROWN_AURA = false
_G.UZIVERT_KNIFE_RADIUS = 15

_G.UZIVERT_KNIFE_SHERIFF_BIND = false
_G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE = "Circle"

_G.UZIVERT_KNIFE_REMOTE = nil
_G.UZIVERT_KNIFE_AIM = nil
_G.UZIVERT_KNIFE_ORIGIN = nil
_G.UZIVERT_KNIFE_INSTANT_LAST = 0
_G.UZIVERT_KNIFE_LAST_THROW = 0
_G.UZIVERT_KNIFE_MOTION_PART = nil
_G.UZIVERT_KNIFE_MOTION_SAMPLES = {}
_G.UZIVERT_KNIFE_MEASURED_VEL = Vector3.zero
_G.UZIVERT_KNIFE_ACTIVE = {}
_G.UZIVERT_KNIFE_BIND_GUI = nil
_G.UZIVERT_KNIFE_BIND_BTN = nil
_G.UZIVERT_KNIFE_BIND_CONNS = {}
_G.UZIVERT_KNIFE_BIND_POS = UDim2.new(0.7, 0, 0.72, 0)
_G.UZIVERT_KNIFE_PROFILE = { Sim = 180, Interval = 72, H = 100, V = 100 }
_G.UZIVERT_KNIFE_LAST_TUNE = 0

_G.UZIVERT_KNIFE_PingProfiles = {
    { Ping = 20,  Sim = 52,  Interval = 70, H = 156, V = 146, X = -5,  Y = -14, Z = 0 },
    { Ping = 50,  Sim = 60,  Interval = 66, H = 166, V = 156, X = -6,  Y = -14, Z = 0 },
    { Ping = 100, Sim = 72,  Interval = 60, H = 180, V = 170, X = -8,  Y = -15, Z = 0 },
    { Ping = 150, Sim = 82,  Interval = 64, H = 188, V = 176, X = -9,  Y = -12, Z = 0 },
    { Ping = 200, Sim = 94,  Interval = 70, H = 198, V = 184, X = -10, Y = -11, Z = 0 },
    { Ping = 250, Sim = 104, Interval = 74, H = 206, V = 192, X = -11, Y = -10, Z = 0 },
    { Ping = 300, Sim = 114, Interval = 78, H = 214, V = 200, X = -12, Y = -9,  Z = 0 },
    { Ping = 350, Sim = 124, Interval = 82, H = 222, V = 206, X = -13, Y = -8,  Z = 0 },
    { Ping = 450, Sim = 138, Interval = 86, H = 232, V = 214, X = -14, Y = -7,  Z = 0 },
}

_G.UZKNIFE_interpProfile = function(ping)
    local arr = _G.UZIVERT_KNIFE_PingProfiles
    local a, b = arr[1], arr[1]
    if ping >= arr[#arr].Ping then
        a, b = arr[#arr], arr[#arr]
    elseif ping > a.Ping then
        for i = 1, #arr - 1 do
            if ping <= arr[i+1].Ping then
                a, b = arr[i], arr[i+1]
                break
            end
        end
    end
    local span = b.Ping - a.Ping
    local alpha = span > 0 and math.clamp((ping - a.Ping) / span, 0, 1) or 0
    alpha = alpha * alpha * (3 - 2 * alpha)
    local function mix(k) return math.floor(a[k] + (b[k] - a[k]) * alpha + 0.5) end
    return { Sim = mix("Sim"), Interval = mix("Interval"), H = mix("H"), V = mix("V") }
end

_G.UZKNIFE_autoTune = function()
    local now = os.clock()
    if now - _G.UZIVERT_KNIFE_LAST_TUNE < 0.4 then return end
    _G.UZIVERT_KNIFE_LAST_TUNE = now
    local p = _G.UZKNIFE_interpProfile(math.clamp(math.floor((_G.UZNOIR_cachedPing or 0.08) * 1000 + 0.5), 5, 1000))
    _G.UZIVERT_KNIFE_PROFILE.Sim = p.Sim
    _G.UZIVERT_KNIFE_PROFILE.Interval = p.Interval
    _G.UZIVERT_KNIFE_PROFILE.H = p.H
    _G.UZIVERT_KNIFE_PROFILE.V = p.V
end

_G.UZKNIFE_lead = function()
    local observedPing = _G.UZIVERT_KNIFE_PRIORITIZE_PING and (_G.UZNOIR_cachedPing or 0.08) or (_G.UZIVERT_KNIFE_MANUAL_PING / 1000)
    local prediction
    if _G.UZIVERT_KNIFE_ADAPTIVE then
        prediction = observedPing + _G.UZIVERT_KNIFE_EXTRA_LEAD + observedPing * 0.06
        if _G.UZIVERT_KNIFE_PREDICT_LAG then
            local s = math.clamp(_G.UZIVERT_KNIFE_PRED_INTERVAL / 2000, 0, 0.05)
            prediction = prediction + s + math.max(0, observedPing - 0.10) * 0.22
        end
    else
        prediction = _G.UZIVERT_KNIFE_FIXED_LEAD
    end
    local cap = _G.UZIVERT_KNIFE_MAX_SIM / 1000
    if _G.UZIVERT_KNIFE_ADAPTIVE then
        cap = math.min(0.52, cap + math.clamp(observedPing - 0.10, 0, 0.40) * 0.62)
    end
    return math.clamp(prediction, 0.02, cap)
end

_G.UZKNIFE_sampleMotion = function(part)
    local now = os.clock()
    if _G.UZIVERT_KNIFE_MOTION_PART ~= part then
        _G.UZIVERT_KNIFE_MOTION_PART = part
        _G.UZIVERT_KNIFE_MOTION_SAMPLES = {}
        _G.UZIVERT_KNIFE_MEASURED_VEL = part.AssemblyLinearVelocity
    end
    local samples = _G.UZIVERT_KNIFE_MOTION_SAMPLES
    local last = samples[#samples]
    local interval = _G.UZIVERT_KNIFE_PRED_INTERVAL / 1000
    if not last or now - last.time >= math.max(0.016, interval) then
        samples[#samples + 1] = { position = part.Position, time = now }
        while #samples > 8 or (#samples > 2 and now - samples[1].time > 0.35) do
            table.remove(samples, 1)
        end
        if #samples >= 2 then
            local first = samples[1]
            local newest = samples[#samples]
            local delta = newest.time - first.time
            if delta > 0.015 then
                local sampled = (newest.position - first.position) / delta
                if sampled.Magnitude < 150 then
                    _G.UZIVERT_KNIFE_MEASURED_VEL = _G.UZIVERT_KNIFE_MEASURED_VEL:Lerp(sampled, 0.55)
                end
            end
        end
    end
end

_G.UZKNIFE_calculateAim = function(part, origin)
    _G.UZKNIFE_sampleMotion(part)
    local assembly = part.AssemblyLinearVelocity
    local velocity = assembly
    if _G.UZIVERT_KNIFE_PREDICT_LAG and _G.UZIVERT_KNIFE_MOTION_PART == part and #_G.UZIVERT_KNIFE_MOTION_SAMPLES >= 2 then
        local dis = (assembly - _G.UZIVERT_KNIFE_MEASURED_VEL).Magnitude
        local w = math.clamp(0.75 - dis / 120, 0.35, 0.75)
        velocity = assembly:Lerp(_G.UZIVERT_KNIFE_MEASURED_VEL, w)
    end
    local h = _G.UZIVERT_KNIFE_H_MULT / 100
    local v = _G.UZIVERT_KNIFE_V_MULT / 100
    local pv = Vector3.new(
        velocity.X * h,
        _G.UZIVERT_KNIFE_PREDICT_JUMP and velocity.Y * v or 0,
        velocity.Z * h
    )
    local distance = (part.Position - origin).Magnitude
    local travelTime = math.clamp(distance / 110, 0, 0.65)
    local time = math.clamp(_G.UZKNIFE_lead() + travelTime, 0.03, 0.7)
    local offset = Vector3.new(
        part.Size.X * _G.UZIVERT_KNIFE_OFF_X / 100,
        part.Size.Y * _G.UZIVERT_KNIFE_OFF_Y / 100,
        part.Size.Z * _G.UZIVERT_KNIFE_OFF_Z / 100
    )
    return part.Position + pv * time + offset
end

_G.UZKNIFE_wallParams = RaycastParams.new()
_G.UZKNIFE_wallParams.FilterType = Enum.RaycastFilterType.Exclude
_G.UZKNIFE_wallParams.IgnoreWater = true

_G.UZKNIFE_targetVisible = function(part)
    if not _G.UZIVERT_KNIFE_WALL_CHECK then return true end
    local char = LocalPlayer.Character
    if not char then return false end
    local o = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
    if not o or not part then return false end
    _G.UZKNIFE_wallParams.FilterDescendantsInstances = { char }
    local r = Workspace:Raycast(o.Position, part.Position - o.Position, _G.UZKNIFE_wallParams)
    return r == nil or r.Instance:IsDescendantOf(part.Parent)
end

_G.UZKNIFE_getKnife = function()
    local char = LocalPlayer.Character
    if not char then return nil, nil end
    local k = char:FindFirstChild("Knife")
    if k then return k, "equipada" end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if bp then
        k = bp:FindFirstChild("Knife")
        if k then return k, "backpack" end
    end
    return nil, nil
end

_G.UZKNIFE_equip = function()
    local k, w = _G.UZKNIFE_getKnife()
    if k and w == "backpack" then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then pcall(function() hum:EquipTool(k) end) end
        task.wait(0.1)
    end
    return _G.UZKNIFE_getKnife()
end

_G.UZKNIFE_getRemote = function(knife)
    if not knife then return nil end
    for _, obj in ipairs(knife:GetDescendants()) do
        if obj:IsA("RemoteEvent") and obj.Name == "KnifeThrown" then return obj end
    end
end

_G.UZKNIFE_getAimPart = function(p)
    if not p or not p.Character then return nil end
    if _G.UZIVERT_KNIFE_HIT_PART == "Head" then
        return p.Character:FindFirstChild("Head") or p.Character:FindFirstChild("HumanoidRootPart")
    end
    return p.Character:FindFirstChild("HumanoidRootPart") or p.Character:FindFirstChild("Head")
end

_G.UZKNIFE_findNearest = function(radius)
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    local best, bestD = nil, radius or math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local h = p.Character:FindFirstChildOfClass("Humanoid")
            local r = p.Character:FindFirstChild("HumanoidRootPart")
            if h and h.Health > 0 and r then
                local d = (r.Position - root.Position).Magnitude
                if d < bestD then bestD = d best = p end
            end
        end
    end
    return best
end

_G.UZKNIFE_selectTarget = function()
    if _G.UZIVERT_KNIFE_PRIORITIZE_SHERIFF then
        local s = detectarSheriff()
        if s and s.Character then
            local h = s.Character:FindFirstChildOfClass("Humanoid")
            if h and h.Health > 0 then return s end
        end
    end
    return _G.UZKNIFE_findNearest()
end

_G.UZKNIFE_throwAt = function(p)
    if not p or not p.Character then return false end
    local knife = _G.UZKNIFE_equip()
    if not knife then return false end
    local remote = _G.UZKNIFE_getRemote(knife)
    if not remote then return false end
    local handle = knife:FindFirstChild("Handle")
    if not handle then return false end
    local part = _G.UZKNIFE_getAimPart(p)
    if not part then return false end
    if not _G.UZKNIFE_targetVisible(part) then return false end

    local cd = 0.38
    if _G.UZIVERT_KNIFE_INSTANT then cd = 0.05
    elseif _G.UZIVERT_KNIFE_FAST then cd = 0.12 end

    local now = tick()
    if now - _G.UZIVERT_KNIFE_LAST_THROW < cd then return false end
    _G.UZIVERT_KNIFE_LAST_THROW = now
    if _G.UZIVERT_KNIFE_INSTANT then _G.UZIVERT_KNIFE_INSTANT_LAST = now end

    local origin = handle.Position
    local aim = _G.UZKNIFE_calculateAim(part, origin)
    local look = CFrame.lookAt(origin, aim)
    local hit = CFrame.new(aim)
    pcall(function() remote:FireServer(look, hit) end)
    return true
end

-- LOOP ACTUALIZA REMOTE
task.spawn(function()
    while task.wait(0.25) do
        local knife = _G.UZKNIFE_getKnife()
        _G.UZIVERT_KNIFE_REMOTE = knife and _G.UZKNIFE_getRemote(knife) or nil
    end
end)

-- LOOP AUTO KILL
task.spawn(function()
    while task.wait(0.15) do
        if not soyMurderer() then task.wait(0.5) continue end
        if _G.UZIVERT_KNIFE_AUTO_KILL_ALL then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local h = p.Character:FindFirstChildOfClass("Humanoid")
                    if h and h.Health > 0 then
                        if _G.UZKNIFE_throwAt(p) then task.wait(0.4) end
                    end
                end
            end
        elseif _G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF then
            local s = detectarSheriff()
            if s then _G.UZKNIFE_throwAt(s) end
        elseif _G.UZIVERT_KNIFE_KILL_PLAYER ~= "None" then
            local t = Players:FindFirstChild(_G.UZIVERT_KNIFE_KILL_PLAYER)
            if t then _G.UZKNIFE_throwAt(t) end
        end
    end
end)

-- LOOP AUTO THROW
task.spawn(function()
    while task.wait(0.2) do
        if not _G.UZIVERT_KNIFE_AUTO_THROW then continue end
        if not soyMurderer() then continue end
        if _G.UZIVERT_KNIFE_AUTO_KILL_ALL or _G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF or _G.UZIVERT_KNIFE_KILL_PLAYER ~= "None" then continue end
        local target = _G.UZKNIFE_findNearest(_G.UZIVERT_KNIFE_AUTO_THROW_RADIUS)
        if target then _G.UZKNIFE_throwAt(target) end
    end
end)

-- LOOP SILENT AIM KNIFE
RunService.RenderStepped:Connect(function()
    if not _G.UZIVERT_KNIFE_SA or not soyMurderer() then
        _G.UZIVERT_KNIFE_AIM = nil
        return
    end
    local target = _G.UZKNIFE_selectTarget()
    if not target then _G.UZIVERT_KNIFE_AIM = nil return end
    local part = _G.UZKNIFE_getAimPart(target)
    if not part then _G.UZIVERT_KNIFE_AIM = nil return end
    if not _G.UZKNIFE_targetVisible(part) then _G.UZIVERT_KNIFE_AIM = nil return end
    local knife = _G.UZKNIFE_getKnife()
    if not knife then _G.UZIVERT_KNIFE_AIM = nil return end
    local handle = knife:FindFirstChild("Handle")
    if not handle then _G.UZIVERT_KNIFE_AIM = nil return end
    _G.UZIVERT_KNIFE_ORIGIN = handle.Position
    _G.UZIVERT_KNIFE_AIM = _G.UZKNIFE_calculateAim(part, _G.UZIVERT_KNIFE_ORIGIN)
end)

-- LOOP AUTOTUNE
task.spawn(function()
    while task.wait(0.5) do
        _G.UZKNIFE_autoTune()
    end
end)

-- THROW AURA
_G.UZKNIFE_knifePos = function(knife)
    if not knife or not knife.Parent then return nil end
    local b = knife:FindFirstChild("BladePosition")
    if b and b:IsA("BasePart") then return b.Position end
    if b and b:IsA("Attachment") then return b.WorldPosition end
    local v = knife:FindFirstChild("KnifeVisual")
    if v and v:IsA("BasePart") then return v.Position end
    if knife:IsA("BasePart") then return knife.Position end
    local p = knife:FindFirstChildWhichIsA("BasePart", true)
    return p and p.Position or nil
end

_G.UZKNIFE_isOwn = function(knife)
    local link = knife:FindFirstChild("HandleLink")
    local char = LocalPlayer.Character
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if link and link:IsA("ObjectValue") and link.Value then
        if char and link.Value:IsDescendantOf(char) then return true end
        if bp and link.Value:IsDescendantOf(bp) then return true end
    end
    return false
end

_G.UZKNIFE_touchPair = function(a, b)
    if type(firetouchinterest) ~= "function" then return end
    if not a or not b or not a.Parent or not b.Parent then return end
    pcall(firetouchinterest, a, b, 0)
    task.wait()
    pcall(firetouchinterest, a, b, 1)
end

_G.UZKNIFE_strike = function(knife, part)
    local tool = _G.UZKNIFE_getKnife()
    local handle = tool and tool:FindFirstChild("Handle", true)
    local blade = knife:FindFirstChild("BladePosition")
    if not (blade and blade:IsA("BasePart")) then
        blade = knife:IsA("BasePart") and knife or knife:FindFirstChildWhichIsA("BasePart", true)
    end
    _G.UZKNIFE_touchPair(blade, part)
    if handle and handle:IsA("BasePart") and handle ~= blade then
        _G.UZKNIFE_touchPair(handle, part)
    end
    if tool then
        local t = tool:FindFirstChild("HandleTouched", true)
        if t and t:IsA("RemoteEvent") then pcall(function() t:FireServer(part) end) end
        local s = tool:FindFirstChild("KnifeStabbed", true)
        if s and s:IsA("RemoteEvent") then pcall(function() s:FireServer() end) end
    end
end

_G.UZKNIFE_track = function(knife)
    if _G.UZIVERT_KNIFE_ACTIVE[knife] or not _G.UZIVERT_KNIFE_THROWN_AURA then return end
    local isK = knife.Name == "ThrowingKnife" or knife:HasTag("ThrowingKnife")
              or knife:FindFirstChild("HandleLink") ~= nil
              or knife:FindFirstChild("BladePosition") ~= nil
    if not isK then return end
    if not _G.UZKNIFE_isOwn(knife) then
        knife:WaitForChild("HandleLink", 0.1)
        if not _G.UZKNIFE_isOwn(knife) then return end
    end
    _G.UZIVERT_KNIFE_ACTIVE[knife] = { started = os.clock(), hit = {} }
end

game:GetService("CollectionService"):GetInstanceAddedSignal("ThrowingKnife"):Connect(function(k) task.defer(_G.UZKNIFE_track, k) end)
Workspace.ChildAdded:Connect(function(c)
    if c.Name == "ThrowingKnife" or c:HasTag("ThrowingKnife") then task.defer(_G.UZKNIFE_track, c) end
end)

RunService.Heartbeat:Connect(function()
    if not _G.UZIVERT_KNIFE_THROWN_AURA then _G.UZIVERT_KNIFE_ACTIVE = {} return end
    local now = os.clock()
    for k, d in pairs(_G.UZIVERT_KNIFE_ACTIVE) do
        if not k.Parent or now - d.started > 3.5 then
            _G.UZIVERT_KNIFE_ACTIVE[k] = nil
        else
            local kp = _G.UZKNIFE_knifePos(k)
            if kp then
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        local r = p.Character:FindFirstChild("HumanoidRootPart")
                        local h = p.Character:FindFirstChildOfClass("Humanoid")
                        if r and h and h.Health > 0 then
                            if (r.Position - kp).Magnitude <= _G.UZIVERT_KNIFE_RADIUS then
                                if now - (d.hit[p] or 0) >= 0.08 then
                                    d.hit[p] = now
                                    _G.UZKNIFE_strike(k, r)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)

-- SHERIFF BIND
_G.UZKNIFE_destroyBind = function()
    for _, c in ipairs(_G.UZIVERT_KNIFE_BIND_CONNS) do pcall(function() c:Disconnect() end) end
    _G.UZIVERT_KNIFE_BIND_CONNS = {}
    if _G.UZIVERT_KNIFE_BIND_GUI then _G.UZIVERT_KNIFE_BIND_GUI:Destroy() end
    _G.UZIVERT_KNIFE_BIND_GUI, _G.UZIVERT_KNIFE_BIND_BTN = nil, nil
end

_G.UZKNIFE_createBind = function()
    if _G.UZIVERT_KNIFE_BIND_BTN then return end
    local pg = LocalPlayer:FindFirstChild("PlayerGui")
    local gui = Instance.new("ScreenGui")
    gui.Name = "UzivertKnifeSheriffBind"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 90
    gui.Parent = pg
    local btn = Instance.new("ImageButton")
    btn.AnchorPoint = Vector2.new(0.5, 0.5)
    btn.Position = _G.UZIVERT_KNIFE_BIND_POS
    btn.Size = UDim2.fromOffset(64, 64)
    btn.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
    btn.BackgroundTransparency = 0.28
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Image = ""
    btn.Parent = gui
    local corner = Instance.new("UICorner")
    corner.Name = "KnifeShape"
    corner.CornerRadius = _G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE == "Circle" and UDim.new(1, 0) or UDim.new(0, 12)
    corner.Parent = btn
    local st = Instance.new("UIStroke")
    st.Color = Color3.fromRGB(255, 255, 255)
    st.Thickness = 2
    st.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    st.Parent = btn
    local lbl = Instance.new("TextLabel")
    lbl.AnchorPoint = Vector2.new(0.5, 0.5)
    lbl.Position = UDim2.fromScale(0.5, 0.5)
    lbl.Size = UDim2.fromScale(0.85, 0.85)
    lbl.BackgroundTransparency = 1
    lbl.Text = "Kill\nSheriff"
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.TextSize = 10
    lbl.TextWrapped = true
    lbl.Font = Enum.Font.GothamBold
    lbl.Parent = btn

    local dragging, moved, dragStart, startPos, dragInput = false, false, nil, nil, nil
    _G.UZIVERT_KNIFE_BIND_CONNS[#_G.UZIVERT_KNIFE_BIND_CONNS+1] = btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging, moved = true, false
            dragStart, startPos = input.Position, btn.Position
        end
    end)
    _G.UZIVERT_KNIFE_BIND_CONNS[#_G.UZIVERT_KNIFE_BIND_CONNS+1] = btn.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    _G.UZIVERT_KNIFE_BIND_CONNS[#_G.UZIVERT_KNIFE_BIND_CONNS+1] = UserInputService.InputChanged:Connect(function(input)
        if not dragging or input ~= dragInput then return end
        local d = input.Position - dragStart
        if d.Magnitude > 7 then moved = true end
        btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end)
    _G.UZIVERT_KNIFE_BIND_CONNS[#_G.UZIVERT_KNIFE_BIND_CONNS+1] = UserInputService.InputEnded:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            _G.UZIVERT_KNIFE_BIND_POS = btn.Position
            if not moved then
                local s = detectarSheriff()
                if s then _G.UZKNIFE_throwAt(s) end
            end
        end
    end)
    _G.UZIVERT_KNIFE_BIND_GUI, _G.UZIVERT_KNIFE_BIND_BTN = gui, btn
end

_G.UZKNIFE_updateBindShape = function()
    if _G.UZIVERT_KNIFE_BIND_BTN then
        local sh = _G.UZIVERT_KNIFE_BIND_BTN:FindFirstChild("KnifeShape")
        if sh then
            sh.CornerRadius = _G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE == "Circle" and UDim.new(1, 0) or UDim.new(0, 12)
        end
    end
end

-- ============================================
-- SECCIÓN UI EN PESTAÑA CRAB
-- ============================================
_G.secKnifeNoir = Instance.new("Frame")
_G.secKnifeNoir.Size = UDim2.new(1, 0, 0, 30)
_G.secKnifeNoir.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
_G.secKnifeNoir.BackgroundTransparency = 0.3
_G.secKnifeNoir.BorderSizePixel = 0
_G.secKnifeNoir.ZIndex = 2
_G.secKnifeNoir.Parent = PaginaAura

_G.cKnifeNoir = Instance.new("UICorner")
_G.cKnifeNoir.CornerRadius = UDim.new(0, 7)
_G.cKnifeNoir.Parent = _G.secKnifeNoir

_G.sKnifeNoir = Instance.new("UIStroke")
_G.sKnifeNoir.Color = COLORES.Morado3
_G.sKnifeNoir.Thickness = 1.5
_G.sKnifeNoir.Transparency = 0.2
_G.sKnifeNoir.Parent = _G.secKnifeNoir

_G.lblKnifeNoir = Instance.new("TextLabel")
_G.lblKnifeNoir.Size = UDim2.new(1, -20, 1, 0)
_G.lblKnifeNoir.Position = UDim2.new(0, 10, 0, 0)
_G.lblKnifeNoir.BackgroundTransparency = 1
_G.lblKnifeNoir.Text = "🗡️ KNIFE NOIR (Completo)"
_G.lblKnifeNoir.TextColor3 = COLORES.Naranja2
_G.lblKnifeNoir.Font = Enum.Font.GothamBlack
_G.lblKnifeNoir.TextSize = 12
_G.lblKnifeNoir.TextXAlignment = Enum.TextXAlignment.Left
_G.lblKnifeNoir.ZIndex = 3
_G.lblKnifeNoir.Parent = _G.secKnifeNoir

crearToggle(PaginaAura, "🗡️ Knife Silent Aim", CONFIG.UZKNIFE_SA or false, function(e)
    _G.UZIVERT_KNIFE_SA = e
    CONFIG.UZKNIFE_SA = e
    guardarConfig()
end)
crearToggle(PaginaAura, "🧱 Knife Wall Check", CONFIG.UZKNIFE_WallCheck or false, function(e)
    _G.UZIVERT_KNIFE_WALL_CHECK = e
    CONFIG.UZKNIFE_WallCheck = e
    guardarConfig()
end)
crearToggle(PaginaAura, "🎯 Prioritize Sheriff", CONFIG.UZKNIFE_PrioritizeSheriff or false, function(e)
    _G.UZIVERT_KNIFE_PRIORITIZE_SHERIFF = e
    CONFIG.UZKNIFE_PrioritizeSheriff = e
    guardarConfig()
end)
crearToggle(PaginaAura, "🦘 Predict Jump", CONFIG.UZKNIFE_PredictJump ~= false, function(e)
    _G.UZIVERT_KNIFE_PREDICT_JUMP = e
    CONFIG.UZKNIFE_PredictJump = e
    guardarConfig()
end)
crearToggle(PaginaAura, "🏃 Predict Lag", CONFIG.UZKNIFE_PredictLag ~= false, function(e)
    _G.UZIVERT_KNIFE_PREDICT_LAG = e
    CONFIG.UZKNIFE_PredictLag = e
    guardarConfig()
end)
crearToggle(PaginaAura, "📡 Prioritize Ping", CONFIG.UZKNIFE_PrioritizePing ~= false, function(e)
    _G.UZIVERT_KNIFE_PRIORITIZE_PING = e
    CONFIG.UZKNIFE_PrioritizePing = e
    guardarConfig()
end)
crearSlider(PaginaAura, "🎯 Extra Lead (x1000)", 0, 100, math.floor((CONFIG.UZKNIFE_ExtraLead or 0.02) * 1000), function(v)
    _G.UZIVERT_KNIFE_EXTRA_LEAD = v / 1000
    CONFIG.UZKNIFE_ExtraLead = v / 1000
    guardarConfig()
end)
crearSlider(PaginaAura, "⚙️ Max Sim (ms)", 50, 500, CONFIG.UZKNIFE_MaxSim or 180, function(v)
    _G.UZIVERT_KNIFE_MAX_SIM = v
    CONFIG.UZKNIFE_MaxSim = v
    guardarConfig()
end)
crearSlider(PaginaAura, "🎯 Pred Interval (ms)", 30, 200, CONFIG.UZKNIFE_PredInterval or 72, function(v)
    _G.UZIVERT_KNIFE_PRED_INTERVAL = v
    CONFIG.UZKNIFE_PredInterval = v
    guardarConfig()
end)
crearSlider(PaginaAura, "↔️ H Mult (%)", 50, 250, CONFIG.UZKNIFE_HMult or 100, function(v)
    _G.UZIVERT_KNIFE_H_MULT = v
    CONFIG.UZKNIFE_HMult = v
    guardarConfig()
end)
crearSlider(PaginaAura, "↕️ V Mult (%)", 50, 250, CONFIG.UZKNIFE_VMult or 100, function(v)
    _G.UZIVERT_KNIFE_V_MULT = v
    CONFIG.UZKNIFE_VMult = v
    guardarConfig()
end)
crearSlider(PaginaAura, "⬅️ Offset X (%)", -100, 100, CONFIG.UZKNIFE_OffX or 0, function(v)
    _G.UZIVERT_KNIFE_OFF_X = v
    CONFIG.UZKNIFE_OffX = v
    guardarConfig()
end)
crearSlider(PaginaAura, "⬆️ Offset Y (%)", -100, 100, CONFIG.UZKNIFE_OffY or 0, function(v)
    _G.UZIVERT_KNIFE_OFF_Y = v
    CONFIG.UZKNIFE_OffY = v
    guardarConfig()
end)
crearSlider(PaginaAura, "↗️ Offset Z (%)", -100, 100, CONFIG.UZKNIFE_OffZ or 0, function(v)
    _G.UZIVERT_KNIFE_OFF_Z = v
    CONFIG.UZKNIFE_OffZ = v
    guardarConfig()
end)
crearToggle(PaginaAura, "⚡ Instant Throw", CONFIG.UZKNIFE_InstantThrow or false, function(e)
    _G.UZIVERT_KNIFE_INSTANT = e
    CONFIG.UZKNIFE_InstantThrow = e
    if e then
        _G.UZIVERT_KNIFE_FAST = false
        CONFIG.UZKNIFE_FastThrow = false
    end
    guardarConfig()
end)
crearToggle(PaginaAura, "🏃 Fast Throw", CONFIG.UZKNIFE_FastThrow or false, function(e)
    _G.UZIVERT_KNIFE_FAST = e
    CONFIG.UZKNIFE_FastThrow = e
    if e then
        _G.UZIVERT_KNIFE_INSTANT = false
        CONFIG.UZKNIFE_InstantThrow = false
    end
    guardarConfig()
end)
crearToggle(PaginaAura, "🎯 Auto Throw (cerca)", CONFIG.UZKNIFE_AutoThrow or false, function(e)
    _G.UZIVERT_KNIFE_AUTO_THROW = e
    CONFIG.UZKNIFE_AutoThrow = e
    guardarConfig()
end)
crearSlider(PaginaAura, "Rango Auto Throw", 5, 100, CONFIG.UZKNIFE_AutoThrowRadius or 25, function(v)
    _G.UZIVERT_KNIFE_AUTO_THROW_RADIUS = v
    CONFIG.UZKNIFE_AutoThrowRadius = v
    guardarConfig()
end)
crearToggle(PaginaAura, "💥 Auto Kill Everyone", CONFIG.UZKNIFE_AutoKillAll or false, function(e)
    _G.UZIVERT_KNIFE_AUTO_KILL_ALL = e
    CONFIG.UZKNIFE_AutoKillAll = e
    if e then
        _G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = false
        CONFIG.UZKNIFE_AutoKillSheriff = false
        _G.UZIVERT_KNIFE_KILL_PLAYER = "None"
        CONFIG.UZKNIFE_KillPlayer = "None"
    end
    guardarConfig()
end)
crearToggle(PaginaAura, "💥 Auto Kill Sheriff", CONFIG.UZKNIFE_AutoKillSheriff or false, function(e)
    _G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = e
    CONFIG.UZKNIFE_AutoKillSheriff = e
    if e then
        _G.UZIVERT_KNIFE_AUTO_KILL_ALL = false
        CONFIG.UZKNIFE_AutoKillAll = false
        _G.UZIVERT_KNIFE_KILL_PLAYER = "None"
        CONFIG.UZKNIFE_KillPlayer = "None"
    end
    guardarConfig()
end)

_G.lblKnifeKillPlayer = Instance.new("TextButton")
_G.lblKnifeKillPlayer.Size = UDim2.new(1, 0, 0, 38)
_G.lblKnifeKillPlayer.BackgroundColor3 = COLORES.Morado3
_G.lblKnifeKillPlayer.BackgroundTransparency = 0.5
_G.lblKnifeKillPlayer.Text = "Kill Player: " .. (_G.UZIVERT_KNIFE_KILL_PLAYER or "None")
_G.lblKnifeKillPlayer.TextColor3 = COLORES.Texto
_G.lblKnifeKillPlayer.Font = Enum.Font.GothamBold
_G.lblKnifeKillPlayer.TextSize = 11
_G.lblKnifeKillPlayer.BorderSizePixel = 0
_G.lblKnifeKillPlayer.ZIndex = 2
_G.lblKnifeKillPlayer.Parent = PaginaAura
_G.ckp = Instance.new("UICorner")
_G.ckp.CornerRadius = UDim.new(0, 8)
_G.ckp.Parent = _G.lblKnifeKillPlayer
_G.lblKnifeKillPlayer.MouseButton1Click:Connect(function()
    local names = {"None"}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then names[#names+1] = p.Name end
    end
    local idx = table.find(names, _G.UZIVERT_KNIFE_KILL_PLAYER) or 1
    idx = idx % #names + 1
    _G.UZIVERT_KNIFE_KILL_PLAYER = names[idx]
    CONFIG.UZKNIFE_KillPlayer = names[idx]
    _G.lblKnifeKillPlayer.Text = "Kill Player: " .. names[idx]
    if names[idx] ~= "None" then
        _G.UZIVERT_KNIFE_AUTO_KILL_ALL = false
        _G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = false
        CONFIG.UZKNIFE_AutoKillAll = false
        CONFIG.UZKNIFE_AutoKillSheriff = false
    end
    guardarConfig()
end)

crearToggle(PaginaAura, "🗡️ Knife Throw Aura", CONFIG.UZKNIFE_ThrowAura or false, function(e)
    _G.UZIVERT_KNIFE_THROWN_AURA = e
    CONFIG.UZKNIFE_ThrowAura = e
    guardarConfig()
end)
crearSlider(PaginaAura, "Aura Radius", 5, 40, CONFIG.UZKNIFE_AuraRadius or 15, function(v)
    _G.UZIVERT_KNIFE_RADIUS = v
    CONFIG.UZKNIFE_AuraRadius = v
    guardarConfig()
end)
crearToggle(PaginaAura, "🎯 Sheriff Bind Button", CONFIG.UZKNIFE_SheriffBind or false, function(e)
    _G.UZIVERT_KNIFE_SHERIFF_BIND = e
    CONFIG.UZKNIFE_SheriffBind = e
    if e then _G.UZKNIFE_createBind() else _G.UZKNIFE_destroyBind() end
    guardarConfig()
end)
crearToggle(PaginaAura, "Shape: Circle", (CONFIG.UZKNIFE_SheriffBindShape or "Circle") == "Circle", function(e)
    _G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE = e and "Circle" or "Square"
    CONFIG.UZKNIFE_SheriffBindShape = _G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE
    _G.UZKNIFE_updateBindShape()
    guardarConfig()
end)

-- Aplicar config guardada al arrancar
task.defer(function()
    _G.UZIVERT_KNIFE_SA = CONFIG.UZKNIFE_SA or false
    _G.UZIVERT_KNIFE_WALL_CHECK = CONFIG.UZKNIFE_WallCheck or false
    _G.UZIVERT_KNIFE_PRIORITIZE_SHERIFF = CONFIG.UZKNIFE_PrioritizeSheriff or false
    _G.UZIVERT_KNIFE_PREDICT_JUMP = CONFIG.UZKNIFE_PredictJump ~= false
    _G.UZIVERT_KNIFE_PREDICT_LAG = CONFIG.UZKNIFE_PredictLag ~= false
    _G.UZIVERT_KNIFE_PRIORITIZE_PING = CONFIG.UZKNIFE_PrioritizePing ~= false
    _G.UZIVERT_KNIFE_EXTRA_LEAD = CONFIG.UZKNIFE_ExtraLead or 0.02
    _G.UZIVERT_KNIFE_MAX_SIM = CONFIG.UZKNIFE_MaxSim or 180
    _G.UZIVERT_KNIFE_PRED_INTERVAL = CONFIG.UZKNIFE_PredInterval or 72
    _G.UZIVERT_KNIFE_H_MULT = CONFIG.UZKNIFE_HMult or 100
    _G.UZIVERT_KNIFE_V_MULT = CONFIG.UZKNIFE_VMult or 100
    _G.UZIVERT_KNIFE_OFF_X = CONFIG.UZKNIFE_OffX or 0
    _G.UZIVERT_KNIFE_OFF_Y = CONFIG.UZKNIFE_OffY or 0
    _G.UZIVERT_KNIFE_OFF_Z = CONFIG.UZKNIFE_OffZ or 0
    _G.UZIVERT_KNIFE_INSTANT = CONFIG.UZKNIFE_InstantThrow or false
    _G.UZIVERT_KNIFE_FAST = CONFIG.UZKNIFE_FastThrow or false
    _G.UZIVERT_KNIFE_AUTO_THROW = CONFIG.UZKNIFE_AutoThrow or false
    _G.UZIVERT_KNIFE_AUTO_THROW_RADIUS = CONFIG.UZKNIFE_AutoThrowRadius or 25
    _G.UZIVERT_KNIFE_AUTO_KILL_ALL = CONFIG.UZKNIFE_AutoKillAll or false
    _G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = CONFIG.UZKNIFE_AutoKillSheriff or false
    _G.UZIVERT_KNIFE_KILL_PLAYER = CONFIG.UZKNIFE_KillPlayer or "None"
    _G.UZIVERT_KNIFE_THROWN_AURA = CONFIG.UZKNIFE_ThrowAura or false
    _G.UZIVERT_KNIFE_RADIUS = CONFIG.UZKNIFE_AuraRadius or 15
    _G.UZIVERT_KNIFE_SHERIFF_BIND = CONFIG.UZKNIFE_SheriffBind or false
    _G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE = CONFIG.UZKNIFE_SheriffBindShape or "Circle"
    if _G.UZIVERT_KNIFE_SHERIFF_BIND then _G.UZKNIFE_createBind() end
end)

print("🗡️ [KNIFE NOIR] Cargado en pestaña Crab")

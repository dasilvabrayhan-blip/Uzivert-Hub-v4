 -- ═══════════════════════════════════════════════════════════
-- UZIVERT HUB AUTO FARM - ESPECIAL EDITION (HALLOWEEN 2026)
-- Lógica original + interfaz propia (sin WindUI)
-- Edición limitada: disponible hasta el 16 de noviembre de 2026
-- ═══════════════════════════════════════════════════════════
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local LP = Players.LocalPlayer

-- ═══════════════════════════════════════════════════════════
-- UI ESPECIAL EDITION (propia, sin WindUI)
-- Edicion limitada: disponible hasta el 16 de noviembre de 2026
-- ═══════════════════════════════════════════════════════════
local SE_DEADLINE = 1794884399 -- 16/11/2026 23:59:59 (hora de Paraguay, UTC-3)
local SE_DISCORD = "discord.gg/vHhERWcbXe"
local SE_ORB_IMAGE = "" -- opcional: "rbxassetid://ID" con tu imagen para el orbe (vacio = eclipse dibujado)

local Window
do
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Debris = game:GetService("Debris")
    local CoreGui = game:GetService("CoreGui")

    -- ───────────── paleta: oro antiguo sobre negro ─────────────
    local C = {
        void = Color3.fromRGB(6, 5, 8),
        panel = Color3.fromRGB(12, 10, 14),
        card = Color3.fromRGB(19, 16, 20),
        line = Color3.fromRGB(66, 52, 24),
        gold = Color3.fromRGB(212, 175, 55),
        goldL = Color3.fromRGB(242, 218, 140),
        goldD = Color3.fromRGB(128, 96, 26),
        blood = Color3.fromRGB(128, 20, 26),
        ember = Color3.fromRGB(222, 92, 34),
        text = Color3.fromRGB(234, 226, 206),
        sub = Color3.fromRGB(150, 140, 120),
    }

    -- ───────────── helpers ─────────────
    local function mk(class, props, parent)
        local o = Instance.new(class)
        for k, v in pairs(props) do o[k] = v end
        if parent then o.Parent = parent end
        return o
    end
    local function tw(o, t, goal, style, dir)
        local tween = TweenService:Create(o, TweenInfo.new(t, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out), goal)
        tween:Play()
        return tween
    end
    local function loopTw(o, t, goal, delay)
        TweenService:Create(o, TweenInfo.new(t, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true, delay or 0), goal):Play()
    end
    local function corner(p, r)
        return mk("UICorner", { CornerRadius = (typeof(r) == "UDim") and r or UDim.new(0, r or 6) }, p)
    end
    local function stroke(p, col, th, tr)
        return mk("UIStroke", { Color = col, Thickness = th or 1, Transparency = tr or 0, ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, p)
    end
    local function goldGrad(p, rot)
        return mk("UIGradient", {
            Rotation = rot or 0,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, C.goldD),
                ColorSequenceKeypoint.new(0.5, C.goldL),
                ColorSequenceKeypoint.new(1, C.gold),
            }),
        }, p)
    end
    local function circle(parent, size, color, z)
        local f = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(size, size),
            BackgroundColor3 = color, BorderSizePixel = 0, ZIndex = z or 1,
        }, parent)
        mk("UICorner", { CornerRadius = UDim.new(1, 0) }, f)
        return f
    end
    local function label(parent, props)
        props.BackgroundTransparency = 1
        props.Font = props.Font or Enum.Font.Gotham
        props.TextColor3 = props.TextColor3 or C.text
        props.TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Left
        return mk("TextLabel", props, parent)
    end

    -- ───────────── tiempo (edicion limitada) ─────────────
    local function now()
        local ok, t = pcall(function() return Workspace:GetServerTimeNow() end)
        if ok and type(t) == "number" and t > 1000000000 then return t end
        return os.time()
    end
    local function timeLeft() return SE_DEADLINE - now() end
    local function fmtLeft(sec)
        sec = math.max(0, math.floor(sec))
        return string.format("%dd %02dh %02dm %02ds", math.floor(sec / 86400), math.floor(sec % 86400 / 3600), math.floor(sec % 3600 / 60), sec % 60)
    end

    -- ───────────── ScreenGui + limpieza ─────────────
    if _G.UZ_SE_CLEAN then pcall(_G.UZ_SE_CLEAN) end
    local conns = {}
    local alive = true
    local gui = mk("ScreenGui", {
        Name = "UzivertHub", ResetOnSpawn = false, IgnoreGuiInset = true, DisplayOrder = 999,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })
    do
        local okH, hui = pcall(function() return gethui and gethui() end)
        local parent = (okH and hui) or CoreGui
        pcall(function()
            local old = parent:FindFirstChild("UzivertHub")
            if old then old:Destroy() end
        end)
        if not pcall(function() gui.Parent = parent end) then gui.Parent = LP:WaitForChild("PlayerGui") end
    end
    local function cleanup()
        alive = false
        for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
        conns = {}
        pcall(function() gui:Destroy() end)
    end
    _G.UZ_SE_CLEAN = cleanup

    local function copyDiscord()
        local ok = pcall(function() setclipboard(SE_DISCORD) end)
        return ok
    end

    -- ───────────── pantalla: edicion finalizada ─────────────
    local function showEnded()
        local sc = mk("UIScale", { Scale = 0 })
        local box = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(390, 210),
            BackgroundColor3 = C.panel, BorderSizePixel = 0,
        }, gui)
        sc.Parent = box
        corner(box, 6)
        local st = stroke(box, C.gold, 2)
        loopTw(st, 1.6, { Color = C.goldD })
        tw(sc, 0.7, { Scale = 1 }, Enum.EasingStyle.Back)

        label(box, {
            Position = UDim2.fromOffset(20, 18), Size = UDim2.new(1, -40, 0, 28), Text = "ESPECIAL EDITION FINALIZADA",
            Font = Enum.Font.Garamond, TextSize = 24, TextColor3 = C.gold, TextXAlignment = Enum.TextXAlignment.Center,
        })
        label(box, {
            Position = UDim2.fromOffset(24, 56), Size = UDim2.new(1, -48, 0, 80), TextWrapped = true, TextSize = 12,
            TextYAlignment = Enum.TextYAlignment.Top, TextColor3 = C.sub,
            Text = "Uzivert Hub Auto Farm Especial Edition estuvo disponible hasta el 16 de noviembre de 2026. Gracias por acompañarnos.\n\nSigue las novedades en el Discord oficial.",
        })
        local b1 = mk("TextButton", {
            Position = UDim2.new(0, 24, 1, -52), Size = UDim2.new(0.5, -30, 0, 34), BackgroundColor3 = C.card, AutoButtonColor = false,
            Text = "Copiar Discord", Font = Enum.Font.Garamond, TextSize = 17, TextColor3 = C.goldL, BorderSizePixel = 0,
        }, box)
        corner(b1, 5) stroke(b1, C.goldD, 1)
        local b2 = mk("TextButton", {
            Position = UDim2.new(0.5, 6, 1, -52), Size = UDim2.new(0.5, -30, 0, 34), BackgroundColor3 = C.card, AutoButtonColor = false,
            Text = "Cerrar", Font = Enum.Font.Garamond, TextSize = 17, TextColor3 = C.text, BorderSizePixel = 0,
        }, box)
        corner(b2, 5) stroke(b2, C.line, 1)
        b1.Activated:Connect(function()
            b1.Text = copyDiscord() and "Copiado" or SE_DISCORD
            task.delay(2, function() if b1.Parent then b1.Text = "Copiar Discord" end end)
        end)
        b2.Activated:Connect(cleanup)
    end

    if timeLeft() <= 0 then
        showEnded()
        return
    end

    -- ═══════════════════════════════════════════════════════════
    -- VENTANA
    -- ═══════════════════════════════════════════════════════════
    local W, H = 560, 344
    local SIDE = 132
    local HEAD = 62

    local holder = mk("Frame", {
        Name = "Holder", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(W, H), BackgroundTransparency = 1, Visible = false,
    }, gui)
    local winScale = mk("UIScale", { Scale = 1 }, holder)
    local function fitScale()
        local cam = workspace.CurrentCamera
        local vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
        return math.clamp(math.min(vp.X / (W + 40), vp.Y / (H + 60)), 0.45, 1.15)
    end
    winScale.Scale = fitScale()
    do
        local cam = workspace.CurrentCamera
        if cam then
            conns[#conns + 1] = cam:GetPropertyChangedSignal("ViewportSize"):Connect(function() winScale.Scale = fitScale() end)
        end
    end

    -- "cortina": la ventana se abre desde una linea fina
    local shell = mk("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(W, 2),
        BackgroundColor3 = C.panel, BorderSizePixel = 0, ClipsDescendants = true,
    }, holder)
    corner(shell, 6)
    local shellStroke = stroke(shell, Color3.new(1, 1, 1), 2)
    local borderGrad = mk("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.goldL), ColorSequenceKeypoint.new(0.35, C.goldD),
            ColorSequenceKeypoint.new(0.7, C.goldD), ColorSequenceKeypoint.new(1, C.goldL),
        }),
        Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.55), NumberSequenceKeypoint.new(1, 0),
        }),
    }, shellStroke)

    local body = mk("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(W, H),
        BackgroundTransparency = 1,
    }, shell)

    local flick = {} -- funciones que se animan cada frame

    -- ───────────── fondo ─────────────
    local bg = mk("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 1 }, body)
    mk("UIGradient", {
        Rotation = 90,
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(9, 7, 11)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(14, 11, 13)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 18, 11)),
        }),
    }, bg)

    -- niebla densa que se arrastra
    for i = 1, 3 do
        local fog = mk("Frame", {
            Position = UDim2.fromOffset(-W * 0.5, 70 + i * 70), Size = UDim2.fromOffset(W * 1.3, 90),
            BackgroundColor3 = Color3.fromRGB(150, 135, 160), BackgroundTransparency = 0, BorderSizePixel = 0, ZIndex = 2,
        }, body)
        mk("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.94), NumberSequenceKeypoint.new(1, 1),
            }),
        }, fog)
        loopTw(fog, 26 + i * 9, { Position = UDim2.fromOffset(-W * 0.1, 70 + i * 70 + (i % 2 == 0 and 14 or -14)) }, i * 1.7)
    end

    -- ceniza que cae despacio
    task.spawn(function()
        while alive do
            local x = math.random(10, W - 10)
            local dur = 7 + math.random() * 4
            local drop = mk("Frame", { Position = UDim2.fromOffset(x, -6), Size = UDim2.fromOffset(1, 1), BackgroundTransparency = 1, ZIndex = 3 }, body)
            local speck = mk("Frame", {
                Size = UDim2.fromOffset(math.random(2, 3), math.random(2, 3)), BorderSizePixel = 0,
                BackgroundColor3 = (math.random() > 0.7) and C.goldD or Color3.fromRGB(120, 112, 104),
                BackgroundTransparency = 0.45,
            }, drop)
            tw(drop, dur, { Position = UDim2.fromOffset(x, H + 8) }, Enum.EasingStyle.Linear)
            tw(speck, dur / 2, { Position = UDim2.fromOffset(math.random(-14, 14), 0) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            Debris:AddItem(drop, dur + 0.1)
            task.wait(0.4)
        end
    end)

    -- vineta que respira
    local vig = {}
    local function vignette(pos, size, rot)
        local v = mk("Frame", { Position = pos, Size = size, BackgroundColor3 = Color3.new(0, 0, 0), BorderSizePixel = 0, ZIndex = 4 }, body)
        mk("UIGradient", {
            Rotation = rot,
            Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.05), NumberSequenceKeypoint.new(1, 1) }),
        }, v)
        vig[#vig + 1] = v
    end
    vignette(UDim2.fromScale(0, 0), UDim2.fromScale(1, 0.3), 90)
    vignette(UDim2.fromScale(0, 0.7), UDim2.fromScale(1, 0.3), 270)
    vignette(UDim2.fromScale(0, 0), UDim2.fromScale(0.2, 1), 0)
    vignette(UDim2.fromScale(0.8, 0), UDim2.fromScale(0.2, 1), 180)
    local breath = mk("Frame", { Size = UDim2.fromScale(1, 1), BackgroundColor3 = Color3.new(0, 0, 0), BackgroundTransparency = 0.8, BorderSizePixel = 0, ZIndex = 4 }, body)
    loopTw(breath, 3.6, { BackgroundTransparency = 0.62 })

    -- ───────────── cabecera ─────────────
    local header = mk("Frame", {
        Size = UDim2.new(1, 0, 0, HEAD), BackgroundColor3 = C.void, BackgroundTransparency = 0.2, BorderSizePixel = 0, ZIndex = 10,
    }, body)

    -- sello: eclipse con corona dorada (se reutiliza en el orbe)
    local function makeSigil(parent, size, z, image)
        local h = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(size, size),
            BackgroundTransparency = 1, ZIndex = z,
        }, parent)
        local glow = circle(h, size * 1.7, C.gold, z)
        glow.BackgroundTransparency = 0.9
        local ring = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(size, size),
            BackgroundTransparency = 1, ZIndex = z + 1,
        }, h)
        mk("UICorner", { CornerRadius = UDim.new(1, 0) }, ring)
        local rs = mk("UIStroke", { Thickness = 2, Color = Color3.new(1, 1, 1) }, ring)
        local rg = mk("UIGradient", {
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, C.goldL), ColorSequenceKeypoint.new(0.5, C.goldD), ColorSequenceKeypoint.new(1, C.goldL),
            }),
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.7), NumberSequenceKeypoint.new(1, 0),
            }),
        }, rs)
        if image and image ~= "" then
            local disc = circle(h, size * 0.8, C.void, z + 1)
            disc.ClipsDescendants = true
            local img = mk("ImageLabel", {
                Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Image = image, ScaleType = Enum.ScaleType.Crop, ZIndex = z + 2,
            }, disc)
            mk("UICorner", { CornerRadius = UDim.new(1, 0) }, img)
        else
            local crescent = circle(h, size * 0.8, C.goldL, z + 1)
            crescent.Position = UDim2.new(0.5, size * 0.05, 0.5, -size * 0.05)
            circle(h, size * 0.78, C.void, z + 2)
        end
        local function upd(t)
            rg.Rotation = (t * 70) % 360
            glow.BackgroundTransparency = 0.88 + 0.06 * math.sin(t * 1.6) + 0.03 * math.noise(t * 5)
        end
        return h, upd
    end
    do
        local sg = mk("Frame", { Position = UDim2.fromOffset(34, 31), Size = UDim2.fromOffset(1, 1), BackgroundTransparency = 1, ZIndex = 11 }, header)
        local _, upd = makeSigil(sg, 36, 11)
        flick[#flick + 1] = upd
    end

    local titleTxt = "UZIVERT HUB AUTO FARM"
    local ghost = label(header, {
        Position = UDim2.fromOffset(64, 7), Size = UDim2.fromOffset(330, 24), Text = titleTxt, Font = Enum.Font.Garamond,
        TextSize = 21, TextColor3 = C.blood, TextTransparency = 1, ZIndex = 11,
    })
    local title = label(header, {
        Position = UDim2.fromOffset(64, 7), Size = UDim2.fromOffset(330, 24), Text = titleTxt, Font = Enum.Font.Garamond,
        TextSize = 21, TextColor3 = Color3.new(1, 1, 1), ZIndex = 12,
    })
    local titleGrad = mk("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.goldD), ColorSequenceKeypoint.new(0.45, C.gold),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 244, 200)), ColorSequenceKeypoint.new(0.55, C.gold),
            ColorSequenceKeypoint.new(1, C.goldD),
        }),
        Offset = Vector2.new(-1, 0),
    }, title)
    task.spawn(function()
        while alive do
            titleGrad.Offset = Vector2.new(-1, 0)
            tw(titleGrad, 3.6, { Offset = Vector2.new(1, 0) }, Enum.EasingStyle.Linear)
            task.wait(4.6)
        end
    end)
    -- falla de senal: el titulo se desdobla en rojo un instante
    task.spawn(function()
        while alive do
            task.wait(8 + math.random() * 7)
            for _ = 1, math.random(2, 3) do
                if not alive then return end
                ghost.Position = UDim2.fromOffset(64 + math.random(-3, 3), 7 + math.random(-1, 1))
                ghost.TextTransparency = 0.45
                title.Position = UDim2.fromOffset(64 + math.random(-2, 2), 7)
                task.wait(0.06)
                ghost.TextTransparency = 1
                title.Position = UDim2.fromOffset(64, 7)
                task.wait(0.05)
            end
        end
    end)

    local subtitle = label(header, {
        Position = UDim2.fromOffset(64, 31), Size = UDim2.fromOffset(300, 12), Text = "E S P E C I A L   E D I T I O N",
        Font = Enum.Font.GothamBold, TextSize = 9, TextColor3 = C.gold, ZIndex = 12,
    })
    loopTw(subtitle, 2.4, { TextTransparency = 0.35 })
    label(header, {
        Position = UDim2.fromOffset(64, 44), Size = UDim2.fromOffset(300, 13), Text = "By Uzivert 🇵🇾",
        Font = Enum.Font.GothamMedium, TextSize = 10, TextColor3 = C.sub, ZIndex = 12,
    })

    -- cuenta regresiva
    label(header, {
        AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -78, 0, 11), Size = UDim2.fromOffset(190, 11),
        Text = "EDICION LIMITADA  -  TERMINA EN", Font = Enum.Font.GothamBold, TextSize = 8, TextColor3 = C.sub,
        TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 12,
    })
    local countdown = label(header, {
        AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -78, 0, 24), Size = UDim2.fromOffset(190, 18),
        Text = fmtLeft(timeLeft()), Font = Enum.Font.Garamond, TextSize = 16, TextColor3 = C.goldL,
        TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 12,
    })
    local urgent = false
    task.spawn(function()
        while alive do
            local left = timeLeft()
            if left <= 0 then
                -- la edicion termino: se apaga el farm y se muestra el aviso
                pcall(function() if _G.FARM_UNLOAD then _G.FARM_UNLOAD() end end)
                alive = false
                for _, c in ipairs(conns) do pcall(function() c:Disconnect() end) end
                conns = {}
                for _, c in ipairs(gui:GetChildren()) do c:Destroy() end
                showEnded()
                return
            end
            countdown.Text = fmtLeft(left)
            if left < 86400 and not urgent then
                urgent = true
                countdown.TextColor3 = Color3.fromRGB(196, 54, 50)
                loopTw(countdown, 0.9, { TextTransparency = 0.4 })
            end
            task.wait(1)
        end
    end)

    -- botones minimizar / cerrar
    local function headBtn(x, kind, hoverCol)
        local b = mk("TextButton", {
            AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, x, 0, 12), Size = UDim2.fromOffset(24, 24),
            BackgroundColor3 = C.card, BackgroundTransparency = 0.2, Text = "", AutoButtonColor = false, BorderSizePixel = 0, ZIndex = 13,
        }, header)
        corner(b, 4)
        local st = stroke(b, C.line, 1)
        local parts = {}
        local function bar(w, h, rot)
            local f = mk("Frame", {
                AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(w, h),
                BackgroundColor3 = C.sub, BorderSizePixel = 0, Rotation = rot or 0, ZIndex = 14,
            }, b)
            parts[#parts + 1] = f
        end
        if kind == "min" then bar(10, 2) else bar(12, 2, 45) bar(12, 2, -45) end
        b.MouseEnter:Connect(function()
            tw(st, 0.15, { Color = hoverCol })
            for _, f in ipairs(parts) do tw(f, 0.15, { BackgroundColor3 = hoverCol }) end
        end)
        b.MouseLeave:Connect(function()
            tw(st, 0.15, { Color = C.line })
            for _, f in ipairs(parts) do tw(f, 0.15, { BackgroundColor3 = C.sub }) end
        end)
        return b
    end
    local minBtn = headBtn(-44, "min", C.gold)
    local closeBtn = headBtn(-12, "close", Color3.fromRGB(196, 54, 50))

    -- linea bajo la cabecera con destello que la recorre
    local hline = mk("Frame", { Position = UDim2.fromOffset(0, HEAD), Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = C.goldD, BackgroundTransparency = 0.4, BorderSizePixel = 0, ZIndex = 13 }, body)
    local glint = mk("Frame", { Position = UDim2.fromOffset(-90, HEAD - 1), Size = UDim2.fromOffset(90, 3), BackgroundColor3 = C.goldL, BorderSizePixel = 0, ZIndex = 14 }, body)
    mk("UIGradient", {
        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.1), NumberSequenceKeypoint.new(1, 1) }),
    }, glint)
    task.spawn(function()
        while alive do
            glint.Position = UDim2.fromOffset(-90, HEAD - 1)
            tw(glint, 2.4, { Position = UDim2.fromOffset(W, HEAD - 1) }, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            task.wait(5.2)
        end
    end)

    -- ───────────── barra lateral ─────────────
    local sidebar = mk("Frame", {
        Position = UDim2.fromOffset(0, HEAD + 1), Size = UDim2.new(0, SIDE, 1, -(HEAD + 1)), BackgroundColor3 = C.void,
        BackgroundTransparency = 0.45, BorderSizePixel = 0, ZIndex = 10,
    }, body)
    mk("Frame", { AnchorPoint = Vector2.new(1, 0), Position = UDim2.fromScale(1, 0), Size = UDim2.new(0, 1, 1, 0), BackgroundColor3 = C.line, BorderSizePixel = 0, ZIndex = 11 }, sidebar)
    local indicator = mk("Frame", { Position = UDim2.fromOffset(0, 20), Size = UDim2.fromOffset(3, 22), BackgroundColor3 = C.gold, BorderSizePixel = 0, ZIndex = 13 }, sidebar)
    label(sidebar, {
        AnchorPoint = Vector2.new(0.5, 1), Position = UDim2.new(0.5, 0, 1, -10), Size = UDim2.new(1, -10, 0, 12),
        Text = "H A L L O W E E N   2 0 2 6", Font = Enum.Font.GothamBold, TextSize = 7, TextColor3 = C.goldD,
        TextXAlignment = Enum.TextXAlignment.Center, ZIndex = 12,
    })

    -- iconos dibujados
    local function drawIcon(kind, parent)
        local box = mk("Frame", { Position = UDim2.fromOffset(12, 8), Size = UDim2.fromOffset(18, 18), BackgroundTransparency = 1, ZIndex = 13 }, parent)
        local paint = {}
        local function rect(x, y, w, h, r, rot)
            local f = mk("Frame", { Position = UDim2.fromOffset(x, y), Size = UDim2.fromOffset(w, h), BackgroundColor3 = C.sub, BorderSizePixel = 0, Rotation = rot or 0, ZIndex = 13 }, box)
            if r then corner(f, UDim.new(r, 0)) end
            paint[#paint + 1] = { f, "bg" }
            return f
        end
        local function ring(x, y, w, h, r, th, rot)
            local f = mk("Frame", { Position = UDim2.fromOffset(x, y), Size = UDim2.fromOffset(w, h), BackgroundTransparency = 1, Rotation = rot or 0, ZIndex = 13 }, box)
            corner(f, UDim.new(r, 0))
            local s = mk("UIStroke", { Thickness = th, Color = C.sub }, f)
            paint[#paint + 1] = { s, "stroke" }
            return f
        end
        if kind == "coins" then
            ring(1, 1, 16, 16, 1, 2)
            rect(7, 7, 4, 4, 1)
        elseif kind == "settings" then
            rect(1, 3, 16, 2, 1) rect(1, 8, 16, 2, 1) rect(1, 13, 16, 2, 1)
            rect(10, 1, 4, 6, 0.4) rect(4, 6, 4, 6, 0.4) rect(11, 11, 4, 6, 0.4)
        elseif kind == "crown" then
            ring(3, 3, 12, 12, 0, 2, 45)
            rect(7, 7, 4, 4, 1)
        else
            ring(1, 1, 16, 16, 1, 2)
            local t = mk("TextLabel", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "i", Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = C.sub, ZIndex = 13 }, box)
            paint[#paint + 1] = { t, "text" }
        end
        return function(col)
            for _, p in ipairs(paint) do
                if p[2] == "bg" then p[1].BackgroundColor3 = col
                elseif p[2] == "stroke" then p[1].Color = col
                else p[1].TextColor3 = col end
            end
        end
    end

    -- ───────────── paginas y pestanas ─────────────
    local tabs = {}
    local currentTab
    local tabMethods = {}
    tabMethods.__index = tabMethods

    local function selectTab(t, instant)
        if currentTab == t then return end
        currentTab = t
        for _, o in ipairs(tabs) do
            local on = o == t
            tw(o.label, 0.2, { TextColor3 = on and C.goldL or C.sub })
            tw(o.btn, 0.2, { BackgroundTransparency = on and 0.9 or 1 })
            o.setIcon(on and C.goldL or C.sub)
            if not on then o.page.Visible = false end
        end
        t.page.Position = UDim2.fromOffset(SIDE + (instant and 0 or 20), HEAD + 1)
        t.page.Visible = true
        tw(t.page, 0.38, { Position = UDim2.fromOffset(SIDE, HEAD + 1) })
        tw(indicator, instant and 0 or 0.3, { Position = UDim2.fromOffset(0, t.btn.Position.Y.Offset + 6) }, Enum.EasingStyle.Back)
    end

    local function createTab(cfg)
        cfg = cfg or {}
        local idx = #tabs + 1
        local tab = setmetatable({ n = 0 }, tabMethods)

        local btn = mk("TextButton", {
            Position = UDim2.fromOffset(8, 16 + (idx - 1) * 38), Size = UDim2.new(1, -16, 0, 34), BackgroundColor3 = C.gold,
            BackgroundTransparency = 1, Text = "", AutoButtonColor = false, BorderSizePixel = 0, ZIndex = 12,
        }, sidebar)
        corner(btn, 5)
        tab.setIcon = drawIcon(cfg.Icon or "info", btn)
        tab.label = label(btn, {
            Position = UDim2.fromOffset(40, 0), Size = UDim2.new(1, -44, 1, 0), Text = cfg.Title or "Tab", Font = Enum.Font.GothamMedium,
            TextSize = 12, TextColor3 = C.sub, ZIndex = 13,
        })
        tab.btn = btn

        local page = mk("ScrollingFrame", {
            Position = UDim2.fromOffset(SIDE, HEAD + 1), Size = UDim2.new(1, -SIDE, 1, -(HEAD + 1)), BackgroundTransparency = 1,
            BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = C.goldD, CanvasSize = UDim2.new(),
            AutomaticCanvasSize = Enum.AutomaticSize.Y, Visible = false, ZIndex = 10,
        }, body)
        mk("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, page)
        mk("UIPadding", { PaddingTop = UDim.new(0, 14), PaddingBottom = UDim.new(0, 14), PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 16) }, page)
        tab.page = page

        btn.MouseEnter:Connect(function()
            if currentTab ~= tab then tw(tab.label, 0.15, { TextColor3 = C.text }) tab.setIcon(C.text) end
        end)
        btn.MouseLeave:Connect(function()
            if currentTab ~= tab then tw(tab.label, 0.15, { TextColor3 = C.sub }) tab.setIcon(C.sub) end
        end)
        btn.Activated:Connect(function() selectTab(tab) end)

        tabs[idx] = tab
        if idx == 1 then selectTab(tab, true) end
        return tab
    end

    -- ───────────── componentes ─────────────
    local function newRow(self, height)
        self.n = self.n + 1
        local row = mk("Frame", { LayoutOrder = self.n, Size = UDim2.new(1, 0, 0, height), BackgroundColor3 = C.card, BorderSizePixel = 0, ZIndex = 11 }, self.page)
        corner(row, 6)
        local st = stroke(row, C.line, 1)
        local accent = mk("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromOffset(2, 0),
            BackgroundColor3 = C.gold, BorderSizePixel = 0, ZIndex = 12,
        }, row)
        return row, st, accent
    end

    -- TOGGLE: el interruptor es un ojo que se abre
    function tabMethods.Toggle(self, cfg)
        cfg = cfg or {}
        local value = false
        local row, rst, accent = newRow(self, cfg.Desc and 54 or 46)

        local title = label(row, {
            Position = UDim2.fromOffset(16, cfg.Desc and 9 or 0), Size = UDim2.new(1, -96, 0, cfg.Desc and 18 or 46),
            Text = cfg.Title or "Toggle", Font = Enum.Font.GothamMedium, TextSize = 13, ZIndex = 12,
        })
        if cfg.Desc then
            label(row, {
                Position = UDim2.fromOffset(16, 28), Size = UDim2.new(1, -96, 0, 16), Text = cfg.Desc, TextSize = 10,
                TextColor3 = C.sub, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 12,
            })
        end

        local glow = mk("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -8, 0.5, 0), Size = UDim2.fromOffset(68, 34),
            BackgroundColor3 = C.gold, BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 12,
        }, row)
        corner(glow, 17)
        local track = mk("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -16, 0.5, 0), Size = UDim2.fromOffset(52, 24),
            BackgroundColor3 = Color3.fromRGB(9, 7, 9), ClipsDescendants = true, BorderSizePixel = 0, ZIndex = 13,
        }, row)
        corner(track, 12)
        local tstroke = stroke(track, C.goldD, 1.5)
        local fill = mk("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 13 }, track)
        goldGrad(fill, 0)
        local knob = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 13, 0.5, 0), Size = UDim2.fromOffset(18, 18),
            BackgroundColor3 = Color3.fromRGB(44, 36, 28), BorderSizePixel = 0, ZIndex = 15,
        }, track)
        corner(knob, 9)
        stroke(knob, C.goldD, 1.5)
        local lid = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(10, 1),
            BackgroundColor3 = C.goldD, BorderSizePixel = 0, ZIndex = 16,
        }, knob)
        local pupil = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(2, 2),
            BackgroundColor3 = C.ember, BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 16,
        }, knob)
        corner(pupil, UDim.new(1, 0))

        local function sparks()
            local tp = (track.AbsolutePosition - row.AbsolutePosition) / math.max(winScale.Scale, 0.1)
            local cx, cy = tp.X + 39, tp.Y + 12
            for _ = 1, 7 do
                local s = mk("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(cx, cy), Size = UDim2.fromOffset(2, 2),
                    BackgroundColor3 = C.goldL, BorderSizePixel = 0, ZIndex = 21,
                }, row)
                local a = math.rad(math.random(200, 340))
                local dist = math.random(14, 30)
                tw(s, 0.55, { Position = UDim2.fromOffset(cx + math.cos(a) * dist, cy + math.sin(a) * dist), BackgroundTransparency = 1 })
                Debris:AddItem(s, 0.6)
            end
        end

        local function apply(v, instant)
            value = v
            local d = instant and 0 or 0.3
            tw(knob, d, { Position = UDim2.new(0, v and 39 or 13, 0.5, 0), BackgroundColor3 = v and C.goldL or Color3.fromRGB(44, 36, 28) }, Enum.EasingStyle.Back)
            tw(fill, d, { Size = UDim2.fromScale(v and 1 or 0, 1) })
            tw(tstroke, d, { Color = v and C.gold or C.goldD })
            tw(lid, d, { BackgroundTransparency = v and 1 or 0 })
            tw(pupil, d, { Size = v and UDim2.fromOffset(8, 8) or UDim2.fromOffset(2, 2), BackgroundTransparency = v and 0 or 1 })
            tw(title, d, { TextColor3 = v and C.goldL or C.text })
            tw(accent, d, { Size = UDim2.fromOffset(2, v and 24 or 0) })
            if not v then glow.BackgroundTransparency = 1 end
        end
        apply(cfg.Value and true or false, true)

        local seed = math.random() * 50
        flick[#flick + 1] = function(t)
            if value then
                local f = 0.5 + math.noise(t * 6, seed)
                pupil.BackgroundColor3 = C.blood:Lerp(C.ember, math.clamp(f, 0, 1))
                glow.BackgroundTransparency = 0.84 + 0.08 * math.clamp(f, 0, 1)
            end
        end

        local hit = mk("TextButton", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Text = "", ZIndex = 20 }, row)
        hit.MouseEnter:Connect(function() tw(rst, 0.15, { Color = C.goldD }) end)
        hit.MouseLeave:Connect(function() tw(rst, 0.15, { Color = C.line }) end)
        hit.Activated:Connect(function()
            apply(not value, false)
            if value then sparks() end
            if cfg.Callback then task.spawn(cfg.Callback, value) end
        end)

        local obj = {}
        function obj.Set(_, v) apply(v and true or false, false) end
        return obj
    end

    -- SLIDER: barra de oro con marca en rombo
    function tabMethods.Slider(self, cfg)
        cfg = cfg or {}
        local v = cfg.Value or {}
        local mn, mx = v.Min or 0, v.Max or 100
        local value = math.clamp(math.floor((v.Default or mn) + 0.5), mn, mx)
        local row, rst = newRow(self, 60)

        label(row, { Position = UDim2.fromOffset(16, 8), Size = UDim2.new(1, -100, 0, 18), Text = cfg.Title or "Slider", Font = Enum.Font.GothamMedium, TextSize = 13, ZIndex = 12 })
        local valLbl = label(row, {
            AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -16, 0, 6), Size = UDim2.fromOffset(70, 20), Text = tostring(value),
            Font = Enum.Font.Garamond, TextSize = 18, TextColor3 = C.goldL, TextXAlignment = Enum.TextXAlignment.Right, ZIndex = 12,
        })
        local track = mk("Frame", {
            Position = UDim2.fromOffset(16, 40), Size = UDim2.new(1, -32, 0, 6), BackgroundColor3 = Color3.fromRGB(9, 7, 9), BorderSizePixel = 0, ZIndex = 12,
        }, row)
        corner(track, 3)
        stroke(track, C.goldD, 1)
        local frac0 = (value - mn) / math.max(1, mx - mn)
        local fill = mk("Frame", { Size = UDim2.new(frac0, 0, 1, 0), BackgroundColor3 = Color3.new(1, 1, 1), BorderSizePixel = 0, ZIndex = 13 }, track)
        corner(fill, 3)
        goldGrad(fill, 0)
        local knob = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(frac0, 0, 0.5, 0), Size = UDim2.fromOffset(12, 12), Rotation = 45,
            BackgroundColor3 = C.goldL, BorderSizePixel = 0, ZIndex = 14,
        }, track)
        stroke(knob, C.goldD, 1.5)
        local halo = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(22, 22),
            BackgroundColor3 = C.gold, BackgroundTransparency = 1, BorderSizePixel = 0, Rotation = 0, ZIndex = 13,
        }, knob)
        corner(halo, UDim.new(1, 0))

        local function render(nv, fire)
            local frac = (nv - mn) / math.max(1, mx - mn)
            tw(fill, 0.08, { Size = UDim2.new(frac, 0, 1, 0) }, Enum.EasingStyle.Sine)
            tw(knob, 0.08, { Position = UDim2.new(frac, 0, 0.5, 0) }, Enum.EasingStyle.Sine)
            valLbl.Text = tostring(nv)
            if nv ~= value then
                value = nv
                if fire and cfg.Callback then task.spawn(cfg.Callback, nv) end
            end
        end
        local function setFromX(x)
            local frac = math.clamp((x - track.AbsolutePosition.X) / math.max(1, track.AbsoluteSize.X), 0, 1)
            render(math.floor(mn + frac * (mx - mn) + 0.5), true)
        end

        local dragging = false
        local hit = mk("TextButton", { Position = UDim2.fromOffset(10, 28), Size = UDim2.new(1, -20, 0, 30), BackgroundTransparency = 1, Text = "", ZIndex = 20 }, row)
        hit.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                self.page.ScrollingEnabled = false
                tw(halo, 0.15, { BackgroundTransparency = 0.7 })
                tw(rst, 0.15, { Color = C.goldD })
                setFromX(input.Position.X)
            end
        end)
        conns[#conns + 1] = UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                setFromX(input.Position.X)
            end
        end)
        conns[#conns + 1] = UserInputService.InputEnded:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                dragging = false
                self.page.ScrollingEnabled = true
                tw(halo, 0.25, { BackgroundTransparency = 1 })
                tw(rst, 0.25, { Color = C.line })
            end
        end)

        local obj = {}
        function obj.Set(_, nv) render(math.clamp(math.floor(nv + 0.5), mn, mx), false) end
        return obj
    end

    function tabMethods.Section(self, text, order)
        self.n = self.n + 1
        local f = mk("Frame", { LayoutOrder = order or self.n, Size = UDim2.new(1, 0, 0, 20), BackgroundTransparency = 1, ZIndex = 11 }, self.page)
        label(f, { Size = UDim2.new(1, 0, 0, 14), Text = string.upper(text), Font = Enum.Font.GothamBold, TextSize = 9, TextColor3 = C.gold, ZIndex = 12 })
        mk("Frame", { Position = UDim2.fromOffset(0, 17), Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = C.line, BorderSizePixel = 0, ZIndex = 12 }, f)
        return f
    end

    function tabMethods.Card(self, titleText, bodyText)
        self.n = self.n + 1
        local card = mk("Frame", {
            LayoutOrder = self.n, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = C.card, BorderSizePixel = 0, ZIndex = 11,
        }, self.page)
        corner(card, 6)
        stroke(card, C.line, 1)
        mk("UIPadding", { PaddingTop = UDim.new(0, 12), PaddingBottom = UDim.new(0, 14), PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 16) }, card)
        mk("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, card)
        label(card, { LayoutOrder = 1, Size = UDim2.new(1, 0, 0, 22), Text = titleText, Font = Enum.Font.Garamond, TextSize = 20, TextColor3 = C.gold, ZIndex = 12 })
        label(card, {
            LayoutOrder = 2, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, Text = bodyText, TextSize = 12,
            TextWrapped = true, TextYAlignment = Enum.TextYAlignment.Top, TextColor3 = C.text, ZIndex = 12,
        })
        return card
    end

    function tabMethods.Button(self, cfg)
        cfg = cfg or {}
        self.n = self.n + 1
        local btn = mk("TextButton", {
            LayoutOrder = self.n, Size = UDim2.new(1, 0, 0, 42), BackgroundColor3 = C.card, AutoButtonColor = false, Text = "",
            ClipsDescendants = true, BorderSizePixel = 0, ZIndex = 11,
        }, self.page)
        corner(btn, 6)
        local st = stroke(btn, C.goldD, 1.5)
        local sweep = mk("Frame", { Size = UDim2.fromScale(0, 1), BackgroundColor3 = C.gold, BackgroundTransparency = 0.82, BorderSizePixel = 0, ZIndex = 12 }, btn)
        local txt = label(btn, {
            Size = UDim2.fromScale(1, 1), Text = cfg.Title or "Boton", Font = Enum.Font.Garamond, TextSize = 18, TextColor3 = C.goldL,
            TextXAlignment = Enum.TextXAlignment.Center, ZIndex = 13,
        })
        btn.MouseEnter:Connect(function()
            tw(sweep, 0.4, { Size = UDim2.fromScale(1, 1) })
            tw(st, 0.2, { Color = C.gold })
        end)
        btn.MouseLeave:Connect(function()
            tw(sweep, 0.3, { Size = UDim2.fromScale(0, 1) })
            tw(st, 0.2, { Color = C.goldD })
        end)
        btn.Activated:Connect(function()
            if cfg.Callback then task.spawn(cfg.Callback) end
        end)
        local obj = {}
        function obj.SetTitle(_, t) txt.Text = t end
        return obj
    end

    function tabMethods.Stats(self, defs, order)
        self.n = self.n + 1
        local f = mk("Frame", {
            LayoutOrder = order or self.n, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1, ZIndex = 11,
        }, self.page)
        mk("UIGridLayout", { CellSize = UDim2.new(0.5, -4, 0, 48), CellPadding = UDim2.fromOffset(8, 8), SortOrder = Enum.SortOrder.LayoutOrder }, f)
        local vals = {}
        for i, d in ipairs(defs) do
            local tile = mk("Frame", { LayoutOrder = i, BackgroundColor3 = C.card, BorderSizePixel = 0, ZIndex = 11 }, f)
            corner(tile, 6)
            stroke(tile, C.line, 1)
            label(tile, { Position = UDim2.fromOffset(12, 7), Size = UDim2.new(1, -24, 0, 12), Text = string.upper(d[2]), Font = Enum.Font.GothamBold, TextSize = 8, TextColor3 = C.sub, ZIndex = 12 })
            vals[d[1]] = label(tile, {
                Position = UDim2.fromOffset(12, 21), Size = UDim2.new(1, -24, 0, 22), Text = "-", Font = Enum.Font.Garamond, TextSize = 19,
                TextColor3 = C.goldL, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 12,
            })
        end
        return vals
    end

    -- ───────────── ornamentos, ojos que observan ─────────────
    for _, c in ipairs({ { 0, 0, 1, 1 }, { 1, 0, -1, 1 }, { 0, 1, 1, -1 }, { 1, 1, -1, -1 } }) do
        local px, py = c[1], c[2]
        local ox, oy = c[3], c[4]
        local function piece(w, h, ax, ay)
            local f = mk("Frame", {
                AnchorPoint = Vector2.new(px, py), Position = UDim2.new(px, ox * 7, py, oy * 7), Size = UDim2.fromOffset(w, h),
                BackgroundColor3 = C.gold, BackgroundTransparency = 0.25, BorderSizePixel = 0, ZIndex = 30,
            }, body)
            loopTw(f, 2.8 + math.random(), { BackgroundTransparency = 0.7 }, math.random())
        end
        piece(18, 2) piece(2, 18)
    end

    task.spawn(function()
        task.wait(6)
        while alive do
            task.wait(12 + math.random() * 14)
            if not alive or not holder.Visible then continue end
            local ex = math.random(10, 95)
            local ey = H - math.random(80, 150)
            local eyes = mk("Frame", { Position = UDim2.fromOffset(ex, ey), Size = UDim2.fromOffset(24, 8), BackgroundTransparency = 1, ZIndex = 5 }, body)
            local parts = {}
            for i = 1, 2 do
                local e = mk("Frame", {
                    Position = UDim2.fromOffset((i - 1) * 15, 0), Size = UDim2.fromOffset(9, 4), BackgroundColor3 = (math.random() > 0.5) and C.ember or C.gold,
                    BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 5,
                }, eyes)
                corner(e, UDim.new(1, 0))
                parts[i] = e
            end
            for _, e in ipairs(parts) do tw(e, 0.9, { BackgroundTransparency = 0.25 }, Enum.EasingStyle.Sine) end
            task.wait(1.8)
            for _, e in ipairs(parts) do tw(e, 0.12, { Size = UDim2.fromOffset(9, 1), Position = UDim2.new(0, e.Position.X.Offset, 0, 2) }) end
            task.wait(0.2)
            for _, e in ipairs(parts) do tw(e, 0.15, { Size = UDim2.fromOffset(9, 4), Position = UDim2.new(0, e.Position.X.Offset, 0, 0) }) end
            task.wait(1.4)
            for _, e in ipairs(parts) do tw(e, 0.7, { BackgroundTransparency = 1 }, Enum.EasingStyle.Sine) end
            Debris:AddItem(eyes, 0.8)
        end
    end)

    -- ───────────── animacion central (cada frame) ─────────────
    do
        local t0 = os.clock()
        conns[#conns + 1] = RunService.Heartbeat:Connect(function()
            local t = os.clock() - t0
            borderGrad.Rotation = (t * 40) % 360
            shellStroke.Transparency = 0.1 + 0.3 * math.abs(math.noise(t * 4.5, 0.37)) -- luz de vela
            for _, f in ipairs(flick) do f(t) end
        end)
    end

    -- ───────────── abrir / cerrar ─────────────
    local isOpen = false
    local gen = 0
    local function openWin()
        if isOpen then return end
        isOpen, gen = true, gen + 1
        local my = gen
        holder.Visible = true
        task.spawn(function()
            shell.Size = UDim2.fromOffset(60, 2)
            tw(shell, 0.3, { Size = UDim2.fromOffset(W, 2) }).Completed:Wait()
            if my ~= gen then return end
            tw(shell, 0.55, { Size = UDim2.fromOffset(W, H) })
        end)
    end
    local function closeWin()
        if not isOpen then return end
        isOpen, gen = false, gen + 1
        local my = gen
        task.spawn(function()
            tw(shell, 0.35, { Size = UDim2.fromOffset(W, 2) }).Completed:Wait()
            if my ~= gen then return end
            tw(shell, 0.25, { Size = UDim2.fromOffset(40, 2) }).Completed:Wait()
            if my == gen then holder.Visible = false end
        end)
    end
    minBtn.Activated:Connect(closeWin)
    closeBtn.Activated:Connect(function()
        closeWin()
        task.delay(0.9, cleanup)
    end)

    -- arrastrar por la cabecera
    do
        local dragging, dStart, pStart = false, nil, nil
        header.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging, dStart, pStart = true, input.Position, holder.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        conns[#conns + 1] = UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local d = (input.Position - dStart) / math.max(winScale.Scale, 0.1)
                holder.Position = UDim2.new(pStart.X.Scale, pStart.X.Offset + d.X, pStart.Y.Scale, pStart.Y.Offset + d.Y)
            end
        end)
    end

    -- ───────────── orbe flotante (eclipse) ─────────────
    do
        local orb = mk("TextButton", {
            Name = "Orb", Size = UDim2.fromOffset(64, 64), Position = UDim2.new(0, 28, 0.5, -32), BackgroundTransparency = 1,
            Text = "", AutoButtonColor = false, ZIndex = 50,
        }, gui)
        local orbScale = mk("UIScale", { Scale = 0 }, orb)
        local sigil, upd = makeSigil(orb, 46, 51, SE_ORB_IMAGE)
        flick[#flick + 1] = upd
        -- anillo exterior que late como una llama
        local halo = mk("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(60, 60),
            BackgroundTransparency = 1, ZIndex = 51,
        }, orb)
        mk("UICorner", { CornerRadius = UDim.new(1, 0) }, halo)
        local hs = stroke(halo, C.gold, 1, 0.6)
        loopTw(halo, 1.8, { Size = UDim2.fromOffset(68, 68) })
        loopTw(hs, 1.8, { Transparency = 0.95 })
        tw(orbScale, 0.8, { Scale = 1 }, Enum.EasingStyle.Back)

        local dragging, moved, dStart, pStart = false, false, nil, nil
        orb.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging, moved = true, false
                dStart, pStart = input.Position, orb.Position
                tw(orbScale, 0.12, { Scale = 0.9 })
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                        tw(orbScale, 0.3, { Scale = 1 }, Enum.EasingStyle.Back)
                        if not moved then
                            if isOpen then closeWin() else openWin() end
                        end
                    end
                end)
            end
        end)
        conns[#conns + 1] = UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local d = input.Position - dStart
                if moved or d.Magnitude > 8 then
                    moved = true
                    orb.Position = UDim2.new(pStart.X.Scale, pStart.X.Offset + d.X, pStart.Y.Scale, pStart.Y.Offset + d.Y)
                end
            end
        end)
    end

    -- ───────────── API compatible con las llamadas del script ─────────────
    Window = {}
    function Window.Tab(_, cfg) return createTab(cfg) end
    function Window.Open() openWin() end
    function Window.Close() closeWin() end
    function Window.Toggle() if isOpen then closeWin() else openWin() end end
    function Window.Destroy() cleanup() end
    function Window.IsAlive() return alive end
    function Window.Countdown() return fmtLeft(timeLeft()) end
    function Window.CopyDiscord() return copyDiscord() end
end
if not Window then return end -- edicion finalizada: no se carga nada mas

local FarmTab = Window:Tab({ Title = "Farm", Icon = "coins" })
local SettingsTab = Window:Tab({ Title = "Ajustes", Icon = "settings" })

-- ═══════════════════════════════════════════════════════════
-- ESPECIAL EDITION: estado en vivo, Creador e Info
-- ═══════════════════════════════════════════════════════════
do
    -- estado en vivo (solo lee las variables del farm, no las cambia)
    FarmTab:Section("Estado en vivo", 900)
    local live = FarmTab:Stats({
        { "estado", "Estado" },
        { "detectadas", "Monedas detectadas" },
        { "ronda", "Recolectadas en la ronda" },
        { "tiempo", "Tiempo farmeando" },
    }, 901)

    local startedAt
    task.spawn(function()
        while Window.IsAlive() do
            local estado = "Detenido"
            if _G.FARM_ON then
                if _G.FARM_BAG_FULL then estado = "Bolsa llena, reiniciando"
                elseif _G.FARM_WAITING then estado = "Esperando la ronda"
                elseif _G.FARM_CURRENT then estado = "Recolectando"
                else estado = "Buscando monedas" end
                startedAt = startedAt or os.clock()
            else
                startedAt = nil
            end
            local detectadas, recogidas = 0, 0
            for _ in pairs(_G.FARM_ACTIVE_COINS or {}) do detectadas = detectadas + 1 end
            for _ in pairs(_G.FARM_BLACKLIST or {}) do recogidas = recogidas + 1 end
            local secs = startedAt and math.floor(os.clock() - startedAt) or 0
            live.estado.Text = estado
            live.detectadas.Text = tostring(detectadas)
            live.ronda.Text = tostring(recogidas)
            live.tiempo.Text = string.format("%02d:%02d:%02d", math.floor(secs / 3600), math.floor(secs % 3600 / 60), secs % 60)
            task.wait(0.5)
        end
    end)

    -- pagina Creador
    local CreatorTab = Window:Tab({ Title = "Creador", Icon = "crown" })
    CreatorTab:Card("Mensaje del Creador",
        "¡Hola! Soy Uzivert, creador del Uzivert Hub.\n\n" ..
        "Este proyecto sigue en pie y en desarrollo continúo. Si te gusta el Hub de auto farm, también tenés el Hub para District y para MM2 completo con la misma esencia y el mismo cariño.\n\n" ..
        "Redes sociales:\n" ..
        "• TikTok: @Uzivert550\n" ..
        "• Instagram: @hxuntedluv77\n\n" ..
        "Discord oficial: " .. SE_DISCORD .. "\n\n" ..
        "— Uzivert")

    -- pagina Info
    local InfoTab = Window:Tab({ Title = "Info", Icon = "info" })
    InfoTab:Section("Edición limitada")
    local lim = InfoTab:Stats({
        { "left", "Tiempo restante" },
        { "hasta", "Disponible hasta" },
    })
    lim.hasta.Text = "16 de noviembre"
    task.spawn(function()
        while Window.IsAlive() do
            lim.left.Text = Window.Countdown()
            task.wait(1)
        end
    end)
    InfoTab:Card("Qué es Especial Edition",
        "Uzivert Hub Auto Farm Especial Edition es una edición limitada de Halloween 2026, con una interfaz exclusiva de oro y sombras y animaciones nuevas.\n\n" ..
        "Estará disponible únicamente hasta el 16 de noviembre de 2026. Pasada esa fecha la edición se desactiva y deja de cargar.")
    InfoTab:Section("Comunidad")
    InfoTab:Card("Discord oficial", SE_DISCORD)
    local copyBtn
    copyBtn = InfoTab:Button({
        Title = "Copiar invitación de Discord",
        Callback = function()
            copyBtn:SetTitle(Window.CopyDiscord() and "Copiado" or SE_DISCORD)
            task.delay(2, function() copyBtn:SetTitle("Copiar invitación de Discord") end)
        end,
    })
    InfoTab:Card("Redes sociales", "• TikTok: @Uzivert550\n• Instagram: @hxuntedluv77")
    InfoTab:Section("Uso")
    InfoTab:Card("Cómo usar",
        "• Toca el orbe dorado para abrir o cerrar el menú.\n" ..
        "• Arrastra la barra superior para mover la ventana.\n" ..
        "• El botón (—) minimiza al orbe.\n" ..
        "• El botón (X) cierra la interfaz; si el farm estaba encendido, sigue activo.")

    -- abre la ventana cuando termina de armarse todo el script
    task.defer(function() Window.Open() end)
end



-- ═══════════════════════════════════════════════════════════
-- SISTEMA DE GUARDADO (JSON PRO CON AUTO-REJOIN)
-- ═══════════════════════════════════════════════════════════
local HttpService = game:GetService("HttpService")
_G.FARM_SAVE_FILE = "UzivertFarmConfig.json"

_G.FARM_SAVE = function()
    local config = {
        FarmON = _G.FARM_ON,
        AntiMurder = _G.FARM_AUTO_MURDER,
        AntiKick = _G.FARM_AUTO_KICK,
        AntiVoid = _G.FARM_ANTIVOID,
        Speed = _G.FARM_SPEED,
        AutoRejoin = _G.FARM_AUTO_REJOIN, -- 🔥 Nuevo
        Noclip = _G.FARM_NOCLIP -- 🔥 AGREGADO
    }
    pcall(function()
        writefile(_G.FARM_SAVE_FILE, HttpService:JSONEncode(config))
    end)
end

_G.FARM_LOAD_CONFIG = function()
    local data = ""
    pcall(function() 
        if isfile(_G.FARM_SAVE_FILE) then 
            data = readfile(_G.FARM_SAVE_FILE) 
        end 
    end)
    
    if data ~= "" then
        local success, config = pcall(function()
            return HttpService:JSONDecode(data)
        end)
        
        if success and config then
            _G.FARM_AUTO_MURDER = config.AntiMurder
            _G.FARM_AUTO_KICK = config.AntiKick
            _G.FARM_ANTIVOID = config.AntiVoid
            _G.FARM_SPEED = config.Speed or 25
            _G.FARM_AUTO_REJOIN = config.AutoRejoin -- 🔥 Nuevo
            _G.FARM_NOCLIP = config.Noclip 
            
            if config.FarmON then
                _G.FARM_ON = true
                task.defer(function()
                    if _G.FARM_LOAD then _G.FARM_LOAD() end
                end)
            end
            print("✅ Configuración JSON cargada (incluyendo Auto-Rejoin).")
        end
    end
end

-- ═══════════════════════════════════════════════════════════
-- TU LÓGICA ORIGINAL (Intacta)
-- ═══════════════════════════════════════════════════════════
-- _G.FARM_ON = false
-- _G.FARM_AFK = false
-- _G.FARM_NOCLIP = true
-- _G.FARM_ANTIVOID = true
-- _G.FARM_SPEED = 25 -- Velocidad máxima 25
_G.FARM_ON = _G.FARM_ON or false
_G.FARM_AUTO_MURDER = _G.FARM_AUTO_MURDER or true
_G.FARM_AUTO_KICK = _G.FARM_AUTO_KICK or true
_G.FARM_ANTIVOID = _G.FARM_ANTIVOID or true
_G.FARM_SPEED = _G.FARM_SPEED or 35
_G.FARM_AUTO_REJOIN = _G.FARM_AUTO_REJOIN or true
_G.FARM_MAXDIST = 1000
_G.FARM_RESET_DELAY = 5.0
_G.FARM_NOCLIP = _G.FARM_NOCLIP or true

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

_G.FARM_CHAR = LP.Character or LP.CharacterAdded:Wait()
_G.FARM_ROOT = _G.FARM_CHAR:WaitForChild("HumanoidRootPart")
_G.FARM_HUM = _G.FARM_CHAR:WaitForChild("Humanoid")

_G.FARM_ADD_CONN = function(conn) table.insert(_G.FARM_CONNECTIONS, conn) end
_G.FARM_CLEAN_CONNS = function()
    for _, conn in ipairs(_G.FARM_CONNECTIONS) do pcall(function() conn:Disconnect() end) end
    _G.FARM_CONNECTIONS = {}
end
_G.FARM_STOP_MOVE = function()
    if _G.FARM_LV then _G.FARM_LV.VectorVelocity = Vector3.zero _G.FARM_LV.Enabled = false end
    if _G.FARM_ROOT then _G.FARM_ROOT.AssemblyLinearVelocity = Vector3.zero _G.FARM_ROOT.AssemblyAngularVelocity = Vector3.zero end
end
_G.FARM_SETUP_VEL = function()
    if not _G.FARM_ROOT then return end
    _G.FARM_ATTACH = _G.FARM_ROOT:FindFirstChild("FarmAttachment")
    if not _G.FARM_ATTACH then
        _G.FARM_ATTACH = Instance.new("Attachment") _G.FARM_ATTACH.Name = "FarmAttachment" _G.FARM_ATTACH.Parent = _G.FARM_ROOT
    end
    _G.FARM_LV = _G.FARM_ROOT:FindFirstChild("FarmLinearVelocity")
    if not _G.FARM_LV then
        _G.FARM_LV = Instance.new("LinearVelocity") _G.FARM_LV.Name = "FarmLinearVelocity"
        _G.FARM_LV.Attachment0 = _G.FARM_ATTACH _G.FARM_LV.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
        _G.FARM_LV.RelativeTo = Enum.ActuatorRelativeTo.World _G.FARM_LV.VectorVelocity = Vector3.zero
        _G.FARM_LV.Enabled = false _G.FARM_LV.ForceLimitMode = Enum.ForceLimitMode.PerAxis
        _G.FARM_LV.MaxAxesForce = Vector3.new(100000, 100000, 100000) _G.FARM_LV.Parent = _G.FARM_ROOT
    end
end
_G.FARM_REMOVE_VEL = function()
    if _G.FARM_LV then _G.FARM_LV:Destroy() _G.FARM_LV = nil end
    if _G.FARM_ATTACH then _G.FARM_ATTACH:Destroy() _G.FARM_ATTACH = nil end
end
_G.FARM_IS_COIN = function(part)
    if not part:IsA("BasePart") or _G.FARM_BLACKLIST[part] then return false end
    local name = part.Name:lower()
    return name:find("coin") or name:find("cash") or name:find("money") or name:find("collect") or name:find("candy")
end
_G.FARM_CHECK_FULL = function()
    local pg = LP:FindFirstChild("PlayerGui")
    if not pg then return false end
    for _, gui in ipairs(pg:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Name ~= "UzivertHub" then
            local cont = gui:FindFirstChild("Container", true)
            if cont then
                for _, fr in ipairs(cont:GetChildren()) do
                    if fr:IsA("Frame") and fr.Visible then
                        local ico = fr:FindFirstChild("FullBagIcon", true)
                        local txt = fr:FindFirstChild("Full", true)
                        if (ico and ico.Visible) or (txt and txt.Visible) then return true end
                    end
                end
            end
        end
    end
    return false
end
_G.FARM_TRIGGER_RESET = function()
    if _G.FARM_BAG_FULL then return end
    _G.FARM_BAG_FULL = true _G.FARM_STOP_MOVE()
    task.wait(0.2)
    if _G.FARM_HUM and _G.FARM_HUM.Health > 0 then _G.FARM_HUM.Health = 0 end
end
_G.FARM_TRACK = function(part) if _G.FARM_IS_COIN(part) then _G.FARM_ACTIVE_COINS[part] = true end end
_G.FARM_UNTRACK = function(part) _G.FARM_ACTIVE_COINS[part] = nil if _G.FARM_CURRENT == part then _G.FARM_CURRENT = nil end end
_G.FARM_INIT_COINS = function()
    _G.FARM_ACTIVE_COINS = {}
    for _, v in ipairs(Workspace:GetDescendants()) do if _G.FARM_IS_COIN(v) then _G.FARM_ACTIVE_COINS[v] = true end end
    _G.FARM_ADD_CONN(Workspace.DescendantAdded:Connect(_G.FARM_TRACK))
    _G.FARM_ADD_CONN(Workspace.DescendantRemoving:Connect(_G.FARM_UNTRACK))
    
    local remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local gameplay = remotes and remotes:FindFirstChild("Gameplay")
    if gameplay then
        local coinsStarted = gameplay:FindFirstChild("CoinsStarted")
        local coinCollected = gameplay:FindFirstChild("CoinCollected")
        if coinsStarted then
            _G.FARM_ADD_CONN(coinsStarted.OnClientEvent:Connect(function()
                _G.FARM_WAITING = true _G.FARM_STOP_MOVE() _G.FARM_CURRENT = nil
                _G.FARM_ACTIVE_COINS = {} _G.FARM_BLACKLIST = {} _G.FARM_BAG_FULL = false
                task.wait(1.5)
                for _, v in ipairs(Workspace:GetDescendants()) do if _G.FARM_IS_COIN(v) then _G.FARM_ACTIVE_COINS[v] = true end end
                _G.FARM_WAITING = false
            end))
        end
        if coinCollected then
            _G.FARM_ADD_CONN(coinCollected.OnClientEvent:Connect(function(_, cur, max)
                local c = tonumber(cur) local m = tonumber(max)
                if c and m and c >= m then _G.FARM_TRIGGER_RESET() end
            end))
        end
    end
end

-- 🛡️ LÓGICA ANTI-MURDER (Integrada a tu Finder)
_G.GetMurdererPos = function()
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            if p.Team and p.Team.Name == "Murderer" then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then return hrp.Position end
            end
            local tool = p.Character:FindFirstChildOfClass("Tool")
            if tool and (tool.Name:lower():find("knife") or tool.Name:lower():find("gun")) then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then return hrp.Position end
            end
        end
    end
    return nil
end

_G.FARM_FINDER = function()
    if _G.FARM_TARGET_THREAD then task.cancel(_G.FARM_TARGET_THREAD) end
    _G.FARM_TARGET_THREAD = task.spawn(function()
        while true do
            task.wait(0.1)
            if not _G.FARM_ON then break end
            if _G.FARM_ON and not _G.FARM_BAG_FULL and _G.FARM_CHECK_FULL() then _G.FARM_TRIGGER_RESET() end
            
            if _G.FARM_ON and not _G.FARM_BAG_FULL and not _G.FARM_WAITING and _G.FARM_ROOT then
                local pos = _G.FARM_ROOT.Position
                local murdererPos = _G.FARM_ANTI_MURDER and _G.GetMurdererPos() or nil
                local nearest = nil
                local nearestDist = _G.FARM_MAXDIST + 1
                
                for coin, _ in pairs(_G.FARM_ACTIVE_COINS) do
                    if coin and coin.Parent and not _G.FARM_BLACKLIST[coin] then
                        local distToCoin = (coin.Position - pos).Magnitude
                        
                        if murdererPos then
                            local distToMurderer = (coin.Position - murdererPos).Magnitude
                            -- Si la moneda está cerca del murderer, la ignoramos
                            if distToMurderer < 25 then continue end
                            
                            -- Si el murderer está cerca nuestro, huimos a la moneda más lejana
                            if (murdererPos - pos).Magnitude < 20 then
                                if distToMurderer > nearestDist then
                                    nearestDist = distToMurderer
                                    nearest = coin
                                end
                                continue
                            end
                        end
                        if distToCoin < nearestDist then nearestDist = distToCoin nearest = coin end
                    else
                        _G.FARM_ACTIVE_COINS[coin] = nil
                    end
                end
                if nearest and not nearest:FindFirstChild("CoinVisual") then _G.FARM_ACTIVE_COINS[nearest] = nil nearest = nil end
                _G.FARM_CURRENT = nearest
            end
        end
    end)
end

_G.FARM_AFK_LOOP = function()
    while _G.FARM_AFK and _G.FARM_ON do
        task.wait(30)
        if not _G.FARM_AFK or not _G.FARM_ON then break end
        pcall(function() VirtualUser:CaptureController() VirtualUser:ClickButton2(Vector2.new()) end)
    end
end

_G.FARM_ENGINE = function()
    _G.FARM_CLEAN_CONNS() _G.FARM_SETUP_VEL() _G.FARM_INIT_COINS() _G.FARM_NOCOINS_TIME = nil
    _G.FARM_ADD_CONN(RunService.Heartbeat:Connect(function()
        if not _G.FARM_ON or _G.FARM_BAG_FULL or _G.FARM_WAITING or not _G.FARM_ROOT or not _G.FARM_ROOT.Parent or not _G.FARM_HUM or _G.FARM_HUM.Health <= 0 then
            _G.FARM_STOP_MOVE() return
        end
        if _G.FARM_CURRENT and _G.FARM_CURRENT.Parent and not _G.FARM_BLACKLIST[_G.FARM_CURRENT] then
            _G.FARM_NOCOINS_TIME = nil
            local targetPos = _G.FARM_CURRENT.Position
            local rootPos = _G.FARM_ROOT.Position
            local dist = (targetPos - rootPos).Magnitude
            if dist <= 1.2 then
                _G.FARM_ROOT.CFrame = CFrame.new(targetPos) _G.FARM_STOP_MOVE()
                _G.FARM_COLLECTED = true _G.FARM_BLACKLIST[_G.FARM_CURRENT] = true
                _G.FARM_ACTIVE_COINS[_G.FARM_CURRENT] = nil _G.FARM_CURRENT = nil
            else
                if _G.FARM_LV then _G.FARM_LV.Enabled = true _G.FARM_LV.VectorVelocity = (targetPos - rootPos).Unit * _G.FARM_SPEED end
            end
        else
            _G.FARM_STOP_MOVE()
            if _G.FARM_COLLECTED then
                if not _G.FARM_NOCOINS_TIME then _G.FARM_NOCOINS_TIME = os.clock()
                elseif os.clock() - _G.FARM_NOCOINS_TIME >= _G.FARM_RESET_DELAY then
                    _G.FARM_NOCOINS_TIME = nil _G.FARM_CLEAN_CONNS()
                    if _G.FARM_HUM then _G.FARM_HUM.Health = 0 end
                end
            else _G.FARM_NOCOINS_TIME = nil end
        end
    end))
end

_G.FARM_ANTIVOID_APPLY = function()
    if _G.FARM_ANTIVOID then Workspace.FallenPartsDestroyHeight = 0/0 end
end

_G.FARM_NOCLIP_CONN = nil

_G.FARM_NOCLIP_START = function()
    if _G.FARM_NOCLIP_CONN then return end
    _G.FARM_NOCLIP_CONN = RunService.Stepped:Connect(function()
        local char = LP.Character
        if not char then return end
        
        if _G.FARM_ON and _G.FARM_NOCLIP then
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
    local char = LP.Character
    if char then 
        for _, p in ipairs(char:GetDescendants()) do 
            if p:IsA("BasePart") then p.CanCollide = true end 
        end 
    end
end

_G.FARM_LOAD = function()
    _G.FARM_BAG_FULL = false _G.FARM_WAITING = false _G.FARM_COLLECTED = false
    _G.FARM_BLACKLIST = {} _G.FARM_NOCOINS_TIME = nil
    _G.FARM_CHAR = LP.Character or LP.CharacterAdded:Wait()
    _G.FARM_ROOT = _G.FARM_CHAR:WaitForChild("HumanoidRootPart")
    _G.FARM_HUM = _G.FARM_CHAR:WaitForChild("Humanoid")
    _G.FARM_ANTIVOID_APPLY() _G.FARM_NOCLIP_START() _G.FARM_FINDER() _G.FARM_ENGINE()
    if _G.FARM_AFK then task.spawn(_G.FARM_AFK_LOOP) end
    
    if _G.FARM_CHAR_CONN then _G.FARM_CHAR_CONN:Disconnect() end
    _G.FARM_CHAR_CONN = LP.CharacterAdded:Connect(function(newChar)
        _G.FARM_CLEAN_CONNS() _G.FARM_REMOVE_VEL()
        _G.FARM_CHAR = newChar _G.FARM_ROOT = newChar:WaitForChild("HumanoidRootPart") _G.FARM_HUM = newChar:WaitForChild("Humanoid")
        _G.FARM_BAG_FULL = false _G.FARM_WAITING = false _G.FARM_COLLECTED = false _G.FARM_BLACKLIST = {}
        task.wait(1.5)
        if _G.FARM_ON then _G.FARM_ENGINE() end
    end)
end

_G.FARM_UNLOAD = function()
    _G.FARM_ON = false _G.FARM_CLEAN_CONNS() _G.FARM_NOCLIP_STOP() _G.FARM_REMOVE_VEL()
    if _G.FARM_TARGET_THREAD then task.cancel(_G.FARM_TARGET_THREAD) _G.FARM_TARGET_THREAD = nil end
    if _G.FARM_CHAR_CONN then _G.FARM_CHAR_CONN:Disconnect() _G.FARM_CHAR_CONN = nil end
    _G.FARM_ACTIVE_COINS = {} _G.FARM_BLACKLIST = {} _G.FARM_CURRENT = nil
end

-- ═══════════════════════════════════════════════════════════
-- UI DE CONTROLES (CON GUARDADO JSON)
-- ═══════════════════════════════════════════════════════════

-- Función para iniciar el motor del farm (limpia y sin repetir código)
_G.FARM_BOOT = function()
    _G.FARM_BAG_FULL = false 
    _G.FARM_WAITING = false 
    _G.FARM_COLLECTED = false
    _G.FARM_BLACKLIST = {} 
    _G.FARM_NOCOINS_TIME = nil
    _G.FARM_CHAR = LP.Character or LP.CharacterAdded:Wait()
    _G.FARM_ROOT = _G.FARM_CHAR:WaitForChild("HumanoidRootPart")
    _G.FARM_HUM = _G.FARM_CHAR:WaitForChild("Humanoid")
    
    _G.FARM_ANTIVOID_APPLY() 
    _G.FARM_NOCLIP_START() 
    _G.FARM_FINDER() 
    _G.FARM_ENGINE()
    if _G.FARM_AFK then task.spawn(_G.FARM_AFK_LOOP) end
end

-- 1. Toggle Auto Farm
FarmTab:Toggle({ 
    Title = "Auto Farm", 
    Value = _G.FARM_ON, 
    Callback = function(v)
        _G.FARM_ON = v
        _G.FARM_SAVE()
        if v then 
            _G.FARM_LOAD() -- 🔥 ACÁ LLAMAMOS A LA FUNCIÓN DE LA LÍNEA 311
        else 
            _G.FARM_UNLOAD() 
        end
    end 
})

-- 2. Toggle Anti Murder
SettingsTab:Toggle({ 
    Title = "Anti Murder", 
    Value = _G.FARM_AUTO_MURDER, 
    Callback = function(v) 
        _G.FARM_AUTO_MURDER = v 
        _G.FARM_SAVE() 
    end 
})

-- 3. Toggle Anti Kick
SettingsTab:Toggle({ 
    Title = "Anti Kick", 
    Value = _G.FARM_AUTO_KICK, 
    Callback = function(v) 
        _G.FARM_AUTO_KICK = v 
        _G.FARM_AFK = v -- El loop del AFK usa esta variable
        _G.FARM_SAVE()
        if v and _G.FARM_ON then task.spawn(_G.FARM_AFK_LOOP) end
    end 
})

-- 4. Toggle Anti Void
SettingsTab:Toggle({ 
    Title = "Anti Void", 
    Value = _G.FARM_ANTIVOID, 
    Callback = function(v) 
        _G.FARM_ANTIVOID = v 
        _G.FARM_SAVE()
        Workspace.FallenPartsDestroyHeight = v and 0/0 or -500
    end 
})

SettingsTab:Toggle({ 
    Title = "Noclip", 
    Desc = "Atraviesa paredes mientras farmeás.",
    Value = _G.FARM_NOCLIP, 
    Callback = function(v) 
        _G.FARM_NOCLIP = v 
        _G.FARM_SAVE()
        
        -- Si lo apaga, forzamos que vuelvan las colisiones al toque
        if not v then
            _G.FARM_NOCLIP_STOP()
        else
            _G.FARM_NOCLIP_START()
        end
    end 
})

SettingsTab:Toggle({ 
    Title = "Auto Rejoin (Anti-Kick)", 
    Desc = "Reingresa solo si hay lag o te kickean.",
    Value = _G.FARM_AUTO_REJOIN or true, 
    Callback = function(v) 
        _G.FARM_AUTO_REJOIN = v 
        _G.FARM_SAVE() -- 🔥 Guarda el estado
    end 
})

-- 5. Slider Velocidad
SettingsTab:Slider({ 
    Title = "Velocidad", 
    Value = { Min = 10, Max = 35, Default = _G.FARM_SPEED }, 
    Callback = function(v) 
        _G.FARM_SPEED = v 
        _G.FARM_SAVE()
    end 
})

-- ═══════════════════════════════════════════════════════════
-- AUTO REJOIN INTELIGENTE
-- ═══════════════════════════════════════════════════════════
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local FARM_LOADER_LINK = "https://raw.githubusercontent.com/TU_USUARIO/TU_REPO/main/autofarm.lua"

_G.DoFarmRejoin = function()
    if _G.FARM_SAVE then _G.FARM_SAVE() end
    pcall(function()
        queue_on_teleport('loadstring(game:HttpGet("' .. FARM_LOADER_LINK .. '"))()')
    end)
    task.wait(1)
    pcall(function()
        TeleportService:Teleport(game.PlaceId, LP)
    end)
end

task.spawn(function()
    while task.wait(3) do
        -- 🔥 Solo actúa si el Farm está ON y el Auto-Rejoin está habilitado
        if _G.FARM_ON and _G.FARM_AUTO_REJOIN then
            local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            if ping >= 5000 or ping ~= ping then
                print("⚠️ Kick detectado. Haciendo Rejoin...")
                _G.DoFarmRejoin()
                break
            end
        end
    end
end)

_G.FARM_LOAD_CONFIG() 

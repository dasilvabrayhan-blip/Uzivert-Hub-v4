--[[
███████╗██╗   ██╗██╗██╗         █████╗ ██╗  ██╗███████╗
██╔════╝██║   ██║██║██║        ██╔══██╗╚██╗██╔╝██╔════╝
█████╗  ██║   ██║██║██║        ███████║ ╚███╔╝ █████╗
██╔══╝  ╚██╗ ██╔╝██║██║        ██╔══██║ ██╔██╗ ██╔══╝
███████╗ ╚████╔╝ ██║███████╗   ██║  ██║██╔╝ ██╗███████╗
╚══════╝  ╚═══╝  ╚═╝╚══════╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

        STUDIOS V2 OBFUSCATOR By MAX
        https://eaxe.net

        Sponsored by
        https://BloxDen.com
--]]

local e = game:GetService("Players");
local A = workspace.CurrentCamera;
local l = e.LocalPlayer;
local E = game:GetService("UserInputService");
local y = game:GetService("TweenService");
local a = game:GetService("RunService");
local W = game:GetService("Stats");
local U = game:GetService("Lighting");
local t = game:GetService("HttpService");
local c = game:GetService("Debris");
local b = "v4.7.8 HALLOWEEN";
_G.UZIVERT_GAMA_BAJA = false;
_G.UZIVERT_SELECCIONADO = false;
_G.UZ_SEL_CONFIG = {
		LAUGH_SOUND = "rbxassetid://8047405326",
		TEETH_SOUND = "rbxassetid://1846999567",
		CREATOR_NAME = "Uzivert",
		TIKTOK = "@Uzivert550",
		INSTAGRAM = "@hxuntedluv77",
		VERSION = "v4.7.8",
	};
_G.UZ_SEL_Players = game:GetService("Players");
_G.UZ_SEL_Tween = game:GetService("TweenService");
_G.UZ_SEL_Run = game:GetService("RunService");
_G.UZ_SEL_Input = game:GetService("UserInputService");
_G.UZ_SEL_Debris = game:GetService("Debris");
_G.UZ_SEL_player = _G.UZ_SEL_Players.LocalPlayer;
_G.UZ_SEL_ORANGE = Color3.fromRGB(245, 135, 35);
_G.UZ_SEL_ORANGE_LIGHT = Color3.fromRGB(255, 190, 90);
_G.UZ_SEL_PURPLE = Color3.fromRGB(150, 80, 230);
_G.UZ_SEL_GREEN = Color3.fromRGB(74, 222, 128);
_G.UZ_SEL_WEB = Color3.fromRGB(210, 200, 225);
_G.UZ_SEL_BG = Color3.fromRGB(14, 10, 18);
_G.UZ_SEL_BAR = Color3.fromRGB(20, 14, 26);
_G.UZ_SEL_CARD = Color3.fromRGB(24, 17, 30);
_G.UZ_SEL_CARD_LINE = Color3.fromRGB(58, 40, 66);
_G.UZ_SEL_GRAY = Color3.fromRGB(140, 130, 152);
_G.UZ_SEL_BONE = Color3.fromRGB(235, 228, 205);
_G.UZ_SEL_INK = Color3.fromRGB(60, 45, 30);
_G.UZ_SEL_WIN_W, _G.UZ_SEL_WIN_H = 540, 320;
_G.UZ_SEL_new = function(e, A, l)
		local E = Instance.new(e);
		for e, A in pairs(A) do
			E[e] = A;
		end;
		E.Parent = l;
		return E;
	end;
_G.UZ_SEL_tween = function(e, A, l)
		local E = _G.UZ_SEL_Tween:Create(e, A, l);
		E:Play();
		return E;
	end;
_G.UZ_SEL_corner = function(e, A)
		return _G.UZ_SEL_new("UICorner", { CornerRadius = A or UDim.new(0, 6) }, e);
	end;
_G.UZ_SEL_LOOP = function(e, A)
		return TweenInfo.new(e, A or Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);
	end;
_G.UZ_SEL_setLine = function(e, A, l, E, y, a)
		local W, U = E - A, y - l;
		e.Size = UDim2.fromOffset(math.sqrt(W * W + U * U), a);
		e.Position = UDim2.fromOffset(((A + E)) / 2, ((l + y)) / 2);
		e.Rotation = math.deg(math.atan2(U, W));
	end;
_G.UZ_SEL_line = function(e, A, l)
		return _G.UZ_SEL_new("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = A,
			BorderSizePixel = 0,
			ZIndex = l or 1,
		}, e);
	end;
_G.UZ_SEL_dot = function(e, A, l, E)
		local y = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Size = UDim2.fromOffset(A, A),
				BackgroundColor3 = l,
				BorderSizePixel = 0,
				ZIndex = E or 1,
			}, e);
		_G.UZ_SEL_corner(y, UDim.new(1, 0));
		return y;
	end;
_G.UZ_SEL_outline = function(e, A, l, E, y, a, W)
		local U = _G.UZ_SEL_new("Frame", {
				Position = A,
				Size = l,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = W or 10,
			}, e);
		_G.UZ_SEL_corner(U, UDim.new(0, a or 0));
		_G.UZ_SEL_new("UIStroke", { Thickness = y, Color = E }, U);
		return U;
	end;
_G.UZ_SEL_solid = function(e, A, l, E, y, a)
		local W = _G.UZ_SEL_new("Frame", {
				Position = A,
				Size = l,
				BackgroundColor3 = E,
				BorderSizePixel = 0,
				ZIndex = a or 10,
			}, e);
		if y then
			_G.UZ_SEL_corner(W, UDim.new(0, y));
		end;
		return W;
	end;
_G.UZ_SEL_hoverable = function(e, A, l)
		e.MouseEnter:Connect(A);
		e.MouseLeave:Connect(l);
		e.InputBegan:Connect(function(e)
			if e.UserInputType == Enum.UserInputType.Touch then
				A();
			end;
		end);
		e.InputEnded:Connect(function(e)
			if e.UserInputType == Enum.UserInputType.Touch then
				l();
			end;
		end);
	end;
_G.UZ_SEL_updaters = {};
_G.UZ_SEL_addUpdater = function(e)
		table.insert(_G.UZ_SEL_updaters, e);
	end;
_G.UZ_SEL_T0 = os.clock();
_G.UZ_SEL_hb = _G.UZ_SEL_Run.Heartbeat:Connect(function(e)
		local A = os.clock() - _G.UZ_SEL_T0;
		for l, E in ipairs(_G.UZ_SEL_updaters) do
			pcall(E, A, e);
		end;
	end);
_G.UZ_SEL_pg = _G.UZ_SEL_player:WaitForChild("PlayerGui");
if _G.UZ_SEL_pg:FindFirstChild("UzivertSelectorHalloween") then
	_G.UZ_SEL_pg.UzivertSelectorHalloween:Destroy();
end;
_G.UZ_SEL_gui = _G.UZ_SEL_new("ScreenGui", {
		Name = "UzivertSelectorHalloween",
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		DisplayOrder = 9999,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	}, _G.UZ_SEL_pg);
_G.UZ_SEL_root = _G.UZ_SEL_new("Frame", {
		Name = "Root",
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.fromScale(.5, .5),
		Size = UDim2.fromOffset(_G.UZ_SEL_WIN_W, _G.UZ_SEL_WIN_H),
		BackgroundTransparency = 1,
	}, _G.UZ_SEL_gui);
_G.UZ_SEL_winScale = _G.UZ_SEL_new("UIScale", { Scale = 0 }, _G.UZ_SEL_root);
_G.UZ_SEL_glow1 = _G.UZ_SEL_new("Frame", {
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.fromScale(.5, .5),
		Size = UDim2.new(1, 60, 1, 60),
		BackgroundColor3 = Color3.fromRGB(140, 60, 220),
		BackgroundTransparency = .85,
		BorderSizePixel = 0,
		ZIndex = 0,
	}, _G.UZ_SEL_root);
_G.UZ_SEL_corner(_G.UZ_SEL_glow1, UDim.new(0, 40));
_G.UZ_SEL_glow2 = _G.UZ_SEL_new("Frame", {
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.fromScale(.5, .5),
		Size = UDim2.new(1, 30, 1, 30),
		BackgroundColor3 = Color3.fromRGB(180, 80, 255),
		BackgroundTransparency = .7,
		BorderSizePixel = 0,
		ZIndex = 1,
	}, _G.UZ_SEL_root);
_G.UZ_SEL_corner(_G.UZ_SEL_glow2, UDim.new(0, 25));
_G.UZ_SEL_glow3 = _G.UZ_SEL_new("Frame", {
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.fromScale(.5, .5),
		Size = UDim2.new(1, 12, 1, 12),
		BackgroundColor3 = Color3.fromRGB(220, 130, 255),
		BackgroundTransparency = .55,
		BorderSizePixel = 0,
		ZIndex = 2,
	}, _G.UZ_SEL_root);
_G.UZ_SEL_corner(_G.UZ_SEL_glow3, UDim.new(0, 14));
_G.UZ_SEL_addUpdater(function(e)
	_G.UZ_SEL_glow1.BackgroundTransparency = .88 + .04 * math.sin(e * 1.2);
	_G.UZ_SEL_glow2.BackgroundTransparency = .78 + .05 * math.sin(e * 1.7 + 1);
	_G.UZ_SEL_glow3.BackgroundTransparency = .68 + .06 * math.sin(e * 2.3 + 2);
end);
_G.UZ_SEL_fitScale = function()
		local e = workspace.CurrentCamera;
		local A = e and e.ViewportSize or Vector2.new(1280, 720);
		return math.clamp(math.min(A.X / ((_G.UZ_SEL_WIN_W + 60)), A.Y / ((_G.UZ_SEL_WIN_H + 60))), .5, 1.4);
	end;
_G.UZ_SEL_main = _G.UZ_SEL_new("CanvasGroup", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = _G.UZ_SEL_BG,
		BackgroundTransparency = .15,
		ZIndex = 3,
	}, _G.UZ_SEL_root);
_G.UZ_SEL_corner(_G.UZ_SEL_main, UDim.new(0, 8));
_G.UZ_SEL_border = _G.UZ_SEL_new("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 20 }, _G.UZ_SEL_root);
_G.UZ_SEL_corner(_G.UZ_SEL_border, UDim.new(0, 8));
_G.UZ_SEL_mainStroke = _G.UZ_SEL_new("UIStroke", { Thickness = 1.5, Color = Color3.new(1, 1, 1), ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, _G.UZ_SEL_border);
_G.UZ_SEL_mainStrokeGrad = _G.UZ_SEL_new("UIGradient", { Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, _G.UZ_SEL_ORANGE),
			ColorSequenceKeypoint.new(.33, _G.UZ_SEL_PURPLE),
			ColorSequenceKeypoint.new(.66, _G.UZ_SEL_ORANGE),
			ColorSequenceKeypoint.new(1, _G.UZ_SEL_PURPLE),
		}) }, _G.UZ_SEL_mainStroke);
_G.UZ_SEL_addUpdater(function(e)
	_G.UZ_SEL_mainStrokeGrad.Rotation = ((e * 45)) % 360;
end);
_G.UZ_SEL_bgGrad = _G.UZ_SEL_new("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = .7,
		BorderSizePixel = 0,
		ZIndex = 1,
	}, _G.UZ_SEL_main);
_G.UZ_SEL_new("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 10, 30)), ColorSequenceKeypoint.new(.7, Color3.fromRGB(60, 25, 20)), ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 45, 15)) }), Rotation = 35 }, _G.UZ_SEL_bgGrad);
_G.UZ_SEL_webs = {};
_G.UZ_SEL_createWeb = function(e, A, l)
		local E = ((e == "TL" or e == "BL")) and 1 or -1;
		local y = ((e == "TL" or e == "TR")) and 1 or -1;
		local a = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(E == 1 and 0 or 1, y == 1 and 0 or 1),
				Position = UDim2.new(E == 1 and 0 or 1, 0, y == 1 and 0 or 1, l or 0),
				Size = UDim2.fromOffset(A, A),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				ZIndex = 2,
			}, _G.UZ_SEL_main);
		local W = E == 1 and 0 or A;
		local U = y == 1 and 0 or A;
		local function t(e, A)
			return W + (E * A) * math.cos(e), U + (y * A) * math.sin(e);
		end;
		local c, b = 6, 6;
		local k = {
				1,
				.97,
				1.04,
				.99,
				1.03,
				1,
			};
		local x, z = {}, {};
		for e = 0, c - 1, 1 do
			local l = (((math.pi / 2)) * e) / ((c - 1));
			local E = _G.UZ_SEL_line(a, _G.UZ_SEL_WEB, 2);
			local y, b = t(l, A * 1.5);
			_G.UZ_SEL_setLine(E, W, U, y, b, 1);
			x[#x + 1] = E;
		end;
		for e = 1, b, 1 do
			for l = 0, c - 2, 1 do
				z[#z + 1] = {
						r = e,
						i = l,
						R = ((A * 1.1) * ((e / b))) * k[e],
						a1 = (((math.pi / 2)) * l) / ((c - 1)),
						a2 = (((math.pi / 2)) * ((l + 1))) / ((c - 1)),
						am = (((math.pi / 2)) * ((l + .5))) / ((c - 1)),
						l1 = _G.UZ_SEL_line(a, _G.UZ_SEL_WEB, 1),
						l2 = _G.UZ_SEL_line(a, _G.UZ_SEL_WEB, 1),
					};
			end;
		end;
		_G.UZ_SEL_addUpdater(function(e)
			for A, l in ipairs(z) do
				local E = .84 + .035 * math.sin((e * 1.3 + l.r * .8) + l.i * .5);
				local y, a = t(l.a1, l.R);
				local W, U = t(l.a2, l.R);
				local c, b = t(l.am, l.R * E);
				_G.UZ_SEL_setLine(l.l1, y, a, c, b, 1);
				_G.UZ_SEL_setLine(l.l2, c, b, W, U, 1);
				local k = .8 + .08 * math.sin(e * 1.8 - l.r * .9);
				l.l1.BackgroundTransparency = k;
				l.l2.BackgroundTransparency = k;
			end;
			for A, l in ipairs(x) do
				l.BackgroundTransparency = .72 + .08 * math.sin(e * 1.1 + A);
			end;
		end);
		table.insert(_G.UZ_SEL_webs, a);
	end;
_G.UZ_SEL_createWeb("TL", 70, 50);
_G.UZ_SEL_createWeb("TR", 46, 50);
_G.UZ_SEL_createWeb("BL", 56, 0);
_G.UZ_SEL_createWeb("BR", 84, 0);
_G.UZ_SEL_tombColor = Color3.fromRGB(44, 30, 56);
for e, A in ipairs({
	{ 24, 16, 22 },
	{
		70,
		3,
		24,
		true,
	},
	{ 118, 18, 28 },
	{ 176, 12, 16 },
	{
		236,
		3,
		20,
		true,
	},
	{ 300, 16, 20 },
	{ 372, 12, 26 },
	{
		430,
		3,
		22,
		true,
	},
	{ 478, 18, 18 },
}) do
	local l, E, y, a = A[1], A[2], A[3], A[4];
	if a then
		_G.UZ_SEL_new("Frame", {
			AnchorPoint = Vector2.new(.5, 1),
			Position = UDim2.fromOffset(l, _G.UZ_SEL_WIN_H + 2),
			Size = UDim2.fromOffset(3, y),
			BackgroundColor3 = _G.UZ_SEL_tombColor,
			BackgroundTransparency = .2,
			BorderSizePixel = 0,
			ZIndex = 3,
		}, _G.UZ_SEL_main);
		_G.UZ_SEL_new("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromOffset(l, (_G.UZ_SEL_WIN_H + 2) - y * .7),
			Size = UDim2.fromOffset(12, 3),
			BackgroundColor3 = _G.UZ_SEL_tombColor,
			BackgroundTransparency = .2,
			BorderSizePixel = 0,
			ZIndex = 3,
		}, _G.UZ_SEL_main);
	else
		local e = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(.5, 1),
				Position = UDim2.fromOffset(l, _G.UZ_SEL_WIN_H + 12),
				Size = UDim2.fromOffset(E, y + 12),
				BackgroundColor3 = _G.UZ_SEL_tombColor,
				BackgroundTransparency = .2,
				BorderSizePixel = 0,
				ZIndex = 3,
			}, _G.UZ_SEL_main);
		_G.UZ_SEL_corner(e, UDim.new(0, E));
		_G.UZ_SEL_new("UIStroke", { Color = Color3.fromRGB(90, 60, 90), Transparency = .7, Thickness = 1 }, e);
	end;
end;
_G.UZ_SEL_embers = {};
for e = 1, 18, 1 do
	local A = math.random(2, 4);
	local l = _G.UZ_SEL_new("Frame", {
			Size = UDim2.fromOffset(A, A),
			BackgroundColor3 = (e % 3 == 0) and _G.UZ_SEL_PURPLE or ((e % 2 == 0) and _G.UZ_SEL_ORANGE or _G.UZ_SEL_ORANGE_LIGHT),
			BorderSizePixel = 0,
			ZIndex = 3,
		}, _G.UZ_SEL_main);
	_G.UZ_SEL_corner(l, UDim.new(1, 0));
	_G.UZ_SEL_embers[e] = {
			f = l,
			x = math.random() * _G.UZ_SEL_WIN_W,
			y = math.random() * _G.UZ_SEL_WIN_H,
			speed = 8 + math.random() * 16,
			amp = 6 + math.random() * 10,
			ph = math.random() * 6.28,
			fr = .6 + math.random() * .8,
		};
end;
_G.UZ_SEL_addUpdater(function(e, A)
	for l, E in ipairs(_G.UZ_SEL_embers) do
		E.y = E.y - (E.speed * A);
		if E.y < -6 then
			E.y = _G.UZ_SEL_WIN_H + 6;
			E.x = math.random() * _G.UZ_SEL_WIN_W;
		end;
		E.f.Position = UDim2.fromOffset(E.x + math.sin(e * E.fr + E.ph) * E.amp, E.y);
		E.f.BackgroundTransparency = 1 - .8 * math.sin(math.pi * math.clamp(E.y / _G.UZ_SEL_WIN_H, 0, 1));
	end;
end);
_G.UZ_SEL_fogLayer = function(e, A, l)
		local E = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.fromScale(0, 1),
				Size = UDim2.new(1, 0, 0, e),
				BackgroundColor3 = A,
				BorderSizePixel = 0,
				ZIndex = 4,
			}, _G.UZ_SEL_main);
		return _G.UZ_SEL_new("UIGradient", { Transparency = NumberSequence.new(l) }, E);
	end;
_G.UZ_SEL_new("UIGradient", { Rotation = 90, Color = ColorSequence.new(_G.UZ_SEL_PURPLE, _G.UZ_SEL_ORANGE), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, .85) }) }, _G.UZ_SEL_new("Frame", {
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.fromScale(0, 1),
	Size = UDim2.new(1, 0, 0, 80),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BorderSizePixel = 0,
	ZIndex = 4,
}, _G.UZ_SEL_main));
_G.UZ_SEL_wispKeys = {
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(.2, .9),
		NumberSequenceKeypoint.new(.4, 1),
		NumberSequenceKeypoint.new(.65, .88),
		NumberSequenceKeypoint.new(.85, 1),
		NumberSequenceKeypoint.new(1, 1),
	};
_G.UZ_SEL_wispA = _G.UZ_SEL_fogLayer(44, Color3.fromRGB(190, 150, 255), _G.UZ_SEL_wispKeys);
_G.UZ_SEL_wispB = _G.UZ_SEL_fogLayer(28, Color3.fromRGB(255, 170, 110), _G.UZ_SEL_wispKeys);
_G.UZ_SEL_phaseA, _G.UZ_SEL_phaseB = 0, 0;
_G.UZ_SEL_addUpdater(function(e, A)
	_G.UZ_SEL_phaseA = ((_G.UZ_SEL_phaseA + A * .08)) % 2;
	_G.UZ_SEL_phaseB = ((_G.UZ_SEL_phaseB + A * .05)) % 2;
	_G.UZ_SEL_wispA.Offset = Vector2.new(_G.UZ_SEL_phaseA - 1, 0);
	_G.UZ_SEL_wispB.Offset = Vector2.new(1 - _G.UZ_SEL_phaseB, 0);
end);
_G.UZ_SEL_bats = {};
_G.UZ_SEL_batColor = Color3.fromRGB(125, 85, 175);
for e = 1, 2, 1 do
	local A = {
			active = false,
			timer = 2 + e * 3,
			x = 0,
			baseY = 0,
			dir = 1,
			flap = 0,
			seed = e * 2.1,
			s = (e == 1) and 1 or .75,
			lines = {},
		};
	A.root = _G.UZ_SEL_new("Frame", {
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = 2,
		}, _G.UZ_SEL_main);
	for e = 1, 8, 1 do
		A.lines[e] = _G.UZ_SEL_line(A.root, _G.UZ_SEL_batColor, 1);
		A.lines[e].BackgroundTransparency = .25;
	end;
	A.body = _G.UZ_SEL_dot(A.root, 5 * A.s, _G.UZ_SEL_batColor, 2);
	_G.UZ_SEL_bats[e] = A;
end;
_G.UZ_SEL_addUpdater(function(e, A)
	for l, E in ipairs(_G.UZ_SEL_bats) do
		if not E.active then
			E.timer = E.timer - (A);
			if E.timer <= 0 then
				E.active = true;
				E.dir = (math.random() > .5) and 1 or -1;
				E.x = (E.dir == 1) and -24 or (_G.UZ_SEL_WIN_W + 24);
				E.baseY = math.random(64, 200);
				E.root.Visible = true;
			end;
		else
			E.x = E.x + ((E.dir * ((46 + E.s * 10))) * A);
			E.flap = E.flap + (A * 13);
			E.root.Position = UDim2.fromOffset(E.x, E.baseY + math.sin(e * 1.8 + E.seed) * 16);
			local l, y, a = math.sin(E.flap), E.s, 1;
			for e = -1, 1, 2 do
				local A, W = (e * 14) * y, (-l * 9) * y - 2 * y;
				local U, t = (e * 9) * y, 5 * y - (l * 3) * y;
				local c, b = (e * 4) * y, 4 * y;
				_G.UZ_SEL_setLine(E.lines[a], 0, -1 * y, A, W, 1.5);
				_G.UZ_SEL_setLine(E.lines[a + 1], A, W, U, t, 1.5);
				_G.UZ_SEL_setLine(E.lines[a + 2], U, t, c, b, 1.5);
				_G.UZ_SEL_setLine(E.lines[a + 3], c, b, 0, 2 * y, 1.5);
				a = a + (4);
			end;
			if E.x < -30 or E.x > _G.UZ_SEL_WIN_W + 30 then
				E.active = false;
				E.root.Visible = false;
				E.timer = 5 + math.random() * 7;
			end;
		end;
	end;
end);
_G.UZ_SEL_spLayer = _G.UZ_SEL_new("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 7 }, _G.UZ_SEL_main);
_G.UZ_SEL_spThread = _G.UZ_SEL_line(_G.UZ_SEL_spLayer, _G.UZ_SEL_WEB, 1);
_G.UZ_SEL_spThread.BackgroundTransparency = .35;
_G.UZ_SEL_spBody = _G.UZ_SEL_new("Frame", { Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1 }, _G.UZ_SEL_spLayer);
_G.UZ_SEL_spLegs = {};
for e = 0, 7, 1 do
	_G.UZ_SEL_spLegs[e] = { a = _G.UZ_SEL_line(_G.UZ_SEL_spBody, Color3.fromRGB(110, 70, 160), 1), b = _G.UZ_SEL_line(_G.UZ_SEL_spBody, Color3.fromRGB(110, 70, 160), 1) };
end;
_G.UZ_SEL_spAbd = _G.UZ_SEL_dot(_G.UZ_SEL_spBody, 10, Color3.fromRGB(45, 30, 70), 2);
_G.UZ_SEL_spAbd.Position = UDim2.fromOffset(0, 6);
_G.UZ_SEL_spAbd.Size = UDim2.fromOffset(10, 12);
_G.UZ_SEL_new("Frame", {
	AnchorPoint = Vector2.new(.5, .5),
	Position = UDim2.fromOffset(5, 6),
	Size = UDim2.fromOffset(3, 5),
	BackgroundColor3 = _G.UZ_SEL_ORANGE,
	BorderSizePixel = 0,
	ZIndex = 3,
}, _G.UZ_SEL_spAbd);
_G.UZ_SEL_spHead = _G.UZ_SEL_dot(_G.UZ_SEL_spBody, 7, Color3.fromRGB(60, 42, 90), 2);
_G.UZ_SEL_spHead.Position = UDim2.fromOffset(0, -4);
_G.UZ_SEL_spEyeL = _G.UZ_SEL_dot(_G.UZ_SEL_spBody, 2, _G.UZ_SEL_GREEN, 3);
_G.UZ_SEL_spEyeL.Position = UDim2.fromOffset(-1.6, -5);
_G.UZ_SEL_spEyeR = _G.UZ_SEL_dot(_G.UZ_SEL_spBody, 2, _G.UZ_SEL_GREEN, 3);
_G.UZ_SEL_spEyeR.Position = UDim2.fromOffset(1.6, -5);
_G.UZ_SEL_sp = {
		x = _G.UZ_SEL_WIN_W - 30,
		state = "idle",
		timer = 3.5,
		drop = 0,
		phase = 0,
	};
_G.UZ_SEL_legAngles = {
		-55,
		-18,
		18,
		55,
	};
_G.UZ_SEL_addUpdater(function(e, A)
	local l = _G.UZ_SEL_sp;
	local E = false;
	l.timer = l.timer - (A);
	if l.state == "idle" then
		if l.timer <= 0 then
			l.state, l.timer = "drop", 3.4;
		end;
	else
		local e = 3.4 - l.timer;
		local A = math.clamp(math.min(e, l.timer), 0, 1);
		l.drop = ((1 - ((1 - A)) ^ 3)) * 56;
		E = true;
		if l.timer <= 0 then
			l.state, l.timer, l.drop = "idle", 5 + math.random() * 4, 0;
		end;
	end;
	l.phase = l.phase + (A * ((E and 9 or 2)));
	local y = (26 + l.drop) + math.sin(e * 1.3) * 5;
	local a = math.sin(e * .9) * 4;
	local W = 50 + y;
	_G.UZ_SEL_setLine(_G.UZ_SEL_spThread, l.x, 50, l.x + a, W, 1);
	_G.UZ_SEL_spBody.Position = UDim2.fromOffset(l.x + a, W);
	for e = 0, 7, 1 do
		local A = e < 4 and -1 or 1;
		local E = math.rad(_G.UZ_SEL_legAngles[(e % 4) + 1]);
		local y, a = A * math.cos(E), math.sin(E);
		local W = math.sin(l.phase + e * .9) * .22;
		local U, t = y * 7, a * 7 - 5;
		local c, b = (y * 15) * ((1 + W)), (a * 15 + 4) + W * 5;
		_G.UZ_SEL_setLine(_G.UZ_SEL_spLegs[e].a, 0, 0, U, t, 1.2);
		_G.UZ_SEL_setLine(_G.UZ_SEL_spLegs[e].b, U, t, c, b, 1.2);
	end;
	local U = (math.sin(e * 1.7) > .96) and .9 or 0;
	_G.UZ_SEL_spEyeL.BackgroundTransparency = U;
	_G.UZ_SEL_spEyeR.BackgroundTransparency = U;
end);
_G.UZ_SEL_topbar = _G.UZ_SEL_new("Frame", {
		Size = UDim2.new(1, 0, 0, 50),
		BackgroundColor3 = _G.UZ_SEL_BAR,
		BackgroundTransparency = .2,
		BorderSizePixel = 0,
		ZIndex = 10,
	}, _G.UZ_SEL_main);
_G.UZ_SEL_new("Frame", {
	AnchorPoint = Vector2.new(0, 1),
	Position = UDim2.fromScale(0, 1),
	Size = UDim2.new(1, 0, 0, 1),
	BackgroundColor3 = _G.UZ_SEL_ORANGE,
	BackgroundTransparency = .6,
	BorderSizePixel = 0,
	ZIndex = 11,
}, _G.UZ_SEL_topbar);
_G.UZ_SEL_avatar = _G.UZ_SEL_new("ImageLabel", {
		Position = UDim2.fromOffset(14, 8),
		Size = UDim2.fromOffset(34, 34),
		BackgroundColor3 = _G.UZ_SEL_CARD,
		ZIndex = 12,
	}, _G.UZ_SEL_topbar);
_G.UZ_SEL_corner(_G.UZ_SEL_avatar, UDim.new(1, 0));
_G.UZ_SEL_avatarStroke = _G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = Color3.new(1, 1, 1) }, _G.UZ_SEL_avatar);
_G.UZ_SEL_avatarGrad = _G.UZ_SEL_new("UIGradient", { Color = ColorSequence.new(_G.UZ_SEL_ORANGE, _G.UZ_SEL_ORANGE_LIGHT), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(.55, .85), NumberSequenceKeypoint.new(1, 0) }) }, _G.UZ_SEL_avatarStroke);
task.spawn(function()
	local e, A = pcall(function()
			return _G.UZ_SEL_Players:GetUserThumbnailAsync(_G.UZ_SEL_player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
		end);
	if e then
		_G.UZ_SEL_avatar.Image = A;
	end;
end);
_G.UZ_SEL_onlineDot = _G.UZ_SEL_dot(_G.UZ_SEL_topbar, 9, _G.UZ_SEL_GREEN, 13);
_G.UZ_SEL_onlineDot.Position = UDim2.fromOffset(42.5, 40.5);
_G.UZ_SEL_new("UIStroke", { Thickness = 1.5, Color = _G.UZ_SEL_BAR }, _G.UZ_SEL_onlineDot);
_G.UZ_SEL_new("TextLabel", {
	Position = UDim2.fromOffset(56, 9),
	Size = UDim2.fromOffset(110, 14),
	BackgroundTransparency = 1,
	Text = _G.UZ_SEL_player.Name,
	Font = Enum.Font.GothamBold,
	TextSize = 11,
	TextColor3 = Color3.new(1, 1, 1),
	TextXAlignment = Enum.TextXAlignment.Left,
	TextTruncate = Enum.TextTruncate.AtEnd,
	ZIndex = 12,
}, _G.UZ_SEL_topbar);
_G.UZ_SEL_xpBack = _G.UZ_SEL_new("Frame", {
		Position = UDim2.fromOffset(56, 29),
		Size = UDim2.fromOffset(70, 3),
		BackgroundColor3 = Color3.fromRGB(50, 35, 50),
		BorderSizePixel = 0,
		ZIndex = 12,
	}, _G.UZ_SEL_topbar);
_G.UZ_SEL_corner(_G.UZ_SEL_xpBack, UDim.new(1, 0));
_G.UZ_SEL_xpFill = _G.UZ_SEL_new("Frame", {
		Size = UDim2.fromScale(0, 1),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		ZIndex = 13,
	}, _G.UZ_SEL_xpBack);
_G.UZ_SEL_corner(_G.UZ_SEL_xpFill, UDim.new(1, 0));
_G.UZ_SEL_xpGrad = _G.UZ_SEL_new("UIGradient", { Color = ColorSequence.new(_G.UZ_SEL_ORANGE, _G.UZ_SEL_ORANGE_LIGHT) }, _G.UZ_SEL_xpFill);
_G.UZ_SEL_tween(_G.UZ_SEL_xpFill, TweenInfo.new(1.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Size = UDim2.fromScale(.65, 1) });
_G.UZ_SEL_TAB_W = 90;
_G.UZ_SEL_tabNames = { "INICIO", "REDES", "CREADOR" };
_G.UZ_SEL_tabHolder = _G.UZ_SEL_new("Frame", {
		AnchorPoint = Vector2.new(.5, 0),
		Position = UDim2.new(.5, 0, 0, 0),
		Size = UDim2.fromOffset(_G.UZ_SEL_TAB_W * 3, 50),
		BackgroundTransparency = 1,
		ZIndex = 12,
	}, _G.UZ_SEL_topbar);
_G.UZ_SEL_tabGlow = _G.UZ_SEL_new("Frame", {
		Size = UDim2.fromOffset(_G.UZ_SEL_TAB_W, 50),
		BackgroundColor3 = _G.UZ_SEL_ORANGE,
		BorderSizePixel = 0,
		ZIndex = 12,
	}, _G.UZ_SEL_tabHolder);
_G.UZ_SEL_new("UIGradient", { Rotation = 90, Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, .8) }) }, _G.UZ_SEL_tabGlow);
_G.UZ_SEL_underline = _G.UZ_SEL_new("Frame", {
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromOffset(15, 50),
		Size = UDim2.fromOffset(_G.UZ_SEL_TAB_W - 30, 2),
		BackgroundColor3 = _G.UZ_SEL_ORANGE,
		BorderSizePixel = 0,
		ZIndex = 13,
	}, _G.UZ_SEL_tabHolder);
_G.UZ_SEL_stats = _G.UZ_SEL_new("TextLabel", {
		AnchorPoint = Vector2.new(1, .5),
		Position = UDim2.new(1, -14, .5, 0),
		Size = UDim2.fromOffset(100, 16),
		BackgroundTransparency = 1,
		Text = "-- FPS   |   -- ms",
		Font = Enum.Font.Gotham,
		TextSize = 9,
		TextColor3 = _G.UZ_SEL_GRAY,
		TextXAlignment = Enum.TextXAlignment.Right,
		ZIndex = 12,
	}, _G.UZ_SEL_topbar);
_G.UZ_SEL_statDot = _G.UZ_SEL_dot(_G.UZ_SEL_topbar, 6, _G.UZ_SEL_GREEN, 12);
_G.UZ_SEL_statDot.Position = UDim2.new(1, -120, .5, 0);
_G.UZ_SEL_frames, _G.UZ_SEL_acc = 0, 0;
_G.UZ_SEL_addUpdater(function(e, A)
	_G.UZ_SEL_frames = _G.UZ_SEL_frames + (1);
	_G.UZ_SEL_acc = _G.UZ_SEL_acc + (A);
	if _G.UZ_SEL_acc >= .5 then
		local e = math.floor(_G.UZ_SEL_frames / _G.UZ_SEL_acc + .5);
		local A, l = pcall(function()
				return math.floor(_G.UZ_SEL_player:GetNetworkPing() * 1000 + .5);
			end);
		_G.UZ_SEL_stats.Text = string.format("%d FPS   |   %s ms", e, A and tostring(l) or "--");
		_G.UZ_SEL_statDot.Position = UDim2.new(1, (-14 - _G.UZ_SEL_stats.TextBounds.X) - 10, .5, 0);
		_G.UZ_SEL_frames, _G.UZ_SEL_acc = 0, 0;
	end;
	_G.UZ_SEL_statDot.BackgroundTransparency = .4 + .4 * math.sin(e * 2.4);
	_G.UZ_SEL_onlineDot.BackgroundTransparency = .35 + .35 * math.sin(e * 3);
	_G.UZ_SEL_avatarGrad.Rotation = ((e * 120)) % 360;
	_G.UZ_SEL_xpGrad.Offset = Vector2.new(math.sin(e * 2) * .3, 0);
end);
_G.UZ_SEL_content = _G.UZ_SEL_new("Frame", {
		Position = UDim2.fromOffset(0, 50),
		Size = UDim2.new(1, 0, 1, -74),
		BackgroundTransparency = 1,
		ZIndex = 5,
	}, _G.UZ_SEL_main);
_G.UZ_SEL_makePage = function()
		return _G.UZ_SEL_new("CanvasGroup", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			GroupTransparency = 1,
			Visible = false,
			ZIndex = 5,
		}, _G.UZ_SEL_content);
	end;
_G.UZ_SEL_pages = { INICIO = _G.UZ_SEL_makePage(), REDES = _G.UZ_SEL_makePage(), CREADOR = _G.UZ_SEL_makePage() };
_G.UZ_SEL_new("TextLabel", {
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, -14, 1, -5),
	Size = UDim2.fromOffset(40, 14),
	BackgroundTransparency = 1,
	Text = "ONLINE",
	Font = Enum.Font.GothamMedium,
	TextSize = 8,
	TextColor3 = _G.UZ_SEL_GREEN,
	TextXAlignment = Enum.TextXAlignment.Right,
	ZIndex = 12,
}, _G.UZ_SEL_main);
_G.UZ_SEL_footDot = _G.UZ_SEL_dot(_G.UZ_SEL_main, 5, _G.UZ_SEL_GREEN, 12);
_G.UZ_SEL_footDot.Position = UDim2.new(1, -62, 1, -12);
_G.UZ_SEL_new("TextLabel", {
	AnchorPoint = Vector2.new(1, 1),
	Position = UDim2.new(1, -70, 1, -5),
	Size = UDim2.fromOffset(150, 14),
	BackgroundTransparency = 1,
	Text = "By/ " .. _G.UZ_SEL_CONFIG.CREATOR_NAME,
	Font = Enum.Font.Gotham,
	TextSize = 8,
	TextColor3 = _G.UZ_SEL_GRAY,
	TextXAlignment = Enum.TextXAlignment.Right,
	ZIndex = 12,
}, _G.UZ_SEL_main);
_G.UZ_SEL_addUpdater(function(e)
	_G.UZ_SEL_footDot.BackgroundTransparency = .4 + .4 * math.sin(e * 2.4 + 1);
end);
_G.UZ_SEL_toastFrame = _G.UZ_SEL_new("Frame", {
		AnchorPoint = Vector2.new(.5, 1),
		Position = UDim2.new(.5, 0, 1, 40),
		Size = UDim2.fromOffset(210, 26),
		BackgroundColor3 = _G.UZ_SEL_CARD,
		BorderSizePixel = 0,
		ZIndex = 30,
	}, _G.UZ_SEL_main);
_G.UZ_SEL_corner(_G.UZ_SEL_toastFrame, UDim.new(0, 13));
_G.UZ_SEL_new("UIStroke", { Color = _G.UZ_SEL_ORANGE, Thickness = 1, Transparency = .3 }, _G.UZ_SEL_toastFrame);
_G.UZ_SEL_toastText = _G.UZ_SEL_new("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		Font = Enum.Font.GothamMedium,
		TextSize = 10,
		TextColor3 = Color3.new(1, 1, 1),
		ZIndex = 31,
	}, _G.UZ_SEL_toastFrame);
_G.UZ_SEL_toastToken = 0;
_G.UZ_SEL_toast = function(e)
		_G.UZ_SEL_toastToken = _G.UZ_SEL_toastToken + (1);
		local A = _G.UZ_SEL_toastToken;
		_G.UZ_SEL_toastText.Text = e;
		_G.UZ_SEL_tween(_G.UZ_SEL_toastFrame, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.new(.5, 0, 1, -30) });
		task.delay(2.2, function()
			if A == _G.UZ_SEL_toastToken then
				_G.UZ_SEL_tween(_G.UZ_SEL_toastFrame, TweenInfo.new(.35, Enum.EasingStyle.Quint), { Position = UDim2.new(.5, 0, 1, 40) });
			end;
		end);
	end;
_G.UZ_SEL_copy = function(e, A)
		local l = pcall(function()
				setclipboard(e);
			end);
		_G.UZ_SEL_toast(l and A or "No se pudo copiar");
	end;
_G.UZ_SEL_iconDesktop = function(e, A)
		_G.UZ_SEL_outline(e, UDim2.fromOffset(6, 7), UDim2.fromOffset(22, 15), A, 2, 3);
		_G.UZ_SEL_solid(e, UDim2.fromOffset(10, 12), UDim2.fromOffset(14, 2), A, 1);
		_G.UZ_SEL_solid(e, UDim2.fromOffset(10, 16), UDim2.fromOffset(8, 2), A, 1);
		_G.UZ_SEL_solid(e, UDim2.fromOffset(15, 22), UDim2.fromOffset(4, 4), A);
		_G.UZ_SEL_solid(e, UDim2.fromOffset(11, 26), UDim2.fromOffset(12, 2), A, 1);
	end;
_G.UZ_SEL_iconPhone = function(e, A)
		_G.UZ_SEL_outline(e, UDim2.fromOffset(10, 5), UDim2.fromOffset(14, 24), A, 2, 4);
		_G.UZ_SEL_solid(e, UDim2.fromOffset(14, 8), UDim2.fromOffset(6, 2), A, 1);
		_G.UZ_SEL_solid(e, UDim2.fromOffset(14, 24), UDim2.fromOffset(6, 2), A, 1);
	end;
_G.UZ_SEL_iconTikTok = function(e, A)
		_G.UZ_SEL_solid(e, UDim2.fromOffset(19, 7), UDim2.fromOffset(3, 16), A);
		_G.UZ_SEL_setLine(_G.UZ_SEL_line(e, A, 10), 21, 8, 27, 13, 3);
		local l = _G.UZ_SEL_dot(e, 9, A, 10);
		l.Position = UDim2.fromOffset(15.5, 23);
	end;
_G.UZ_SEL_iconInstagram = function(e, A)
		_G.UZ_SEL_outline(e, UDim2.fromOffset(6, 6), UDim2.fromOffset(22, 22), A, 2, 7);
		local l = _G.UZ_SEL_dot(e, 10, A, 10);
		l.BackgroundTransparency = 1;
		l.Position = UDim2.fromOffset(17, 17);
		_G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = A }, l);
		local E = _G.UZ_SEL_dot(e, 3, A, 10);
		E.Position = UDim2.fromOffset(23.5, 10.5);
	end;
_G.UZ_SEL_sparkColors = {
		_G.UZ_SEL_ORANGE,
		_G.UZ_SEL_ORANGE_LIGHT,
		_G.UZ_SEL_PURPLE,
		Color3.fromRGB(255, 255, 255),
	};
_G.UZ_SEL_burst = function(e)
		local A = _G.UZ_SEL_main;
		local l = (((e.AbsolutePosition + e.AbsoluteSize / 2) - A.AbsolutePosition)) / math.max(_G.UZ_SEL_winScale.Scale, .05);
		local E = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromOffset(l.X, l.Y),
				Size = UDim2.fromOffset(10, 10),
				BackgroundTransparency = 1,
				ZIndex = 40,
			}, A);
		_G.UZ_SEL_corner(E, UDim.new(1, 0));
		local y = _G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_ORANGE_LIGHT }, E);
		_G.UZ_SEL_tween(E, TweenInfo.new(.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(96, 96) });
		_G.UZ_SEL_tween(y, TweenInfo.new(.5), { Transparency = 1 });
		_G.UZ_SEL_Debris:AddItem(E, .6);
		for e = 1, 10, 1 do
			local E = math.random(4, 7);
			local y = _G.UZ_SEL_new("Frame", {
					AnchorPoint = Vector2.new(.5, .5),
					Position = UDim2.fromOffset(l.X, l.Y),
					Size = UDim2.fromOffset(E, E),
					Rotation = 45,
					BorderSizePixel = 0,
					ZIndex = 41,
					BackgroundColor3 = _G.UZ_SEL_sparkColors[math.random(#_G.UZ_SEL_sparkColors)],
				}, A);
			local a, W = (math.random() * math.pi) * 2, 36 + math.random() * 50;
			_G.UZ_SEL_tween(y, TweenInfo.new(.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = UDim2.fromOffset(l.X + math.cos(a) * W, l.Y + math.sin(a) * W),
				BackgroundTransparency = 1,
				Rotation = 45 + math.random(-200, 200),
				Size = UDim2.fromOffset(1, 1),
			});
			_G.UZ_SEL_Debris:AddItem(y, .7);
		end;
	end;
_G.UZ_SEL_menuItem = function(e, A, l, E, y, a, W)
		local U = _G.UZ_SEL_new("TextButton", {
				LayoutOrder = A,
				Size = UDim2.new(1, 0, 0, 52),
				BackgroundColor3 = _G.UZ_SEL_CARD,
				BackgroundTransparency = .1,
				AutoButtonColor = false,
				Text = "",
				ClipsDescendants = true,
				ZIndex = 8,
			}, e);
		_G.UZ_SEL_corner(U, UDim.new(0, 8));
		local t = _G.UZ_SEL_new("UIStroke", { Thickness = 1, Color = _G.UZ_SEL_CARD_LINE }, U);
		local c = _G.UZ_SEL_new("UIScale", { Scale = 0 }, U);
		local b = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(0, .5),
				Position = UDim2.new(0, 0, .5, 0),
				Size = UDim2.fromOffset(3, 0),
				BackgroundColor3 = E,
				BorderSizePixel = 0,
				ZIndex = 10,
			}, U);
		local k = 18;
		local x;
		if l then
			k = 54;
			local e = _G.UZ_SEL_new("Frame", {
					Position = UDim2.fromOffset(9, 9),
					Size = UDim2.fromOffset(34, 34),
					BackgroundColor3 = E,
					BackgroundTransparency = .8,
					BorderSizePixel = 0,
					ZIndex = 9,
				}, U);
			_G.UZ_SEL_corner(e, UDim.new(0, 6));
			x = _G.UZ_SEL_new("UIStroke", { Thickness = 1, Color = E, Transparency = .3 }, e);
			l(e, E);
		end;
		local z = _G.UZ_SEL_new("TextLabel", {
				Position = UDim2.fromOffset(k, 9),
				Size = UDim2.new(1, -k - 24, 0, 16),
				BackgroundTransparency = 1,
				Text = y,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = Color3.new(1, 1, 1),
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 9,
			}, U);
		_G.UZ_SEL_new("TextLabel", {
			Position = UDim2.fromOffset(k, 28),
			Size = UDim2.new(1, -k - 24, 0, 14),
			BackgroundTransparency = 1,
			Text = a,
			Font = Enum.Font.Gotham,
			TextSize = 10,
			TextColor3 = _G.UZ_SEL_GRAY,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 9,
		}, U);
		local d = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.new(0, -30, .5, 0),
				Size = UDim2.fromOffset(26, 100),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = .9,
				BorderSizePixel = 0,
				Rotation = 20,
				ZIndex = 9,
			}, U);
		local w = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.new(1, -8, .5, 0),
				Size = UDim2.fromOffset(10, 12),
				BackgroundTransparency = 1,
				ZIndex = 10,
			}, U);
		local m = _G.UZ_SEL_line(w, E, 10);
		local V = _G.UZ_SEL_line(w, E, 10);
		_G.UZ_SEL_setLine(m, 2, 1, 8, 6, 2);
		_G.UZ_SEL_setLine(V, 8, 6, 2, 11, 2);
		m.BackgroundTransparency, V.BackgroundTransparency = 1, 1;
		_G.UZ_SEL_hoverable(U, function()
			_G.UZ_SEL_tween(U, TweenInfo.new(.2), { BackgroundColor3 = _G.UZ_SEL_CARD:Lerp(E, .2) });
			_G.UZ_SEL_tween(t, TweenInfo.new(.2), { Color = E });
			_G.UZ_SEL_tween(c, TweenInfo.new(.2, Enum.EasingStyle.Back), { Scale = 1.03 });
			_G.UZ_SEL_tween(b, TweenInfo.new(.3, Enum.EasingStyle.Back), { Size = UDim2.fromOffset(3, 26) });
			_G.UZ_SEL_tween(z, TweenInfo.new(.2), { TextColor3 = E:Lerp(Color3.new(1, 1, 1), .4) });
			if x then
				_G.UZ_SEL_tween(x, TweenInfo.new(.2), { Transparency = 0 });
			end;
			d.Position = UDim2.new(0, -30, .5, 0);
			_G.UZ_SEL_tween(d, TweenInfo.new(.55, Enum.EasingStyle.Quad), { Position = UDim2.new(1, 40, .5, 0) });
			w.Position = UDim2.new(1, -2, .5, 0);
			_G.UZ_SEL_tween(w, TweenInfo.new(.3, Enum.EasingStyle.Back), { Position = UDim2.new(1, -16, .5, 0) });
			_G.UZ_SEL_tween(m, TweenInfo.new(.2), { BackgroundTransparency = 0 });
			_G.UZ_SEL_tween(V, TweenInfo.new(.2), { BackgroundTransparency = 0 });
		end, function()
			_G.UZ_SEL_tween(U, TweenInfo.new(.25), { BackgroundColor3 = _G.UZ_SEL_CARD });
			_G.UZ_SEL_tween(t, TweenInfo.new(.25), { Color = _G.UZ_SEL_CARD_LINE });
			_G.UZ_SEL_tween(c, TweenInfo.new(.2), { Scale = 1 });
			_G.UZ_SEL_tween(b, TweenInfo.new(.2), { Size = UDim2.fromOffset(3, 0) });
			_G.UZ_SEL_tween(z, TweenInfo.new(.25), { TextColor3 = Color3.new(1, 1, 1) });
			if x then
				_G.UZ_SEL_tween(x, TweenInfo.new(.25), { Transparency = .3 });
			end;
			_G.UZ_SEL_tween(m, TweenInfo.new(.2), { BackgroundTransparency = 1 });
			_G.UZ_SEL_tween(V, TweenInfo.new(.2), { BackgroundTransparency = 1 });
		end);
		U.Activated:Connect(function()
			_G.UZ_SEL_tween(c, TweenInfo.new(.07), { Scale = .96 });
			task.delay(.07, function()
				_G.UZ_SEL_tween(c, TweenInfo.new(.2, Enum.EasingStyle.Back), { Scale = 1.03 });
			end);
			_G.UZ_SEL_burst(U);
			if W then
				task.spawn(W);
			end;
		end);
		task.delay(.4 + A * .1, function()
			_G.UZ_SEL_tween(c, TweenInfo.new(.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 });
		end);
		return U;
	end;
_G.UZ_SEL_elegirGama = function(e)
		_G.UZIVERT_GAMA_BAJA = e;
		_G.UZIVERT_SELECCIONADO = true;
		print("[Uzivert] Seleccionado: " .. ((e and "GAMA BAJA" or "GAMA ALTA")));
		_G.UZ_SEL_tween(_G.UZ_SEL_winScale, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), { Scale = 0 });
		task.wait(.4);
		if _G.UZ_SEL_hb then
			_G.UZ_SEL_hb:Disconnect();
		end;
		_G.UZ_SEL_gui:Destroy();
		print("[Uzivert] Iniciando Uzivert Hub " .. ((e and "GAMA BAJA" or "GAMA ALTA")));
	end;
_G.UZ_SEL_home = _G.UZ_SEL_pages.INICIO;
_G.UZ_SEL_new("TextLabel", {
	Position = UDim2.fromOffset(16, 10),
	Size = UDim2.fromOffset(200, 12),
	BackgroundTransparency = 1,
	Text = "ELEG\195\141 TU DISPOSITIVO",
	Font = Enum.Font.GothamBold,
	TextSize = 8,
	TextColor3 = Color3.new(1, 1, 1),
	TextXAlignment = Enum.TextXAlignment.Left,
	ZIndex = 8,
}, _G.UZ_SEL_home);
_G.UZ_SEL_new("TextLabel", {
	Position = UDim2.new(0, 206, 0, 10),
	Size = UDim2.fromOffset(60, 12),
	BackgroundTransparency = 1,
	Text = _G.UZ_SEL_CONFIG.VERSION,
	Font = Enum.Font.GothamBold,
	TextSize = 8,
	TextColor3 = _G.UZ_SEL_ORANGE,
	TextXAlignment = Enum.TextXAlignment.Right,
	ZIndex = 8,
}, _G.UZ_SEL_home);
_G.UZ_SEL_menuList = _G.UZ_SEL_new("Frame", {
		Position = UDim2.fromOffset(16, 28),
		Size = UDim2.fromOffset(250, 112),
		BackgroundTransparency = 1,
		ZIndex = 8,
	}, _G.UZ_SEL_home);
_G.UZ_SEL_new("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, _G.UZ_SEL_menuList);
_G.UZ_SEL_menuItem(_G.UZ_SEL_menuList, 1, _G.UZ_SEL_iconDesktop, Color3.fromRGB(60, 120, 255), "GAMA ALTA", "Todas las funciones del hub", function()
	task.wait(.3);
	_G.UZ_SEL_elegirGama(false);
end);
_G.UZ_SEL_menuItem(_G.UZ_SEL_menuList, 2, _G.UZ_SEL_iconPhone, _G.UZ_SEL_ORANGE, "GAMA BAJA", "Solo funciones esenciales", function()
	task.wait(.3);
	_G.UZ_SEL_elegirGama(true);
end);
_G.UZ_SEL_logo = _G.UZ_SEL_new("TextLabel", {
		Position = UDim2.fromOffset(16, 150),
		Size = UDim2.fromOffset(250, 44),
		BackgroundTransparency = 1,
		Text = "UZIVERT HUB",
		Font = Enum.Font.Creepster,
		TextSize = 38,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 8,
	}, _G.UZ_SEL_home);
_G.UZ_SEL_logoGrad = _G.UZ_SEL_new("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 50)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 225, 170)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 50)) }) }, _G.UZ_SEL_logo);
_G.UZ_SEL_addUpdater(function(e)
	_G.UZ_SEL_logoGrad.Offset = Vector2.new(math.sin(e * .9) * .7, 0);
	_G.UZ_SEL_logo.TextTransparency = (((e % 6) < .3 and math.sin(e * 90) > 0)) and .55 or 0;
end);
_G.UZ_SEL_showcase = _G.UZ_SEL_new("Frame", {
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.new(.77, 0, .47, 0),
		Size = UDim2.fromOffset(190, 190),
		BackgroundTransparency = 1,
		ZIndex = 6,
	}, _G.UZ_SEL_home);
_G.UZ_SEL_aura = {};
for e, A in ipairs({ 186, 150, 112 }) do
	local l = _G.UZ_SEL_dot(_G.UZ_SEL_showcase, A, _G.UZ_SEL_ORANGE, 5);
	l.Position = UDim2.fromScale(.5, .5);
	l.BackgroundTransparency = .9 - e * .012;
	_G.UZ_SEL_aura[e] = l;
end;
_G.UZ_SEL_halo = _G.UZ_SEL_dot(_G.UZ_SEL_showcase, 150, _G.UZ_SEL_ORANGE, 6);
_G.UZ_SEL_halo.Position = UDim2.fromScale(.5, .5);
_G.UZ_SEL_halo.BackgroundTransparency = .85;
_G.UZ_SEL_new("UIStroke", { Thickness = 1.5, Color = _G.UZ_SEL_ORANGE, Transparency = .4 }, _G.UZ_SEL_halo);
_G.UZ_SEL_squares = {};
for e = 1, 2, 1 do
	local A = _G.UZ_SEL_new("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(e == 1 and 140 or 128, e == 1 and 140 or 128),
			BackgroundTransparency = 1,
			ZIndex = 7,
		}, _G.UZ_SEL_showcase);
	_G.UZ_SEL_new("UIStroke", { Thickness = 1.5, Color = _G.UZ_SEL_ORANGE, Transparency = (e == 1) and .1 or .35 }, A);
	if e == 1 then
		for e, l in ipairs({
			{ 0, 0 },
			{ 1, 0 },
			{ 0, 1 },
			{ 1, 1 },
		}) do
			_G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(l[1], l[2]),
				Size = UDim2.fromOffset(5, 5),
				BackgroundColor3 = _G.UZ_SEL_ORANGE_LIGHT,
				BorderSizePixel = 0,
				ZIndex = 8,
			}, A);
		end;
	end;
	_G.UZ_SEL_squares[e] = A;
end;
_G.UZ_SEL_orbiters = {};
for e = 1, 8, 1 do
	local A = _G.UZ_SEL_dot(_G.UZ_SEL_showcase, 3 + (e % 3), (e % 3 == 0) and _G.UZ_SEL_PURPLE or _G.UZ_SEL_ORANGE_LIGHT, 8);
	_G.UZ_SEL_orbiters[e] = {
			f = A,
			r = 80 + ((e % 3)) * 7,
			sp = (((e % 2 == 0) and 1 or -1)) * ((.3 + e * .06)),
			ph = e * .8,
		};
end;
_G.UZ_SEL_skullHolder = _G.UZ_SEL_new("Frame", {
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.fromScale(.5, .5),
		Size = UDim2.fromOffset(92, 102),
		BackgroundTransparency = 1,
		ZIndex = 9,
	}, _G.UZ_SEL_showcase);
_G.UZ_SEL_skull = _G.UZ_SEL_new("Frame", {
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.fromScale(.5, .5),
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ZIndex = 9,
	}, _G.UZ_SEL_skullHolder);
_G.UZ_SEL_skullScale = _G.UZ_SEL_new("UIScale", { Scale = 1 }, _G.UZ_SEL_skull);
_G.UZ_SEL_bone = function(e, A)
		e.BackgroundColor3 = e.BackgroundColor3 or _G.UZ_SEL_BONE;
		e.BorderSizePixel = 0;
		e.ZIndex = e.ZIndex or 10;
		return _G.UZ_SEL_new("Frame", e, A);
	end;
_G.UZ_SEL_cranium = _G.UZ_SEL_bone({ AnchorPoint = Vector2.new(.5, 0), Position = UDim2.fromScale(.5, .02), Size = UDim2.fromScale(.88, .68) }, _G.UZ_SEL_skull);
_G.UZ_SEL_corner(_G.UZ_SEL_cranium, UDim.new(.5, 0));
_G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_INK }, _G.UZ_SEL_cranium);
_G.UZ_SEL_cheek = _G.UZ_SEL_bone({ AnchorPoint = Vector2.new(.5, 0), Position = UDim2.fromScale(.5, .5), Size = UDim2.fromScale(.62, .3) }, _G.UZ_SEL_skull);
_G.UZ_SEL_corner(_G.UZ_SEL_cheek, UDim.new(.3, 0));
_G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_INK }, _G.UZ_SEL_cheek);
_G.UZ_SEL_mouth = _G.UZ_SEL_bone({
		AnchorPoint = Vector2.new(.5, 0),
		Position = UDim2.fromScale(.5, .66),
		Size = UDim2.fromScale(.5, .2),
		BackgroundColor3 = Color3.fromRGB(10, 5, 10),
	}, _G.UZ_SEL_skull);
_G.UZ_SEL_corner(_G.UZ_SEL_mouth, UDim.new(.3, 0));
_G.UZ_SEL_eyes, _G.UZ_SEL_pupils = {}, {};
for e = 1, 2, 1 do
	local A = _G.UZ_SEL_bone({
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(e == 1 and .34 or .66, .33),
			Size = UDim2.fromScale(.24, .24),
			BackgroundColor3 = Color3.fromRGB(8, 4, 8),
			Rotation = e == 1 and 12 or -12,
			ZIndex = 12,
		}, _G.UZ_SEL_skull);
	_G.UZ_SEL_corner(A, UDim.new(.45, 0));
	local l = _G.UZ_SEL_bone({
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromScale(.35, .35),
			BackgroundColor3 = _G.UZ_SEL_ORANGE,
			ZIndex = 13,
		}, A);
	_G.UZ_SEL_corner(l, UDim.new(1, 0));
	_G.UZ_SEL_tween(l, _G.UZ_SEL_LOOP(.5), { BackgroundColor3 = Color3.fromRGB(255, 40, 30), Size = UDim2.fromScale(.5, .5) });
	_G.UZ_SEL_eyes[e] = A;
	_G.UZ_SEL_pupils[e] = l;
end;
_G.UZ_SEL_nose = _G.UZ_SEL_bone({
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.fromScale(.5, .56),
		Size = UDim2.fromOffset(7, 7),
		BackgroundColor3 = Color3.fromRGB(10, 5, 10),
		Rotation = 45,
		ZIndex = 12,
	}, _G.UZ_SEL_skull);
_G.UZ_SEL_teethRow = function(e, A, l, E)
		local y = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(.5, 0),
				Position = A,
				Size = l,
				BackgroundTransparency = 1,
				ZIndex = E,
			}, e);
		_G.UZ_SEL_new("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(.02, 0), HorizontalAlignment = Enum.HorizontalAlignment.Center }, y);
		for e = 1, 6, 1 do
			local A = _G.UZ_SEL_bone({ Size = UDim2.fromScale(.13, 1), ZIndex = E }, y);
			_G.UZ_SEL_corner(A, UDim.new(.2, 0));
			_G.UZ_SEL_new("UIStroke", { Thickness = 1, Color = _G.UZ_SEL_INK }, A);
		end;
	end;
_G.UZ_SEL_teethRow(_G.UZ_SEL_skull, UDim2.fromScale(.5, .64), UDim2.fromScale(.5, .1), 12);
_G.UZ_SEL_JAW_CLOSED = UDim2.fromScale(.5, .74);
_G.UZ_SEL_JAW_OPEN = UDim2.fromScale(.5, .9);
_G.UZ_SEL_jaw = _G.UZ_SEL_bone({
		AnchorPoint = Vector2.new(.5, 0),
		Position = _G.UZ_SEL_JAW_CLOSED,
		Size = UDim2.fromScale(.56, .2),
		ZIndex = 11,
	}, _G.UZ_SEL_skull);
_G.UZ_SEL_corner(_G.UZ_SEL_jaw, UDim.new(.35, 0));
_G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_INK }, _G.UZ_SEL_jaw);
_G.UZ_SEL_teethRow(_G.UZ_SEL_jaw, UDim2.fromScale(.5, .05), UDim2.fromScale(.9, .45), 12);
_G.UZ_SEL_laughText = _G.UZ_SEL_new("TextLabel", {
		AnchorPoint = Vector2.new(.5, .5),
		Position = UDim2.fromScale(.5, .06),
		Size = UDim2.fromOffset(150, 24),
		BackgroundTransparency = 1,
		Text = "",
		Font = Enum.Font.Creepster,
		TextScaled = true,
		TextColor3 = _G.UZ_SEL_ORANGE_LIGHT,
		TextTransparency = 1,
		ZIndex = 20,
	}, _G.UZ_SEL_showcase);
_G.UZ_SEL_laughStroke = _G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = Color3.fromRGB(80, 0, 0), Transparency = 1 }, _G.UZ_SEL_laughText);
_G.UZ_SEL_eyeX, _G.UZ_SEL_eyeY = 0, 0;
_G.UZ_SEL_addUpdater(function(e, A)
	_G.UZ_SEL_squares[1].Rotation = ((e * 22)) % 360;
	_G.UZ_SEL_squares[2].Rotation = ((-e * 15)) % 360;
	local l = math.sin(e * 2.2);
	_G.UZ_SEL_halo.Size = UDim2.fromOffset(150 + l * 6, 150 + l * 6);
	_G.UZ_SEL_halo.BackgroundTransparency = .88 + l * .03;
	for A, l in ipairs(_G.UZ_SEL_aura) do
		l.BackgroundTransparency = (.9 - A * .012) + .02 * math.sin(e * 1.6 + A);
	end;
	for A, l in ipairs(_G.UZ_SEL_orbiters) do
		local E = e * l.sp + l.ph;
		l.f.Position = UDim2.fromScale(.5, .5) + UDim2.fromOffset(math.cos(E) * l.r, (math.sin(E) * l.r) * .92);
		l.f.BackgroundTransparency = .1 + .4 * ((.5 + .5 * math.sin(e * 2 + l.ph)));
	end;
	_G.UZ_SEL_skullHolder.Position = UDim2.fromScale(.5, .5 + math.sin(e * 1.8) * .025);
	local E = _G.UZ_SEL_showcase;
	local y = E.AbsolutePosition + E.AbsoluteSize / 2;
	local a = _G.UZ_SEL_Input:GetMouseLocation() - y;
	local W = a.Magnitude;
	local U = math.min(W, 300) / 300;
	local t = (W > 0) and a.Unit or Vector2.new(0, 0);
	local c = math.min(1, A * 10);
	_G.UZ_SEL_eyeX = _G.UZ_SEL_eyeX + ((((t.X * .18) * U - _G.UZ_SEL_eyeX)) * c);
	_G.UZ_SEL_eyeY = _G.UZ_SEL_eyeY + ((((t.Y * .18) * U - _G.UZ_SEL_eyeY)) * c);
	for e, A in ipairs(_G.UZ_SEL_pupils) do
		A.Position = UDim2.fromScale(.5 + _G.UZ_SEL_eyeX, .5 + _G.UZ_SEL_eyeY);
	end;
end);
_G.UZ_SEL_playSound = function(e, A)
		if e == "" then
			return;
		end;
		pcall(function()
			local l = _G.UZ_SEL_new("Sound", { SoundId = e, Volume = 1, PlaybackSpeed = A or 1 }, _G.UZ_SEL_root);
			l:Play();
			_G.UZ_SEL_Debris:AddItem(l, 4);
		end);
	end;
_G.UZ_SEL_ripple = function()
		local e = _G.UZ_SEL_new("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(60, 60),
				BackgroundTransparency = 1,
				ZIndex = 6,
			}, _G.UZ_SEL_showcase);
		_G.UZ_SEL_corner(e, UDim.new(1, 0));
		local A = _G.UZ_SEL_new("UIStroke", { Thickness = 2, Color = _G.UZ_SEL_ORANGE_LIGHT }, e);
		_G.UZ_SEL_tween(e, TweenInfo.new(.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(200, 200) });
		_G.UZ_SEL_tween(A, TweenInfo.new(.7), { Transparency = 1 });
		_G.UZ_SEL_Debris:AddItem(e, .8);
	end;
_G.UZ_SEL_laughTexts = {
		"HA HA HA!",
		"MUAJAJAJA!",
		"JE JE JE!",
		"HAHAHAHA!",
	};
_G.UZ_SEL_isLaughing = false;
_G.UZ_SEL_laugh = function()
		if _G.UZ_SEL_isLaughing then
			return;
		end;
		_G.UZ_SEL_isLaughing = true;
		_G.UZ_SEL_laughText.Text = _G.UZ_SEL_laughTexts[math.random(#_G.UZ_SEL_laughTexts)];
		_G.UZ_SEL_laughText.TextTransparency = 1;
		_G.UZ_SEL_laughText.Position = UDim2.fromScale(.5, .1);
		_G.UZ_SEL_laughText.Rotation = -6;
		_G.UZ_SEL_tween(_G.UZ_SEL_laughText, TweenInfo.new(.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { TextTransparency = 0, Position = UDim2.fromScale(.5, 0), Rotation = 6 });
		_G.UZ_SEL_tween(_G.UZ_SEL_laughStroke, TweenInfo.new(.3), { Transparency = 0 });
		_G.UZ_SEL_playSound(_G.UZ_SEL_CONFIG.LAUGH_SOUND, 1);
		for e = 1, 8, 1 do
			if e % 3 == 1 then
				_G.UZ_SEL_ripple();
			end;
			_G.UZ_SEL_tween(_G.UZ_SEL_jaw, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Position = _G.UZ_SEL_JAW_OPEN });
			_G.UZ_SEL_tween(_G.UZ_SEL_skull, TweenInfo.new(.1, Enum.EasingStyle.Quad), { Rotation = (e % 2 == 0) and 7 or -7 });
			_G.UZ_SEL_tween(_G.UZ_SEL_skullScale, TweenInfo.new(.1, Enum.EasingStyle.Quad), { Scale = 1.08 });
			for e, A in ipairs(_G.UZ_SEL_eyes) do
				_G.UZ_SEL_tween(A, TweenInfo.new(.1), { Size = UDim2.fromScale(.24, .17) });
			end;
			task.wait(.11);
			_G.UZ_SEL_tween(_G.UZ_SEL_jaw, TweenInfo.new(.09, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = _G.UZ_SEL_JAW_CLOSED });
			_G.UZ_SEL_tween(_G.UZ_SEL_skullScale, TweenInfo.new(.09, Enum.EasingStyle.Quad), { Scale = 1 });
			for e, A in ipairs(_G.UZ_SEL_eyes) do
				_G.UZ_SEL_tween(A, TweenInfo.new(.09), { Size = UDim2.fromScale(.24, .24) });
			end;
			_G.UZ_SEL_playSound(_G.UZ_SEL_CONFIG.TEETH_SOUND, .9 + math.random() * .4);
			task.wait(.09);
		end;
		_G.UZ_SEL_tween(_G.UZ_SEL_skull, TweenInfo.new(.25, Enum.EasingStyle.Back), { Rotation = 0 });
		_G.UZ_SEL_tween(_G.UZ_SEL_laughText, TweenInfo.new(.4), { TextTransparency = 1 });
		_G.UZ_SEL_tween(_G.UZ_SEL_laughStroke, TweenInfo.new(.4), { Transparency = 1 });
		_G.UZ_SEL_isLaughing = false;
	end;
task.spawn(function()
	task.wait(1.2);
	while _G.UZ_SEL_gui.Parent do
		if _G.UZ_SEL_home.Visible and _G.UZ_SEL_home.GroupTransparency < .5 then
			pcall(_G.UZ_SEL_laugh);
		end;
		task.wait(1.5 + math.random() * 1.5);
	end;
end);
_G.UZ_SEL_skullBtn = _G.UZ_SEL_new("TextButton", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Text = "",
		ZIndex = 25,
	}, _G.UZ_SEL_skullHolder);
_G.UZ_SEL_skullBtn.Activated:Connect(function()
	_G.UZ_SEL_burst(_G.UZ_SEL_skullHolder);
	_G.UZ_SEL_laugh();
end);
do
	local e = _G.UZ_SEL_pages.REDES;
	_G.UZ_SEL_new("TextLabel", {
		Position = UDim2.fromOffset(16, 10),
		Size = UDim2.fromOffset(200, 12),
		BackgroundTransparency = 1,
		Text = "MIS REDES",
		Font = Enum.Font.GothamBold,
		TextSize = 8,
		TextColor3 = Color3.new(1, 1, 1),
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 8,
	}, e);
	_G.UZ_SEL_redesList = _G.UZ_SEL_new("Frame", {
			Position = UDim2.fromOffset(16, 28),
			Size = UDim2.fromOffset(250, 112),
			BackgroundTransparency = 1,
			ZIndex = 8,
		}, e);
	_G.UZ_SEL_new("UIListLayout", { Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder }, _G.UZ_SEL_redesList);
	_G.UZ_SEL_menuItem(_G.UZ_SEL_redesList, 1, _G.UZ_SEL_iconTikTok, Color3.fromRGB(70, 220, 230), "TIKTOK", _G.UZ_SEL_CONFIG.TIKTOK, function()
		_G.UZ_SEL_copy("https://tiktok.com/" .. _G.UZ_SEL_CONFIG.TIKTOK, "Link de TikTok copiado");
	end);
	_G.UZ_SEL_menuItem(_G.UZ_SEL_redesList, 2, _G.UZ_SEL_iconInstagram, Color3.fromRGB(230, 80, 150), "INSTAGRAM", _G.UZ_SEL_CONFIG.INSTAGRAM, function()
		_G.UZ_SEL_copy("https://instagram.com/" .. _G.UZ_SEL_CONFIG.INSTAGRAM, "Link de Instagram copiado");
	end);
	_G.UZ_SEL_new("TextLabel", {
		Position = UDim2.fromOffset(16, 150),
		Size = UDim2.fromOffset(250, 20),
		BackgroundTransparency = 1,
		Text = "Toc\195\161 un bot\195\179n para copiar el link",
		Font = Enum.Font.Gotham,
		TextSize = 9,
		TextColor3 = _G.UZ_SEL_GRAY,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 8,
	}, e);
	_G.UZ_SEL_redesDeco = _G.UZ_SEL_new("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.new(.77, 0, .47, 0),
			Size = UDim2.fromOffset(150, 150),
			BackgroundTransparency = 1,
			ZIndex = 6,
		}, e);
	_G.UZ_SEL_redesRings = {};
	for e = 1, 3, 1 do
		local A = _G.UZ_SEL_outline(_G.UZ_SEL_redesDeco, UDim2.fromScale(.5, .5) - UDim2.fromOffset(40 + e * 14, 40 + e * 14), UDim2.fromOffset(80 + e * 28, 80 + e * 28), (e == 2) and _G.UZ_SEL_PURPLE or _G.UZ_SEL_ORANGE, 1.5, 6, 7);
		_G.UZ_SEL_redesRings[e] = A;
	end;
	_G.UZ_SEL_redesCore = _G.UZ_SEL_dot(_G.UZ_SEL_redesDeco, 26, _G.UZ_SEL_ORANGE, 8);
	_G.UZ_SEL_redesCore.Position = UDim2.fromScale(.5, .5);
	_G.UZ_SEL_addUpdater(function(e)
		for A, l in ipairs(_G.UZ_SEL_redesRings) do
			l.Rotation = ((e * ((A % 2 == 0 and -16 or 20)) + A * 15)) % 360;
		end;
		local A = .5 + .5 * math.sin(e * 2.4);
		_G.UZ_SEL_redesCore.BackgroundTransparency = .2 + .5 * A;
		_G.UZ_SEL_redesCore.Size = UDim2.fromOffset(22 + A * 8, 22 + A * 8);
	end);
end;
do
	local e = _G.UZ_SEL_pages.CREADOR;
	_G.UZ_SEL_credTitle = _G.UZ_SEL_new("TextLabel", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .3),
			Size = UDim2.fromOffset(300, 56),
			BackgroundTransparency = 1,
			Text = "UZIVERT HUB",
			Font = Enum.Font.Creepster,
			TextScaled = true,
			TextColor3 = Color3.new(1, 1, 1),
			ZIndex = 8,
		}, e);
	_G.UZ_SEL_credGrad = _G.UZ_SEL_new("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 50)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 225, 170)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 50)) }) }, _G.UZ_SEL_credTitle);
	_G.UZ_SEL_divL = _G.UZ_SEL_solid(e, UDim2.new(.5, -90, .5, -4), UDim2.fromOffset(78, 1), _G.UZ_SEL_ORANGE, nil, 8);
	_G.UZ_SEL_divR = _G.UZ_SEL_solid(e, UDim2.new(.5, 12, .5, -4), UDim2.fromOffset(78, 1), _G.UZ_SEL_ORANGE, nil, 8);
	_G.UZ_SEL_divD = _G.UZ_SEL_new("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.new(.5, 0, .5, -3.5),
			Size = UDim2.fromOffset(8, 8),
			BackgroundColor3 = _G.UZ_SEL_ORANGE,
			BorderSizePixel = 0,
			Rotation = 45,
			ZIndex = 8,
		}, e);
	_G.UZ_SEL_new("TextLabel", {
		AnchorPoint = Vector2.new(.5, 0),
		Position = UDim2.new(.5, 0, .5, 14),
		Size = UDim2.fromOffset(300, 70),
		BackgroundTransparency = 1,
		RichText = true,
		Text = "Hecho por <b>" .. (_G.UZ_SEL_CONFIG.CREATOR_NAME .. ("</b>\nTruco o trato\n\nVersi\195\179n: " .. _G.UZ_SEL_CONFIG.VERSION)),
		Font = Enum.Font.Gotham,
		TextSize = 11,
		TextColor3 = _G.UZ_SEL_GRAY,
		ZIndex = 8,
	}, e);
	_G.UZ_SEL_addUpdater(function(e)
		_G.UZ_SEL_credGrad.Offset = Vector2.new(math.sin(e * .9) * .7, 0);
		_G.UZ_SEL_credTitle.TextTransparency = (((e % 5) < .25 and math.sin(e * 90) > 0)) and .5 or 0;
		_G.UZ_SEL_divD.Rotation = 45 + math.sin(e * 1.5) * 20;
		_G.UZ_SEL_divD.BackgroundTransparency = .1 + .3 * ((.5 + .5 * math.sin(e * 2.2)));
	end);
end;
_G.UZ_SEL_currentTab = nil;
_G.UZ_SEL_tabButtons = {};
_G.UZ_SEL_setTab = function(e)
		if _G.UZ_SEL_currentTab == e then
			return;
		end;
		local A = _G.UZ_SEL_currentTab;
		_G.UZ_SEL_currentTab = e;
		local l = table.find(_G.UZ_SEL_tabNames, e);
		local E = ((l - 1)) * _G.UZ_SEL_TAB_W;
		_G.UZ_SEL_tween(_G.UZ_SEL_underline, TweenInfo.new(.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.fromOffset(E + 15, 50) });
		_G.UZ_SEL_tween(_G.UZ_SEL_tabGlow, TweenInfo.new(.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { Position = UDim2.fromOffset(E, 0) });
		for A, l in pairs(_G.UZ_SEL_tabButtons) do
			_G.UZ_SEL_tween(l, TweenInfo.new(.2), { TextColor3 = (A == e) and _G.UZ_SEL_ORANGE or _G.UZ_SEL_GRAY });
		end;
		if A then
			local e = _G.UZ_SEL_pages[A];
			_G.UZ_SEL_tween(e, TweenInfo.new(.18, Enum.EasingStyle.Quint), { GroupTransparency = 1, Position = UDim2.fromOffset(-24, 0) });
			task.delay(.18, function()
				if _G.UZ_SEL_currentTab ~= A then
					e.Visible = false;
				end;
			end);
		end;
		local y = _G.UZ_SEL_pages[e];
		y.Position = UDim2.fromOffset(24, 0);
		y.GroupTransparency = 1;
		y.Visible = true;
		_G.UZ_SEL_tween(y, TweenInfo.new(.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { GroupTransparency = 0, Position = UDim2.fromOffset(0, 0) });
	end;
for e, A in ipairs(_G.UZ_SEL_tabNames) do
	local l = _G.UZ_SEL_new("TextButton", {
			Position = UDim2.fromOffset(((e - 1)) * _G.UZ_SEL_TAB_W, 0),
			Size = UDim2.fromOffset(_G.UZ_SEL_TAB_W, 50),
			BackgroundTransparency = 1,
			Text = A,
			Font = Enum.Font.GothamBold,
			TextSize = 9,
			TextColor3 = _G.UZ_SEL_GRAY,
			ZIndex = 14,
		}, _G.UZ_SEL_tabHolder);
	l.Activated:Connect(function()
		_G.UZ_SEL_setTab(A);
	end);
	_G.UZ_SEL_tabButtons[A] = l;
end;
do
	local e, A, l;
	_G.UZ_SEL_topbar.InputBegan:Connect(function(E)
		if E.UserInputType == Enum.UserInputType.MouseButton1 or E.UserInputType == Enum.UserInputType.Touch then
			e = true;
			A = E.Position;
			l = _G.UZ_SEL_root.Position;
			E.Changed:Connect(function()
				if E.UserInputState == Enum.UserInputState.End then
					e = false;
				end;
			end);
		end;
	end);
	_G.UZ_SEL_Input.InputChanged:Connect(function(E)
		if e and ((E.UserInputType == Enum.UserInputType.MouseMovement or E.UserInputType == Enum.UserInputType.Touch)) then
			local e = ((E.Position - A)) / math.max(_G.UZ_SEL_winScale.Scale, .1);
			_G.UZ_SEL_root.Position = UDim2.new(l.X.Scale, l.X.Offset + e.X, l.Y.Scale, l.Y.Offset + e.Y);
		end;
	end);
end;
_G.UZ_SEL_setTab("INICIO");
_G.UZ_SEL_tween(_G.UZ_SEL_winScale, TweenInfo.new(.7, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = _G.UZ_SEL_fitScale() });
_G.UZ_SEL_cam = workspace.CurrentCamera;
if _G.UZ_SEL_cam then
	(_G.UZ_SEL_cam:GetPropertyChangedSignal("ViewportSize")):Connect(function()
		_G.UZ_SEL_winScale.Scale = _G.UZ_SEL_fitScale();
	end);
end;
while not _G.UZIVERT_SELECCIONADO do
	task.wait(.1);
end;
local k = {
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
	};
k.FondoPrincipal = k.Fondo;
k.FondoSecundario = k.FondoPanel;
k.Acento = k.Naranja1;
k.AcentoBrillo = k.Naranja2;
k.TextoSecundario = k.Sub;
k.AzulOscuro = k.Morado3;
k.AzulOscuroBorde = k.Naranja1;
local x = "UzivertHub_Config_v470.json";
local z = {
		ESP = true,
		GunESP = false,
		AntiFling = false,
		Noclip = false,
		Walkspeed = 16,
		Spinbot = false,
		Monitor = false,
		FPSBoost = false,
		Anims = false,
		AutoGrabAntiM = true,
		AutoGrabDistMurder = 25,
		AutoGrabRegresar = true,
		AutoGrabLock = false,
		AutoGrabPos = {
			0,
			30,
			.5,
			40,
		},
		AutoGrabMostrar = true,
		ShootMostrar = true,
		ShootLock = false,
		ShootPos = {
			0,
			30,
			.5,
			100,
		},
		ShootAvzMostrar = false,
		ShootAvzLock = false,
		ShootAvzPos = {
			0,
			30,
			.5,
			170,
		},
		ShootAltura = 1.55,
		ShootPredVel = .11,
		ShootPredMov = .13,
		ShootBurst = 3,
		ShootBurstDelay = .04,
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
		AimPred = .145,
		AimBtnShow = true,
		AimBtnPos = nil,
		AutoStab = false,
		AutoStabRango = 6,
		ModoNoche = false,
		AutoGetGun = false,
		RoundTimer = false,
		MusicVolumen = .5,
		CancionesCustom = {},
		GunAura = false,
		GunAuraRango = 25,
		SilentAim = false,
		SilentPred = .1,
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
	};
local d = {};
local function w()
	if isfile and isfile(x) then
		local e, A = pcall(function()
				return t:JSONDecode(readfile(x));
			end);
		if e and A then
			d = A;
			print("\240\159\142\131 Configuraci\195\179n v4.7.4 cargada");
			return true;
		end;
	end;
	d = z;
	print("\240\159\147\157 Configuraci\195\179n v4.7.4 por defecto");
	return false;
end;
local function m()
	if writefile then
		pcall(function()
			writefile(x, t:JSONEncode(d));
		end);
	end;
end;
w();
local V = d.ESP;
local H = d.GunESP;
local s = d.AntiFling;
local p = d.Noclip;
local i = d.Walkspeed;
local Y = d.Spinbot;
local T = d.Monitor;
local u = d.FPSBoost;
local P = d.Anims;
local N = d.ShootMostrar ~= false;
local M = d.ShootAvzMostrar or false;
local X = d.ShootAltura or 1.55;
local L = d.ShootPredVel or .11;
local F = d.ShootPredMov or .13;
local g = d.ShootBurst or 3;
local Q = d.ShootBurstDelay or .04;
local n = d.ShootRangoMax or 350;
local h = d.ShootRangoMin or 3;
local K = d.ShootWallCheck ~= false;
local r = d.ShootAuto;
local Z = d.ShootPing or 60;
local f = d.ShootPingAuto ~= false;
local R = d.AutoPrankBomb or false;
local D = nil;
local G = d.KillAllActivo or false;
print("\240\159\142\131 Parte 1/10 cargada - v4.7.4 HALLOWEEN");
task.spawn(function()
	pcall(function()
		game:HttpGet("https://uzivert-api.onrender.com/registrar?user=" .. l.Name);
	end);
	while task.wait(120) do
		pcall(function()
			game:HttpGet("https://uzivert-api.onrender.com/registrar?user=" .. l.Name);
		end);
	end;
end);
local B = l:WaitForChild("PlayerGui");
if B:FindFirstChild("UzivertHub") then
	B.UzivertHub:Destroy();
end;
local S = Instance.new("ScreenGui");
S.Name = "UzivertHub";
S.ResetOnSpawn = false;
S.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
S.IgnoreGuiInset = true;
S.DisplayOrder = 999999;
local C = (gethui and gethui()) or B;
S.Parent = C;
local I, j, O, J, q, o, v;
local eB = {};
do
	local e = (_G.UZIVERT_GAMA_BAJA == true);
	local A = {};
	_G.UZ_UI = A;
	A.visible = false;
	A.abierto = false;
	local l, W, U = 520, 340, 132;
	local t = Enum.EasingStyle.Back;
	local x = {
			bg = Color3.fromRGB(14, 10, 18),
			card = Color3.fromRGB(26, 17, 32),
			cardHi = Color3.fromRGB(44, 26, 40),
			dark = Color3.fromRGB(18, 11, 24),
			line = Color3.fromRGB(70, 46, 60),
			off = Color3.fromRGB(50, 38, 64),
			web = Color3.fromRGB(210, 200, 225),
			or1 = k.Naranja1,
			or2 = k.Naranja2,
			or3 = k.Naranja3,
			pu1 = k.Morado1,
			pu2 = k.Morado2,
			pu3 = k.Morado3,
			text = k.Texto,
			sub = k.Sub,
			red = k.Rojo,
			green = k.Verde,
			yellow = k.Amarillo,
		};
	local function z(e, A, l)
		local E = Instance.new(e);
		for e, A in pairs(A) do
			E[e] = A;
		end;
		E.Parent = l;
		return E;
	end;
	local function w(e, A, l, E, a)
		local W = y:Create(e, TweenInfo.new(A, E or Enum.EasingStyle.Quint, a or Enum.EasingDirection.Out), l);
		W:Play();
		return W;
	end;
	local function m(e, A)
		return z("UICorner", { CornerRadius = UDim.new(0, A) }, e);
	end;
	local function V(e, A, l, E, y, a)
		local W, U = E - A, y - l;
		e.Size = UDim2.fromOffset(math.sqrt(W * W + U * U), a);
		e.Position = UDim2.fromOffset(((A + E)) / 2, ((l + y)) / 2);
		e.Rotation = math.deg(math.atan2(U, W));
	end;
	local function H(e, A, l)
		return z("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			BackgroundColor3 = A,
			BorderSizePixel = 0,
			ZIndex = l or 1,
		}, e);
	end;
	local function s(e, A, l, E)
		local y = z("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Size = UDim2.fromOffset(A, A),
				BackgroundColor3 = l,
				BorderSizePixel = 0,
				ZIndex = E or 1,
			}, e);
		m(y, 999);
		return y;
	end;
	local function p(e)
		return (.299 * e.R + .587 * e.G) + .114 * e.B;
	end;
	local function i(e)
		if not e then
			return x.pu2;
		end;
		if p(e) < .2 then
			return x.or1;
		end;
		return e;
	end;
	local function Y(e, A, l)
		e.MouseEnter:Connect(A);
		e.MouseLeave:Connect(l);
		e.InputBegan:Connect(function(e)
			if e.UserInputType == Enum.UserInputType.Touch then
				A();
			end;
		end);
		e.InputEnded:Connect(function(e)
			if e.UserInputType == Enum.UserInputType.Touch then
				l();
			end;
		end);
	end;
	local function T(e, A, l, E)
		local y = s(e, 10, A, l or 12);
		y.Position = UDim2.fromScale(.5, .5);
		y.BackgroundTransparency = .6;
		w(y, .5, { Size = UDim2.fromOffset(E or 260, E or 260), BackgroundTransparency = 1 });
		c:AddItem(y, .6);
	end;
	local u, P = {}, {};
	A.addUpdater = function(e, A)
			table.insert(A and u or P, e);
		end;
	local N = os.clock();
	A.hb = a.Heartbeat:Connect(function(e)
			local l = os.clock() - N;
			for A, E in ipairs(u) do
				pcall(E, l, e);
			end;
			if A.visible then
				for A, E in ipairs(P) do
					pcall(E, l, e);
				end;
			end;
		end);
	I = z("Frame", {
			Name = "UzivertPanel",
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(l, W),
			BackgroundTransparency = 1,
			Visible = false,
		}, S);
	local M = z("UIScale", { Scale = .9 }, I);
	local function X()
		local e = workspace.CurrentCamera;
		local A = e and e.ViewportSize or Vector2.new(1280, 720);
		return math.clamp(math.min(A.X / ((l + 30)), A.Y / ((W + 30))), .55, 1.3);
	end;
	A.base = X();
	local L = {};
	local F = e and { { 30, .9, 30 } } or { { 60, .85, 40 }, { 30, .72, 25 }, { 12, .58, 14 } };
	for e, A in ipairs(F) do
		local l = z("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.new(1, A[1], 1, A[1]),
				BackgroundColor3 = Color3.fromRGB(150 + e * 25, 60 + e * 25, 230),
				BackgroundTransparency = A[2],
				BorderSizePixel = 0,
				ZIndex = e,
			}, I);
		m(l, A[3]);
		L[e] = { l, A[2] };
	end;
	if not e then
		A.addUpdater(function(e)
			for A, l in ipairs(L) do
				l[1].BackgroundTransparency = l[2] + .04 * math.sin(e * ((1.1 + A * .5)) + A);
			end;
		end);
	end;
	local g = z(e and "Frame" or "CanvasGroup", {
			Name = "Surface",
			Size = UDim2.fromScale(1, 1),
			BackgroundColor3 = x.bg,
			BackgroundTransparency = .1,
			BorderSizePixel = 0,
			ZIndex = 5,
			ClipsDescendants = true,
		}, I);
	m(g, 14);
	A.surface = g;
	local Q = z("Frame", { Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 30 }, I);
	m(Q, 14);
	local n = z("UIStroke", { Thickness = 1.5, Color = Color3.new(1, 1, 1), ApplyStrokeMode = Enum.ApplyStrokeMode.Border }, Q);
	local h = z("UIGradient", { Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, x.or1),
				ColorSequenceKeypoint.new(.33, x.pu2),
				ColorSequenceKeypoint.new(.66, x.or1),
				ColorSequenceKeypoint.new(1, x.pu2),
			}) }, n);
	A.addUpdater(function(e)
		h.Rotation = ((e * 45)) % 360;
	end);
	z("UIGradient", { Rotation = 35, Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 10, 30)), ColorSequenceKeypoint.new(.7, Color3.fromRGB(60, 25, 20)), ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 45, 15)) }) }, z("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BackgroundTransparency = .72,
		BorderSizePixel = 0,
		ZIndex = 1,
	}, g));
	local function K(l, E, y)
		local a = ((l == "TL" or l == "BL")) and 1 or -1;
		local W = ((l == "TL" or l == "TR")) and 1 or -1;
		local U = z("Frame", {
				AnchorPoint = Vector2.new(a == 1 and 0 or 1, W == 1 and 0 or 1),
				Position = UDim2.new(a == 1 and 0 or 1, 0, W == 1 and 0 or 1, y or 0),
				Size = UDim2.fromOffset(E, E),
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				ZIndex = 2,
			}, g);
		local t = a == 1 and 0 or E;
		local c = W == 1 and 0 or E;
		local function b(e, A)
			return t + (a * A) * math.cos(e), c + (W * A) * math.sin(e);
		end;
		local k, d = 5, 5;
		local w, m = {}, {};
		for e = 0, k - 1, 1 do
			local A = (((math.pi / 2)) * e) / ((k - 1));
			local l = H(U, x.web, 2);
			local y, a = b(A, E * 1.5);
			V(l, t, c, y, a, 1);
			w[#w + 1] = l;
		end;
		for e = 1, d, 1 do
			for A = 0, k - 2, 1 do
				m[#m + 1] = {
						r = e,
						i = A,
						R = (E * 1.1) * ((e / d)),
						a1 = (((math.pi / 2)) * A) / ((k - 1)),
						a2 = (((math.pi / 2)) * ((A + 1))) / ((k - 1)),
						am = (((math.pi / 2)) * ((A + .5))) / ((k - 1)),
						l1 = H(U, x.web, 1),
						l2 = H(U, x.web, 1),
					};
			end;
		end;
		local function s(e)
			for A, l in ipairs(m) do
				local E = .84 + ((e and .035 * math.sin((e * 1.3 + l.r * .8) + l.i * .5) or 0));
				local y, a = b(l.a1, l.R);
				local W, U = b(l.a2, l.R);
				local t, c = b(l.am, l.R * E);
				V(l.l1, y, a, t, c, 1);
				V(l.l2, t, c, W, U, 1);
				local k = .8 + ((e and .08 * math.sin(e * 1.8 - l.r * .9) or 0));
				l.l1.BackgroundTransparency = k;
				l.l2.BackgroundTransparency = k;
			end;
			for A, l in ipairs(w) do
				l.BackgroundTransparency = .72 + ((e and .08 * math.sin(e * 1.1 + A) or 0));
			end;
		end;
		s(nil);
		if not e then
			local e = 0;
			A.addUpdater(function(A)
				e = e + (1);
				if e % 3 == 0 then
					s(A);
				end;
			end);
		end;
	end;
	K("TL", 70, 0);
	K("TR", 46, 0);
	K("BL", 56, 0);
	K("BR", 84, 0);
	z("UIGradient", { Rotation = 90, Color = ColorSequence.new(x.pu1, x.or1), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, .86) }) }, z("Frame", {
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.new(1, 0, 0, 70),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		ZIndex = 4,
	}, g));
	if not e then
		local e = {};
		for A = 1, 12, 1 do
			local E = math.random(2, 4);
			local y = z("Frame", {
					Size = UDim2.fromOffset(E, E),
					BorderSizePixel = 0,
					ZIndex = 3,
					BackgroundColor3 = (A % 3 == 0) and x.pu2 or ((A % 2 == 0) and x.or1 or x.or2),
				}, g);
			m(y, 4);
			e[A] = {
					f = y,
					x = math.random() * l,
					y = math.random() * W,
					speed = 8 + math.random() * 16,
					amp = 6 + math.random() * 10,
					ph = math.random() * 6.28,
					fr = .6 + math.random() * .8,
				};
		end;
		A.addUpdater(function(A, E)
			for e, y in ipairs(e) do
				y.y = y.y - (y.speed * E);
				if y.y < -6 then
					y.y = W + 6;
					y.x = math.random() * l;
				end;
				y.f.Position = UDim2.fromOffset(y.x + math.sin(A * y.fr + y.ph) * y.amp, y.y);
				y.f.BackgroundTransparency = 1 - .8 * math.sin(math.pi * math.clamp(y.y / W, 0, 1));
			end;
		end);
		local E = {
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(.2, .9),
				NumberSequenceKeypoint.new(.4, 1),
				NumberSequenceKeypoint.new(.65, .88),
				NumberSequenceKeypoint.new(.85, 1),
				NumberSequenceKeypoint.new(1, 1),
			};
		local function y(e, A)
			local l = z("Frame", {
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.fromScale(0, 1),
					Size = UDim2.new(1, 0, 0, e),
					BackgroundColor3 = A,
					BorderSizePixel = 0,
					ZIndex = 4,
				}, g);
			return z("UIGradient", { Transparency = NumberSequence.new(E) }, l);
		end;
		local a, U = y(44, Color3.fromRGB(190, 150, 255)), y(28, Color3.fromRGB(255, 170, 110));
		local t, c = 0, 0;
		A.addUpdater(function(e, A)
			t = ((t + A * .08)) % 2;
			c = ((c + A * .05)) % 2;
			a.Offset = Vector2.new(t - 1, 0);
			U.Offset = Vector2.new(1 - c, 0);
		end);
		local b = Color3.fromRGB(125, 85, 175);
		local k = {};
		for e = 1, 2, 1 do
			local A = {
					active = false,
					timer = 2 + e * 3,
					x = 0,
					baseY = 0,
					dir = 1,
					flap = 0,
					seed = e * 2.1,
					s = (e == 1) and 1 or .75,
					lines = {},
				};
			A.root = z("Frame", {
					Size = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
					Visible = false,
					ZIndex = 2,
				}, g);
			for e = 1, 10, 1 do
				A.lines[e] = H(A.root, b, 1);
				A.lines[e].BackgroundTransparency = .25;
			end;
			s(A.root, 5 * A.s, b, 2);
			k[e] = A;
		end;
		A.addUpdater(function(e, A)
			for E, y in ipairs(k) do
				if not y.active then
					y.timer = y.timer - (A);
					if y.timer <= 0 then
						y.active = true;
						y.dir = (math.random() > .5) and 1 or -1;
						y.x = (y.dir == 1) and -24 or (l + 24);
						y.baseY = math.random(60, W - 80);
						y.root.Visible = true;
					end;
				else
					y.x = y.x + ((y.dir * ((46 + y.s * 10))) * A);
					y.flap = y.flap + (A * 13);
					y.root.Position = UDim2.fromOffset(y.x, y.baseY + math.sin(e * 1.8 + y.seed) * 16);
					local E, a, W = math.sin(y.flap), y.s, 1;
					for e = -1, 1, 2 do
						local A, l = (e * 14) * a, (-E * 9) * a - 2 * a;
						local U, t = (e * 9) * a, 5 * a - (E * 3) * a;
						local c, b = (e * 4) * a, 4 * a;
						V(y.lines[W], 0, -1 * a, A, l, 1.5);
						V(y.lines[W + 1], A, l, U, t, 1.5);
						V(y.lines[W + 2], U, t, c, b, 1.5);
						V(y.lines[W + 3], c, b, 0, 2 * a, 1.5);
						W = W + (4);
					end;
					if y.x < -30 or y.x > l + 30 then
						y.active = false;
						y.root.Visible = false;
						y.timer = 5 + math.random() * 7;
					end;
				end;
			end;
		end);
	end;
	local r = z("Frame", {
			Size = UDim2.new(0, U, 1, 0),
			BackgroundColor3 = Color3.fromRGB(10, 5, 16),
			BackgroundTransparency = .35,
			BorderSizePixel = 0,
			ZIndex = 6,
		}, g);
	z("Frame", {
		Position = UDim2.new(1, -1, 0, 0),
		Size = UDim2.new(0, 1, 1, 0),
		BackgroundColor3 = x.or1,
		BackgroundTransparency = .7,
		BorderSizePixel = 0,
		ZIndex = 7,
	}, r);
	local Z = z("Frame", {
			Position = UDim2.fromOffset(12, 12),
			Size = UDim2.fromOffset(34, 34),
			BackgroundTransparency = 1,
			ZIndex = 8,
		}, r);
	local function f(e, A, l)
		local E = z("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(e, e),
				BackgroundTransparency = 1,
				ZIndex = 8,
			}, Z);
		m(E, 6);
		z("UIStroke", { Thickness = 1.5, Color = A, Transparency = l }, E);
		return E;
	end;
	local R, D = f(32, x.or1, .2), f(25, x.pu2, .4);
	local G = s(Z, 15, x.or2, 9);
	G.Position = UDim2.fromScale(.5, .5);
	local B = s(Z, 13, Color3.fromRGB(14, 9, 20), 10);
	B.Position = UDim2.new(.5, 4, .5, -3);
	A.addUpdater(function(e)
		R.Rotation = ((e * 22)) % 360;
		D.Rotation = ((-e * 30)) % 360;
	end);
	local C = z("TextLabel", {
			Position = UDim2.fromOffset(52, 12),
			Size = UDim2.fromOffset(76, 22),
			BackgroundTransparency = 1,
			Text = "Uzivert Hub",
			Font = Enum.Font.Creepster,
			TextScaled = true,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 8,
		}, r);
	z("UITextSizeConstraint", { MaxTextSize = 19, MinTextSize = 8 }, C);
	local AB = z("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 150, 50)), ColorSequenceKeypoint.new(.5, Color3.fromRGB(255, 225, 170)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 150, 50)) }) }, C);
	A.addUpdater(function(e)
		AB.Offset = Vector2.new(math.sin(e * .9) * .7, 0);
		C.TextTransparency = (((e % 6) < .25 and math.sin(e * 90) > 0)) and .5 or 0;
	end);
	z("TextLabel", {
		Position = UDim2.fromOffset(52, 34),
		Size = UDim2.fromOffset(78, 12),
		BackgroundTransparency = 1,
		Text = b,
		Font = Enum.Font.GothamBold,
		TextSize = 7,
		TextColor3 = x.pu2,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,
		ZIndex = 8,
	}, r);
	z("TextLabel", {
		Position = UDim2.fromOffset(14, 54),
		Size = UDim2.new(1, -20, 0, 14),
		BackgroundTransparency = 1,
		Text = "By Uzivert \240\159\135\181\240\159\135\190",
		Font = Enum.Font.GothamMedium,
		TextSize = 10,
		TextColor3 = x.sub,
		TextXAlignment = Enum.TextXAlignment.Left,
		ZIndex = 8,
	}, r);
	local lB = z("Frame", {
			Position = UDim2.fromOffset(12, 78),
			Size = UDim2.new(1, -24, 0, 1),
			BackgroundColor3 = x.or1,
			BackgroundTransparency = .4,
			BorderSizePixel = 0,
			ZIndex = 8,
		}, r);
	z("UIGradient", { Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) }) }, lB);
	local EB = z("ScrollingFrame", {
			Position = UDim2.fromOffset(0, 86),
			Size = UDim2.new(1, 0, 1, -86),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 2,
			ScrollBarImageColor3 = x.or1,
			ScrollBarImageTransparency = .4,
			CanvasSize = UDim2.new(),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Active = true,
			ZIndex = 7,
		}, r);
	z("UIListLayout", { Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Center }, EB);
	z("UIPadding", {
		PaddingTop = UDim.new(0, 4),
		PaddingBottom = UDim.new(0, 14),
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
	}, EB);
	local yB = z("Frame", {
			Position = UDim2.fromOffset(U, 0),
			Size = UDim2.new(1, -U, 0, 42),
			BackgroundTransparency = 1,
			ZIndex = 8,
		}, g);
	z("Frame", {
		Position = UDim2.new(0, 0, 1, -1),
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = x.or1,
		BackgroundTransparency = .75,
		BorderSizePixel = 0,
		ZIndex = 9,
	}, yB);
	A.titulo = z("TextLabel", {
			Position = UDim2.fromOffset(14, 4),
			Size = UDim2.fromOffset(220, 32),
			BackgroundTransparency = 1,
			Text = "",
			Font = Enum.Font.Creepster,
			TextSize = 26,
			TextColor3 = Color3.new(1, 1, 1),
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 9,
		}, yB);
	local aB = z("UIGradient", { Color = ColorSequence.new(x.or1, x.or2) }, A.titulo);
	A.titleBar = z("Frame", {
			Position = UDim2.fromOffset(16, 35),
			Size = UDim2.fromOffset(46, 2),
			BackgroundColor3 = x.or1,
			BorderSizePixel = 0,
			ZIndex = 9,
		}, yB);
	m(A.titleBar, 1);
	A.addUpdater(function(e)
		aB.Offset = Vector2.new(math.sin(e * 1.1) * .4, 0);
	end);
	local function WB(e, A, l)
		local E = z("TextButton", {
				Position = UDim2.new(1, e, 0, 9),
				Size = UDim2.fromOffset(24, 24),
				BackgroundColor3 = x.card,
				BackgroundTransparency = .2,
				Text = "",
				AutoButtonColor = false,
				BorderSizePixel = 0,
				ZIndex = 10,
			}, yB);
		m(E, 12);
		local y = z("UIStroke", { Color = l, Thickness = 1, Transparency = .55 }, E);
		local a = z("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(12, 12),
				BackgroundTransparency = 1,
				ZIndex = 11,
			}, E);
		if A == "min" then
			V(H(a, x.text, 11), 1, 6, 11, 6, 2);
		else
			V(H(a, x.text, 11), 1, 1, 11, 11, 2);
			V(H(a, x.text, 11), 11, 1, 1, 11, 2);
		end;
		Y(E, function()
			w(E, .18, { BackgroundColor3 = l, BackgroundTransparency = .05 });
			w(y, .18, { Transparency = 0 });
			w(a, .3, { Rotation = 90 }, t);
		end, function()
			w(E, .22, { BackgroundColor3 = x.card, BackgroundTransparency = .2 });
			w(y, .22, { Transparency = .55 });
			w(a, .3, { Rotation = 0 }, t);
		end);
		return E;
	end;
	local UB = WB(-62, "min", x.yellow);
	local tB = WB(-32, "close", x.red);
	UB.Activated:Connect(function()
		A.cerrar();
	end);
	tB.Activated:Connect(function()
		A.cerrar();
	end);
	local function cB(e)
		local A, l, y;
		e.InputBegan:Connect(function(e)
			if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
				A, l, y = true, e.Position, I.Position;
				e.Changed:Connect(function()
					if e.UserInputState == Enum.UserInputState.End then
						A = false;
					end;
				end);
			end;
		end);
		E.InputChanged:Connect(function(e)
			if A and ((e.UserInputType == Enum.UserInputType.MouseMovement or e.UserInputType == Enum.UserInputType.Touch)) then
				local A = ((e.Position - l)) / math.max(M.Scale, .1);
				I.Position = UDim2.new(y.X.Scale, y.X.Offset + A.X, y.Y.Scale, y.Y.Offset + A.Y);
			end;
		end);
	end;
	cB(yB);
	cB(r);
	local bB = z("Frame", {
			Position = UDim2.fromOffset(U + 6, 46),
			Size = UDim2.new(1, -((U + 12)), 1, -54),
			BackgroundColor3 = x.bg,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 9,
		}, g);
	local function kB(e, A, l, E, y, a, W, U, t)
		local c = z("Frame", {
				Position = UDim2.fromOffset(l, E),
				Size = UDim2.fromOffset(y, a),
				BackgroundColor3 = W,
				BorderSizePixel = 0,
				ZIndex = 10,
				Rotation = t or 0,
			}, A);
		if U then
			m(c, U);
		end;
		e[#e + 1] = { c, "bg" };
		return c;
	end;
	local function xB(e, A, l, E, y, a, W)
		local U = z("Frame", {
				Position = UDim2.fromOffset(A, l),
				Size = UDim2.fromOffset(E, y),
				BackgroundColor3 = a,
				BorderSizePixel = 0,
				ZIndex = 11,
			}, e);
		if W and W > 0 then
			m(U, W);
		end;
		return U;
	end;
	local function zB(e, A, l, E, y, a, W, U, t, c)
		local b = z("Frame", {
				Position = UDim2.fromOffset(l, E),
				Size = UDim2.fromOffset(y, a),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 10,
				Rotation = c or 0,
			}, A);
		if t then
			m(b, t);
		end;
		local k = z("UIStroke", { Thickness = U, Color = W }, b);
		e[#e + 1] = { k, "stroke" };
		return b;
	end;
	local function dB(e, A, l, E, y, a, W, U)
		local t = H(A, W, 10);
		V(t, l, E, y, a, U);
		e[#e + 1] = { t, "bg" };
		return t;
	end;
	local wB = {};
	wB.Visual = function(e, A, l)
			zB(e, A, 2, 6, 20, 12, l, 2, 6);
			kB(e, A, 9, 9, 6, 6, l, 3);
		end;
	wB.Combat = function(e, A, l)
			zB(e, A, 4, 4, 16, 16, l, 2, 8);
			dB(e, A, 12, 1, 12, 7, l, 2);
			dB(e, A, 12, 17, 12, 23, l, 2);
			dB(e, A, 1, 12, 7, 12, l, 2);
			dB(e, A, 17, 12, 23, 12, l, 2);
			kB(e, A, 10, 10, 4, 4, l, 2);
		end;
	wB.Crab = function(e, A, l)
			kB(e, A, 4, 2, 16, 14, l, 7);
			kB(e, A, 8, 13, 8, 7, l, 2);
			xB(A, 7, 8, 4, 4, x.dark, 2);
			xB(A, 13, 8, 4, 4, x.dark, 2);
			xB(A, 11, 13, 2, 2, x.dark, 1);
			xB(A, 10, 17, 1, 3, x.dark, 0);
			xB(A, 13, 17, 1, 3, x.dark, 0);
		end;
	wB.Jugador = function(e, A, l)
			kB(e, A, 10, 8, 4, 9, l, 2);
			dB(e, A, 10, 9, 9, 5, l, 1.5);
			dB(e, A, 14, 9, 15, 5, l, 1.5);
			for E, y in ipairs({ -1, 1 }) do
				local function a(e)
					return 12 + y * e;
				end;
				dB(e, A, a(1), 10, a(10), 6, l, 2);
				dB(e, A, a(10), 6, a(10), 13, l, 2);
				dB(e, A, a(10), 13, a(6), 11, l, 2);
				dB(e, A, a(6), 11, a(3), 16, l, 2);
				dB(e, A, a(3), 16, a(1), 12, l, 2);
			end;
		end;
	wB.Fling = function(e, A, l)
			zB(e, A, 2, 2, 20, 20, l, 2, 10);
			zB(e, A, 6, 6, 12, 12, l, 2, 6);
			kB(e, A, 10, 10, 4, 4, l, 2);
		end;
	wB.Anims = function(e, A, l)
			zB(e, A, 3, 5, 18, 14, l, 2, 3);
			kB(e, A, 9, 9, 6, 6, l, 1, 45);
			dB(e, A, 6, 5, 6, 19, l, 1);
			dB(e, A, 18, 5, 18, 19, l, 1);
		end;
	wB.Clutchs = function(e, A, l)
			kB(e, A, 6, 10, 12, 12, l, 6);
			kB(e, A, 8, 2, 8, 8, l, 1, 45);
			xB(A, 10, 14, 4, 6, x.dark, 2);
		end;
	wB.Utilidades = function(e, A, l)
			zB(e, A, 5, 5, 14, 14, l, 2.5, 7);
			kB(e, A, 10, 1, 4, 4, l, 1);
			kB(e, A, 10, 19, 4, 4, l, 1);
			kB(e, A, 1, 10, 4, 4, l, 1);
			kB(e, A, 19, 10, 4, 4, l, 1);
			kB(e, A, 10, 10, 4, 4, l, 2);
		end;
	wB.Apariencia = function(e, A, l)
			zB(e, A, 2, 3, 20, 18, l, 2, 9);
			kB(e, A, 6, 8, 3, 3, l, 2);
			kB(e, A, 11, 6, 3, 3, l, 2);
			kB(e, A, 15, 9, 3, 3, l, 2);
			kB(e, A, 8, 13, 3, 3, l, 2);
		end;
	wB.Info = function(e, A, l)
			zB(e, A, 2, 2, 20, 20, l, 2, 10);
			kB(e, A, 11, 10, 2, 8, l, 1);
			kB(e, A, 11, 6, 2, 2, l, 1);
		end;
	wB.Update = function(e, A, l)
			zB(e, A, 5, 3, 14, 18, l, 2, 3);
			dB(e, A, 8, 8, 16, 8, l, 2);
			dB(e, A, 8, 12, 16, 12, l, 2);
			dB(e, A, 8, 16, 13, 16, l, 2);
		end;
	wB.Avisos = function(e, A, l)
			zB(e, A, 4, 4, 16, 16, l, 2, 2, 45);
			kB(e, A, 11, 8, 2, 6, l, 1);
			kB(e, A, 11, 16, 2, 2, l, 1);
		end;
	wB.Creador = function(e, A, l)
			kB(e, A, 4, 16, 16, 4, l, 1);
			dB(e, A, 4, 16, 3, 7, l, 2);
			dB(e, A, 3, 7, 9, 12, l, 2);
			dB(e, A, 9, 12, 12, 5, l, 2);
			dB(e, A, 12, 5, 15, 12, l, 2);
			dB(e, A, 15, 12, 21, 7, l, 2);
			dB(e, A, 21, 7, 20, 16, l, 2);
		end;
	wB.AutoFarm = function(e, A, l)
			zB(e, A, 3, 9, 18, 14, l, 2, 7);
			dB(e, A, 8, 9, 16, 9, l, 1.5);
			kB(e, A, 11, 4, 2, 6, l, 1);
			kB(e, A, 9, 2, 6, 3, l, 1);
			zB(e, A, 9, 12, 6, 6, l, 1, 3);
			dB(e, A, 12, 13, 12, 17, l, 1);
			dB(e, A, 10, 14, 14, 14, l, 1);
		end;
	A.icon = function(e, A, l)
			local E = {};
			local y = wB[e];
			if y then
				y(E, A, l);
			else
				zB(E, A, 4, 4, 16, 16, l, 2, 8);
				kB(E, A, 10, 10, 4, 4, l, 2);
			end;
			return E;
		end;
	A.recolor = function(e, A)
			for e, l in ipairs(e) do
				if l[2] == "stroke" then
					w(l[1], .2, { Color = A });
				else
					w(l[1], .2, { BackgroundColor3 = A });
				end;
			end;
		end;
	local mB = z("TextButton", {
			Name = "UzivertOrb",
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.new(0, 30, .5, -30),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 50,
		}, S);
	local VB = z("UIScale", { Scale = 1 }, mB);
	local HB = s(mB, 90, x.pu1, 1);
	HB.Position = UDim2.fromScale(.5, .5);
	HB.BackgroundTransparency = .85;
	local sB = z("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(58, 58),
			BackgroundTransparency = 1,
			ZIndex = 2,
		}, mB);
	m(sB, 29);
	local pB = z("UIStroke", { Thickness = 2.5, Color = Color3.new(1, 1, 1) }, sB);
	local iB = z("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, x.or1), ColorSequenceKeypoint.new(.5, x.pu2), ColorSequenceKeypoint.new(1, x.or1) }), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(.55, .65), NumberSequenceKeypoint.new(1, 0) }) }, pB);
	local YB = Color3.fromRGB(22, 13, 30);
	local TB = s(mB, 50, YB, 3);
	TB.Position = UDim2.fromScale(.5, .5);
	local function uB(e, A, l)
		local E = z("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(e, e),
				BackgroundTransparency = 1,
				ZIndex = 4,
			}, mB);
		m(E, 4);
		z("UIStroke", { Thickness = 1.2, Color = A, Transparency = l }, E);
		return E;
	end;
	local PB, NB = uB(36, x.or1, .35), uB(30, x.pu2, .5);
	local MB = s(mB, 20, x.or2, 5);
	MB.Position = UDim2.new(.5, -1, .5, 0);
	local XB = s(mB, 17, YB, 6);
	XB.Position = UDim2.new(.5, 4, .5, -3);
	local LB = {};
	for e = 1, 3, 1 do
		local A = s(mB, 3 + (e % 2), (e % 2 == 0) and x.or2 or x.pu2, 7);
		LB[e] = {
				f = A,
				r = 29,
				sp = ((e % 2 == 0 and 1 or -1)) * ((.9 + e * .35)),
				ph = e * 2.1,
			};
	end;
	A.addUpdater(function(e)
		HB.BackgroundTransparency = ((A.abierto and .92 or .84)) + .04 * math.sin(e * 2);
		iB.Rotation = ((e * 90)) % 360;
		PB.Rotation = ((e * 24)) % 360;
		NB.Rotation = ((-e * 16)) % 360;
		for A, l in ipairs(LB) do
			local E = e * l.sp + l.ph;
			l.f.Position = UDim2.fromScale(.5, .5) + UDim2.fromOffset(math.cos(E) * l.r, math.sin(E) * l.r);
		end;
	end, true);
	do
		local e, l, y, a, W = false, false, nil, nil, nil;
		mB.InputBegan:Connect(function(E)
			if E.UserInputType == Enum.UserInputType.MouseButton1 or E.UserInputType == Enum.UserInputType.Touch then
				e, l = true, false;
				y, a = E.Position, mB.Position;
				W = E;
				w(VB, .12, { Scale = .9 });
				E.Changed:Connect(function()
					if E.UserInputState == Enum.UserInputState.End then
						e = false;
						w(VB, .25, { Scale = 1 }, t);
						if not l then
							T(mB, x.or2, 8, 120);
							A.abrir();
						end;
						W = nil;
					end;
				end);
			end;
		end);
		E.InputChanged:Connect(function(A)
			if e and (A == W and ((A.UserInputType == Enum.UserInputType.MouseMovement or A.UserInputType == Enum.UserInputType.Touch))) then
				local e = A.Position - y;
				if l or e.Magnitude > 8 then
					l = true;
					mB.Position = UDim2.new(a.X.Scale, a.X.Offset + e.X, a.Y.Scale, a.Y.Offset + e.Y);
				end;
			end;
		end);
	end;
	local function FB(e)
		if g:IsA("CanvasGroup") then
			g.GroupTransparency = e;
		end;
	end;
	A.abrir = function()
			if A.abierto then
				return;
			end;
			A.abierto = true;
			A.visible = true;
			if _G.AIM_BTN then
				_G.AIM_BTN.Visible = false;
			end;
			if _G.UZ_INV_BTN then
				_G.UZ_INV_BTN.Visible = false;
			end;
			if _G.UZ_TF_BTN then
				_G.UZ_TF_BTN.Visible = false;
			end;
			if _G.UZ_PB_BTN then
				_G.UZ_PB_BTN.Visible = false;
			end;
			if _G.UZIVERT_STP_BINDABLE then
				_G.UZIVERT_STP_BINDABLE.Visible = false;
			end;
			if BotonShoot then
				BotonShoot.Visible = false;
			end;
			if _G.UZIVERT_AA_DD1 then
				_G.UZIVERT_AA_DD1.Visible = false;
			end;
			I.Visible = true;
			M.Scale = A.base * .9;
			FB(1);
			if g:IsA("CanvasGroup") then
				w(g, .35, { GroupTransparency = 0 });
			end;
			w(M, .45, { Scale = A.base }, t);
			w(VB, .2, { Scale = 0 });
			task.delay(.2, function()
				if A.abierto then
					mB.Visible = false;
				end;
			end);
		end;
	A.cerrar = function()
			if not A.abierto then
				return;
			end;
			A.abierto = false;
			if _G.AIM_BTN then
				_G.AIM_BTN.Visible = true;
			end;
			if _G.UZ_INV_BTN then
				_G.UZ_INV_BTN.Visible = true;
			end;
			if _G.UZ_TF_BTN then
				_G.UZ_TF_BTN.Visible = true;
			end;
			if _G.UZ_PB_BTN then
				_G.UZ_PB_BTN.Visible = true;
			end;
			if _G.UZIVERT_STP_BINDABLE then
				_G.UZIVERT_STP_BINDABLE.Visible = true;
			end;
			if BotonShoot then
				BotonShoot.Visible = d.ShootMostrar ~= false;
			end;
			if _G.UZIVERT_AA_DD1 then
				_G.UZIVERT_AA_DD1.Visible = true;
			end;
			mB.Visible = true;
			VB.Scale = 0;
			w(VB, .4, { Scale = 1 }, t);
			if g:IsA("CanvasGroup") then
				w(g, .2, { GroupTransparency = 1 });
			end;
			w(M, .22, { Scale = A.base * .9 });
			task.delay(.24, function()
				if not A.abierto then
					I.Visible = false;
					A.visible = false;
				end;
			end);
		end;
	do
		local e = workspace.CurrentCamera;
		if e then
			(e:GetPropertyChangedSignal("ViewportSize")):Connect(function()
				A.base = X();
				if A.abierto then
					M.Scale = A.base;
				end;
			end);
		end;
	end;
	A.mostrar = function(e, l)
			local E = A.actual;
			if E == e then
				return;
			end;
			A.actual = e;
			if E then
				E[2].Visible = false;
				w(E[1], .2, { BackgroundTransparency = .6 });
				w(E.st, .2, { Transparency = .8 });
				w(E.bar, .2, { Size = UDim2.fromOffset(3, 0) });
				w(E[3], .2, { TextColor3 = x.sub });
				A.recolor(E[4], x.sub);
			end;
			w(e[1], .25, { BackgroundTransparency = .3 });
			w(e.st, .25, { Transparency = .3 });
			w(e.bar, .35, { Size = UDim2.fromOffset(3, 18) }, t);
			w(e[3], .25, { TextColor3 = x.text });
			A.recolor(e[4], x.or2);
			e[2].Visible = true;
			A.titulo.Text = string.upper(e.nombre);
			if l then
				e[2].Position = UDim2.fromOffset(U + 6, 46);
			else
				e[2].Position = UDim2.fromOffset(U + 28, 46);
				w(e[2], .38, { Position = UDim2.fromOffset(U + 6, 46) });
				bB.BackgroundTransparency = .3;
				w(bB, .32, { BackgroundTransparency = 1 });
				A.titulo.Position = UDim2.fromOffset(14, 14);
				A.titulo.TextTransparency = 1;
				w(A.titulo, .35, { Position = UDim2.fromOffset(14, 4), TextTransparency = 0 });
				A.titleBar.Size = UDim2.fromOffset(0, 2);
				w(A.titleBar, .5, { Size = UDim2.fromOffset(46, 2) });
			end;
		end;
	j = function(e, l, E)
			local y = z("TextButton", {
					Size = UDim2.new(1, 0, 0, 32),
					LayoutOrder = E,
					BackgroundColor3 = x.card,
					BackgroundTransparency = .6,
					Text = "",
					AutoButtonColor = false,
					BorderSizePixel = 0,
					ZIndex = 8,
					ClipsDescendants = true,
				}, EB);
			y:SetAttribute("UZ", true);
			m(y, 8);
			local a = z("UIStroke", { Color = x.or1, Thickness = 1, Transparency = .8 }, y);
			local W = z("Frame", {
					AnchorPoint = Vector2.new(0, .5),
					Position = UDim2.new(0, 0, .5, 0),
					Size = UDim2.fromOffset(3, 0),
					BackgroundColor3 = x.or1,
					BorderSizePixel = 0,
					ZIndex = 10,
				}, y);
			m(W, 2);
			local t = z("Frame", {
					Position = UDim2.fromOffset(8, 4),
					Size = UDim2.fromOffset(24, 24),
					BackgroundTransparency = 1,
					ZIndex = 9,
				}, y);
			local c = A.icon(l, t, x.sub);
			local b = z("TextLabel", {
					Position = UDim2.fromOffset(38, 0),
					Size = UDim2.new(1, -42, 1, 0),
					BackgroundTransparency = 1,
					Text = e,
					TextColor3 = x.sub,
					Font = Enum.Font.GothamMedium,
					TextSize = 11,
					TextXAlignment = Enum.TextXAlignment.Left,
					ZIndex = 9,
				}, y);
			local k = z("ScrollingFrame", {
					Name = "Pagina_" .. e,
					Position = UDim2.fromOffset(U + 6, 46),
					Size = UDim2.new(1, -((U + 12)), 1, -54),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ScrollBarThickness = 3,
					ScrollBarImageColor3 = x.or1,
					ScrollBarImageTransparency = .3,
					CanvasSize = UDim2.new(),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					ScrollingDirection = Enum.ScrollingDirection.Y,
					ScrollingEnabled = true,
					Active = true,
					ClipsDescendants = true,
					ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
					Visible = false,
					ZIndex = 6,
				}, g);
			z("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder, HorizontalAlignment = Enum.HorizontalAlignment.Center }, k);
			z("UIPadding", {
				PaddingTop = UDim.new(0, 6),
				PaddingBottom = UDim.new(0, 40),
				PaddingLeft = UDim.new(0, 4),
				PaddingRight = UDim.new(0, 8),
			}, k);
			local d = {
					y,
					k,
					b,
					c,
					bar = W,
					st = a,
					nombre = e,
				};
			table.insert(eB, d);
			Y(y, function()
				if A.actual ~= d then
					w(y, .15, { BackgroundTransparency = .45 });
					w(a, .15, { Transparency = .5 });
				end;
			end, function()
				if A.actual ~= d then
					w(y, .2, { BackgroundTransparency = .6 });
					w(a, .2, { Transparency = .8 });
				end;
			end);
			y.Activated:Connect(function()
				T(y, x.or2, 11, 120);
				A.mostrar(d);
			end);
			if #eB == 1 then
				A.mostrar(d, true);
			end;
			return k;
		end;
	O = function(e, A, l, E)
			local y = l and true or false;
			local a = z("Frame", {
					Size = UDim2.new(1, 0, 0, 40),
					BackgroundColor3 = x.card,
					BackgroundTransparency = .35,
					BorderSizePixel = 0,
					ZIndex = 7,
				}, e);
			a:SetAttribute("UZ", true);
			m(a, 9);
			local W = z("UIStroke", { Color = x.line, Thickness = 1, Transparency = .3 }, a);
			local U = z("Frame", {
					AnchorPoint = Vector2.new(0, .5),
					Position = UDim2.new(0, 0, .5, 0),
					Size = UDim2.fromOffset(3, y and 20 or 8),
					BackgroundColor3 = x.or1,
					BackgroundTransparency = y and 0 or .6,
					BorderSizePixel = 0,
					ZIndex = 8,
				}, a);
			m(U, 2);
			local c = z("TextLabel", {
					Position = UDim2.fromOffset(14, 0),
					Size = UDim2.new(1, -86, 1, 0),
					BackgroundTransparency = 1,
					Text = A,
					TextColor3 = y and x.text or x.sub,
					Font = Enum.Font.GothamMedium,
					TextSize = 11,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextWrapped = true,
					ZIndex = 8,
				}, a);
			local b = z("Frame", {
					Position = UDim2.new(1, -58, .5, -11),
					Size = UDim2.fromOffset(46, 22),
					BackgroundColor3 = y and x.or1 or x.off,
					BorderSizePixel = 0,
					ZIndex = 9,
				}, a);
			m(b, 11);
			local k = z("UIStroke", { Color = x.or2, Thickness = 1.5, Transparency = y and .4 or 1 }, b);
			local d = s(b, 16, Color3.new(1, 1, 1), 10);
			d.Position = y and UDim2.new(1, -12, .5, 0) or UDim2.new(0, 12, .5, 0);
			local V = z("TextButton", {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					Text = "",
					ZIndex = 11,
				}, a);
			V.Activated:Connect(function()
				y = not y;
				w(d, .3, { Position = y and UDim2.new(1, -12, .5, 0) or UDim2.new(0, 12, .5, 0) }, t);
				d.Size = UDim2.fromOffset(22, 14);
				w(d, .3, { Size = UDim2.fromOffset(16, 16) }, t);
				w(b, .25, { BackgroundColor3 = y and x.or1 or x.off });
				w(k, .25, { Transparency = y and .4 or 1 });
				w(U, .3, { Size = UDim2.fromOffset(3, y and 20 or 8), BackgroundTransparency = y and 0 or .6 }, t);
				w(c, .25, { TextColor3 = y and x.text or x.sub });
				T(b, y and x.or2 or x.pu2, 12, 70);
				E(y);
			end);
			Y(V, function()
				w(W, .15, { Color = x.or1 });
				w(a, .15, { BackgroundTransparency = .2 });
			end, function()
				w(W, .2, { Color = x.line });
				w(a, .2, { BackgroundTransparency = .35 });
			end);
			return a;
		end;
	J = function(e, l, E, y)
			local a = i(y);
			local W = z("TextButton", {
					Size = UDim2.new(1, 0, 0, 40),
					BackgroundColor3 = x.card,
					BackgroundTransparency = .25,
					Text = "",
					AutoButtonColor = false,
					BorderSizePixel = 0,
					ClipsDescendants = true,
					ZIndex = 7,
				}, e);
			W:SetAttribute("UZ", true);
			m(W, 9);
			local U = z("UIStroke", { Thickness = 1.5, Color = Color3.new(1, 1, 1), Transparency = .2 }, W);
			local c = z("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, a), ColorSequenceKeypoint.new(.5, x.pu2), ColorSequenceKeypoint.new(1, a) }) }, U);
			local b = z("Frame", {
					Size = UDim2.fromScale(1, 1),
					BackgroundColor3 = a,
					BorderSizePixel = 0,
					ZIndex = 7,
				}, W);
			z("UIGradient", { Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .72), NumberSequenceKeypoint.new(1, .95) }) }, b);
			local k = z("Frame", {
					AnchorPoint = Vector2.new(0, .5),
					Position = UDim2.new(0, 0, .5, 0),
					Size = UDim2.fromOffset(3, 16),
					BackgroundColor3 = a,
					BorderSizePixel = 0,
					ZIndex = 9,
				}, W);
			m(k, 2);
			z("TextLabel", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				Text = l,
				TextColor3 = x.text,
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				ZIndex = 10,
			}, W);
			local d = z("Frame", {
					AnchorPoint = Vector2.new(.5, .5),
					Position = UDim2.new(0, -30, .5, 0),
					Size = UDim2.fromOffset(24, 90),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = .9,
					BorderSizePixel = 0,
					Rotation = 20,
					ZIndex = 9,
				}, W);
			local V = z("UIScale", { Scale = 1 }, W);
			A.addUpdater(function(e)
				if W.Parent then
					c.Rotation = ((e * 80)) % 360;
				end;
			end);
			Y(W, function()
				w(W, .2, { BackgroundColor3 = x.cardHi });
				w(V, .2, { Scale = 1.015 }, t);
				w(k, .25, { Size = UDim2.fromOffset(3, 26) }, t);
				d.Position = UDim2.new(0, -30, .5, 0);
				w(d, .55, { Position = UDim2.new(1, 40, .5, 0) }, Enum.EasingStyle.Quad);
			end, function()
				w(W, .25, { BackgroundColor3 = x.card });
				w(V, .2, { Scale = 1 });
				w(k, .2, { Size = UDim2.fromOffset(3, 16) });
			end);
			W.InputBegan:Connect(function(e)
				if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
					w(V, .08, { Scale = .97 });
				end;
			end);
			W.Activated:Connect(function()
				w(V, .25, { Scale = 1.015 }, t);
				T(W, a, 8, 300);
				E();
			end);
			return W;
		end;
	E.InputChanged:Connect(function(e)
		if A.sliderDragHandlers then
			for A, l in ipairs(A.sliderDragHandlers) do
				pcall(l, e);
			end;
		end;
		if A.drag and ((e.UserInputType == Enum.UserInputType.MouseMovement or e.UserInputType == Enum.UserInputType.Touch)) then
			A.drag(e.Position.X);
		end;
	end);
	E.InputEnded:Connect(function(e)
		if A.sliderDragEndHandlers then
			for A, l in ipairs(A.sliderDragEndHandlers) do
				pcall(l, e);
			end;
		end;
		if A.drag and ((e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch)) then
			A.drag = nil;
			if A.dragEnd then
				A.dragEnd();
				A.dragEnd = nil;
			end;
		end;
	end);
	q = function(e, l, E, y, a, W)
			local U = math.max(y - E, 1);
			local c = z("Frame", {
					Size = UDim2.new(1, 0, 0, 54),
					BackgroundColor3 = x.card,
					BackgroundTransparency = .35,
					BorderSizePixel = 0,
					ZIndex = 7,
				}, e);
			c:SetAttribute("UZ", true);
			m(c, 9);
			local b = z("UIStroke", { Color = x.line, Thickness = 1, Transparency = .3 }, c);
			z("TextLabel", {
				Position = UDim2.fromOffset(12, 6),
				Size = UDim2.new(1, -84, 0, 18),
				BackgroundTransparency = 1,
				Text = l,
				TextColor3 = x.text,
				Font = Enum.Font.GothamMedium,
				TextSize = 11,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 8,
			}, c);
			local k = z("Frame", {
					Position = UDim2.new(1, -66, 0, 6),
					Size = UDim2.fromOffset(54, 18),
					BackgroundColor3 = x.or1,
					BackgroundTransparency = .82,
					BorderSizePixel = 0,
					ZIndex = 8,
				}, c);
			m(k, 9);
			z("UIStroke", { Color = x.or1, Thickness = 1, Transparency = .5 }, k);
			local d = z("TextLabel", {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					Text = tostring(a),
					TextColor3 = x.or2,
					Font = Enum.Font.GothamBold,
					TextSize = 11,
					ZIndex = 9,
				}, k);
			local V = math.clamp(((a - E)) / U, 0, 1);
			local H = z("Frame", {
					Position = UDim2.new(0, 12, 0, 36),
					Size = UDim2.new(1, -24, 0, 6),
					BackgroundColor3 = x.off,
					BorderSizePixel = 0,
					ZIndex = 8,
				}, c);
			m(H, 3);
			local p = z("Frame", {
					Size = UDim2.fromScale(V, 1),
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					ZIndex = 9,
				}, H);
			m(p, 3);
			z("UIGradient", { Color = ColorSequence.new(x.or3, x.or2) }, p);
			local i = s(H, 16, Color3.new(1, 1, 1), 11);
			i.Position = UDim2.new(V, 0, .5, 0);
			local Y = z("UIStroke", { Thickness = 2, Color = x.or1 }, i);
			local T = z("Frame", {
					AnchorPoint = Vector2.new(.5, 1),
					Position = UDim2.new(V, 0, 0, -8),
					Size = UDim2.fromOffset(38, 18),
					BackgroundColor3 = x.or1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 12,
				}, H);
			m(T, 6);
			local u = z("TextLabel", {
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					Text = tostring(a),
					TextColor3 = x.bg,
					Font = Enum.Font.GothamBold,
					TextSize = 10,
					TextTransparency = 1,
					ZIndex = 13,
				}, T);
			local P = z("TextButton", {
					Position = UDim2.new(0, 6, 0, 26),
					Size = UDim2.new(1, -12, 0, 26),
					BackgroundTransparency = 1,
					Text = "",
					ZIndex = 14,
				}, c);
			local N = a;
			local function M(e)
				local A = math.clamp(((e - H.AbsolutePosition.X)) / math.max(H.AbsoluteSize.X, 1), 0, 1);
				local l = math.floor(E + ((y - E)) * A);
				p.Size = UDim2.fromScale(A, 1);
				i.Position = UDim2.new(A, 0, .5, 0);
				T.Position = UDim2.new(A, 0, 0, -8);
				if l ~= N then
					N = l;
					d.Text = tostring(l);
					u.Text = tostring(l);
					W(l);
				end;
			end;
			local X = nil;
			local L = nil;
			local F = 8;
			local g = false;
			P.InputBegan:Connect(function(e)
				if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
					g = true;
					X = e.Position;
					L = nil;
					A.drag = nil;
					A.dragEnd = nil;
				end;
			end);
			A.sliderDragHandlers = A.sliderDragHandlers or {};
			table.insert(A.sliderDragHandlers, function(l)
				if not g then
					return;
				end;
				if l.UserInputType ~= Enum.UserInputType.Touch and l.UserInputType ~= Enum.UserInputType.MouseMovement then
					return;
				end;
				if L == nil then
					local E = l.Position - X;
					if E.Magnitude > F then
						if math.abs(E.X) > math.abs(E.Y) then
							L = true;
							A.drag = M;
							if e:IsA("ScrollingFrame") then
								e.ScrollingEnabled = false;
							end;
							w(i, .15, { Size = UDim2.fromOffset(22, 22) }, t);
							w(T, .15, { BackgroundTransparency = 0 });
							w(u, .15, { TextTransparency = 0 });
							w(b, .15, { Color = x.or1 });
							A.dragEnd = function()
									if e:IsA("ScrollingFrame") then
										e.ScrollingEnabled = true;
									end;
									w(i, .2, { Size = UDim2.fromOffset(16, 16) }, t);
									w(T, .2, { BackgroundTransparency = 1 });
									w(u, .2, { TextTransparency = 1 });
									w(b, .2, { Color = x.line });
									w(k, .12, { BackgroundTransparency = .6 });
									task.delay(.12, function()
										w(k, .3, { BackgroundTransparency = .82 });
									end);
								end;
						else
							L = false;
							g = false;
						end;
					end;
				elseif L then
					M(l.Position.X);
				end;
			end);
			A.sliderDragEndHandlers = A.sliderDragEndHandlers or {};
			table.insert(A.sliderDragEndHandlers, function(e)
				if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
					g = false;
					L = nil;
				end;
			end);
			return c;
		end;
	o = function(e, A, l, E)
			local y = math.min(#l * 28 + 8, 170);
			local a = z("Frame", {
					Size = UDim2.new(1, 0, 0, 40),
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					ZIndex = 7,
				}, e);
			a:SetAttribute("UZ", true);
			local W = z("TextButton", {
					Size = UDim2.new(1, 0, 0, 40),
					BackgroundColor3 = x.card,
					BackgroundTransparency = .35,
					Text = "",
					AutoButtonColor = false,
					BorderSizePixel = 0,
					ZIndex = 8,
				}, a);
			m(W, 9);
			local U = z("UIStroke", { Color = x.line, Thickness = 1, Transparency = .3 }, W);
			z("TextLabel", {
				Position = UDim2.fromOffset(12, 0),
				Size = UDim2.new(.5, -12, 1, 0),
				BackgroundTransparency = 1,
				Text = A,
				TextColor3 = x.text,
				Font = Enum.Font.GothamMedium,
				TextSize = 11,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 9,
			}, W);
			local c = z("TextLabel", {
					Position = UDim2.new(.5, 0, 0, 0),
					Size = UDim2.new(.5, -36, 1, 0),
					BackgroundTransparency = 1,
					Text = "",
					TextColor3 = x.or2,
					Font = Enum.Font.GothamBold,
					TextSize = 11,
					TextXAlignment = Enum.TextXAlignment.Right,
					TextTruncate = Enum.TextTruncate.AtEnd,
					ZIndex = 9,
				}, W);
			local b = z("Frame", {
					AnchorPoint = Vector2.new(.5, .5),
					Position = UDim2.new(1, -18, .5, 0),
					Size = UDim2.fromOffset(10, 10),
					BackgroundTransparency = 1,
					ZIndex = 9,
				}, W);
			V(H(b, x.or2, 9), 1, 3, 5, 7, 2);
			V(H(b, x.or2, 9), 9, 3, 5, 7, 2);
			local k = z("ScrollingFrame", {
					Position = UDim2.fromOffset(0, 46),
					Size = UDim2.new(1, 0, 0, y),
					BackgroundColor3 = x.card,
					BackgroundTransparency = .25,
					BorderSizePixel = 0,
					ScrollBarThickness = 3,
					ScrollBarImageColor3 = x.or1,
					CanvasSize = UDim2.new(),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					ZIndex = 8,
				}, a);
			m(k, 9);
			z("UIStroke", { Color = x.or1, Thickness = 1, Transparency = .6 }, k);
			z("UIListLayout", { Padding = UDim.new(0, 2) }, k);
			z("UIPadding", {
				PaddingTop = UDim.new(0, 4),
				PaddingBottom = UDim.new(0, 4),
				PaddingLeft = UDim.new(0, 4),
				PaddingRight = UDim.new(0, 6),
			}, k);
			local d = false;
			local function s()
				d = not d;
				w(a, .3, { Size = UDim2.new(1, 0, 0, d and ((46 + y) + 4) or 40) });
				w(b, .3, { Rotation = d and 180 or 0 }, t);
				w(U, .2, { Color = d and x.or1 or x.line });
			end;
			W.Activated:Connect(s);
			Y(W, function()
				w(W, .15, { BackgroundTransparency = .2 });
			end, function()
				w(W, .2, { BackgroundTransparency = .35 });
			end);
			local p;
			for e, A in ipairs(l) do
				local l = z("TextButton", {
						Size = UDim2.new(1, 0, 0, 26),
						BackgroundColor3 = x.pu3,
						BackgroundTransparency = .7,
						Text = A,
						TextColor3 = x.text,
						Font = Enum.Font.GothamMedium,
						TextSize = 10,
						AutoButtonColor = false,
						BorderSizePixel = 0,
						ZIndex = 9,
					}, k);
				m(l, 6);
				Y(l, function()
					w(l, .12, { BackgroundColor3 = x.or1, BackgroundTransparency = .5 });
				end, function()
					w(l, .15, { BackgroundColor3 = x.pu3, BackgroundTransparency = (p == l) and .45 or .7 });
				end);
				l.Activated:Connect(function()
					if p then
						w(p, .15, { BackgroundTransparency = .7 });
					end;
					p = l;
					w(l, .15, { BackgroundTransparency = .45 });
					c.Text = A;
					E(A);
					s();
				end);
			end;
			return a;
		end;
	v = function(e, l, E, y)
			local a = y and i(y) or x.or1;
			local W = z("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = Color3.new(1, 1, 1),
					BackgroundTransparency = .25,
					BorderSizePixel = 0,
					ZIndex = 7,
				}, e);
			W:SetAttribute("UZ", true);
			m(W, 10);
			z("UIGradient", { Rotation = 20, Color = ColorSequence.new(x.cardHi:Lerp(a, .18), x.card) }, W);
			z("UIStroke", { Color = a, Thickness = 1.2, Transparency = .45 }, W);
			z("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }, W);
			z("UIPadding", {
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10),
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
			}, W);
			if l and l ~= "" then
				local e = z("Frame", {
						Size = UDim2.new(1, 0, 0, 20),
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						ZIndex = 8,
					}, W);
				local E = z("Frame", {
						AnchorPoint = Vector2.new(.5, .5),
						Position = UDim2.fromOffset(5, 10),
						Size = UDim2.fromOffset(7, 7),
						BackgroundColor3 = a,
						BorderSizePixel = 0,
						Rotation = 45,
						ZIndex = 9,
					}, e);
				table.insert(A.shimmers, { E, nil });
				z("TextLabel", {
					Position = UDim2.fromOffset(16, 0),
					Size = UDim2.new(1, -16, 1, 0),
					BackgroundTransparency = 1,
					Text = l,
					TextColor3 = a,
					Font = Enum.Font.GothamBold,
					TextSize = 12,
					TextXAlignment = Enum.TextXAlignment.Left,
					ZIndex = 9,
				}, e);
			end;
			z("TextLabel", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundTransparency = 1,
				Text = E,
				TextColor3 = x.text,
				Font = Enum.Font.GothamMedium,
				TextSize = 11,
				TextWrapped = true,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = 2,
				ZIndex = 8,
			}, W);
			return W;
		end;
	A.shimmers = A.shimmers or {};
	A.decorarSeccion = function(e)
			local l = z("Frame", {
					AnchorPoint = Vector2.new(.5, .5),
					Position = UDim2.fromOffset(10, 14),
					Size = UDim2.fromOffset(8, 8),
					BackgroundColor3 = x.or1,
					BorderSizePixel = 0,
					Rotation = 45,
					ZIndex = 4,
				}, e);
			local E = z("Frame", {
					Position = UDim2.new(0, 0, 1, -2),
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = x.or1,
					BorderSizePixel = 0,
					ZIndex = 3,
				}, e);
			z("UIGradient", { Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, .1), NumberSequenceKeypoint.new(1, 1) }) }, E);
			table.insert(A.shimmers, { l, nil });
		end;
	A.addUpdater(function(e)
		for l = #A.shimmers, 1, -1 do
			local E = A.shimmers[l][1];
			if E.Parent then
				E.Rotation = 45 + math.sin(e * 1.6 + l) * 25;
				E.BackgroundTransparency = .1 + .3 * ((.5 + .5 * math.sin(e * 2.2 + l)));
			else
				table.remove(A.shimmers, l);
			end;
		end;
	end);
	_G.crearSeccion = function(e, l)
			local E = z("Frame", {
					Size = UDim2.new(1, 0, 0, 30),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					ZIndex = 7,
				}, e);
			E:SetAttribute("UZ", true);
			z("TextLabel", {
				Position = UDim2.fromOffset(24, 0),
				Size = UDim2.new(1, -30, 1, -2),
				BackgroundTransparency = 1,
				Text = l,
				TextColor3 = x.or2,
				Font = Enum.Font.GothamBlack,
				TextSize = 12,
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 5,
			}, E);
			A.decorarSeccion(E);
			return E;
		end;
	local gB = {
			[10003] = "\226\128\162",
			[9654] = ">",
			[9664] = "<",
			[9208] = "||",
			[9209] = "[]",
		};
	local QB = {
			{ 126976, 127461 },
			{ 127488, 129791 },
			{ 8592, 8703 },
			{ 8960, 9215 },
			{ 9632, 9727 },
			{ 9728, 10175 },
			{ 11008, 11263 },
			{ 65024, 65039 },
			{ 8205, 8205 },
			{ 8419, 8419 },
		};
	local function nB(e)
		for A, l in ipairs(QB) do
			if e >= l[1] and e <= l[2] then
				return true;
			end;
		end;
		return false;
	end;
	local function hB(e)
		if type(e) ~= "string" or e == "" then
			return e;
		end;
		local A, l = pcall(function()
				local A = {};
				for e, l in utf8.codes(e) do
					if gB[l] then
						A[#A + 1] = gB[l];
					elseif not nB(l) then
						A[#A + 1] = utf8.char(l);
					end;
				end;
				return table.concat(A);
			end);
		if not A then
			return e;
		end;
		l = l:gsub("^%?%? ", "");
		l = l:gsub("[ \009]+\n", "\n");
		l = l:gsub("\n[ \009]+", "\n");
		l = l:gsub("  +", " ");
		l = l:gsub("^%s+", "");
		l = l:gsub("%s+$", "");
		return l;
	end;
	local KB, rB = utf8.char(128274), utf8.char(128275);
	local ZB, fB, RB = utf8.char(9660), utf8.char(9650), utf8.char(127875);
	A.lockIcon = function(e, A)
			local l = e:FindFirstChild("UZLock");
			if not l then
				l = z("Frame", {
						Name = "UZLock",
						AnchorPoint = Vector2.new(.5, .5),
						Position = UDim2.fromScale(.5, .5),
						Size = UDim2.fromOffset(14, 14),
						BackgroundTransparency = 1,
						ZIndex = 2,
					}, e);
				local A = z("Frame", {
						Name = "Sh",
						Position = UDim2.fromOffset(3, 0),
						Size = UDim2.fromOffset(8, 8),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
					}, l);
				m(A, 4);
				z("UIStroke", { Thickness = 1.6, Color = x.text }, A);
				local E = z("Frame", {
						Name = "Body",
						Position = UDim2.fromOffset(1, 6),
						Size = UDim2.fromOffset(12, 8),
						BackgroundColor3 = x.text,
						BorderSizePixel = 0,
						ZIndex = 2,
					}, l);
				m(E, 2);
				z("Frame", {
					Position = UDim2.fromOffset(5, 2),
					Size = UDim2.fromOffset(2, 4),
					BackgroundColor3 = x.dark,
					BorderSizePixel = 0,
					ZIndex = 3,
				}, E);
			end;
			local E = l:FindFirstChild("Sh");
			if E then
				if A then
					w(E, .25, { Position = UDim2.fromOffset(3, 0), Size = UDim2.fromOffset(8, 8) });
				else
					w(E, .25, { Position = UDim2.fromOffset(4, -3), Size = UDim2.fromOffset(6, 6) });
				end;
			end;
		end;
	A.chev = function(e)
			if e:FindFirstChild("UZChev") then
				return;
			end;
			local A = z("Frame", {
					Name = "UZChev",
					AnchorPoint = Vector2.new(.5, .5),
					Position = UDim2.new(1, -16, .5, 0),
					Size = UDim2.fromOffset(10, 10),
					BackgroundTransparency = 1,
					ZIndex = 3,
				}, e);
			V(H(A, x.or2, 3), 1, 3, 5, 7, 2);
			V(H(A, x.or2, 3), 9, 3, 5, 7, 2);
		end;
	A.avatarIcon = function(e)
			if e:FindFirstChild("UZAv") then
				return;
			end;
			local l = z("Frame", {
					Name = "UZAv",
					AnchorPoint = Vector2.new(.5, .5),
					Position = UDim2.fromScale(.5, .5),
					Size = UDim2.fromOffset(24, 24),
					BackgroundTransparency = 1,
					ZIndex = 2,
				}, e);
			z("UIScale", { Scale = 2 }, l);
			A.icon("Crab", l, x.or2);
		end;
	local function DB(e)
		if e:IsA("TextBox") then
			return;
		end;
		local l = e.Text;
		if l == "" then
			return;
		end;
		if e:IsA("TextButton") then
			local E = string.find(l, KB, 1, true) ~= nil;
			if E or string.find(l, rB, 1, true) then
				A.lockIcon(e, E);
			end;
			if ((string.find(l, ZB, 1, true) or string.find(l, fB, 1, true))) and not e:GetAttribute("UZ") then
				A.chev(e);
			end;
		end;
		if e:IsA("TextLabel") and (l == RB and e.Size.X.Offset == 60) then
			A.avatarIcon(e);
		end;
		local E = hB(l);
		if E ~= l then
			e.Text = E;
		end;
	end;
	local function GB(e)
		local A = e;
		while A and A ~= S do
			if A:GetAttribute("UZ") then
				return true;
			end;
			A = A.Parent;
		end;
		return false;
	end;
	local function BB(e)
		local A = e:FindFirstAncestorWhichIsA("ScrollingFrame");
		return A ~= nil and string.sub(A.Name, 1, 7) == "Pagina_";
	end;
	local function SB(e)
		if e:GetAttribute("UZsk") then
			return;
		end;
		e:SetAttribute("UZsk", true);
		e.ClipsDescendants = true;
		if not e:FindFirstChildOfClass("UICorner") then
			m(e, 8);
		end;
		local A = e:FindFirstChildOfClass("UIStroke");
		local l = e.BackgroundTransparency;
		local E = z("UIScale", { Scale = 1 }, e);
		Y(e, function()
			w(e, .15, { BackgroundTransparency = math.max(l - .15, 0) });
			w(E, .15, { Scale = 1.015 }, t);
		end, function()
			w(e, .2, { BackgroundTransparency = l });
			w(E, .2, { Scale = 1 });
		end);
		e.InputBegan:Connect(function(e)
			if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
				w(E, .08, { Scale = .97 });
			end;
		end);
		e.Activated:Connect(function()
			w(E, .25, { Scale = 1.015 }, t);
			T(e, x.or2, 12, 240);
		end);
	end;
	local function CB(e)
		if e:GetAttribute("UZsk") then
			return;
		end;
		e:SetAttribute("UZsk", true);
		e.Focused:Connect(function()
			local A = e:FindFirstChildOfClass("UIStroke");
			if A then
				w(A, .2, { Color = x.or2, Transparency = 0 });
			end;
		end);
		e.FocusLost:Connect(function()
			local A = e:FindFirstChildOfClass("UIStroke");
			if A then
				w(A, .25, { Color = x.or1, Transparency = .4 });
			end;
		end);
	end;
	local function IB(e)
		if e:GetAttribute("UZsk") or not e.Parent then
			return;
		end;
		e:SetAttribute("UZsk", true);
		e.BackgroundTransparency = 1;
		local l = e:FindFirstChildOfClass("UIStroke");
		if l then
			l.Transparency = 1;
		end;
		local E = e:FindFirstChildOfClass("TextLabel");
		if E then
			E.Position = UDim2.fromOffset(24, 0);
			E.Size = UDim2.new(1, -30, 1, -2);
		end;
		A.decorarSeccion(e);
	end;
	local function jB(e)
		if e == mB or e:GetAttribute("UZsk") then
			return;
		end;
		e:SetAttribute("UZsk", true);
		local A = z("UIScale", { Scale = 1 }, e);
		e.MouseEnter:Connect(function()
			w(A, .15, { Scale = 1.04 }, t);
		end);
		e.MouseLeave:Connect(function()
			w(A, .2, { Scale = 1 });
		end);
		e.InputBegan:Connect(function(e)
			if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
				w(A, .08, { Scale = .94 });
			end;
		end);
		e.InputEnded:Connect(function(e)
			if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
				w(A, .25, { Scale = 1 }, t);
			end;
		end);
	end;
	local function OB(e)
		if e:IsA("TextLabel") or e:IsA("TextButton") then
			DB(e);
			(e:GetPropertyChangedSignal("Text")):Connect(function()
				DB(e);
			end);
		end;
		if e:IsA("TextButton") then
			if e.Parent == S then
				jB(e);
			elseif not GB(e) and BB(e) then
				SB(e);
			end;
		elseif e:IsA("TextBox") then
			if not GB(e) and BB(e) then
				CB(e);
			end;
		elseif e:IsA("Frame") then
			local A = e.Parent;
			if A and (A:IsA("ScrollingFrame") and (e.Size.Y.Offset == 30 and (e.Size.X.Scale == 1 and e.BackgroundColor3 == Color3.fromRGB(20, 15, 25)))) then
				task.defer(IB, e);
			end;
		end;
	end;
	S.DescendantAdded:Connect(OB);
end;
print("\240\159\142\131 Parte 2/10 cargada - Halloween UI");
_G.FARM_ON = false;
_G.FARM_AFK = false;
_G.FARM_NOCLIP = true;
_G.FARM_ANTIVOID = true;
_G.FARM_SPEED = 23;
_G.FARM_MAXDIST = 1000;
_G.FARM_RESET_DELAY = 5;
_G.FARM_ESTADO = "idle";
_G.FARM_BAG_FULL = false;
_G.FARM_WAITING = false;
_G.FARM_ACTIVE_COINS = {};
_G.FARM_BLACKLIST = {};
_G.FARM_CURRENT = nil;
_G.FARM_NOCOINS_TIME = nil;
_G.FARM_COLLECTED = false;
_G.FARM_LV = nil;
_G.FARM_ATTACH = nil;
_G.FARM_CONNECTIONS = {};
_G.FARM_CHAR_CONN = nil;
_G.FARM_TARGET_THREAD = nil;
_G.FARM_CHAR = l.Character or l.CharacterAdded:Wait();
_G.FARM_ROOT = _G.FARM_CHAR:WaitForChild("HumanoidRootPart");
_G.FARM_HUM = _G.FARM_CHAR:WaitForChild("Humanoid");
_G.FARM_ADD_CONN = function(e)
		table.insert(_G.FARM_CONNECTIONS, e);
	end;
_G.FARM_CLEAN_CONNS = function()
		for e, A in ipairs(_G.FARM_CONNECTIONS) do
			pcall(function()
				A:Disconnect();
			end);
		end;
		_G.FARM_CONNECTIONS = {};
	end;
_G.FARM_STOP_MOVE = function()
		if _G.FARM_LV then
			_G.FARM_LV.VectorVelocity = Vector3.zero;
			_G.FARM_LV.Enabled = false;
		end;
		if _G.FARM_ROOT then
			_G.FARM_ROOT.AssemblyLinearVelocity = Vector3.zero;
			_G.FARM_ROOT.AssemblyAngularVelocity = Vector3.zero;
		end;
	end;
_G.FARM_SETUP_VEL = function()
		if not _G.FARM_ROOT then
			return;
		end;
		_G.FARM_ATTACH = _G.FARM_ROOT:FindFirstChild("FarmAttachment");
		if not _G.FARM_ATTACH then
			_G.FARM_ATTACH = Instance.new("Attachment");
			_G.FARM_ATTACH.Name = "FarmAttachment";
			_G.FARM_ATTACH.Parent = _G.FARM_ROOT;
		end;
		_G.FARM_LV = _G.FARM_ROOT:FindFirstChild("FarmLinearVelocity");
		if not _G.FARM_LV then
			_G.FARM_LV = Instance.new("LinearVelocity");
			_G.FARM_LV.Name = "FarmLinearVelocity";
			_G.FARM_LV.Attachment0 = _G.FARM_ATTACH;
			_G.FARM_LV.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector;
			_G.FARM_LV.RelativeTo = Enum.ActuatorRelativeTo.World;
			_G.FARM_LV.VectorVelocity = Vector3.zero;
			_G.FARM_LV.Enabled = false;
			_G.FARM_LV.ForceLimitMode = Enum.ForceLimitMode.PerAxis;
			_G.FARM_LV.MaxAxesForce = Vector3.new(100000, 100000, 100000);
			_G.FARM_LV.Parent = _G.FARM_ROOT;
		end;
	end;
_G.FARM_REMOVE_VEL = function()
		if _G.FARM_LV then
			_G.FARM_LV:Destroy();
			_G.FARM_LV = nil;
		end;
		if _G.FARM_ATTACH then
			_G.FARM_ATTACH:Destroy();
			_G.FARM_ATTACH = nil;
		end;
	end;
_G.FARM_IS_COIN = function(e)
		if not e:IsA("BasePart") or _G.FARM_BLACKLIST[e] then
			return false;
		end;
		local A = e.Name:lower();
		return A:find("coin") or A:find("cash") or A:find("money") or A:find("collect");
	end;
_G.FARM_CHECK_FULL = function()
		local e = l:FindFirstChild("PlayerGui");
		if not e then
			return false;
		end;
		for e, A in ipairs(e:GetChildren()) do
			if A:IsA("ScreenGui") and (A.Name ~= "UzivertHub" and A.Name ~= "UzivertSelectorNew") then
				local e = A:FindFirstChild("Container", true);
				if e then
					for e, A in ipairs(e:GetChildren()) do
						if A:IsA("Frame") and A.Visible then
							local e = A:FindFirstChild("FullBagIcon", true);
							local l = A:FindFirstChild("Full", true);
							if (e and e.Visible) or (l and l.Visible) then
								return true;
							end;
						end;
					end;
				end;
			end;
		end;
		return false;
	end;
_G.FARM_TRIGGER_RESET = function()
		if _G.FARM_BAG_FULL then
			return;
		end;
		_G.FARM_BAG_FULL = true;
		_G.FARM_STOP_MOVE();
		task.wait(.2);
		if _G.FARM_HUM and _G.FARM_HUM.Health > 0 then
			_G.FARM_HUM.Health = 0;
		end;
	end;
_G.FARM_TRACK = function(e)
		if _G.FARM_IS_COIN(e) then
			_G.FARM_ACTIVE_COINS[e] = true;
		end;
	end;
_G.FARM_UNTRACK = function(e)
		_G.FARM_ACTIVE_COINS[e] = nil;
		if _G.FARM_CURRENT == e then
			_G.FARM_CURRENT = nil;
		end;
	end;
_G.FARM_INIT_COINS = function()
		_G.FARM_ACTIVE_COINS = {};
		for e, A in ipairs(Workspace:GetDescendants()) do
			if _G.FARM_IS_COIN(A) then
				_G.FARM_ACTIVE_COINS[A] = true;
			end;
		end;
		_G.FARM_ADD_CONN(Workspace.DescendantAdded:Connect(_G.FARM_TRACK));
		_G.FARM_ADD_CONN(Workspace.DescendantRemoving:Connect(_G.FARM_UNTRACK));
		local e = (game:GetService("ReplicatedStorage")):FindFirstChild("Remotes");
		local A = e and e:FindFirstChild("Gameplay");
		if A then
			local e = A:FindFirstChild("CoinsStarted");
			local l = A:FindFirstChild("CoinCollected");
			if e then
				_G.FARM_ADD_CONN(e.OnClientEvent:Connect(function()
					_G.FARM_WAITING = true;
					_G.FARM_STOP_MOVE();
					_G.FARM_CURRENT = nil;
					_G.FARM_ACTIVE_COINS = {};
					_G.FARM_BLACKLIST = {};
					_G.FARM_BAG_FULL = false;
					task.wait(1.5);
					for e, A in ipairs(Workspace:GetDescendants()) do
						if _G.FARM_IS_COIN(A) then
							_G.FARM_ACTIVE_COINS[A] = true;
						end;
					end;
					_G.FARM_WAITING = false;
				end));
			end;
			if l then
				_G.FARM_ADD_CONN(l.OnClientEvent:Connect(function(e, A, l)
					local E = tonumber(A);
					local y = tonumber(l);
					if E and (y and E >= y) then
						_G.FARM_TRIGGER_RESET();
					end;
				end));
			end;
		end;
	end;
_G.GetMurdererPos = function()
		local A = _G.RoleCache or RoleCache;
		if A then
			for e, E in ipairs(e:GetPlayers()) do
				if E ~= l and A[E.Name] == "Murderer" then
					local e = E.Character;
					local A = e and e:FindFirstChild("HumanoidRootPart");
					if A and A.Parent then
						return A.Position;
					end;
				end;
			end;
		end;
		for e, A in ipairs(e:GetPlayers()) do
			if A ~= l and A.Character then
				local e = A.Character;
				local l = e:FindFirstChild("HumanoidRootPart");
				if l then
					local E = e:FindFirstChildOfClass("Tool");
					if E and (((E.Name:lower()):find("knife") or (E.Name:lower()):find("gun") or (E.Name:lower()):find("machete"))) then
						return l.Position;
					end;
					local y = A:FindFirstChild("Backpack");
					if y and ((y:FindFirstChild("Knife") or y:FindFirstChild("Gun"))) then
						return l.Position;
					end;
				end;
			end;
		end;
		return nil;
	end;
_G.FARM_FINDER = function()
		if _G.FARM_TARGET_THREAD then
			task.cancel(_G.FARM_TARGET_THREAD);
		end;
		_G.FARM_TARGET_THREAD = task.spawn(function()
				while true do
					task.wait(.1);
					if not _G.FARM_ON then
						break;
					end;
					if _G.FARM_ON and (not _G.FARM_BAG_FULL and _G.FARM_CHECK_FULL()) then
						_G.FARM_TRIGGER_RESET();
					end;
					if _G.FARM_ON and (not _G.FARM_BAG_FULL and (not _G.FARM_WAITING and _G.FARM_ROOT)) then
						local e = _G.FARM_ROOT.Position;
						local A = _G.GetMurdererPos();
						local l = nil;
						local E = _G.FARM_MAXDIST + 1;
						for y, a in pairs(_G.FARM_ACTIVE_COINS) do
							if y and (y.Parent and not _G.FARM_BLACKLIST[y]) then
								local a = ((y.Position - e)).Magnitude;
								if A then
									local a = ((y.Position - A)).Magnitude;
									if a < 25 then
										continue;
									end;
									if ((A - e)).Magnitude < 20 then
										if a > E then
											E = a;
											l = y;
										end;
										continue;
									end;
								end;
								if a < E then
									E = a;
									l = y;
								end;
							else
								_G.FARM_ACTIVE_COINS[y] = nil;
							end;
						end;
						if l and not l:FindFirstChild("CoinVisual") then
							_G.FARM_ACTIVE_COINS[l] = nil;
							l = nil;
						end;
						_G.FARM_CURRENT = l;
					end;
				end;
			end);
	end;
_G.FARM_AFK_LOOP = function()
		while _G.FARM_AFK and _G.FARM_ON do
			task.wait(30);
			if not _G.FARM_AFK or not _G.FARM_ON then
				break;
			end;
			pcall(function()
				VirtualUser:CaptureController();
				VirtualUser:ClickButton2(Vector2.new());
			end);
		end;
	end;
_G.FARM_ENGINE = function()
		_G.FARM_CLEAN_CONNS();
		_G.FARM_SETUP_VEL();
		_G.FARM_INIT_COINS();
		_G.FARM_NOCOINS_TIME = nil;
		_G.FARM_ADD_CONN(a.Heartbeat:Connect(function()
			if not _G.FARM_ON or _G.FARM_BAG_FULL or _G.FARM_WAITING or not _G.FARM_ROOT or not _G.FARM_ROOT.Parent or not _G.FARM_HUM or _G.FARM_HUM.Health <= 0 then
				_G.FARM_STOP_MOVE();
				return;
			end;
			if _G.FARM_CURRENT and (_G.FARM_CURRENT.Parent and not _G.FARM_BLACKLIST[_G.FARM_CURRENT]) then
				_G.FARM_NOCOINS_TIME = nil;
				local e = _G.FARM_CURRENT.Position;
				local A = _G.FARM_ROOT.Position;
				local l = ((e - A)).Magnitude;
				if l <= 1.2 then
					_G.FARM_ROOT.CFrame = CFrame.new(e);
					_G.FARM_STOP_MOVE();
					_G.FARM_COLLECTED = true;
					_G.FARM_BLACKLIST[_G.FARM_CURRENT] = true;
					_G.FARM_ACTIVE_COINS[_G.FARM_CURRENT] = nil;
					_G.FARM_CURRENT = nil;
				else
					if _G.FARM_LV then
						_G.FARM_LV.Enabled = true;
						_G.FARM_LV.VectorVelocity = ((e - A)).Unit * _G.FARM_SPEED;
					end;
				end;
			else
				_G.FARM_STOP_MOVE();
				if _G.FARM_COLLECTED then
					if not _G.FARM_NOCOINS_TIME then
						_G.FARM_NOCOINS_TIME = os.clock();
					elseif os.clock() - _G.FARM_NOCOINS_TIME >= _G.FARM_RESET_DELAY then
						_G.FARM_NOCOINS_TIME = nil;
						_G.FARM_CLEAN_CONNS();
						if _G.FARM_HUM then
							_G.FARM_HUM.Health = 0;
						end;
					end;
				else
					_G.FARM_NOCOINS_TIME = nil;
				end;
			end;
		end));
	end;
_G.FARM_ANTIVOID_APPLY = function()
		if _G.FARM_ANTIVOID then
			Workspace.FallenPartsDestroyHeight = 0 / 0;
		end;
	end;
_G.FARM_NOCLIP_CONN = nil;
_G.FARM_NOCLIP_START = function()
		if _G.FARM_NOCLIP_CONN then
			return;
		end;
		_G.FARM_NOCLIP_CONN = a.Stepped:Connect(function()
				if not _G.FARM_ON or not _G.FARM_NOCLIP then
					return;
				end;
				local e = l.Character;
				if e then
					for e, A in ipairs(e:GetDescendants()) do
						if A:IsA("BasePart") then
							A.CanCollide = false;
						end;
					end;
				end;
			end);
	end;
_G.FARM_NOCLIP_STOP = function()
		if _G.FARM_NOCLIP_CONN then
			_G.FARM_NOCLIP_CONN:Disconnect();
			_G.FARM_NOCLIP_CONN = nil;
		end;
		local e = l.Character;
		if e then
			for e, A in ipairs(e:GetDescendants()) do
				if A:IsA("BasePart") then
					A.CanCollide = true;
				end;
			end;
		end;
	end;
_G.FARM_LOAD = function()
		_G.FARM_BAG_FULL = false;
		_G.FARM_WAITING = false;
		_G.FARM_COLLECTED = false;
		_G.FARM_BLACKLIST = {};
		_G.FARM_NOCOINS_TIME = nil;
		_G.FARM_CHAR = l.Character or l.CharacterAdded:Wait();
		_G.FARM_ROOT = _G.FARM_CHAR:WaitForChild("HumanoidRootPart");
		_G.FARM_HUM = _G.FARM_CHAR:WaitForChild("Humanoid");
		_G.FARM_ANTIVOID_APPLY();
		_G.FARM_NOCLIP_START();
		_G.FARM_FINDER();
		_G.FARM_ENGINE();
		if _G.FARM_CHAR_CONN then
			_G.FARM_CHAR_CONN:Disconnect();
		end;
		_G.FARM_CHAR_CONN = l.CharacterAdded:Connect(function(e)
				_G.FARM_CLEAN_CONNS();
				_G.FARM_REMOVE_VEL();
				_G.FARM_CHAR = e;
				_G.FARM_ROOT = e:WaitForChild("HumanoidRootPart");
				_G.FARM_HUM = e:WaitForChild("Humanoid");
				_G.FARM_BAG_FULL = false;
				_G.FARM_WAITING = false;
				_G.FARM_COLLECTED = false;
				_G.FARM_BLACKLIST = {};
				task.wait(1.5);
				if _G.FARM_ON then
					_G.FARM_ENGINE();
				end;
			end);
	end;
_G.FARM_UNLOAD = function()
		_G.FARM_ON = false;
		_G.FARM_CLEAN_CONNS();
		_G.FARM_NOCLIP_STOP();
		_G.FARM_REMOVE_VEL();
		if _G.FARM_TARGET_THREAD then
			task.cancel(_G.FARM_TARGET_THREAD);
			_G.FARM_TARGET_THREAD = nil;
		end;
		if _G.FARM_CHAR_CONN then
			_G.FARM_CHAR_CONN:Disconnect();
			_G.FARM_CHAR_CONN = nil;
		end;
		_G.FARM_ACTIVE_COINS = {};
		_G.FARM_BLACKLIST = {};
		_G.FARM_CURRENT = nil;
	end;
local AB = j("Visual", "Visual", 1);
local lB = j("Combat", "Combat", 2);
local EB = j("Crab", "Crab", 3);
local yB = j("Jugador", "Jugador", 4);
local aB = j("Clutchs", "Clutchs", 7);
local WB = j("Auto Farm", "AutoFarm", 10);
local UB = j("Info", "Info", 11);
local tB = j("Update", "Update", 12);
local cB = j("Avisos", "Avisos", 13);
local bB = j("Creador", "Creador", 14);
if not _G.UZIVERT_GAMA_BAJA then
	PaginaFling = j("Fling", "Fling", 5);
	PaginaAnims = j("Anims", "Anims", 6);
	PaginaUtilidades = j("Utilidades", "Utilidades", 8);
	PaginaRend = j("Apariencia", "Apariencia", 9);
end;
eB[1][2].Visible = true;
eB[1][1].BackgroundTransparency = .3;
O(WB, "\240\159\140\190 Auto Farm", false, function(e)
	_G.FARM_ON = e;
	if e then
		_G.FARM_LOAD();
		if _G.FARM_AFK then
			task.spawn(_G.FARM_AFK_LOOP);
		end;
	else
		_G.FARM_UNLOAD();
	end;
end);
O(WB, "\240\159\140\153 Anti-AFK", false, function(e)
	_G.FARM_AFK = e;
	if e and _G.FARM_ON then
		task.spawn(_G.FARM_AFK_LOOP);
	end;
end);
O(WB, "\240\159\145\187 Noclip", true, function(e)
	_G.FARM_NOCLIP = e;
	if e and _G.FARM_ON then
		_G.FARM_NOCLIP_START();
	else
		_G.FARM_NOCLIP_STOP();
	end;
end);
O(WB, "\240\159\155\161\239\184\143 Anti-Void", true, function(e)
	_G.FARM_ANTIVOID = e;
	_G.FARM_ANTIVOID_APPLY();
end);
q(WB, "\240\159\154\182 Velocidad", 10, 30, 23, function(e)
	_G.FARM_SPEED = e;
end);
q(WB, "\240\159\147\143 Distancia M\195\161x", 100, 2000, 1000, function(e)
	_G.FARM_MAXDIST = e;
end);
if not _G.UZIVERT_GAMA_BAJA then
	_G.UZIVERT_INV_ON = d.InventoryUnlimiter or false;
	_G.UZIVERT_INV_LIMIT = d.InventoryMaxItems or 10;
	_G.UZIVERT_AUTOGET_ON = d.AutoGetTools or false;
	_G.UZIVERT_TOYS = {
			d.AutoToySlot1 or "None",
			d.AutoToySlot2 or "None",
			d.AutoToySlot3 or "None",
			d.AutoToySlot4 or "None",
		};
	_G.UZIVERT_TOY_ATTEMPTS = {};
	_G.UZIVERT_TARGET_FUNCTIONS = {};
	_G.UZIVERT_TARGETS_SCANNED = false;
	_G.UZIVERT_RECOVERY_TOKEN = 0;
	_G.UZIVERT_RECOVERY_RUNNING = false;
	_G.UZIVERT_OBSERVED_BACKPACK = nil;
	_G.UZIVERT_TOY_ORDER_DIRTY = true;
	local e = (debug and debug.getupvalues) or getupvalues;
	local A = (debug and debug.setupvalue) or setupvalue;
	local E = (debug and debug.getinfo) or getinfo;
	local y = (debug and debug.getconstants) or getconstants;
	_G.UZIVERT_DISCOVER_TARGETS = function(l)
			if _G.UZIVERT_TARGETS_SCANNED and not l then
				return;
			end;
			_G.UZIVERT_TARGETS_SCANNED = false;
			table.clear(_G.UZIVERT_TARGET_FUNCTIONS);
			if not ((type(getgc) == "function" and (type(e) == "function" and (type(A) == "function" and type(E) == "function")))) then
				return;
			end;
			local a, W = pcall(getgc);
			if not a or type(W) ~= "table" then
				return;
			end;
			for e, A in ipairs(W) do
				if type(A) == "function" then
					local e, l = pcall(E, A);
					if e and type(l) == "table" then
						local e = (l.name == "updateItemFrame" or l.name == "onItemEquipped");
						if not e and type(y) == "function" then
							local l, E = pcall(y, A);
							if l and type(E) == "table" then
								local A, l = false, false;
								for e, E in pairs(E) do
									if E == "TouchBinding" then
										A = true;
									elseif E == "EquipButton" then
										l = true;
									end;
								end;
								e = A and l;
							end;
						end;
						if e then
							table.insert(_G.UZIVERT_TARGET_FUNCTIONS, A);
						end;
					end;
				end;
			end;
			_G.UZIVERT_TARGETS_SCANNED = #_G.UZIVERT_TARGET_FUNCTIONS > 0;
		end;
	_G.UZIVERT_APPLY_INV_LIMIT = function(l)
			if not _G.UZIVERT_INV_ON then
				return;
			end;
			_G.UZIVERT_DISCOVER_TARGETS(l);
			for l, E in ipairs(_G.UZIVERT_TARGET_FUNCTIONS) do
				local y, a = pcall(e, E);
				if y and type(a) == "table" then
					for e, l in pairs(a) do
						if type(e) == "number" and (type(l) == "number" and (l >= 2 and l <= 10)) then
							pcall(A, E, e, _G.UZIVERT_INV_LIMIT);
						end;
					end;
				end;
			end;
		end;
	_G.UZIVERT_GET_BACKPACK = function()
			if _G.UZIVERT_OBSERVED_BACKPACK and _G.UZIVERT_OBSERVED_BACKPACK.Parent == l then
				return _G.UZIVERT_OBSERVED_BACKPACK;
			end;
			return l:FindFirstChildOfClass("Backpack");
		end;
	_G.UZIVERT_FIND_TOY_FOLDER = function()
			local e = _G.UZIVERT_GET_BACKPACK();
			return e and e:FindFirstChild("Toys") or nil;
		end;
	_G.UZIVERT_GET_TOY_NAMES = function()
			local e = { "None" };
			local A = _G.UZIVERT_FIND_TOY_FOLDER();
			if A then
				for A, l in ipairs(A:GetChildren()) do
					if not table.find(e, l.Name) then
						e[#e + 1] = l.Name;
					end;
				end;
			end;
			table.sort(e, function(e, A)
				if e == A then
					return false;
				end;
				if e == "None" then
					return true;
				end;
				if A == "None" then
					return false;
				end;
				return e:lower() < A:lower();
			end);
			return e;
		end;
	_G.UZIVERT_HAS_TOOL = function(e, A, l)
			local E = A and A:FindFirstChild(e);
			local y = l and l:FindFirstChild(e);
			return (E and E:IsA("Tool")) or (y and y:IsA("Tool")) or false;
		end;
	_G.UZIVERT_TOY_REMOTE = function()
			local e = game:GetService("ReplicatedStorage");
			local A = e:FindFirstChild("Remotes");
			local l = A and A:FindFirstChild("Extras");
			local E = l and l:FindFirstChild("ReplicateToy");
			if E and E:IsA("RemoteFunction") then
				return E;
			end;
		end;
	_G.UZIVERT_CANCEL_TOY_REQUESTS = function()
			for e, A in pairs(_G.UZIVERT_TOY_ATTEMPTS) do
				if A.thread and type(task.cancel) == "function" then
					pcall(task.cancel, A.thread);
				end;
			end;
			table.clear(_G.UZIVERT_TOY_ATTEMPTS);
			_G.UZIVERT_ACTIVE_REQUEST = nil;
		end;
	_G.UZIVERT_REQUEST_RECOVERY = function(e)
			if not _G.UZIVERT_INV_ON and not _G.UZIVERT_AUTOGET_ON then
				return;
			end;
			local A = l.Character;
			if not A then
				return;
			end;
			if e then
				_G.UZIVERT_TARGETS_SCANNED = false;
				table.clear(_G.UZIVERT_TOY_ATTEMPTS);
			end;
			if _G.UZIVERT_RECOVERY_RUNNING then
				_G.UZIVERT_RECOVERY_TOKEN = _G.UZIVERT_RECOVERY_TOKEN + 1;
			end;
			_G.UZIVERT_RECOVERY_RUNNING = true;
			_G.UZIVERT_RECOVERY_TOKEN = _G.UZIVERT_RECOVERY_TOKEN + 1;
			local E = _G.UZIVERT_RECOVERY_TOKEN;
			task.spawn(function()
				local e = os.clock();
				local l = {
						0,
						.5,
						1,
						2,
						3,
						5,
						8,
						12,
						16,
					};
				local y = 1;
				local a = 0;
				local W = 0;
				while E == _G.UZIVERT_RECOVERY_TOKEN and os.clock() - e < 25 do
					local E = os.clock();
					local U = A:FindFirstChildOfClass("Humanoid");
					if U and U.Health > 0 then
						local U = false;
						if l[y] and E - e >= l[y] then
							U = true;
							repeat
								y = y + 1;
							until not l[y] or E - e < l[y];
						end;
						if _G.UZIVERT_INV_ON and ((U or (_G.UZIVERT_TARGETS_SCANNED and E >= a))) then
							_G.UZIVERT_APPLY_INV_LIMIT(U);
							a = E + 1;
						end;
						if _G.UZIVERT_AUTOGET_ON and (not _G.UZIVERT_ACTIVE_REQUEST and E >= W) then
							local e = _G.UZIVERT_GET_BACKPACK();
							local l = _G.UZIVERT_FIND_TOY_FOLDER();
							local y = _G.UZIVERT_TOY_REMOTE();
							if e and (l and y) then
								for a = 1, 4, 1 do
									local U = _G.UZIVERT_TOYS[a];
									if U and U ~= "None" then
										if not _G.UZIVERT_HAS_TOOL(U, A, e) then
											local e = _G.UZIVERT_TOY_ATTEMPTS[U];
											if not e then
												e = { count = 0, nextAt = 0, inFlight = false };
												_G.UZIVERT_TOY_ATTEMPTS[U] = e;
											end;
											if l:FindFirstChild(U) and (not e.inFlight and (e.count < 12 and E >= e.nextAt)) then
												e.count = e.count + 1;
												e.nextAt = E + .5;
												e.inFlight = true;
												_G.UZIVERT_ACTIVE_REQUEST = e;
												W = E + .15;
												e.thread = task.spawn(function()
														pcall(function()
															y:InvokeServer(U);
														end);
														task.wait(.3);
														e.inFlight = false;
														if _G.UZIVERT_ACTIVE_REQUEST == e then
															_G.UZIVERT_ACTIVE_REQUEST = nil;
														end;
													end);
											end;
											break;
										end;
									end;
								end;
							end;
						end;
					end;
					task.wait(.15);
				end;
				if E == _G.UZIVERT_RECOVERY_TOKEN then
					_G.UZIVERT_RECOVERY_RUNNING = false;
				end;
			end);
		end;
	local a = {};
	_G.UZIVERT_WATCH_TOY_FOLDER = function(e)
			for e, A in ipairs(a) do
				pcall(function()
					A:Disconnect();
				end);
			end;
			table.clear(a);
			if not e then
				return;
			end;
			a[#a + 1] = e.ChildAdded:Connect(function()
					_G.UZIVERT_REQUEST_RECOVERY(false);
				end);
			a[#a + 1] = e.ChildRemoved:Connect(function()
					_G.UZIVERT_REQUEST_RECOVERY(false);
				end);
		end;
	_G.UZIVERT_WATCH_BACKPACK = function(e)
			_G.UZIVERT_OBSERVED_BACKPACK = e;
			if e then
				_G.UZIVERT_WATCH_TOY_FOLDER(e:FindFirstChild("Toys"));
				e.ChildAdded:Connect(function(e)
					if e.Name == "Toys" then
						_G.UZIVERT_WATCH_TOY_FOLDER(e);
						_G.UZIVERT_REQUEST_RECOVERY(false);
					end;
				end);
				e.ChildRemoved:Connect(function(e)
					if e.Name == "Toys" then
						_G.UZIVERT_WATCH_TOY_FOLDER(nil);
					end;
				end);
			end;
		end;
	_G.UZIVERT_WATCH_BACKPACK(l:FindFirstChildOfClass("Backpack"));
	l.CharacterAdded:Connect(function(e)
		local A = tick() + 10;
		repeat
			task.wait(.1);
			local E = e:FindFirstChildOfClass("Humanoid");
			local y = l:FindFirstChildOfClass("Backpack");
			if E and (E.Health > 0 and y) then
				break;
			end;
		until tick() > A;
		task.wait(1.5);
		_G.UZIVERT_WATCH_BACKPACK(l:FindFirstChildOfClass("Backpack"));
		_G.UZIVERT_REQUEST_RECOVERY(true);
		task.delay(3, function()
			if _G.UZIVERT_AUTOGET_ON then
				_G.UZIVERT_REQUEST_RECOVERY(true);
			end;
		end);
		task.delay(6, function()
			if _G.UZIVERT_AUTOGET_ON then
				local A = _G.UZIVERT_GET_BACKPACK();
				if A then
					local l = false;
					for E = 1, 4, 1 do
						local y = _G.UZIVERT_TOYS[E];
						if y and y ~= "None" then
							if not _G.UZIVERT_HAS_TOOL(y, e, A) then
								l = true;
								break;
							end;
						end;
					end;
					if l then
						_G.UZIVERT_REQUEST_RECOVERY(true);
					end;
				end;
			end;
		end);
	end);
	if _G.UZIVERT_INV_ON or _G.UZIVERT_AUTOGET_ON then
		task.defer(function()
			_G.UZIVERT_REQUEST_RECOVERY(false);
		end);
	end;
	_G.secUtil = Instance.new("Frame");
	_G.secUtil.Size = UDim2.new(1, 0, 0, 30);
	_G.secUtil.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secUtil.BackgroundTransparency = .3;
	_G.secUtil.BorderSizePixel = 0;
	_G.secUtil.ZIndex = 2;
	_G.secUtil.Parent = PaginaUtilidades;
	_G.cSecUtil = Instance.new("UICorner");
	_G.cSecUtil.CornerRadius = UDim.new(0, 7);
	_G.cSecUtil.Parent = _G.secUtil;
	_G.sSecUtil = Instance.new("UIStroke");
	_G.sSecUtil.Color = k.Morado3;
	_G.sSecUtil.Thickness = 1.5;
	_G.sSecUtil.Transparency = .2;
	_G.sSecUtil.Parent = _G.secUtil;
	_G.lblSecUtil = Instance.new("TextLabel");
	_G.lblSecUtil.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecUtil.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecUtil.BackgroundTransparency = 1;
	_G.lblSecUtil.Text = "\240\159\167\176 INVENTORY + AUTO GET TOOLS";
	_G.lblSecUtil.TextColor3 = k.Naranja2;
	_G.lblSecUtil.Font = Enum.Font.GothamBlack;
	_G.lblSecUtil.TextSize = 12;
	_G.lblSecUtil.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecUtil.ZIndex = 3;
	_G.lblSecUtil.Parent = _G.secUtil;
	O(PaginaUtilidades, "\240\159\142\146 Unlimit Inventory (3\226\134\14610)", d.InventoryUnlimiter or false, function(e)
		_G.UZIVERT_INV_ON = e;
		d.InventoryUnlimiter = e;
		m();
		if e then
			_G.UZIVERT_REQUEST_RECOVERY(true);
		end;
	end);
	q(PaginaUtilidades, "M\195\161x Items", 3, 10, d.InventoryMaxItems or 10, function(e)
		_G.UZIVERT_INV_LIMIT = math.clamp(math.floor(e), 3, 10);
		d.InventoryMaxItems = _G.UZIVERT_INV_LIMIT;
		m();
		if _G.UZIVERT_INV_ON then
			_G.UZIVERT_REQUEST_RECOVERY(true);
		end;
	end);
	O(PaginaUtilidades, "\240\159\142\146 Auto Get Tools", d.AutoGetTools or false, function(e)
		_G.UZIVERT_AUTOGET_ON = e;
		d.AutoGetTools = e;
		m();
		if e then
			_G.UZIVERT_REQUEST_RECOVERY(false);
		else
			_G.UZIVERT_CANCEL_TOY_REQUESTS();
		end;
	end);
	_G.UZIVERT_TOY_DD_BUTTONS = {};
	_G.UZIVERT_CREAR_TOY_DD = function(e)
			local A = Instance.new("TextButton");
			A.Size = UDim2.new(1, 0, 0, 38);
			A.BackgroundColor3 = k.Morado3;
			A.BackgroundTransparency = .5;
			A.Text = "Toy Slot " .. (e .. (": " .. (((_G.UZIVERT_TOYS[e] or "None")) .. " \226\150\188")));
			A.TextColor3 = k.Texto;
			A.Font = Enum.Font.GothamBold;
			A.TextSize = 11;
			A.BorderSizePixel = 0;
			A.ZIndex = 2;
			A.Parent = PaginaUtilidades;
			local l = Instance.new("UICorner");
			l.CornerRadius = UDim.new(0, 8);
			l.Parent = A;
			_G.UZIVERT_TOY_DD_BUTTONS[e] = A;
			A.MouseButton1Click:Connect(function()
				local l = _G.UZIVERT_GET_TOY_NAMES();
				local E = _G.UZIVERT_TOYS[e];
				local y = table.find(l, E);
				if not y then
					y = 0;
				end;
				y = y % #l + 1;
				local a = l[y];
				_G.UZIVERT_TOYS[e] = a;
				d["AutoToySlot" .. e] = a;
				m();
				A.Text = "Toy Slot " .. (e .. (": " .. (a .. " \226\150\188")));
				if _G.UZIVERT_AUTOGET_ON then
					_G.UZIVERT_REQUEST_RECOVERY(false);
				end;
			end);
		end;
	_G.UZIVERT_CREAR_TOY_DD(1);
	_G.UZIVERT_CREAR_TOY_DD(2);
	_G.UZIVERT_CREAR_TOY_DD(3);
	_G.UZIVERT_CREAR_TOY_DD(4);
	J(PaginaUtilidades, "\240\159\148\132 Refrescar Lista de Toys", function()
		print("\240\159\142\146 Toys disponibles:");
		for e, A in ipairs(_G.UZIVERT_GET_TOY_NAMES()) do
			print("  \226\128\162 " .. A);
		end;
	end, k.Naranja1);
	_G.UZIVERT_FEHL_CONFIGS = { {
				id = "78837807518622",
				on = d.FEHeadless or false,
				track = nil,
				freeze = nil,
				stopped = nil,
				name = "Headless",
			}, {
				id = "117080641351340",
				on = d.FEHeadlessV2 or false,
				track = nil,
				freeze = nil,
				stopped = nil,
				name = "Headless V2",
			}, {
				id = "136055001302601",
				on = d.FEHeadlessV3 or false,
				track = nil,
				freeze = nil,
				stopped = nil,
				name = "Headless V3",
			} };
	_G.UZIVERT_FEHL_STOP = function(e)
			if e.stopped then
				e.stopped:Disconnect();
				e.stopped = nil;
			end;
			if e.track then
				e.track:Stop();
				e.track:Destroy();
				e.track = nil;
			end;
		end;
	_G.UZIVERT_FEHL_PLAY = function(e, A)
			if not A or not A.Parent then
				return;
			end;
			local l = A:FindFirstChildOfClass("Animator");
			if not l then
				return;
			end;
			_G.UZIVERT_FEHL_STOP(e);
			local E = Instance.new("Animation");
			E.AnimationId = "rbxassetid://" .. e.id;
			e.track = l:LoadAnimation(E);
			e.track.Priority = Enum.AnimationPriority.Action;
			e.track.Looped = true;
			e.track:Play();
			e.stopped = e.track.Stopped:Connect(function()
					if e.on and A.Parent then
						task.wait(.1);
						_G.UZIVERT_FEHL_PLAY(e, A);
					end;
				end);
		end;
	_G.UZIVERT_FEHL_FREEZE = function(e, A)
			if e.freeze then
				e.freeze:Disconnect();
			end;
			e.freeze = A.StateChanged:Connect(function()
					if e.on and (A.Parent and ((not e.track or not e.track.IsPlaying))) then
						task.wait(.05);
						if e.on and A.Parent then
							_G.UZIVERT_FEHL_PLAY(e, A);
						end;
					end;
				end);
		end;
	_G.UZIVERT_FEHL_ENABLE = function(e)
			local A = game.Players.LocalPlayer.Character;
			if not A then
				return;
			end;
			local l = A:FindFirstChild("Humanoid");
			if not l then
				return;
			end;
			_G.UZIVERT_FEHL_FREEZE(e, l);
			_G.UZIVERT_FEHL_PLAY(e, l);
		end;
	_G.UZIVERT_FEHL_DISABLE = function(e)
			_G.UZIVERT_FEHL_STOP(e);
			if e.freeze then
				e.freeze:Disconnect();
				e.freeze = nil;
			end;
		end;
	game.Players.LocalPlayer.CharacterRemoving:Connect(function()
		for e, A in ipairs(_G.UZIVERT_FEHL_CONFIGS) do
			_G.UZIVERT_FEHL_STOP(A);
			if A.freeze then
				A.freeze:Disconnect();
				A.freeze = nil;
			end;
		end;
	end);
	game.Players.LocalPlayer.CharacterAdded:Connect(function()
		task.wait(.5);
		for e, A in ipairs(_G.UZIVERT_FEHL_CONFIGS) do
			if A.on then
				_G.UZIVERT_FEHL_ENABLE(A);
			end;
		end;
	end);
	local W = Instance.new("Frame");
	W.Size = UDim2.new(1, 0, 0, 30);
	W.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	W.BackgroundTransparency = .3;
	W.BorderSizePixel = 0;
	W.ZIndex = 2;
	W.Parent = PaginaUtilidades;
	local U = Instance.new("UICorner");
	U.CornerRadius = UDim.new(0, 7);
	U.Parent = W;
	local t = Instance.new("UIStroke");
	t.Color = k.Morado3;
	t.Thickness = 1.5;
	t.Transparency = .2;
	t.Parent = W;
	local c = Instance.new("TextLabel");
	c.Size = UDim2.new(1, -20, 1, 0);
	c.Position = UDim2.new(0, 10, 0, 0);
	c.BackgroundTransparency = 1;
	c.Text = "\240\159\146\128 FE HEADLESS (3 VERSIONES)";
	c.TextColor3 = k.Naranja2;
	c.Font = Enum.Font.GothamBlack;
	c.TextSize = 12;
	c.TextXAlignment = Enum.TextXAlignment.Left;
	c.ZIndex = 3;
	c.Parent = W;
	O(PaginaUtilidades, "\240\159\146\128 Headless (V1)", d.FEHeadless or false, function(e)
		local A = _G.UZIVERT_FEHL_CONFIGS[1];
		A.on = e;
		d.FEHeadless = e;
		m();
		if e then
			_G.UZIVERT_FEHL_ENABLE(A);
		else
			_G.UZIVERT_FEHL_DISABLE(A);
		end;
	end);
	O(PaginaUtilidades, "\240\159\146\128 Headless V2", d.FEHeadlessV2 or false, function(e)
		local A = _G.UZIVERT_FEHL_CONFIGS[2];
		A.on = e;
		d.FEHeadlessV2 = e;
		m();
		if e then
			_G.UZIVERT_FEHL_ENABLE(A);
		else
			_G.UZIVERT_FEHL_DISABLE(A);
		end;
	end);
	O(PaginaUtilidades, "\240\159\146\128 Headless V3", d.FEHeadlessV3 or false, function(e)
		local A = _G.UZIVERT_FEHL_CONFIGS[3];
		A.on = e;
		d.FEHeadlessV3 = e;
		m();
		if e then
			_G.UZIVERT_FEHL_ENABLE(A);
		else
			_G.UZIVERT_FEHL_DISABLE(A);
		end;
	end);
end;
_G.UZ_WH = {
		enabled = false,
		distance = 3,
		power = 50,
		flicking = false,
		lastFlick = 0,
		jumpPressed = false,
		lastHit = nil,
		lastWallhop = 0,
		cooldown = .15,
	};
_G.UZ_WH_RAY = RaycastParams.new();
_G.UZ_WH_RAY.FilterType = Enum.RaycastFilterType.Blacklist;
_G.UZ_WH_IS_PLAYER = function(A)
		if not A then
			return false;
		end;
		local l = A;
		while l do
			if l:IsA("Model") and l:FindFirstChildOfClass("Humanoid") then
				for e, A in ipairs(e:GetPlayers()) do
					if A.Character == l then
						return true;
					end;
				end;
			end;
			l = l.Parent;
		end;
		return false;
	end;
_G.UZ_WH_IS_WALL = function(e)
		if not e or not e.IsA then
			return false;
		end;
		if e:IsA("Part") and (e.Parent and (e.Parent:IsA("Model") and e.Parent:FindFirstChild("Humanoid"))) then
			return false;
		end;
		local A = e;
		while A do
			if _G.UZ_WH_IS_PLAYER(A) then
				return false;
			end;
			A = A.Parent;
		end;
		if not e:IsA("BasePart") and not e:IsA("Terrain") then
			return false;
		end;
		if e:IsA("BasePart") and not e.CanCollide then
			return false;
		end;
		return true;
	end;
_G.UZ_WH_GET_RAY = function()
		local A = l.Character;
		if not A then
			return nil;
		end;
		local E = A:FindFirstChild("HumanoidRootPart");
		if not E then
			return nil;
		end;
		local y = { A };
		for e, A in ipairs(e:GetPlayers()) do
			if A ~= l and A.Character then
				table.insert(y, A.Character);
			end;
		end;
		_G.UZ_WH_RAY.FilterDescendantsInstances = y;
		local a, W = nil, _G.UZ_WH.distance;
		local U = E.CFrame;
		for e = 0, 7, 1 do
			local A = math.rad(e * 45);
			local l = ((U * CFrame.Angles(0, A, 0))).LookVector;
			local y = workspace:Raycast(E.Position, l * _G.UZ_WH.distance, _G.UZ_WH_RAY);
			if y and (y.Instance and y.Distance < W) then
				if _G.UZ_WH_IS_WALL(y.Instance) then
					W = y.Distance;
					a = y;
				end;
			end;
		end;
		return a;
	end;
_G.UZ_WH_FLICK = function()
		if not _G.UZ_WH.enabled or _G.UZ_WH.flicking then
			return;
		end;
		_G.UZ_WH.flicking = true;
		local e = l.Character;
		if not e then
			_G.UZ_WH.flicking = false;
			return;
		end;
		local A = e:FindFirstChild("Humanoid");
		local E = e:FindFirstChild("HumanoidRootPart");
		if not A or not E or A.Health <= 0 then
			_G.UZ_WH.flicking = false;
			return;
		end;
		local y = E.Velocity;
		A:ChangeState(Enum.HumanoidStateType.Jumping);
		E.Velocity = Vector3.new(y.X, _G.UZ_WH.power, y.Z);
		local a = workspace.CurrentCamera;
		local W = a.CFrame;
		a.CFrame = W * CFrame.Angles(0, math.rad(180), 0);
		task.wait(.01);
		a.CFrame = W;
		_G.UZ_WH.flicking = false;
	end;
_G.UZ_WH_PERFORM = function()
		if not _G.UZ_WH.enabled then
			return;
		end;
		local e = l.Character;
		local A = e and e:FindFirstChildOfClass("Humanoid");
		local E = e and e:FindFirstChild("HumanoidRootPart");
		if not ((A and (E and A:GetState() ~= Enum.HumanoidStateType.Dead))) then
			return;
		end;
		local y = os.clock();
		if y - _G.UZ_WH.lastWallhop < _G.UZ_WH.cooldown then
			return;
		end;
		local W = _G.UZ_WH_GET_RAY();
		if not W then
			return;
		end;
		_G.UZ_WH.lastWallhop = y;
		E.CFrame = CFrame.lookAt(E.Position, E.Position + W.Normal);
		a.Heartbeat:Wait();
		if A:GetState() ~= Enum.HumanoidStateType.Dead then
			A:ChangeState(Enum.HumanoidStateType.Jumping);
			task.wait(.1);
		end;
	end;
a.Heartbeat:Connect(function()
	if not _G.UZ_WH.enabled or _G.UZ_WH.flicking then
		return;
	end;
	local e = l.Character;
	if not e then
		_G.UZ_WH.lastHit = nil;
		return;
	end;
	local A = e:FindFirstChild("HumanoidRootPart");
	local E = e:FindFirstChild("Humanoid");
	if not A or not E or E.Health <= 0 then
		_G.UZ_WH.lastHit = nil;
		return;
	end;
	if not _G.UZ_WH.jumpPressed then
		_G.UZ_WH.lastHit = nil;
		return;
	end;
	local y = RaycastParams.new();
	y.FilterDescendantsInstances = { e };
	y.FilterType = Enum.RaycastFilterType.Exclude;
	y.IgnoreWater = true;
	local a = workspace.CurrentCamera;
	local W = a.CFrame.LookVector * _G.UZ_WH.distance;
	local U = workspace:Raycast(A.Position, W, y);
	local t = nil;
	if U and _G.UZ_WH_IS_WALL(U.Instance) then
		t = U.Instance;
	end;
	if _G.UZ_WH.lastHit and (t and _G.UZ_WH.lastHit ~= t) then
		local e = os.clock();
		if e - _G.UZ_WH.lastFlick > .1 then
			_G.UZ_WH.lastFlick = e;
			_G.UZ_WH_FLICK();
		end;
	end;
	_G.UZ_WH.lastHit = t;
end);
E.JumpRequest:Connect(function()
	if _G.UZ_WH.enabled then
		_G.UZ_WH_PERFORM();
	end;
end);
E.InputBegan:Connect(function(e, A)
	if A then
		return;
	end;
	if e.KeyCode == Enum.KeyCode.Space then
		_G.UZ_WH.jumpPressed = true;
	end;
end);
E.InputEnded:Connect(function(e, A)
	if A then
		return;
	end;
	if e.KeyCode == Enum.KeyCode.Space then
		_G.UZ_WH.jumpPressed = false;
		_G.UZ_WH.lastHit = nil;
	end;
end);
O(PaginaUtilidades, "\240\159\167\151 Pm-WallHop", d.PmWallHop or false, function(e)
	_G.UZ_WH.enabled = e;
	d.PmWallHop = e;
	m();
end);
q(PaginaUtilidades, "Distancia WallHop", 1, 6, d.PmWallHopDist or 3, function(e)
	_G.UZ_WH.distance = e;
	d.PmWallHopDist = e;
	m();
end);
q(PaginaUtilidades, "Fuerza WallHop", 20, 100, d.PmWallHopPower or 50, function(e)
	_G.UZ_WH.power = e;
	d.PmWallHopPower = e;
	m();
end);
local kB = game:GetService("ReplicatedStorage");
local xB = nil;
local zB = {};
task.spawn(function()
	while not xB do
		for e, A in ipairs(kB:GetDescendants()) do
			if A.Name == "GetPlayerData" then
				xB = A;
				print("\240\159\142\131 [ROLES] Remote encontrado: " .. A:GetFullName());
				break;
			end;
		end;
		if not xB then
			task.wait(2);
		end;
	end;
end);
task.spawn(function()
	while task.wait(.1) do
		if xB then
			local e, A = pcall(function()
					return xB:InvokeServer();
				end);
			if e and A then
				local e = {};
				for A, l in pairs(A) do
					if l.Dead or not l.Role or l.Role == "" then
						e[A] = "Lobby";
					else
						e[A] = l.Role;
					end;
				end;
				zB = e;
			end;
		end;
	end;
end);
local function dB()
	for A, l in pairs(zB) do
		if l == "Murderer" then
			return e:FindFirstChild(A);
		end;
	end;
	return nil;
end;
local function wB()
	for A, l in pairs(zB) do
		if l == "Sheriff" then
			return e:FindFirstChild(A);
		end;
	end;
	return nil;
end;
local function mB()
	for A, l in pairs(zB) do
		if l == "Hero" then
			return e:FindFirstChild(A);
		end;
	end;
	return nil;
end;
_G.detectarZombie = function()
		if not zB then
			return nil;
		end;
		local A = l.Character;
		local E = A and A:FindFirstChild("HumanoidRootPart");
		if not E then
			return nil;
		end;
		local y = nil;
		local a = math.huge;
		for A, l in pairs(zB) do
			if l == "Zombie" then
				local l = e:FindFirstChild(A);
				if l and l.Character then
					local e = l.Character:FindFirstChild("HumanoidRootPart");
					local A = l.Character:FindFirstChildOfClass("Humanoid");
					if e and (A and A.Health > 0) then
						local A = ((e.Position - E.Position)).Magnitude;
						if A < a then
							a = A;
							y = l;
						end;
					end;
				end;
			end;
		end;
		return y;
	end;
_G.detectarSurvivor = function()
		if zB then
			for A, l in pairs(zB) do
				if l == "Survivor" then
					return e:FindFirstChild(A);
				end;
			end;
		end;
		return nil;
	end;
local function VB(e)
	if zB and zB[e.Name] then
		local A = zB[e.Name];
		if A == "" then
			A = "Lobby";
		end;
		return A;
	end;
	return "Lobby";
end;
_G.AIM_ON = d.AimLock or false;
_G.AIM_WALL = d.AimWall or false;
_G.AIM_FOV_ON = d.AimFOV or false;
_G.AIM_FOV_RADIUS = d.AimFOVRadius or 250;
_G.AIM_SMOOTH = d.AimSmooth or 25;
_G.AIM_HORIZ = d.AimHoriz or false;
_G.AIM_PART = d.AimPart or "Head";
_G.AIM_PRED = d.AimPred or .145;
_G.AIM_SELECTED = nil;
_G.AIM_TARGET = nil;
_G.AIM_LAST_POS = nil;
_G.AIM_LAST_TARGET = nil;
_G.AIM_LAST_SEARCH = 0;
_G.AIM_FOV_CIRCLE = nil;
_G.AIM_FIND_MURDERER = function()
		local A = {};
		for e, E in ipairs(e:GetPlayers()) do
			if E ~= l and E.Character then
				local e = E.Character:FindFirstChildOfClass("Humanoid");
				if e and e.Health > 0 then
					local e = nil;
					local l = E.Character;
					for A, l in ipairs(l:GetChildren()) do
						if l:IsA("Tool") then
							local A = l.Name:lower();
							if A == "knife" or A == "default knife" then
								e = "Murderer";
								break;
							end;
						end;
					end;
					if not e and E:FindFirstChild("Backpack") then
						for A, l in ipairs(E.Backpack:GetChildren()) do
							if l:IsA("Tool") then
								local A = l.Name:lower();
								if A == "knife" or A == "default knife" then
									e = "Murderer";
									break;
								end;
							end;
						end;
					end;
					if e == "Murderer" then
						table.insert(A, E);
					end;
				end;
			end;
		end;
		if #A > 0 then
			local e = l.Character and l.Character:FindFirstChild("HumanoidRootPart");
			if e then
				local l, E = nil, math.huge;
				for A, y in ipairs(A) do
					local a = y.Character and y.Character:FindFirstChild("HumanoidRootPart");
					if a then
						local A = ((a.Position - e.Position)).Magnitude;
						if A < E then
							E = A;
							l = y;
						end;
					end;
				end;
				return l;
			end;
			return A[1];
		end;
		return nil;
	end;
_G.AIM_IS_VISIBLE = function(e, A)
		if not _G.AIM_WALL then
			return true;
		end;
		if not e or not A or not A.Character then
			return false;
		end;
		local E = {};
		if l.Character then
			table.insert(E, l.Character);
		end;
		table.insert(E, A.Character);
		local y = RaycastParams.new();
		y.FilterType = Enum.RaycastFilterType.Exclude;
		y.FilterDescendantsInstances = E;
		y.IgnoreWater = true;
		local a = workspace.CurrentCamera.CFrame.Position;
		local W = {
				"Head",
				"UpperTorso",
				"Torso",
				"HumanoidRootPart",
			};
		local U = 0;
		local t = 0;
		for e, l in ipairs(W) do
			local E = A.Character:FindFirstChild(l);
			if E then
				t = t + 1;
				local e = workspace:Raycast(a, E.Position - a, y);
				if not e then
					U = U + 1;
				end;
			end;
		end;
		if t == 0 then
			return true;
		end;
		return U >= ((t > 2 and 2 or 1));
	end;
_G.AIM_IN_FOV = function(e)
		if not _G.AIM_FOV_ON then
			return true;
		end;
		local A = workspace.CurrentCamera;
		if not A then
			return true;
		end;
		local l, E = A:WorldToViewportPoint(e);
		if not E then
			return false;
		end;
		local y = A.ViewportSize;
		local a = Vector2.new(y.X / 2, y.Y / 2);
		local W = ((Vector2.new(l.X, l.Y) - a)).Magnitude;
		return W <= _G.AIM_FOV_RADIUS;
	end;
_G.AIM_UPDATE_FOV = function()
		if not _G.AIM_FOV_ON then
			if _G.AIM_FOV_CIRCLE then
				_G.AIM_FOV_CIRCLE.Visible = false;
			end;
			return;
		end;
		if not _G.AIM_FOV_CIRCLE then
			local e = Instance.new("Frame");
			e.Name = "@AIM_FOV";
			e.AnchorPoint = Vector2.new(.5, .5);
			e.Position = UDim2.new(.5, 0, .5, 0);
			e.Size = UDim2.new(0, _G.AIM_FOV_RADIUS * 2, 0, _G.AIM_FOV_RADIUS * 2);
			e.BackgroundTransparency = 1;
			e.BorderSizePixel = 0;
			e.ZIndex = 9999;
			local A = Instance.new("UIStroke");
			A.Color = Color3.fromRGB(0, 255, 120);
			A.Thickness = 2;
			A.Transparency = 0;
			A.Parent = e;
			local l = Instance.new("UICorner");
			l.CornerRadius = UDim.new(1, 0);
			l.Parent = e;
			e.Parent = S;
			_G.AIM_FOV_CIRCLE = e;
		end;
		_G.AIM_FOV_CIRCLE.Visible = true;
		_G.AIM_FOV_CIRCLE.Size = UDim2.new(0, _G.AIM_FOV_RADIUS * 2, 0, _G.AIM_FOV_RADIUS * 2);
	end;
_G.UZIVERT_aim_loop = function(A)
		if not _G.AIM_ON then
			return;
		end;
		local l = tick();
		if l - _G.AIM_LAST_SEARCH > .1 then
			_G.AIM_LAST_SEARCH = l;
			if _G.AIM_SELECTED then
				if not _G.AIM_SELECTED.Character or not _G.AIM_SELECTED.Character:FindFirstChildOfClass("Humanoid") or (_G.AIM_SELECTED.Character:FindFirstChildOfClass("Humanoid")).Health <= 0 or not e:FindFirstChild(_G.AIM_SELECTED.Name) then
					_G.AIM_SELECTED = nil;
					_G.AIM_TARGET = _G.AIM_FIND_MURDERER();
				end;
			else
				_G.AIM_TARGET = _G.AIM_FIND_MURDERER();
			end;
		end;
		local E = _G.AIM_SELECTED or _G.AIM_TARGET;
		if not E or not E.Character then
			_G.AIM_LAST_POS = nil;
			return;
		end;
		local y;
		if _G.AIM_PART == "HumanoidRootPart" then
			y = E.Character:FindFirstChild("HumanoidRootPart");
		else
			y = E.Character:FindFirstChild("Head") or E.Character:FindFirstChild("HumanoidRootPart");
		end;
		if not y then
			_G.AIM_LAST_POS = nil;
			return;
		end;
		if _G.AIM_LAST_TARGET ~= E then
			_G.AIM_LAST_POS = nil;
			_G.AIM_LAST_TARGET = E;
		end;
		if not _G.AIM_IS_VISIBLE(y, E) then
			_G.AIM_LAST_POS = nil;
			return;
		end;
		local a = y.AssemblyLinearVelocity or Vector3.new();
		local W, U = 0, 0;
		if _G.AIM_HORIZ then
			W, U = a.X * _G.AIM_PRED, a.Z * _G.AIM_PRED;
		end;
		local t = Vector3.new(W, (a.Y * .3) * _G.AIM_PRED, U);
		local c = y.Position + t;
		if not _G.AIM_IN_FOV(c) then
			_G.AIM_LAST_POS = nil;
			return;
		end;
		local b = workspace.CurrentCamera;
		if _G.AIM_LAST_POS and _G.AIM_SMOOTH > 0 then
			local e = _G.AIM_SMOOTH / 100;
			local l;
			if e <= .001 then
				l = 1000;
			else
				l = math.clamp(24 * ((1 - e)) + 1, 1, 1000);
			end;
			local E = 1 - math.exp(-l * A);
			E = math.clamp(E, 0, 1);
			c = _G.AIM_LAST_POS:Lerp(c, E);
		end;
		_G.AIM_LAST_POS = c;
		b.CFrame = CFrame.lookAt(b.CFrame.Position, c, Vector3.new(0, 1, 0));
	end;
_G.UZIVERT_aim_con = a.RenderStepped:Connect(function(e)
		_G.UZIVERT_aim_loop(e);
	end);
_G.UZIVERT_AUTO_STAB_ON = false;
_G.UZIVERT_STAB_RANGO = 6;
_G.UZIVERT_AUTO_STAB_LOOP = a.Heartbeat:Connect(function()
		if not _G.UZIVERT_AUTO_STAB_ON then
			return;
		end;
		local A = l.Character;
		if not A then
			return;
		end;
		local E = A:FindFirstChild("HumanoidRootPart");
		if not E then
			return;
		end;
		local y = A:FindFirstChild("Knife") or (l:FindFirstChild("Backpack") and l.Backpack:FindFirstChild("Knife"));
		if not y then
			return;
		end;
		for e, a in ipairs(e:GetPlayers()) do
			if a ~= l and a.Character then
				local e = a.Character:FindFirstChild("HumanoidRootPart");
				local W = a.Character:FindFirstChildOfClass("Humanoid");
				if e and (W and W.Health > 0) then
					local a = ((E.Position - e.Position)).Magnitude;
					if a <= _G.UZIVERT_STAB_RANGO then
						if y.Parent == l.Backpack then
							local e = A:FindFirstChildOfClass("Humanoid");
							if e then
								e:EquipTool(y);
							end;
							task.wait(.05);
						end;
						if y.Events and (y.Events:FindFirstChild("KnifeStabbed") and y.Events:FindFirstChild("HandleTouched")) then
							pcall(function()
								y.Events.KnifeStabbed:FireServer();
								y.Events.HandleTouched:FireServer(e);
							end);
						end;
					end;
				end;
			end;
		end;
	end);
_G.UZIVERT_MODO_NOCHE_ON = false;
_G.UZIVERT_NOCHE_SNAP = {};
_G.UZIVERT_MODO_NOCHE = function(e)
		_G.UZIVERT_MODO_NOCHE_ON = e;
		if e then
			_G.UZIVERT_NOCHE_SNAP.GlobalShadows = U.GlobalShadows;
			_G.UZIVERT_NOCHE_SNAP.Brightness = U.Brightness;
			_G.UZIVERT_NOCHE_SNAP.ClockTime = U.ClockTime;
			_G.UZIVERT_NOCHE_SNAP.OutdoorAmbient = U.OutdoorAmbient;
			_G.UZIVERT_NOCHE_SNAP.Ambient = U.Ambient;
			_G.UZIVERT_NOCHE_SNAP.FogColor = U.FogColor;
			_G.UZIVERT_NOCHE_SNAP.FogEnd = U.FogEnd;
			_G.UZIVERT_NOCHE_SNAP.ColorShift_Top = U.ColorShift_Top;
			_G.UZIVERT_NOCHE_SNAP.ColorShift_Bottom = U.ColorShift_Bottom;
			U.GlobalShadows = true;
			U.Brightness = 2;
			U.ClockTime = 0;
			U.OutdoorAmbient = Color3.fromRGB(40, 50, 70);
			U.Ambient = Color3.fromRGB(20, 25, 35);
			U.FogColor = Color3.fromRGB(15, 20, 30);
			U.FogEnd = 2000;
			U.ColorShift_Top = Color3.fromRGB(160, 180, 240);
			U.ColorShift_Bottom = Color3.fromRGB(25, 40, 60);
			local e = Instance.new("BloomEffect");
			e.Name = "UzivertNocheBloom";
			e.Intensity = .6;
			e.Size = 40;
			e.Threshold = .2;
			e.Parent = U;
			local A = Instance.new("BlurEffect");
			A.Name = "UzivertNocheBlur";
			A.Size = 2;
			A.Parent = U;
			print("\240\159\140\153 Modo Noche ON");
		else
			if _G.UZIVERT_NOCHE_SNAP.GlobalShadows ~= nil then
				U.GlobalShadows = _G.UZIVERT_NOCHE_SNAP.GlobalShadows;
			end;
			if _G.UZIVERT_NOCHE_SNAP.Brightness then
				U.Brightness = _G.UZIVERT_NOCHE_SNAP.Brightness;
			end;
			if _G.UZIVERT_NOCHE_SNAP.ClockTime then
				U.ClockTime = _G.UZIVERT_NOCHE_SNAP.ClockTime;
			end;
			if _G.UZIVERT_NOCHE_SNAP.OutdoorAmbient then
				U.OutdoorAmbient = _G.UZIVERT_NOCHE_SNAP.OutdoorAmbient;
			end;
			if _G.UZIVERT_NOCHE_SNAP.Ambient then
				U.Ambient = _G.UZIVERT_NOCHE_SNAP.Ambient;
			end;
			if _G.UZIVERT_NOCHE_SNAP.FogColor then
				U.FogColor = _G.UZIVERT_NOCHE_SNAP.FogColor;
			end;
			if _G.UZIVERT_NOCHE_SNAP.FogEnd then
				U.FogEnd = _G.UZIVERT_NOCHE_SNAP.FogEnd;
			end;
			if _G.UZIVERT_NOCHE_SNAP.ColorShift_Top then
				U.ColorShift_Top = _G.UZIVERT_NOCHE_SNAP.ColorShift_Top;
			end;
			if _G.UZIVERT_NOCHE_SNAP.ColorShift_Bottom then
				U.ColorShift_Bottom = _G.UZIVERT_NOCHE_SNAP.ColorShift_Bottom;
			end;
			local e = U:FindFirstChild("UzivertNocheBloom");
			if e then
				e:Destroy();
			end;
			local A = U:FindFirstChild("UzivertNocheBlur");
			if A then
				A:Destroy();
			end;
			print("\226\152\128\239\184\143 Modo Noche OFF");
		end;
	end;
local function HB()
	local e = l.Character;
	if not e then
		return false;
	end;
	for e, A in ipairs(e:GetChildren()) do
		if A:IsA("Tool") and ((A.Name == "Knife" or (A.Name:lower()):find("knife"))) then
			return true;
		end;
	end;
	local A = l:FindFirstChild("Backpack");
	if A and A:FindFirstChild("Knife") then
		return true;
	end;
	return false;
end;
local function sB()
	local e = l.Character;
	if not e then
		return false;
	end;
	for e, A in ipairs(e:GetChildren()) do
		if A:IsA("Tool") and ((A.Name == "Gun" or A.Name == "Revolver")) then
			return true;
		end;
	end;
	local A = l:FindFirstChild("Backpack");
	if A and ((A:FindFirstChild("Gun") or A:FindFirstChild("Revolver"))) then
		return true;
	end;
	return false;
end;
_G.UZIVERT_MATAR_SHERIFF = function()
		if not HB() then
			print("\226\157\140 No sos Murderer");
			return;
		end;
		local e = l.Character;
		if not e then
			return;
		end;
		local A = e:FindFirstChild("Knife") or (l:FindFirstChild("Backpack") and l.Backpack:FindFirstChild("Knife"));
		if not A then
			print("\226\157\140 No ten\195\169s Knife");
			return;
		end;
		local E = wB();
		if not E or not E.Character then
			print("\226\157\140 No hay Sheriff");
			return;
		end;
		if A.Parent == l.Backpack then
			local l = e:FindFirstChildOfClass("Humanoid");
			if l then
				l:EquipTool(A);
			end;
			task.wait(.1);
		end;
		local y = E.Character:FindFirstChild("HumanoidRootPart");
		if y then
			pcall(function()
				A.Events.KnifeStabbed:FireServer();
				A.Events.HandleTouched:FireServer(y);
			end);
			print("\240\159\146\128 Sheriff muerto: " .. E.Name);
		end;
	end;
local function pB()
	local e = l.Character;
	if not e then
		return true;
	end;
	local A = e:FindFirstChild("HumanoidRootPart");
	if not A then
		return true;
	end;
	return A.Position.Y < -50000;
end;
local iB = {
		Murderer = Color3.fromRGB(255, 30, 30),
		Sheriff = Color3.fromRGB(30, 140, 255),
		Innocent = Color3.fromRGB(30, 255, 120),
		Hero = Color3.fromRGB(255, 255, 0),
		Lobby = Color3.fromRGB(150, 150, 150),
		Zombie = Color3.fromRGB(35, 110, 35),
		Survivor = Color3.fromRGB(0, 60, 120),
	};
local YB = {};
local function TB(e)
	if e == l then
		return;
	end;
	local A = e.Character;
	if not A then
		return;
	end;
	local E = A:FindFirstChildOfClass("Humanoid");
	if not E or E.Health <= 0 then
		return;
	end;
	local y = "Lobby";
	if zB and zB[e.Name] then
		y = zB[e.Name];
		if y == "" then
			y = "Lobby";
		end;
	end;
	local a = iB[y] or iB.Lobby;
	local W = YB[e.Name];
	if not W or not W.Highlight or not W.Highlight.Parent or W.Highlight.Adornee ~= A then
		if W and W.Highlight then
			pcall(function()
				W.Highlight:Destroy();
			end);
		end;
		local l = Instance.new("Highlight");
		l.Name = "ESP_Highlight";
		l.Adornee = A;
		l.Parent = A;
		l.FillColor = a;
		l.FillTransparency = .35;
		l.OutlineColor = a;
		l.OutlineTransparency = 0;
		l.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
		YB[e.Name] = { Highlight = l, ColorAnterior = a };
		return;
	end;
	if W.ColorAnterior ~= a then
		W.Highlight.FillColor = a;
		W.Highlight.OutlineColor = a;
		W.ColorAnterior = a;
	end;
	if W.Highlight.Adornee ~= A then
		W.Highlight.Adornee = A;
	end;
end;
local function uB()
	for e, A in pairs(YB) do
		if A.Highlight then
			pcall(function()
				A.Highlight:Destroy();
			end);
		end;
	end;
	YB = {};
end;
e.PlayerRemoving:Connect(function(e)
	local A = YB[e.Name];
	if A and A.Highlight then
		pcall(function()
			A.Highlight:Destroy();
		end);
	end;
	YB[e.Name] = nil;
end);
e.PlayerAdded:Connect(function(e)
	e.CharacterAdded:Connect(function()
		local A = YB[e.Name];
		if A and A.Highlight then
			pcall(function()
				A.Highlight:Destroy();
			end);
		end;
		YB[e.Name] = nil;
	end);
end);
task.spawn(function()
	while task.wait(.3) do
		if V then
			for e, A in ipairs(e:GetPlayers()) do
				if A ~= l and A.Character then
					TB(A);
				end;
			end;
		end;
	end;
end);
local PB = {};
local function NB()
	for e, A in pairs(e:GetPlayers()) do
		local l = A:FindFirstChild("Backpack");
		local E = A.Character;
		if l and ((l:FindFirstChild("Gun") or l:FindFirstChild("Revolver"))) then
			return A, "equipada";
		end;
		if E and ((E:FindFirstChild("Gun") or E:FindFirstChild("Revolver"))) then
			return A, "equipada";
		end;
	end;
	return nil, nil;
end;
local function MB()
	local e = workspace:FindFirstChild("GunDrop", true);
	if e then
		return e;
	end;
	for e, A in ipairs(workspace:GetDescendants()) do
		if A.Name == "GunDrop" then
			return A;
		end;
	end;
	return nil;
end;
_G.UZIVERT_AUTO_GET_GUN_ON = false;
_G.UZIVERT_AGARRAR_GUN = function()
		pcall(function()
			local e = l.Character;
			if not e then
				return;
			end;
			local A = e:FindFirstChild("HumanoidRootPart");
			if not A then
				return;
			end;
			if HB() then
				return;
			end;
			if sB() then
				return;
			end;
			local E = workspace:FindFirstChild("GunDrop");
			if not E then
				for e, A in ipairs(workspace:GetChildren()) do
					if A.Name == "GunDrop" then
						E = A;
						break;
					end;
					local l = A:FindFirstChild("GunDrop");
					if l then
						E = l;
						break;
					end;
				end;
			end;
			if not E then
				return;
			end;
			firetouchinterest(A, E, 0);
			task.wait();
			firetouchinterest(A, E, 1);
		end);
	end;
_G.UZIVERT_AUTO_GET_GUN_LOOP = task.spawn(function()
		while task.wait(.1) do
			if not _G.UZIVERT_AUTO_GET_GUN_ON then
				continue;
			end;
			_G.UZIVERT_AGARRAR_GUN();
		end;
	end);
_G.UZIVERT_GUN_AURA_ON = false;
_G.UZIVERT_GUN_AURA_RANGO = d.GunAuraRango or 25;
_G.UZIVERT_GUN_AURA_LOOP = task.spawn(function()
		while task.wait(.5) do
			if not _G.UZIVERT_GUN_AURA_ON then
				continue;
			end;
			if HB() or sB() then
				continue;
			end;
			local e = l.Character;
			if not e then
				continue;
			end;
			local A = e:FindFirstChild("HumanoidRootPart");
			if not A then
				continue;
			end;
			local E = workspace:FindFirstChild("GunDrop");
			if not E then
				for e, A in ipairs(workspace:GetChildren()) do
					if A.Name == "GunDrop" then
						E = A;
						break;
					end;
					local l = A:FindFirstChild("GunDrop");
					if l then
						E = l;
						break;
					end;
				end;
			end;
			if not E then
				continue;
			end;
			local y;
			if E:IsA("BasePart") then
				y = E.Position;
			elseif E:FindFirstChild("Handle") then
				y = E.Handle.Position;
			end;
			if not y then
				continue;
			end;
			local a = ((A.Position - y)).Magnitude;
			if a <= _G.UZIVERT_GUN_AURA_RANGO then
				pcall(function()
					if E:IsA("BasePart") then
						E.CanCollide = false;
						E.CFrame = A.CFrame;
						E.Velocity = Vector3.new(0, 0, 0);
						E.RotVelocity = Vector3.new(0, 0, 0);
					elseif E:FindFirstChild("Handle") then
						E.Handle.CanCollide = false;
						E.Handle.CFrame = A.CFrame;
						E.Handle.Velocity = Vector3.new(0, 0, 0);
						E.Handle.RotVelocity = Vector3.new(0, 0, 0);
					end;
				end);
			end;
		end;
	end);
_G.UZIVERT_SA_ON = d.SilentAim or false;
_G.UZIVERT_SA_AUTO_PING = d.SilentAutoPing ~= false;
_G.UZIVERT_SA_MULTI = d.SilentMultiPoint ~= false;
_G.UZIVERT_SA_ANTIHACK = d.SilentAntiHack ~= false;
_G.UZIVERT_SA_OFF_X = d.SilentOffX or 0;
_G.UZIVERT_SA_OFF_Y = d.SilentOffY or -0.1;
_G.UZIVERT_SA_OFF_Z = d.SilentOffZ or 0;
_G.UZIVERT_SA_PRED_H = d.SilentPredH or 1.5;
_G.UZIVERT_SA_PRED_V = d.SilentPredV or .5;
_G.UZIVERT_SA_MAX_SIM = d.SilentMaxSim or .08;
_G.UZIVERT_SA_PRED_PING = d.SilentPredPing or .06;
_G.UZIVERT_SA_TARGET = nil;
_G.UZIVERT_SA_ORIGIN = nil;
_G.UZIVERT_SA_REMOTE = nil;
local XB = {
		{
			Ping = 20,
			Sim = 52,
			Interval = 70,
			H = 156,
			V = 146,
			X = -5,
			Y = -14,
			Z = 0,
		},
		{
			Ping = 50,
			Sim = 60,
			Interval = 66,
			H = 166,
			V = 156,
			X = -6,
			Y = -14,
			Z = 0,
		},
		{
			Ping = 100,
			Sim = 72,
			Interval = 60,
			H = 180,
			V = 170,
			X = -8,
			Y = -15,
			Z = 0,
		},
		{
			Ping = 150,
			Sim = 82,
			Interval = 64,
			H = 188,
			V = 176,
			X = -9,
			Y = -12,
			Z = 0,
		},
		{
			Ping = 200,
			Sim = 94,
			Interval = 70,
			H = 198,
			V = 184,
			X = -10,
			Y = -11,
			Z = 0,
		},
		{
			Ping = 250,
			Sim = 104,
			Interval = 74,
			H = 206,
			V = 192,
			X = -11,
			Y = -10,
			Z = 0,
		},
		{
			Ping = 300,
			Sim = 114,
			Interval = 78,
			H = 214,
			V = 200,
			X = -12,
			Y = -9,
			Z = 0,
		},
		{
			Ping = 350,
			Sim = 124,
			Interval = 82,
			H = 222,
			V = 206,
			X = -13,
			Y = -8,
			Z = 0,
		},
		{
			Ping = 450,
			Sim = 138,
			Interval = 86,
			H = 232,
			V = 214,
			X = -14,
			Y = -7,
			Z = 0,
		},
	};
_G.UZNOIR_CFG = {
		adaptive = true,
		fixedLead = .075,
		extraLead = _G.UZIVERT_SA_PRED or .02,
		prioritizePing = _G.UZIVERT_SA_AUTO_PING ~= false,
		predictJump = true,
		predictLag = true,
		maxSimulationMs = math.floor(((_G.UZIVERT_SA_MAX_SIM or .18)) * 1000),
		predictionIntervalMs = 72,
		manualPingMs = 80,
		offsetX = 0,
		offsetY = 0,
		offsetZ = 0,
		horizontalMultiplier = 100,
		verticalMultiplier = 100,
		hitPart = "Head",
	};
_G.UZNOIR_cachedPing = .05;
_G.UZNOIR_lastAutoTune = 0;
local function LB()
	pcall(function()
		local e = W:FindFirstChild("Network");
		local A = e and e:FindFirstChild("ServerStatsItem");
		local l = A and A:FindFirstChild("Data Ping");
		if l then
			local e = l:GetValue() / 1000;
			if e > 0 and e < 2 then
				_G.UZNOIR_cachedPing = _G.UZNOIR_cachedPing * .7 + e * .3;
			end;
		end;
	end);
end;
local function FB()
	return math.clamp(math.floor(_G.UZNOIR_cachedPing * 1000 + .5), 5, 1000);
end;
local function gB(e)
	local A, l, E;
	A, l = XB[1], XB[1];
	if e >= XB[#XB].Ping then
		A, l = XB[#XB], XB[#XB];
	elseif e > A.Ping then
		for y = 1, #XB - 1, 1 do
			if e <= XB[y + 1].Ping then
				A, l = XB[y], XB[y + 1];
				E = ((e - A.Ping)) / ((l.Ping - A.Ping));
				E = (E * E) * ((3 - 2 * E));
				break;
			end;
		end;
	end;
	E = E or 0;
	local function y(e)
		return math.floor((A[e] + ((l[e] - A[e])) * E) + .5);
	end;
	return {
		Sim = y("Sim"),
		Interval = y("Interval"),
		H = y("H"),
		V = y("V"),
		X = y("X"),
		Y = y("Y"),
		Z = y("Z"),
	};
end;
local function QB()
	local e = os.clock();
	if e - _G.UZNOIR_lastAutoTune < .4 then
		return;
	end;
	_G.UZNOIR_lastAutoTune = e;
	local A = FB();
	local l = gB(A);
	local E = _G.UZNOIR_CFG;
	E.maxSimulationMs = l.Sim;
	E.predictionIntervalMs = l.Interval;
	E.offsetX, E.offsetY, E.offsetZ = l.X, l.Y, l.Z;
	E.horizontalMultiplier, E.verticalMultiplier = l.H, l.V;
	E.manualPingMs = A;
end;
local function nB()
	local e = _G.UZNOIR_CFG;
	local A = e.prioritizePing and _G.UZNOIR_cachedPing or (e.manualPingMs / 1000);
	local l;
	if e.adaptive then
		l = (A + e.extraLead) + A * .06;
		if e.predictLag then
			local E = math.clamp(e.predictionIntervalMs / 2000, 0, .05);
			l = (l + E) + math.max(0, A - .1) * .22;
		end;
	else
		l = e.fixedLead;
	end;
	local E = e.maxSimulationMs / 1000;
	if e.adaptive then
		E = math.min(.52, E + math.clamp(A - .1, 0, .4) * .62);
	end;
	return math.clamp(l, .02, E);
end;
local hB = nil;
local KB = {};
local rB = Vector3.zero;
local ZB = Vector3.zero;
local function fB(e, A)
	A = A or _G.UZNOIR_CFG;
	local l = os.clock();
	if hB ~= e then
		hB = e;
		KB = {};
		rB = e.AssemblyLinearVelocity;
		ZB = Vector3.zero;
	end;
	local E = KB[#KB];
	if not E or l - E.time >= math.max(.016, A.predictionIntervalMs / 1000) then
		KB[#KB + 1] = { position = e.Position, time = l };
		while #KB > 8 or (#KB > 2 and l - KB[1].time > .35) do
			table.remove(KB, 1);
		end;
		if #KB >= 2 then
			local e = KB[1];
			local A = KB[#KB];
			local y = A.time - e.time;
			if y > .015 then
				local a = ((A.position - e.position)) / y;
				if a.Magnitude < 150 then
					local e = rB;
					rB = rB:Lerp(a, .55);
					local A = E and math.max(l - E.time, .016) or y;
					local W = ((rB - e)) / A;
					if W.Magnitude < 120 then
						ZB = ZB:Lerp(W, .25);
					else
						ZB = Vector3.zero;
					end;
				end;
			end;
		end;
	end;
end;
local function RB(e)
	fB(e);
	local A = _G.UZNOIR_CFG;
	local l = e.AssemblyLinearVelocity;
	local E = l;
	local y = Vector3.zero;
	if A.predictLag and (hB == e and #KB >= 2) then
		local e = ((l - rB)).Magnitude;
		local A = math.clamp(.75 - e / 120, .35, .75);
		E = l:Lerp(rB, A);
		y = ZB;
	end;
	local a = A.horizontalMultiplier / 100;
	local W = A.verticalMultiplier / 100;
	local U = nB();
	local t = Vector3.new((E.X * a) * U, 0, (E.Z * a) * U);
	if A.predictLag then
		local e = Vector3.new(y.X, 0, y.Z);
		t = t + e * (((.5 * U) * U));
	end;
	if A.predictJump then
		local A = U * W;
		local l = E.Y * A;
		local y = e.Parent and e.Parent:FindFirstChildWhichIsA("Humanoid");
		local a = false;
		if y then
			local e = y:GetState();
			a = y.FloorMaterial == Enum.Material.Air or e == Enum.HumanoidStateType.Freefall or e == Enum.HumanoidStateType.Jumping or math.abs(E.Y) > 6;
		else
			a = math.abs(E.Y) > 6;
		end;
		if a then
			l = l - ((.5 * Workspace.Gravity) * A) * A;
		end;
		t = t + Vector3.new(0, l, 0);
	end;
	if t.Magnitude > 26 then
		t = t.Unit * 26;
	end;
	local c = Vector3.new((e.Size.X * A.offsetX) / 100, (e.Size.Y * A.offsetY) / 100, (e.Size.Z * A.offsetZ) / 100);
	return (e.Position + t) + c;
end;
_G.UZIVERT_SA_FIND = function()
		for A, l in pairs(zB) do
			if l == "Murderer" then
				return e:FindFirstChild(A);
			end;
		end;
		return nil;
	end;
_G.UZIVERT_SA_GET_REMOTE = function()
		local e = l.Character;
		if not e then
			return nil;
		end;
		local A = e:FindFirstChild("Gun") or e:FindFirstChild("Revolver");
		if A then
			local e = A:FindFirstChild("Shoot", true);
			if e then
				return e;
			end;
		end;
		local E = l:FindFirstChild("Backpack");
		if E then
			A = E:FindFirstChild("Gun") or E:FindFirstChild("Revolver");
			if A then
				local e = A:FindFirstChild("Shoot", true);
				if e then
					return e;
				end;
			end;
		end;
		return nil;
	end;
_G.UZIVERT_SA_LOOP = a.RenderStepped:Connect(function(e)
		if not _G.UZIVERT_SA_ON then
			return;
		end;
		_G.UZIVERT_SA_REMOTE = _G.UZIVERT_SA_GET_REMOTE();
		local A = l.Character;
		if A then
			local e = A:FindFirstChild("HumanoidRootPart");
			if e then
				_G.UZIVERT_SA_ORIGIN = e.CFrame;
			end;
		end;
		local E = _G.UZIVERT_SA_FIND();
		if not E or not E.Character then
			_G.UZIVERT_SA_TARGET = nil;
			return;
		end;
		local y = E.Character;
		local a = y:FindFirstChildOfClass("Humanoid");
		if not a or a.Health <= 0 then
			_G.UZIVERT_SA_TARGET = nil;
			return;
		end;
		local W;
		if _G.UZNOIR_CFG.hitPart == "Head" then
			W = y:FindFirstChild("Head") or y:FindFirstChild("HumanoidRootPart");
		else
			W = y:FindFirstChild("HumanoidRootPart") or y:FindFirstChild("Head");
		end;
		if not W then
			_G.UZIVERT_SA_TARGET = nil;
			return;
		end;
		local U = RB(W);
		if _G.UZIVERT_SA_MULTI then
			local e = .25;
			_G.UZIVERT_SA_TARGET = {
					CFrame.new(U),
					CFrame.new(U + Vector3.new(0, e, 0)),
					CFrame.new(U + Vector3.new(0, -e, 0)),
					CFrame.new(U + Vector3.new(e, 0, 0)),
					CFrame.new(U + Vector3.new(-e, 0, 0)),
					CFrame.new(U + Vector3.new(0, 0, e)),
					CFrame.new(U + Vector3.new(0, 0, -e)),
				};
		else
			_G.UZIVERT_SA_TARGET = { CFrame.new(U) };
		end;
	end);
task.spawn(function()
	while task.wait(.5) do
		LB();
		QB();
	end;
end);
_G.UZIVERT_KNIFE_REMOTE = nil;
_G.UZIVERT_KNIFE_AIM = nil;
_G.UZIVERT_KNIFE_ORIGIN = nil;
_G.UZIVERT_KNIFE_INSTANT_LAST = 0;
task.spawn(function()
	while task.wait(.25) do
		local e = l.Character;
		local A;
		if e then
			A = e:FindFirstChild("Knife");
		end;
		if not A then
			local e = l:FindFirstChild("Backpack");
			A = e and e:FindFirstChild("Knife");
		end;
		if A then
			local e;
			for A, l in ipairs(A:GetDescendants()) do
				if l:IsA("RemoteEvent") and l.Name == "KnifeThrown" then
					e = l;
					break;
				end;
			end;
			_G.UZIVERT_KNIFE_REMOTE = e;
		else
			_G.UZIVERT_KNIFE_REMOTE = nil;
		end;
	end;
end);
local function DB(e)
	if typeof(e) ~= "Instance" then
		return false;
	end;
	if e.ClassName ~= "RemoteEvent" then
		return false;
	end;
	if not ((_G.UZIVERT_KNIFE_INSTANT or _G.UZIVERT_KNIFE_FAST)) then
		return false;
	end;
	local A = tick();
	if A - _G.UZIVERT_KNIFE_INSTANT_LAST < .48 then
		return true;
	end;
	return false;
end;
if not _G.UZIVERT_SA_HOOKED then
	_G.UZIVERT_SA_HOOKED = true;
	pcall(function()
		local e = getrawmetatable(game);
		local A = e.__namecall;
		setreadonly(e, false);
		e.__namecall = newcclosure(function(e, ...)
				local l = getnamecallmethod();
				if l == "FireServer" then
					if DB(e) then
						return;
					end;
					if _G.UZIVERT_SA_ON and (_G.UZIVERT_SA_REMOTE and e == _G.UZIVERT_SA_REMOTE) then
						if not _G.UZIVERT_SA_TARGET or not _G.UZIVERT_SA_TARGET[1] then
							return A(e, ...);
						end;
						local l = { ... };
						if #l >= 2 then
							for E, y in ipairs(_G.UZIVERT_SA_TARGET) do
								l[2] = y;
								A(e, unpack(l));
							end;
						end;
						return;
					end;
					if _G.UZIVERT_KNIFE_SA and (_G.UZIVERT_KNIFE_REMOTE and e == _G.UZIVERT_KNIFE_REMOTE) then
						if not _G.UZIVERT_KNIFE_AIM or not _G.UZIVERT_KNIFE_ORIGIN then
							return A(e, ...);
						end;
						local l = { ... };
						if #l >= 2 and typeof(l[1]) == "CFrame" then
							l[1] = CFrame.lookAt(_G.UZIVERT_KNIFE_ORIGIN, _G.UZIVERT_KNIFE_AIM);
							l[2] = CFrame.new(_G.UZIVERT_KNIFE_AIM);
						end;
						return A(e, unpack(l));
					end;
				end;
				return A(e, ...);
			end);
		setreadonly(e, true);
	end);
	print("\240\159\142\175 [HOOK UNIFICADO Gun+Knife] activado");
end;
local function GB(e, A)
	if not e then
		return;
	end;
	if e:FindFirstChild("GunESP_Highlight") then
		return;
	end;
	local l = Instance.new("Highlight");
	l.Name = "GunESP_Highlight";
	l.Parent = e;
	l.Adornee = e;
	l.FillColor = Color3.fromRGB(30, 140, 255);
	l.FillTransparency = .4;
	l.OutlineColor = Color3.fromRGB(255, 255, 255);
	l.OutlineTransparency = 0;
	l.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
	table.insert(PB, l);
	if not e:FindFirstChild("GunESP_Billboard") then
		local l = Instance.new("BillboardGui");
		l.Name = "GunESP_Billboard";
		l.Size = UDim2.new(0, 100, 0, 30);
		l.StudsOffset = Vector3.new(0, 2, 0);
		l.AlwaysOnTop = true;
		l.Parent = e;
		local E = Instance.new("TextLabel");
		E.Name = "DistanciaLabel";
		E.Size = UDim2.new(1, 0, 1, 0);
		E.BackgroundTransparency = 1;
		E.Text = A and "Dropped Gun!" or "Gun";
		E.TextColor3 = A and Color3.fromRGB(255, 225, 0) or Color3.fromRGB(30, 140, 255);
		E.TextStrokeTransparency = 0;
		E.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		E.Font = Enum.Font.GothamBold;
		E.TextSize = 14;
		E.Parent = l;
	end;
end;
local function BB()
	for e, A in ipairs(PB) do
		if A and A.Parent then
			A:Destroy();
		end;
	end;
	PB = {};
	for e, A in ipairs(workspace:GetDescendants()) do
		local l = A:FindFirstChild("GunESP_Billboard");
		if l then
			l:Destroy();
		end;
	end;
end;
task.spawn(function()
	while task.wait(.3) do
		if not H then
			BB();
			continue;
		end;
		local e, A = NB();
		if e and e.Character then
			local A = e.Character:FindFirstChild("Gun") or e.Character:FindFirstChild("Revolver");
			if A then
				GB(A, false);
			end;
		end;
		local l = MB();
		if l then
			GB(l, true);
		end;
	end;
end);
local SB = 60;
local CB = 60;
local IB = 0;
local jB = "Fallback";
local OB = -math.huge;
local JB = -math.huge;
local qB = .4;
local oB = 5;
local function vB(e)
	return type(e) == "number" and (e == e and (e > -math.huge and e < math.huge));
end;
local function ey()
	local e = W:FindFirstChild("Network");
	local A = e and e:FindFirstChild("ServerStatsItem");
	local l = A and A:FindFirstChild("Data Ping");
	return l and l:GetValue();
end;
local function Ay()
	local e = W:FindFirstChild("PerformanceStats");
	local A = e and e:FindFirstChild("Ping");
	return A and A:GetValue();
end;
local function ly()
	local e = l:GetNetworkPing();
	if vB(e) then
		return e * 1000;
	end;
end;
local Ey = { { ey, "Data Ping" }, { Ay, "Performance" }, { ly, "Network" } };
local function yy()
	pcall(function()
		local e = os.clock();
		if e - OB < qB then
			return;
		end;
		OB = e;
		local A;
		for e, l in ipairs(Ey) do
			local E, y = pcall(l[1]);
			if E and (vB(y) and y > 0) then
				A = y;
				jB = l[2];
				break;
			end;
		end;
		if not A then
			return;
		end;
		local l = e - JB;
		local E = math.clamp(math.floor(A + .5), 5, 1200);
		if l > oB then
			CB = E;
			IB = 0;
		else
			local e = l / qB;
			IB = IB + ((math.abs(E - SB) - IB)) * ((1 - .75 ^ e));
			local A = math.abs(E - CB) > 40 and .6 or .25;
			A = 1 - ((1 - A)) ^ e;
			CB = CB + ((E - CB)) * A;
		end;
		SB = E;
		JB = e;
	end);
end;
local function ay()
	return math.floor(CB + .5);
end;
print("\240\159\142\131 Parte 3/10 cargada - Roles + ESP + Ping");
local Wy = {
		Default = nil,
		Vampire = {
			idle1 = "http://www.roblox.com/asset/?id=1083445855",
			idle2 = "http://www.roblox.com/asset/?id=1083450166",
			walk = "http://www.roblox.com/asset/?id=1083473930",
			run = "http://www.roblox.com/asset/?id=1083462077",
			jump = "http://www.roblox.com/asset/?id=1083455352",
			climb = "http://www.roblox.com/asset/?id=1083439238",
			fall = "http://www.roblox.com/asset/?id=1083443587",
			swim = "http://www.roblox.com/asset/?id=1083480626",
			swimidle = "http://www.roblox.com/asset/?id=1083477208",
			death = "http://www.roblox.com/asset/?id=1083445498",
		},
		Hero = {
			idle1 = "http://www.roblox.com/asset/?id=616111295",
			idle2 = "http://www.roblox.com/asset/?id=616113536",
			walk = "http://www.roblox.com/asset/?id=616122287",
			run = "http://www.roblox.com/asset/?id=616117076",
			jump = "http://www.roblox.com/asset/?id=616115533",
			climb = "http://www.roblox.com/asset/?id=616104706",
			fall = "http://www.roblox.com/asset/?id=616108001",
			swim = "http://www.roblox.com/asset/?id=616119391",
			swimidle = "http://www.roblox.com/asset/?id=616110827",
			death = "http://www.roblox.com/asset/?id=616109459",
		},
		Zombie = {
			idle1 = "http://www.roblox.com/asset/?id=616158929",
			idle2 = "http://www.roblox.com/asset/?id=616160636",
			walk = "http://www.roblox.com/asset/?id=616168032",
			run = "http://www.roblox.com/asset/?id=616163682",
			jump = "http://www.roblox.com/asset/?id=616161997",
			climb = "http://www.roblox.com/asset/?id=616156119",
			fall = "http://www.roblox.com/asset/?id=616157476",
			swim = "http://www.roblox.com/asset/?id=616165462",
			swimidle = "http://www.roblox.com/asset/?id=616159068",
			death = "http://www.roblox.com/asset/?id=616162593",
		},
		Ninja = {
			idle1 = "http://www.roblox.com/asset/?id=656117400",
			idle2 = "http://www.roblox.com/asset/?id=656118341",
			walk = "http://www.roblox.com/asset/?id=656121766",
			run = "http://www.roblox.com/asset/?id=656118852",
			jump = "http://www.roblox.com/asset/?id=656117878",
			climb = "http://www.roblox.com/asset/?id=656114359",
			fall = "http://www.roblox.com/asset/?id=656115606",
			swim = "http://www.roblox.com/asset/?id=656120249",
			swimidle = "http://www.roblox.com/asset/?id=656117506",
			death = "http://www.roblox.com/asset/?id=656114954",
		},
		Astronaut = {
			idle1 = "http://www.roblox.com/asset/?id=891621366",
			idle2 = "http://www.roblox.com/asset/?id=891633237",
			walk = "http://www.roblox.com/asset/?id=891667138",
			run = "http://www.roblox.com/asset/?id=891636393",
			jump = "http://www.roblox.com/asset/?id=891627522",
			climb = "http://www.roblox.com/asset/?id=891609353",
			fall = "http://www.roblox.com/asset/?id=891617961",
			swim = "http://www.roblox.com/asset/?id=891661529",
			swimidle = "http://www.roblox.com/asset/?id=891620272",
			death = "http://www.roblox.com/asset/?id=891615817",
		},
		Cartoon = {
			idle1 = "http://www.roblox.com/asset/?id=742637544",
			idle2 = "http://www.roblox.com/asset/?id=742638445",
			walk = "http://www.roblox.com/asset/?id=742640026",
			run = "http://www.roblox.com/asset/?id=742638842",
			jump = "http://www.roblox.com/asset/?id=742637942",
			climb = "http://www.roblox.com/asset/?id=742636889",
			fall = "http://www.roblox.com/asset/?id=742637151",
			swim = "http://www.roblox.com/asset/?id=742639702",
			swimidle = "http://www.roblox.com/asset/?id=742637601",
			death = "http://www.roblox.com/asset/?id=742637806",
		},
		Pirate = {
			idle1 = "http://www.roblox.com/asset/?id=750781874",
			idle2 = "http://www.roblox.com/asset/?id=750782770",
			walk = "http://www.roblox.com/asset/?id=750785693",
			run = "http://www.roblox.com/asset/?id=750783738",
			jump = "http://www.roblox.com/asset/?id=750782230",
			climb = "http://www.roblox.com/asset/?id=750779899",
			fall = "http://www.roblox.com/asset/?id=750780242",
			swim = "http://www.roblox.com/asset/?id=750784505",
			swimidle = "http://www.roblox.com/asset/?id=750781415",
			death = "http://www.roblox.com/asset/?id=750780242",
		},
		Werewolf = {
			idle1 = "http://www.roblox.com/asset/?id=1083195517",
			idle2 = "http://www.roblox.com/asset/?id=1083214717",
			walk = "http://www.roblox.com/asset/?id=1083178339",
			run = "http://www.roblox.com/asset/?id=1083216690",
			jump = "http://www.roblox.com/asset/?id=1083218792",
			climb = "http://www.roblox.com/asset/?id=1083182000",
			fall = "http://www.roblox.com/asset/?id=1083189019",
			swim = "http://www.roblox.com/asset/?id=1083203763",
			swimidle = "http://www.roblox.com/asset/?id=1083190006",
			death = "http://www.roblox.com/asset/?id=1083183276",
		},
		["OG Run"] = { run = "http://www.roblox.com/asset/?id=9801814462" },
		Jolly = {
			idle1 = "http://www.roblox.com/asset/?id=136145727878709",
			idle2 = "http://www.roblox.com/asset/?id=136145727878709",
			walk = "http://www.roblox.com/asset/?id=83277136078444",
			run = "http://www.roblox.com/asset/?id=124419804298310",
			jump = "http://www.roblox.com/asset/?id=122115816220842",
			climb = "http://www.roblox.com/asset/?id=107190574095036",
			fall = "http://www.roblox.com/asset/?id=85263802503331",
		},
		["Cute Kawaii"] = {
			idle1 = "http://www.roblox.com/asset/?id=72311682331639",
			idle2 = "http://www.roblox.com/asset/?id=72311682331639",
			walk = "http://www.roblox.com/asset/?id=107212872423561",
			run = "http://www.roblox.com/asset/?id=118582510545072",
			jump = "http://www.roblox.com/asset/?id=112952548321695",
			climb = "http://www.roblox.com/asset/?id=126383408493776",
			fall = "http://www.roblox.com/asset/?id=83307333809322",
		},
		["Doll 3.0"] = {
			idle1 = "http://www.roblox.com/asset/?id=83032187271383",
			idle2 = "http://www.roblox.com/asset/?id=83032187271383",
			walk = "http://www.roblox.com/asset/?id=78434960966537",
			run = "http://www.roblox.com/asset/?id=129768396663808",
			jump = "http://www.roblox.com/asset/?id=75369057994828",
			climb = "http://www.roblox.com/asset/?id=112371892133970",
			fall = "http://www.roblox.com/asset/?id=81027444073311",
		},
		["Victoria Model"] = {
			idle1 = "http://www.roblox.com/asset/?id=132069965396465",
			idle2 = "http://www.roblox.com/asset/?id=132069965396465",
			walk = "http://www.roblox.com/asset/?id=84814915379579",
			run = "http://www.roblox.com/asset/?id=84814915379579",
			jump = "http://www.roblox.com/asset/?id=78163261581163",
			climb = "http://www.roblox.com/asset/?id=87772134905508",
			fall = "http://www.roblox.com/asset/?id=110073924253388",
		},
		["Bike/Bicyclist"] = {
			idle1 = "http://www.roblox.com/asset/?id=126390120399173",
			idle2 = "http://www.roblox.com/asset/?id=136791517336633",
			walk = "http://www.roblox.com/asset/?id=98707881660541",
			run = "http://www.roblox.com/asset/?id=102775737211919",
			jump = "http://www.roblox.com/asset/?id=129144847881258",
			climb = "http://www.roblox.com/asset/?id=88267082364595",
			fall = "http://www.roblox.com/asset/?id=110684787086498",
		},
		Animal = {
			idle1 = "http://www.roblox.com/asset/?id=128838183008466",
			idle2 = "http://www.roblox.com/asset/?id=99689776099970",
			walk = "http://www.roblox.com/asset/?id=112238064449133",
			run = "http://www.roblox.com/asset/?id=97412731442167",
			jump = "http://www.roblox.com/asset/?id=123565665274439",
			climb = "http://www.roblox.com/asset/?id=75085836535654",
			fall = "http://www.roblox.com/asset/?id=124705831982259",
		},
		["It-Girl Essential Model"] = {
			idle1 = "http://www.roblox.com/asset/?id=132232079260125",
			idle2 = "http://www.roblox.com/asset/?id=102440789796215",
			walk = "http://www.roblox.com/asset/?id=86579666661215",
			run = "http://www.roblox.com/asset/?id=83336349930143",
			jump = "http://www.roblox.com/asset/?id=103382156539106",
			climb = "http://www.roblox.com/asset/?id=77385815954046",
			fall = "http://www.roblox.com/asset/?id=127262648208409",
		},
		Oldschool = {
			idle1 = "http://www.roblox.com/asset/?id=10921230744",
			idle2 = "http://www.roblox.com/asset/?id=10921232093",
			walk = "http://www.roblox.com/asset/?id=10921244891",
			run = "http://www.roblox.com/asset/?id=10921240218",
			jump = "http://www.roblox.com/asset/?id=10921242013",
			climb = "http://www.roblox.com/asset/?id=10921229866",
			fall = "http://www.roblox.com/asset/?id=10921241244",
		},
		Spider = {
			idle1 = "http://www.roblox.com/asset/?id=112316814377814",
			idle2 = "http://www.roblox.com/asset/?id=103439018552145",
			walk = "http://www.roblox.com/asset/?id=109976439277879",
			run = "http://www.roblox.com/asset/?id=119985832593347",
			jump = "http://www.roblox.com/asset/?id=87979233462906",
			climb = "http://www.roblox.com/asset/?id=119278342251995",
			fall = "http://www.roblox.com/asset/?id=71112238570777",
		},
		Joy = {
			idle1 = "http://www.roblox.com/asset/?id=119957475250242",
			idle2 = "http://www.roblox.com/asset/?id=101200477339169",
			walk = "http://www.roblox.com/asset/?id=112597572150963",
			run = "http://www.roblox.com/asset/?id=96521659811743",
			jump = "http://www.roblox.com/asset/?id=82500357520736",
			climb = "http://www.roblox.com/asset/?id=110061716873830",
			fall = "http://www.roblox.com/asset/?id=132095139090357",
		},
		["Flying Aura"] = {
			idle1 = "http://www.roblox.com/asset/?id=122426844584505",
			idle2 = "http://www.roblox.com/asset/?id=122426844584505",
			walk = "http://www.roblox.com/asset/?id=83077254246622",
			run = "http://www.roblox.com/asset/?id=77053251062908",
			jump = "http://www.roblox.com/asset/?id=125422018244301",
			climb = "http://www.roblox.com/asset/?id=95973965948476",
			fall = "http://www.roblox.com/asset/?id=109790195947848",
		},
		["FHA V2"] = {
			idle1 = "http://www.roblox.com/asset/?id=77320840005481",
			idle2 = "http://www.roblox.com/asset/?id=77320840005481",
			walk = "http://www.roblox.com/asset/?id=134493251445479",
			run = "http://www.roblox.com/asset/?id=122214533401932",
			jump = "http://www.roblox.com/asset/?id=80078165493816",
			climb = "http://www.roblox.com/asset/?id=114562994724647",
			fall = "http://www.roblox.com/asset/?id=98383265864436",
		},
		["Silent Nurse"] = {
			idle1 = "http://www.roblox.com/asset/?id=111047244862844",
			idle2 = "http://www.roblox.com/asset/?id=111047244862844",
			walk = "http://www.roblox.com/asset/?id=94196382152901",
			run = "http://www.roblox.com/asset/?id=94196382152901",
			jump = "http://www.roblox.com/asset/?id=106098057235980",
			climb = "http://www.roblox.com/asset/?id=108985375609705",
			fall = "http://www.roblox.com/asset/?id=131579609334755",
		},
		Supermodel = {
			idle1 = "http://www.roblox.com/asset/?id=91917730726110",
			idle2 = "http://www.roblox.com/asset/?id=91917730726110",
			walk = "http://www.roblox.com/asset/?id=90320132970213",
			run = "http://www.roblox.com/asset/?id=112051258179255",
			jump = "http://www.roblox.com/asset/?id=91931403363860",
			climb = "http://www.roblox.com/asset/?id=82728029306069",
			fall = "http://www.roblox.com/asset/?id=119173466228299",
		},
		["Enchanted Fairy"] = {
			idle1 = "http://www.roblox.com/asset/?id=73650178233095",
			idle2 = "http://www.roblox.com/asset/?id=73650178233095",
			walk = "http://www.roblox.com/asset/?id=94547195663763",
			run = "http://www.roblox.com/asset/?id=76909584337943",
			jump = "http://www.roblox.com/asset/?id=120533712803667",
			climb = "http://www.roblox.com/asset/?id=140663406485180",
			fall = "http://www.roblox.com/asset/?id=100947971756348",
		},
		Furry = {
			idle1 = "http://www.roblox.com/asset/?id=111821292044705",
			idle2 = "http://www.roblox.com/asset/?id=111821292044705",
			walk = "http://www.roblox.com/asset/?id=104011441852459",
			run = "http://www.roblox.com/asset/?id=87770060317862",
			jump = "http://www.roblox.com/asset/?id=102635582722041",
			climb = "http://www.roblox.com/asset/?id=76660530164497",
			fall = "http://www.roblox.com/asset/?id=137079985547592",
		},
		["Vlada Model"] = {
			idle1 = "http://www.roblox.com/asset/?id=100139116433530",
			idle2 = "http://www.roblox.com/asset/?id=100139116433530",
			walk = "http://www.roblox.com/asset/?id=77983757225444",
			run = "http://www.roblox.com/asset/?id=116717848244930",
			jump = "http://www.roblox.com/asset/?id=120751055172567",
			climb = "http://www.roblox.com/asset/?id=70966616077778",
			fall = "http://www.roblox.com/asset/?id=136118518255777",
		},
		["R6 Converter"] = {
			idle1 = "http://www.roblox.com/asset/?id=90040240627854",
			idle2 = "http://www.roblox.com/asset/?id=90040240627854",
			walk = "http://www.roblox.com/asset/?id=92149852708428",
			run = "http://www.roblox.com/asset/?id=72259383092959",
			jump = "http://www.roblox.com/asset/?id=130519980521511",
			climb = "http://www.roblox.com/asset/?id=80369171706383",
			fall = "http://www.roblox.com/asset/?id=130011792193300",
		},
		Mage = {
			idle1 = "http://www.roblox.com/asset/?id=707742142",
			idle2 = "http://www.roblox.com/asset/?id=707855907",
			walk = "http://www.roblox.com/asset/?id=707897309",
			run = "http://www.roblox.com/asset/?id=707861613",
			jump = "http://www.roblox.com/asset/?id=707853694",
			climb = "http://www.roblox.com/asset/?id=707826056",
			fall = "http://www.roblox.com/asset/?id=707829716",
		},
		Ghost = {
			idle1 = "http://www.roblox.com/asset/?id=616006778",
			idle2 = "http://www.roblox.com/asset/?id=616008087",
			walk = "http://www.roblox.com/asset/?id=616010382",
			run = "http://www.roblox.com/asset/?id=616013216",
			jump = "http://www.roblox.com/asset/?id=616008936",
			climb = "http://www.roblox.com/asset/?id=616003713",
			fall = "http://www.roblox.com/asset/?id=616005863",
		},
		Elder = {
			idle1 = "http://www.roblox.com/asset/?id=845397899",
			idle2 = "http://www.roblox.com/asset/?id=845400520",
			walk = "http://www.roblox.com/asset/?id=845403856",
			run = "http://www.roblox.com/asset/?id=845386501",
			jump = "http://www.roblox.com/asset/?id=845398858",
			climb = "http://www.roblox.com/asset/?id=845392038",
			fall = "http://www.roblox.com/asset/?id=845396048",
		},
		Levitation = {
			idle1 = "http://www.roblox.com/asset/?id=616006778",
			idle2 = "http://www.roblox.com/asset/?id=616008087",
			walk = "http://www.roblox.com/asset/?id=616013216",
			run = "http://www.roblox.com/asset/?id=616010382",
			jump = "http://www.roblox.com/asset/?id=616008936",
			climb = "http://www.roblox.com/asset/?id=616003713",
			fall = "http://www.roblox.com/asset/?id=616005863",
		},
		Sneaky = {
			idle1 = "http://www.roblox.com/asset/?id=1132473842",
			idle2 = "http://www.roblox.com/asset/?id=1132477671",
			walk = "http://www.roblox.com/asset/?id=1132510133",
			run = "http://www.roblox.com/asset/?id=1132494274",
			jump = "http://www.roblox.com/asset/?id=1132489853",
			climb = "http://www.roblox.com/asset/?id=1132461372",
			fall = "http://www.roblox.com/asset/?id=1132469004",
		},
		Toy = {
			idle1 = "http://www.roblox.com/asset/?id=782841498",
			idle2 = "http://www.roblox.com/asset/?id=782845736",
			walk = "http://www.roblox.com/asset/?id=782843345",
			run = "http://www.roblox.com/asset/?id=782842708",
			jump = "http://www.roblox.com/asset/?id=782847020",
			climb = "http://www.roblox.com/asset/?id=782843869",
			fall = "http://www.roblox.com/asset/?id=782846423",
		},
		Knight = {
			idle1 = "http://www.roblox.com/asset/?id=657595757",
			idle2 = "http://www.roblox.com/asset/?id=657568135",
			walk = "http://www.roblox.com/asset/?id=657552124",
			run = "http://www.roblox.com/asset/?id=657564596",
			jump = "http://www.roblox.com/asset/?id=658409194",
			climb = "http://www.roblox.com/asset/?id=658360781",
			fall = "http://www.roblox.com/asset/?id=657600338",
		},
		Confident = {
			idle1 = "http://www.roblox.com/asset/?id=1069977950",
			idle2 = "http://www.roblox.com/asset/?id=1069987858",
			walk = "http://www.roblox.com/asset/?id=1070017263",
			run = "http://www.roblox.com/asset/?id=1070001516",
			jump = "http://www.roblox.com/asset/?id=1069984524",
			climb = "http://www.roblox.com/asset/?id=1069946257",
			fall = "http://www.roblox.com/asset/?id=1069973677",
		},
		Popstar = {
			idle1 = "http://www.roblox.com/asset/?id=1212900985",
			idle2 = "http://www.roblox.com/asset/?id=1212900985",
			walk = "http://www.roblox.com/asset/?id=1212980338",
			run = "http://www.roblox.com/asset/?id=1212980348",
			jump = "http://www.roblox.com/asset/?id=1212954642",
			climb = "http://www.roblox.com/asset/?id=1213044953",
			fall = "http://www.roblox.com/asset/?id=1212900995",
		},
		Princess = {
			idle1 = "http://www.roblox.com/asset/?id=941003647",
			idle2 = "http://www.roblox.com/asset/?id=941013098",
			walk = "http://www.roblox.com/asset/?id=941028902",
			run = "http://www.roblox.com/asset/?id=941015281",
			jump = "http://www.roblox.com/asset/?id=941008832",
			climb = "http://www.roblox.com/asset/?id=940996062",
			fall = "http://www.roblox.com/asset/?id=941000007",
		},
		Cowboy = {
			idle1 = "http://www.roblox.com/asset/?id=1014390418",
			idle2 = "http://www.roblox.com/asset/?id=1014398616",
			walk = "http://www.roblox.com/asset/?id=1014421541",
			run = "http://www.roblox.com/asset/?id=1014401683",
			jump = "http://www.roblox.com/asset/?id=1014394726",
			climb = "http://www.roblox.com/asset/?id=1014380606",
			fall = "http://www.roblox.com/asset/?id=1014384571",
		},
		Patrol = {
			idle1 = "http://www.roblox.com/asset/?id=1149612882",
			idle2 = "http://www.roblox.com/asset/?id=1150842221",
			walk = "http://www.roblox.com/asset/?id=1151231493",
			run = "http://www.roblox.com/asset/?id=1150967949",
			jump = "http://www.roblox.com/asset/?id=1150944216",
			climb = "http://www.roblox.com/asset/?id=1148811837",
			fall = "http://www.roblox.com/asset/?id=1148863382",
		},
		["Zombie FE"] = {
			idle1 = "http://www.roblox.com/asset/?id=3489171152",
			idle2 = "http://www.roblox.com/asset/?id=3489171152",
			walk = "http://www.roblox.com/asset/?id=3489174223",
			run = "http://www.roblox.com/asset/?id=3489173414",
			jump = "http://www.roblox.com/asset/?id=616161997",
			climb = "http://www.roblox.com/asset/?id=616156119",
			fall = "http://www.roblox.com/asset/?id=616157476",
		},
		["Amazon Unboxed"] = {
			idle1 = "http://www.roblox.com/asset/?id=98281136301627",
			idle2 = "http://www.roblox.com/asset/?id=98281136301627",
			walk = "http://www.roblox.com/asset/?id=90478085024465",
			run = "http://www.roblox.com/asset/?id=134824450619865",
			jump = "http://www.roblox.com/asset/?id=121454505477205",
			climb = "http://www.roblox.com/asset/?id=121145883950231",
			fall = "http://www.roblox.com/asset/?id=94788218468396",
		},
		Bubbly = {
			idle1 = "https://www.roblox.com/asset/?id=10921054344",
			idle2 = "https://www.roblox.com/asset/?id=10921054344",
			walk = "http://www.roblox.com/asset/?id=10980888364",
			run = "http://www.roblox.com/asset/?id=10921057244",
			jump = "http://www.roblox.com/asset/?id=10921062673",
			climb = "http://www.roblox.com/asset/?id=10921053544",
			fall = "https://www.roblox.com/asset/?id=10921061530",
		},
		["Adidas Comm"] = {
			idle1 = "https://www.roblox.com/asset/?id=122257458498464",
			idle2 = "https://www.roblox.com/asset/?id=122257458498464",
			walk = "http://www.roblox.com/asset/?id=122150855457006",
			run = "http://www.roblox.com/asset/?id=82598234841035",
			jump = "http://www.roblox.com/asset/?id=75290611992385",
			climb = "http://www.roblox.com/asset/?id=88763136693023",
			fall = "https://www.roblox.com/asset/?id=98600215928904",
		},
		KATSEYE = {
			idle1 = "https://www.roblox.com/asset/?id=108187809145790",
			idle2 = "https://www.roblox.com/asset/?id=108187809145790",
			walk = "http://www.roblox.com/asset/?id=99182913548783",
			run = "http://www.roblox.com/asset/?id=73117360545482",
			jump = "http://www.roblox.com/asset/?id=103632305262747",
			climb = "http://www.roblox.com/asset/?id=106213237973858",
			fall = "https://www.roblox.com/asset/?id=127802717128367",
		},
		["Wicked Popular"] = {
			idle1 = "https://www.roblox.com/asset/?id=118832222982049",
			idle2 = "https://www.roblox.com/asset/?id=118832222982049",
			walk = "http://www.roblox.com/asset/?id=92072849924640",
			run = "http://www.roblox.com/asset/?id=72301599441680",
			jump = "http://www.roblox.com/asset/?id=104325245285198",
			climb = "http://www.roblox.com/asset/?id=131326830509784",
			fall = "https://www.roblox.com/asset/?id=121152442762481",
		},
		Dizzy = {
			idle1 = "http://www.roblox.com/asset/?id=132806359718468",
			idle2 = "http://www.roblox.com/asset/?id=132806359718468",
			walk = "http://www.roblox.com/asset/?id=110106034100313",
			run = "http://www.roblox.com/asset/?id=138305342272849",
			jump = "http://www.roblox.com/asset/?id=108564434408211",
			climb = "http://www.roblox.com/asset/?id=93550710314258",
			fall = "http://www.roblox.com/asset/?id=138967706335414",
		},
		WDTL = {
			idle1 = "http://www.roblox.com/asset/?id=92849173543269",
			idle2 = "http://www.roblox.com/asset/?id=92849173543269",
			walk = "http://www.roblox.com/asset/?id=73718308412641",
			run = "http://www.roblox.com/asset/?id=135515454877967",
			jump = "http://www.roblox.com/asset/?id=78508480717326",
			climb = "http://www.roblox.com/asset/?id=129447497744818",
			fall = "http://www.roblox.com/asset/?id=78147885297412",
		},
		["Billie Eilish"] = {
			idle1 = "http://www.roblox.com/asset/?id=102934602884410",
			idle2 = "http://www.roblox.com/asset/?id=102934602884410",
			walk = "http://www.roblox.com/asset/?id=81877886552514",
			run = "http://www.roblox.com/asset/?id=100920560634123",
			jump = "http://www.roblox.com/asset/?id=117602630922781",
			climb = "http://www.roblox.com/asset/?id=117873469361430",
			fall = "http://www.roblox.com/asset/?id=81072141180299",
		},
		["Cute Bouncy"] = {
			idle1 = "http://www.roblox.com/asset/?id=88464649697812",
			idle2 = "http://www.roblox.com/asset/?id=88464649697812",
			walk = "http://www.roblox.com/asset/?id=98713727778027",
			run = "http://www.roblox.com/asset/?id=133955346539948",
			jump = "http://www.roblox.com/asset/?id=124147147418885",
			climb = "http://www.roblox.com/asset/?id=95542189442725",
			fall = "http://www.roblox.com/asset/?id=128620818122982",
		},
		Cute = {
			idle1 = "http://www.roblox.com/asset/?id=85735421117197",
			idle2 = "http://www.roblox.com/asset/?id=85735421117197",
			walk = "http://www.roblox.com/asset/?id=140409718187215",
			run = "http://www.roblox.com/asset/?id=118375157537412",
			jump = "http://www.roblox.com/asset/?id=132381016103721",
			climb = "http://www.roblox.com/asset/?id=86318575131600",
			fall = "http://www.roblox.com/asset/?id=77496925287217",
		},
	};
local Uy = {
		"Default",
		"Vampire",
		"Hero",
		"Zombie",
		"Ninja",
		"Astronaut",
		"Cartoon",
		"Pirate",
		"Werewolf",
		"OG Run",
		"Jolly",
		"Cute Kawaii",
		"Doll 3.0",
		"Victoria Model",
		"Bike/Bicyclist",
		"Animal",
		"It-Girl Essential Model",
		"Oldschool",
		"Spider",
		"Joy",
		"Flying Aura",
		"FHA V2",
		"Silent Nurse",
		"Supermodel",
		"Enchanted Fairy",
		"Furry",
		"Vlada Model",
		"R6 Converter",
		"Mage",
		"Ghost",
		"Elder",
		"Levitation",
		"Sneaky",
		"Toy",
		"Knight",
		"Confident",
		"Popstar",
		"Princess",
		"Cowboy",
		"Patrol",
		"Zombie FE",
		"Amazon Unboxed",
		"Bubbly",
		"Adidas Comm",
		"KATSEYE",
		"Wicked Popular",
		"Dizzy",
		"WDTL",
		"Billie Eilish",
		"Cute Bouncy",
		"Cute",
	};
local ty = {
		all = "Default",
		idle = "Default",
		walk = "Default",
		run = "Default",
		jump = "Default",
		climb = "Default",
		fall = "Default",
		swim = "Default",
		swimidle = "Default",
		death = "Default",
	};
local cy = {};
local by = {
		idle = { folder = "idle", slots = { { child = "Animation1", origKey = "idle1" }, { child = "Animation2", origKey = "idle2" } } },
		walk = { folder = "walk", slots = { { child = "WalkAnim", origKey = "walk" } } },
		run = { folder = "run", slots = { { child = "RunAnim", origKey = "run" } } },
		jump = { folder = "jump", slots = { { child = "JumpAnim", origKey = "jump" } } },
		climb = { folder = "climb", slots = { { child = "ClimbAnim", origKey = "climb" } } },
		fall = { folder = "fall", slots = { { child = "FallAnim", origKey = "fall" } } },
		swim = { folder = "swim", slots = { { child = "Swim", origKey = "swim" } } },
		swimidle = { folder = "swimidle", slots = { { child = "SwimIdle", origKey = "swimidle" } } },
		death = { folder = "death", slots = { { child = "DeathAnim", origKey = "death" } } },
	};
local function ky()
	local e = l.Character;
	if not e then
		return;
	end;
	local A = e:FindFirstChild("Animate");
	if not A then
		return;
	end;
	for e, l in pairs(by) do
		local E = A:FindFirstChild(l.folder);
		if E then
			for e, A in ipairs(l.slots) do
				local l = E:FindFirstChild(A.child);
				if l and (l.AnimationId and l.AnimationId ~= "") then
					cy[A.origKey] = l.AnimationId;
				end;
			end;
		end;
	end;
end;
local function xy()
	if not P then
		return;
	end;
	local e = l.Character;
	if not e then
		return;
	end;
	local A = e:FindFirstChild("Animate");
	if not A then
		return;
	end;
	local E = e:FindFirstChildOfClass("Humanoid");
	if E then
		for e, A in pairs(E:GetPlayingAnimationTracks()) do
			A:Stop(0);
		end;
	end;
	A.Disabled = true;
	task.wait(.1);
	for e, l in pairs(by) do
		local E = "Default";
		if ty[e] ~= "Default" then
			E = ty[e];
		elseif ty.all ~= "Default" then
			E = ty.all;
		end;
		local y = Wy[E];
		local a = A:FindFirstChild(l.folder);
		if a then
			for e, A in ipairs(l.slots) do
				local l = a:FindFirstChild(A.child);
				if l then
					local e;
					if E == "Default" then
						e = cy[A.origKey];
					elseif y and y[A.origKey] then
						e = y[A.origKey];
					end;
					if e then
						l.AnimationId = e;
					end;
				end;
			end;
		end;
	end;
	A.Disabled = false;
end;
l.CharacterAdded:Connect(function(e)
	task.wait(1);
	ky();
	if P then
		xy();
	end;
end);
task.spawn(function()
	while task.wait(.2) do
		pcall(function()
			local e = l.Character;
			if e then
				local A = e:FindFirstChildOfClass("Humanoid");
				if A then
					if A.WalkSpeed ~= i then
						A.WalkSpeed = i;
					end;
					if p then
						for e, A in ipairs(e:GetDescendants()) do
							if A:IsA("BasePart") and A.CanCollide then
								A.CanCollide = false;
							end;
						end;
					end;
				end;
			end;
		end);
	end;
end);
task.spawn(function()
	while task.wait(.05) do
		if Y then
			pcall(function()
				local e = l.Character;
				if e then
					local A = e:FindFirstChild("HumanoidRootPart");
					if A then
						A.CFrame = CFrame.new(A.Position) * CFrame.Angles(0, math.rad(A.Orientation.Y + 90), 0);
					end;
				end;
			end);
		end;
	end;
end);
local function zy()
	local e = workspace:FindFirstChild("GunDrop", true);
	if e then
		return e;
	end;
	for e, A in ipairs(workspace:GetDescendants()) do
		if A.Name == "GunDrop" then
			return A;
		end;
	end;
	return nil;
end;
local function dy()
	if HB() then
		print("\240\159\148\170 Soy Murderer");
		return;
	end;
	if sB() then
		print("\226\156\133 Ya tengo la Gun");
		return;
	end;
	if pB() then
		print("\240\159\143\160 Estoy en el lobby");
		return;
	end;
	local e = zy();
	if not e then
		print("\226\157\140 No hay GunDrop");
		return;
	end;
	local A = l.Character;
	if not A then
		return;
	end;
	local E = A:FindFirstChild("HumanoidRootPart");
	if not E then
		return;
	end;
	local y;
	if e:IsA("BasePart") then
		y = e.Position;
	elseif e:FindFirstChild("Handle") then
		y = e.Handle.Position;
	else
		local A, l = pcall(function()
				return (e:GetPivot()).Position;
			end);
		if A and l then
			y = l;
		else
			return;
		end;
	end;
	pcall(function()
		e.CanCollide = false;
		e.CFrame = E.CFrame;
		e.Velocity = Vector3.new(0, 0, 0);
		e.RotVelocity = Vector3.new(0, 0, 0);
	end);
	print("\240\159\141\172 Gun atra\195\173da a tus pies");
	task.wait(.15);
	local a = l:FindFirstChild("Backpack");
	local W = (a and ((a:FindFirstChild("Gun") or a:FindFirstChild("Revolver")))) or A:FindFirstChild("Gun") or A:FindFirstChild("Revolver");
	if W then
		local e = A:FindFirstChildOfClass("Humanoid");
		if e then
			e:EquipTool(W);
			print("\226\156\133 Gun equipada");
		end;
	end;
end;
local wy = Instance.new("TextButton");
wy.Name = "UzivertGrabGun";
wy.Size = UDim2.new(0, 140, 0, 45);
wy.Position = UDim2.new(0, 30, .5, 40);
wy.BackgroundColor3 = k.Morado3;
wy.BackgroundTransparency = .5;
wy.Text = "\240\159\141\172 GRAB GUN";
wy.TextColor3 = k.Texto;
wy.Font = Enum.Font.GothamBold;
wy.TextSize = 14;
wy.BorderSizePixel = 0;
wy.Active = true;
wy.Draggable = true;
wy.Visible = false;
wy.ZIndex = 998;
wy.ClipsDescendants = true;
wy.Parent = S;
local my = Instance.new("UICorner");
my.CornerRadius = UDim.new(0, 10);
my.Parent = wy;
local Vy = Instance.new("UIStroke");
Vy.Color = k.Naranja1;
Vy.Thickness = 2;
Vy.Transparency = .2;
Vy.Parent = wy;
task.spawn(function()
	while task.wait() do
		local e = tick();
		local A = ((math.sin(e * 1.5) + 1)) / 2;
		Vy.Color = k.Naranja3:Lerp(k.Morado2, A);
		Vy.Transparency = .4 - A * .3;
	end;
end);
local Hy = Instance.new("TextButton");
Hy.Name = "UzivertGrabLock";
Hy.Size = UDim2.new(0, 22, 0, 22);
Hy.Position = UDim2.new(1, -24, 0, 2);
Hy.BackgroundColor3 = k.Morado3;
Hy.BackgroundTransparency = .3;
Hy.Text = "\240\159\148\147";
Hy.TextColor3 = k.Texto;
Hy.Font = Enum.Font.GothamBold;
Hy.TextSize = 12;
Hy.BorderSizePixel = 0;
Hy.ZIndex = 999;
Hy.Parent = wy;
local sy = Instance.new("UICorner");
sy.CornerRadius = UDim.new(1, 0);
sy.Parent = Hy;
local py = d.AutoGrabLock or false;
local function iy()
	if py then
		wy.Draggable = false;
		Hy.Text = "\240\159\148\146";
		Hy.BackgroundColor3 = k.Rojo;
		Hy.BackgroundTransparency = .3;
	else
		wy.Draggable = true;
		Hy.Text = "\240\159\148\147";
		Hy.BackgroundColor3 = k.Morado3;
		Hy.BackgroundTransparency = .3;
	end;
end;
iy();
Hy.MouseButton1Click:Connect(function()
	py = not py;
	d.AutoGrabLock = py;
	iy();
	m();
end);
if d.AutoGrabPos then
	local e = d.AutoGrabPos;
	pcall(function()
		wy.Position = UDim2.new(e[1], e[2], e[3], e[4]);
	end);
end;
task.spawn(function()
	while task.wait(2) do
		if not py then
			pcall(function()
				d.AutoGrabPos = {
						wy.Position.X.Scale,
						wy.Position.X.Offset,
						wy.Position.Y.Scale,
						wy.Position.Y.Offset,
					};
				m();
			end);
		end;
	end;
end);
wy.MouseButton1Click:Connect(dy);
task.spawn(function()
	while task.wait(.3) do
		if d.AutoGrabMostrar == false then
			if wy.Visible then
				wy.Visible = false;
			end;
			continue;
		end;
		local e = zy();
		local A = sB();
		local l = HB();
		local E = pB();
		if e and (not A and (not l and not E)) then
			if not wy.Visible then
				wy.Visible = true;
			end;
			wy.Text = "\240\159\141\172 GRAB GUN";
		else
			if wy.Visible then
				wy.Visible = false;
			end;
		end;
	end;
end);
local Yy = 2.5;
local Ty = false;
local uy = false;
local Py = nil;
local Ny = nil;
local My = false;
local function Xy(e)
	My = true;
	local A = l.Character;
	if not A then
		My = false;
		return;
	end;
	local E = A:FindFirstChildOfClass("Humanoid");
	local y = A:FindFirstChild("HumanoidRootPart");
	if not ((E and y)) then
		My = false;
		return;
	end;
	local a = e.Character;
	if not a then
		My = false;
		return;
	end;
	local W = a:FindFirstChildOfClass("Humanoid");
	local U = W and W.RootPart;
	local t = a:FindFirstChild("Head");
	local c = a:FindFirstChildOfClass("Accessory");
	local b = c and c:FindFirstChild("Handle");
	local k = y.CFrame;
	repeat
		task.wait();
		workspace.CurrentCamera.CameraSubject = t or b or W;
	until workspace.CurrentCamera.CameraSubject == ((t or b or W));
	local function x(e, l, E)
		local a = (CFrame.new(e.Position) * l) * E;
		y.CFrame = a;
		A:SetPrimaryPartCFrame(a);
		y.Velocity = Vector3.new(90000000, 900000000, 90000000);
		y.RotVelocity = Vector3.new(900000000, 900000000, 900000000);
	end;
	local function z(e)
		local A = tick();
		local l = 0;
		repeat
			if y and W then
				l = l + 100;
				for A, E in ipairs({
					CFrame.new(0, 1.5, 0),
					CFrame.new(0, -1.5, 0),
					CFrame.new(2.25, 1.5, -2.25),
					CFrame.new(-2.25, -1.5, 2.25),
				}) do
					x(e, E + W.MoveDirection, CFrame.Angles(math.rad(l), 0, 0));
					task.wait();
				end;
			end;
		until e.Velocity.Magnitude > 500 or tick() - A > Yy;
	end;
	local d = Instance.new("BodyVelocity");
	d.Name = "FlingVelocity";
	d.Velocity = Vector3.new(900000000, 900000000, 900000000);
	d.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
	d.Parent = y;
	E:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
	local w = U or t or b;
	if w then
		z(w);
	end;
	d:Destroy();
	E:SetStateEnabled(Enum.HumanoidStateType.Seated, true);
	repeat
		task.wait();
		workspace.CurrentCamera.CameraSubject = E;
	until workspace.CurrentCamera.CameraSubject == E;
	repeat
		local e = k * CFrame.new(0, .5, 0);
		y.CFrame = e;
		A:SetPrimaryPartCFrame(e);
		E:ChangeState(Enum.HumanoidStateType.GettingUp);
		for e, A in ipairs(A:GetChildren()) do
			if A:IsA("BasePart") then
				A.Velocity = Vector3.zero;
				A.RotVelocity = Vector3.zero;
			end;
		end;
		task.wait();
	until ((y.Position - k.p)).Magnitude < 25;
	My = false;
end;
local function Ly()
	My = true;
	local A = {};
	for e, E in ipairs(e:GetPlayers()) do
		if E ~= l then
			table.insert(A, E);
		end;
	end;
	if #A == 0 then
		My = false;
		return;
	end;
	local E = 1;
	while uy do
		local e = A[E];
		if e and (e.Character and (e.Character:FindFirstChild("Humanoid") and e.Character.Humanoid.Health > 0)) then
			Ty = true;
			Py = e;
			Xy(e);
			Ty = false;
		end;
		E = E % #A + 1;
		task.wait(.5);
	end;
	My = false;
end;
local function Fy()
	Ty = false;
	uy = false;
	if Ny then
		task.cancel(Ny);
		Ny = nil;
	end;
	My = false;
end;
local function gy(e)
	if My then
		print("\226\154\160\239\184\143 Fling en progreso");
		return;
	end;
	Fy();
	if e == "all" then
		uy = true;
		Ny = task.spawn(Ly);
	elseif e == "Murderer" then
		local e = dB();
		if e then
			Ty = true;
			Py = e;
			Ny = task.spawn(Xy, e);
		end;
	elseif e == "Sheriff" then
		local e = wB();
		if not e then
			e = mB();
		end;
		if e then
			Ty = true;
			Py = e;
			Ny = task.spawn(Xy, e);
		end;
	end;
end;
print("\240\159\142\131 Parte 4/10 cargada - Anims + Grab + Fling Nexus");
local function Qy()
	local e = l.Character;
	if not e then
		return nil;
	end;
	local A = e:FindFirstChild("Gun") or e:FindFirstChild("Revolver");
	if A then
		return A;
	end;
	local E = l:FindFirstChild("Backpack");
	if E then
		A = E:FindFirstChild("Gun") or E:FindFirstChild("Revolver");
		if A then
			local l = e:FindFirstChildOfClass("Humanoid");
			if l then
				l:EquipTool(A);
			end;
			return A;
		end;
	end;
	return nil;
end;
local function ny(e)
	if not e then
		return nil;
	end;
	return e:FindFirstChild("Shoot", true);
end;
local function hy(e)
	if not e then
		return A.CFrame;
	end;
	local l = e:FindFirstChild("Handle");
	if l then
		return l.CFrame;
	end;
	return A.CFrame;
end;
_G.UZSHOOT_PingProfiles = _G.UZSHOOT_PingProfiles or {
		{
			Ping = 20,
			Sim = 48,
			Interval = 70,
			H = 154,
			V = 144,
			X = -5,
			Y = -14,
			Z = 0,
		},
		{
			Ping = 50,
			Sim = 54,
			Interval = 66,
			H = 162,
			V = 152,
			X = -6,
			Y = -14,
			Z = 0,
		},
		{
			Ping = 100,
			Sim = 68,
			Interval = 60,
			H = 176,
			V = 166,
			X = -8,
			Y = -15,
			Z = 0,
		},
		{
			Ping = 150,
			Sim = 72,
			Interval = 64,
			H = 182,
			V = 170,
			X = -9,
			Y = -12,
			Z = 0,
		},
		{
			Ping = 200,
			Sim = 76,
			Interval = 70,
			H = 188,
			V = 174,
			X = -10,
			Y = -11,
			Z = 0,
		},
		{
			Ping = 300,
			Sim = 82,
			Interval = 76,
			H = 196,
			V = 180,
			X = -12,
			Y = -10,
			Z = 0,
		},
	};
_G.UZSHOOT_CFG = _G.UZSHOOT_CFG or {
		adaptive = true,
		fixedLead = .075,
		extraLead = .02,
		maxLead = .18,
		prioritizePing = true,
		predictJump = false,
		predictLag = true,
		maxSimulationMs = 180,
		predictionIntervalMs = 72,
		manualPingMs = 80,
		offsetX = 0,
		offsetY = 0,
		offsetZ = 0,
		horizontalMultiplier = 100,
		verticalMultiplier = 100,
		wallCheck = false,
		autoUnequip = true,
		cooldown = .2,
	};
_G.UZSHOOT_motionPart = nil;
_G.UZSHOOT_motionSamples = {};
_G.UZSHOOT_measuredVel = Vector3.new(0, 0, 0);
_G.UZSHOOT_previousVel = Vector3.new(0, 0, 0);
_G.UZSHOOT_accel = Vector3.new(0, 0, 0);
_G.UZSHOOT_shootBusy = false;
_G.UZSHOOT_interpProfile = function(e)
		local A = _G.UZSHOOT_PingProfiles;
		local l, E = A[1], A[1];
		if e >= A[#A].Ping then
			l = A[#A];
			E = A[#A];
		else
			for y = 1, #A - 1, 1 do
				if e >= A[y].Ping and e <= A[y + 1].Ping then
					l = A[y];
					E = A[y + 1];
					break;
				end;
			end;
		end;
		local y = E.Ping - l.Ping;
		local a = y > 0 and math.clamp(((e - l.Ping)) / y, 0, 1) or 0;
		a = (a * a) * ((3 - 2 * a));
		local function W(e)
			return l[e] + ((E[e] - l[e])) * a;
		end;
		return {
			Sim = math.floor(W("Sim") + .5),
			Interval = math.floor(W("Interval") + .5),
			H = math.floor(W("H") + .5),
			V = math.floor(W("V") + .5),
			X = math.floor(W("X") + .5),
			Y = math.floor(W("Y") + .5),
			Z = math.floor(W("Z") + .5),
		};
	end;
_G.UZSHOOT_leadTime = function()
		local e = _G.UZSHOOT_CFG;
		local A;
		if e.adaptive then
			local l = e.prioritizePing and ((_G.UZNOIR_cachedPing or .08)) or (e.manualPingMs / 1000);
			A = l + e.extraLead;
			if e.predictLag then
				local E = math.clamp(e.predictionIntervalMs / 2000, 0, .05);
				A = (A + E) + math.max(0, l - .1) * .15;
			end;
		else
			A = e.fixedLead;
		end;
		return math.clamp(A, .02, math.min(e.maxLead, e.maxSimulationMs / 1000));
	end;
_G.UZSHOOT_sampleMotion = function(e)
		local A = _G.UZSHOOT_CFG;
		local l = os.clock();
		if _G.UZSHOOT_motionPart ~= e then
			_G.UZSHOOT_motionPart = e;
			_G.UZSHOOT_motionSamples = {};
			_G.UZSHOOT_measuredVel = e.AssemblyLinearVelocity;
			_G.UZSHOOT_previousVel = _G.UZSHOOT_measuredVel;
			_G.UZSHOOT_accel = Vector3.new(0, 0, 0);
		end;
		local E = _G.UZSHOOT_motionSamples;
		local y = E[#E];
		if not y or l - y.time >= math.max(.016, A.predictionIntervalMs / 1000) then
			table.insert(E, { position = e.Position, time = l });
			while #E > 8 or (#E > 2 and l - E[1].time > .35) do
				table.remove(E, 1);
			end;
			if #E >= 2 then
				local e = E[1];
				local A = E[#E];
				local a = A.time - e.time;
				if a > .015 then
					local E = ((A.position - e.position)) / a;
					if E.Magnitude < 150 then
						local e = _G.UZSHOOT_measuredVel;
						_G.UZSHOOT_measuredVel = _G.UZSHOOT_measuredVel:Lerp(E, .55);
						local A = y and math.max(l - y.time, .016) or a;
						local W = ((_G.UZSHOOT_measuredVel - e)) / A;
						if W.Magnitude < 120 then
							_G.UZSHOOT_accel = _G.UZSHOOT_accel:Lerp(W, .25);
						else
							_G.UZSHOOT_accel = Vector3.new(0, 0, 0);
						end;
						_G.UZSHOOT_previousVel = e;
					end;
				end;
			end;
		end;
	end;
_G.UZSHOOT_calculateAim = function(e)
		local A = _G.UZSHOOT_CFG;
		_G.UZSHOOT_sampleMotion(e);
		local l = e.AssemblyLinearVelocity;
		local E = l;
		local y = Vector3.new(0, 0, 0);
		if A.predictLag and (_G.UZSHOOT_motionPart == e and #_G.UZSHOOT_motionSamples >= 2) then
			local e = ((l - _G.UZSHOOT_measuredVel)).Magnitude;
			local A = math.clamp(.75 - e / 120, .35, .75);
			E = l:Lerp(_G.UZSHOOT_measuredVel, A);
			y = _G.UZSHOOT_accel;
		end;
		local a = A.horizontalMultiplier / 100;
		local W = A.verticalMultiplier / 100;
		local U = A.predictJump and E.Y * W or 0;
		local t = Vector3.new(E.X * a, U, E.Z * a);
		local c = _G.UZSHOOT_leadTime();
		local b = t * c;
		if A.predictLag then
			local e = Vector3.new(y.X, 0, y.Z);
			b = b + e * (((.5 * c) * c));
		end;
		if A.predictJump then
			local A = e.Parent and e.Parent:FindFirstChildWhichIsA("Humanoid");
			if A and A.FloorMaterial == Enum.Material.Air then
				b = b + Vector3.new(0, ((-0.5 * workspace.Gravity) * c) * c, 0);
			end;
		end;
		if b.Magnitude > 18 then
			b = b.Unit * 18;
		end;
		local k = Vector3.new((e.Size.X * A.offsetX) / 100, (e.Size.Y * A.offsetY) / 100, (e.Size.Z * A.offsetZ) / 100);
		return (e.Position + b) + k;
	end;
_G.UZSHOOT_getAimPart = function(e)
		local A = e and e.Character;
		if not A then
			return nil;
		end;
		return A:FindFirstChild("Head") or A:FindFirstChild("HumanoidRootPart");
	end;
_G.UZSHOOT_targetVisible = function(e)
		if not _G.UZSHOOT_CFG.wallCheck then
			return true;
		end;
		local A = l.Character;
		local E = A and ((A:FindFirstChild("Head") or A:FindFirstChild("HumanoidRootPart")));
		if not E or not e then
			return false;
		end;
		local y = RaycastParams.new();
		y.FilterType = Enum.RaycastFilterType.Exclude;
		y.FilterDescendantsInstances = { A };
		local a = workspace:Raycast(E.Position, e.Position - E.Position, y);
		return a == nil or a.Instance:IsDescendantOf(e.Parent);
	end;
_G.UZSHOOT_getGun = function()
		local e = l.Character;
		if not e then
			return nil;
		end;
		local A = e:FindFirstChild("Gun") or e:FindFirstChild("Revolver");
		if A then
			return A;
		end;
		local E = l:FindFirstChild("Backpack");
		if E then
			A = E:FindFirstChild("Gun") or E:FindFirstChild("Revolver");
		end;
		return A;
	end;
_G.UZSHOOT_findGunRemote = function()
		local e = _G.UZSHOOT_getGun();
		if not e then
			return nil;
		end;
		local A, l;
		for e, E in ipairs(e:GetDescendants()) do
			if E:IsA("RemoteEvent") then
				local e = E.Name;
				local y = #e;
				if e == "Shoot" then
					y += 50;
				end;
				if e == "GunFired" or e == "KnifeThrown" then
					y = -1;
				end;
				if y >= ((l or 0)) then
					A, l = E, y;
				end;
			end;
		end;
		return A;
	end;
_G.UZSHOOT_getHandle = function(e)
		if not e then
			return nil;
		end;
		local A = e:FindFirstChild("Handle", true);
		if A and A:IsA("BasePart") then
			return A;
		end;
		return nil;
	end;
_G.UZSHOOT_fireGunAt = function(e)
		if _G.UZSHOOT_shootBusy then
			return false;
		end;
		_G.UZSHOOT_shootBusy = true;
		local A = false;
		pcall(function()
			if not e or not e.Character then
				return;
			end;
			local E = _G.UZSHOOT_getAimPart(e);
			local y = l.Character;
			local a = y and y:FindFirstChildWhichIsA("Humanoid");
			local W = l:FindFirstChildOfClass("Backpack");
			if not E or not y or not a then
				return;
			end;
			if _G.UZSHOOT_CFG.wallCheck and not _G.UZSHOOT_targetVisible(E) then
				return;
			end;
			local U = false;
			local t = y:FindFirstChild("Gun") or y:FindFirstChild("Revolver");
			if not t and W then
				t = W:FindFirstChild("Gun") or W:FindFirstChild("Revolver");
				if t then
					a:EquipTool(t);
					U = true;
					task.wait(.12);
				end;
			end;
			if not t or not t:IsA("Tool") then
				if U and a.Parent then
					a:UnequipTools();
				end;
				return;
			end;
			local c = _G.UZSHOOT_findGunRemote();
			local b = _G.UZSHOOT_getHandle(t);
			if not c or not b then
				if U and a.Parent then
					a:UnequipTools();
				end;
				return;
			end;
			local k = _G.UZSHOOT_calculateAim(E);
			local x = b.Position;
			local z = _G.UZ_PB_ORIGIN and _G.UZ_PB_ORIGIN(x, k, E) or x;
			A = pcall(function()
					c:FireServer(CFrame.lookAt(z, k), CFrame.new(k));
				end);
			task.wait(.16);
			if U and (_G.UZSHOOT_CFG.autoUnequip and a.Parent) then
				task.wait(.08);
				a:UnequipTools();
			end;
		end);
		task.wait(_G.UZSHOOT_CFG.cooldown);
		_G.UZSHOOT_shootBusy = false;
		return A;
	end;
task.spawn(function()
	while task.wait(.033333333333333) do
		local e = dB();
		if e and e.Character then
			local A = _G.UZSHOOT_getAimPart(e);
			if A then
				_G.UZSHOOT_sampleMotion(A);
			end;
		end;
	end;
end);
local function Ky()
	if _G.UZSHOOT_shootBusy then
		return;
	end;
	if _G.UZIVERT_SHOOT_ULTIMA and tick() - _G.UZIVERT_SHOOT_ULTIMA < .15 then
		return;
	end;
	_G.UZIVERT_SHOOT_ULTIMA = tick();
	local e = dB();
	if not e and _G.detectarZombie then
		e = _G.detectarZombie();
	end;
	if not e or not e.Character then
		print("\226\157\140 No hay Murderer ni Zombie");
		return;
	end;
	task.spawn(function()
		local A = _G.UZSHOOT_fireGunAt(e);
		print(A and ("\240\159\146\165 Disparo a " .. e.Name) or "\226\157\140 Fallo");
	end);
end;
task.spawn(function()
	while task.wait(.3) do
		if r then
			pcall(Ky);
		end;
	end;
end);
local function ry()
	if not HB() then
		print("\226\157\140 Kill All: No sos Murderer");
		return false;
	end;
	local A = l.Character;
	if not A then
		return false;
	end;
	local E = A:FindFirstChild("Knife");
	if not E then
		local e = l:FindFirstChild("Backpack");
		if e then
			E = e:FindFirstChild("Knife");
		end;
	end;
	if not E then
		print("\226\157\140 Kill All: No ten\195\169s Knife");
		return false;
	end;
	local y = E:FindFirstChild("HandleTouched", true);
	if not y then
		for e, A in ipairs(E:GetDescendants()) do
			if A:IsA("RemoteEvent") then
				y = A;
				break;
			end;
		end;
	end;
	local a = 0;
	for e, A in ipairs(e:GetPlayers()) do
		if A ~= l and A.Character then
			local e = A.Character:FindFirstChild("HumanoidRootPart");
			local l = A.Character:FindFirstChildOfClass("Humanoid");
			if e and (l and l.Health > 0) then
				pcall(function()
					e.CFrame = E.Handle.CFrame;
					e.Velocity = Vector3.new(0, 0, 0);
					e.RotVelocity = Vector3.new(0, 0, 0);
				end);
				if y then
					pcall(function()
						y:FireServer(e);
					end);
				end;
				a = a + 1;
				task.wait(.05);
			end;
		end;
	end;
	print("\240\159\146\165 Kill All \226\134\146 " .. (a .. " objetivos"));
	return true;
end;
task.spawn(function()
	while task.wait(1) do
		if G and HB() then
			pcall(ry);
		end;
	end;
end);
local function Zy()
	local e = l.Character;
	if not e then
		return nil;
	end;
	local A = e:FindFirstChild("Knife");
	if not A then
		local e = l:FindFirstChild("Backpack");
		if e then
			A = e:FindFirstChild("Knife");
		end;
	end;
	if not A then
		return nil;
	end;
	local E = A:FindFirstChild("Events");
	if E then
		local e = E:FindFirstChild("KnifeThrown");
		if e then
			return e;
		end;
	end;
	return A:FindFirstChild("HandleTouched", true);
end;
task.spawn(function()
	while task.wait(.1) do
		if d.KnifeAura and HB() then
			local A = l.Character;
			local E = A and A:FindFirstChild("Knife");
			if E and E:FindFirstChild("Handle") then
				for e, y in ipairs(e:GetPlayers()) do
					if y ~= l and y.Character then
						local e = y.Character:FindFirstChild("HumanoidRootPart");
						local l = y.Character:FindFirstChildOfClass("Humanoid");
						if e and (l and l.Health > 0) then
							local l = ((e.Position - A.HumanoidRootPart.Position)).Magnitude;
							if l <= ((d.KnifeAuraDist or 15)) then
								e.CFrame = E.Handle.CFrame;
								e.Velocity = Vector3.new(0, 0, 0);
								e.RotVelocity = Vector3.new(0, 0, 0);
								local A = Zy();
								if A then
									pcall(function()
										A:FireServer(e);
									end);
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end);
print("\240\159\148\170 Knife Aura loop iniciado");
print("\240\159\142\131 Parte 5/10 cargada - Shoot + Kill All");
local fy = Instance.new("TextButton");
fy.Name = "UzivertShootMurder";
fy.Size = UDim2.new(0, 160, 0, 50);
fy.Position = UDim2.new(0, 30, .5, 100);
fy.BackgroundColor3 = k.Fondo;
fy.BackgroundTransparency = .3;
fy.Text = "SHOOT MURDERER";
fy.TextColor3 = k.Texto;
fy.Font = Enum.Font.GothamBold;
fy.TextSize = 13;
fy.BorderSizePixel = 0;
fy.Active = true;
fy.Draggable = true;
fy.Visible = N;
fy.ZIndex = 998;
fy.ClipsDescendants = true;
fy.Parent = S;
local Ry = Instance.new("UICorner");
Ry.CornerRadius = UDim.new(0, 10);
Ry.Parent = fy;
local Dy = Instance.new("UIStroke");
Dy.Color = k.Naranja1;
Dy.Thickness = 2;
Dy.Transparency = .2;
Dy.Parent = fy;
task.spawn(function()
	while fy.Parent do
		local e = tick();
		local A = ((math.sin(e * 1.5) + 1)) / 2;
		Dy.Color = k.Naranja1:Lerp(k.Morado2, A);
		Dy.Transparency = .4 - A * .3;
		task.wait(.05);
	end;
end);
if d.ShootPos then
	local e = d.ShootPos;
	pcall(function()
		fy.Position = UDim2.new(e[1], e[2], e[3], e[4]);
	end);
end;
task.spawn(function()
	while task.wait(2) do
		if not BLOQUEADO_SHOOT then
			pcall(function()
				d.ShootPos = {
						fy.Position.X.Scale,
						fy.Position.X.Offset,
						fy.Position.Y.Scale,
						fy.Position.Y.Offset,
					};
				m();
			end);
		end;
	end;
end);
fy.MouseButton1Click:Connect(function()
	Ky();
	fy.Text = "FIRE!";
	task.delay(.5, function()
		fy.Text = "SHOOT MURDERER";
	end);
end);
if not _G.UZIVERT_GAMA_BAJA then
	_G.UZIVERT_SHOOT_TP_ACTIVO = false;
	_G.UZIVERT_SHOOT_TP_DISTANCIA = 5.5;
	_G.UZIVERT_SHOOT_TP_DURACION = 1;
	_G.UZIVERT_SHOOT_TP_INTERVALO = .1;
	_G.UZIVERT_SHOOT_TP_LOCK = .03;
	_G.UZIVERT_STP_BUSCAR_GUN = function()
			local e = l.Character;
			if not e then
				return nil, nil;
			end;
			local A = e:FindFirstChild("Gun") or e:FindFirstChild("Revolver");
			if A then
				return A, "equipada";
			end;
			local E = l:FindFirstChild("Backpack");
			if E then
				A = E:FindFirstChild("Gun") or E:FindFirstChild("Revolver");
				if A then
					return A, "backpack";
				end;
			end;
			return nil, nil;
		end;
	_G.UZIVERT_STP_EQUIPAR = function(e)
			local A = l.Character;
			local E = A and A:FindFirstChildOfClass("Humanoid");
			if E and e then
				pcall(function()
					E:EquipTool(e);
				end);
				task.wait(.1);
			end;
		end;
	_G.UZIVERT_STP_DESEQUIPAR = function()
			local e = l.Character;
			local A = e and e:FindFirstChildOfClass("Humanoid");
			if A then
				pcall(function()
					A:UnequipTools();
				end);
			end;
		end;
	_G.UZIVERT_STP_BUSCAR_MURDERER = function()
			for A, l in pairs(zB) do
				if l == "Murderer" then
					return e:FindFirstChild(A);
				end;
			end;
			return nil;
		end;
	_G.UZIVERT_SHOOT_TP = function()
			if _G.UZIVERT_SHOOT_TP_ACTIVO then
				pcall(function()
					(game:GetService("StarterGui")):SetCore("SendNotification", { Title = "\226\154\160\239\184\143 Shoot TP", Text = "Ya en progreso", Duration = 2 });
				end);
				return false;
			end;
			local e = _G.UZIVERT_STP_BUSCAR_MURDERER();
			if not e or not e.Character then
				pcall(function()
					(game:GetService("StarterGui")):SetCore("SendNotification", { Title = "\226\157\140 Shoot TP", Text = "No hay Murderer", Duration = 2 });
				end);
				return false;
			end;
			local A = e.Character:FindFirstChildOfClass("Humanoid");
			if not A or A.Health <= 0 then
				return false;
			end;
			local E, y = _G.UZIVERT_STP_BUSCAR_GUN();
			if not E then
				pcall(function()
					(game:GetService("StarterGui")):SetCore("SendNotification", { Title = "\226\157\140 Shoot TP", Text = "No ten\195\169s gun", Duration = 2 });
				end);
				return false;
			end;
			local W = l.Character;
			local U = W and W:FindFirstChild("HumanoidRootPart");
			local t = W and W:FindFirstChildOfClass("Humanoid");
			if not U then
				return false;
			end;
			local c = U.CFrame;
			local b = (y == "equipada");
			local k = t and t.WalkSpeed or 16;
			local x = t and t.JumpPower or 50;
			_G.UZIVERT_SHOOT_TP_ACTIVO = true;
			if not b then
				_G.UZIVERT_STP_EQUIPAR(E);
			end;
			local z = E:FindFirstChild("Shoot", true);
			if not z then
				if not b then
					_G.UZIVERT_STP_DESEQUIPAR();
				end;
				_G.UZIVERT_SHOOT_TP_ACTIVO = false;
				return false;
			end;
			if t then
				t.WalkSpeed = 0;
				t.JumpPower = 0;
			end;
			local d = tick();
			local w = 0;
			local m = 0;
			local V = 0;
			while (tick() - d) < _G.UZIVERT_SHOOT_TP_DURACION do
				if not e.Character or not A.Parent or A.Health <= 0 then
					break;
				end;
				if not U or not U.Parent then
					break;
				end;
				local l = tick() - d;
				if l - V >= _G.UZIVERT_SHOOT_TP_LOCK then
					local A = e.Character:FindFirstChild("HumanoidRootPart");
					if A then
						U.CFrame = A.CFrame * CFrame.new(0, 1, _G.UZIVERT_SHOOT_TP_DISTANCIA);
						U.Velocity = Vector3.new(0, 0, 0);
						U.RotVelocity = Vector3.new(0, 0, 0);
					end;
					V = l;
				end;
				if l - w >= _G.UZIVERT_SHOOT_TP_INTERVALO then
					local A = e.Character:FindFirstChild("Head");
					if A then
						local e = E:FindFirstChild("Handle");
						local l = e and e.CFrame or U.CFrame;
						pcall(function()
							z:FireServer(l, CFrame.new(A.Position));
						end);
						m = m + 1;
					end;
					w = l;
				end;
				a.Heartbeat:Wait();
			end;
			if t and t.Parent then
				t.WalkSpeed = k;
				t.JumpPower = x;
			end;
			if U and U.Parent then
				U.CFrame = c;
				U.Velocity = Vector3.new(0, 0, 0);
			end;
			task.wait(.1);
			if not b then
				_G.UZIVERT_STP_DESEQUIPAR();
			end;
			_G.UZIVERT_SHOOT_TP_ACTIVO = false;
			print("\240\159\148\171 Shoot TP \226\134\146 " .. (e.Name .. (" | " .. (m .. " tiros"))));
			return true;
		end;
	_G.secSTP = Instance.new("Frame");
	_G.secSTP.Size = UDim2.new(1, 0, 0, 30);
	_G.secSTP.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secSTP.BackgroundTransparency = .3;
	_G.secSTP.BorderSizePixel = 0;
	_G.secSTP.ZIndex = 2;
	_G.secSTP.Parent = lB;
	_G.cSecSTP = Instance.new("UICorner");
	_G.cSecSTP.CornerRadius = UDim.new(0, 7);
	_G.cSecSTP.Parent = _G.secSTP;
	_G.sSecSTP = Instance.new("UIStroke");
	_G.sSecSTP.Color = k.Morado3;
	_G.sSecSTP.Thickness = 1.5;
	_G.sSecSTP.Transparency = .2;
	_G.sSecSTP.Parent = _G.secSTP;
	_G.lblSecSTP = Instance.new("TextLabel");
	_G.lblSecSTP.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecSTP.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecSTP.BackgroundTransparency = 1;
	_G.lblSecSTP.Text = "\240\159\148\171 SHOOT TELEPORT";
	_G.lblSecSTP.TextColor3 = k.Naranja2;
	_G.lblSecSTP.Font = Enum.Font.GothamBlack;
	_G.lblSecSTP.TextSize = 12;
	_G.lblSecSTP.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecSTP.ZIndex = 3;
	_G.lblSecSTP.Parent = _G.secSTP;
	local A = Instance.new("TextButton");
	A.Name = "UzivertShootTP";
	A.Size = UDim2.new(1, 0, 0, 50);
	A.BackgroundColor3 = k.Fondo;
	A.BackgroundTransparency = .3;
	A.Text = "\240\159\148\171 SHOOT TP";
	A.TextColor3 = k.Texto;
	A.Font = Enum.Font.GothamBold;
	A.TextSize = 14;
	A.BorderSizePixel = 0;
	A.Active = true;
	A.ClipsDescendants = true;
	A.ZIndex = 2;
	A.Parent = lB;
	local E = Instance.new("UICorner");
	E.CornerRadius = UDim.new(0, 10);
	E.Parent = A;
	local y = Instance.new("UIStroke");
	y.Color = k.Naranja1;
	y.Thickness = 2;
	y.Transparency = .2;
	y.Parent = A;
	task.spawn(function()
		while A.Parent do
			local e = tick();
			local A = ((math.sin(e * 1.5) + 1)) / 2;
			y.Color = k.Naranja1:Lerp(k.Morado2, A);
			y.Transparency = .4 - A * .3;
			task.wait(.05);
		end;
	end);
	A.MouseButton1Click:Connect(function()
		if _G.UZIVERT_SHOOT_TP_ACTIVO then
			return;
		end;
		A.Text = "\226\154\161 EJECUTANDO...";
		task.spawn(function()
			_G.UZIVERT_SHOOT_TP();
			task.wait(.3);
			A.Text = "\240\159\148\171 SHOOT TP";
		end);
	end);
	O(lB, "\240\159\147\140 Mostrar bot\195\179n flotante STP", d.ShootTPVisible or false, function(e)
		d.ShootTPVisible = e;
		m();
		if e then
			if not _G.UZIVERT_STP_BINDABLE or not _G.UZIVERT_STP_BINDABLE.Parent then
				local e = Instance.new("TextButton");
				e.Name = "STP_Bindable";
				e.Size = UDim2.new(0, 40, 0, 40);
				if d.ShootTPPos then
					e.Position = UDim2.new(d.ShootTPPos[1], d.ShootTPPos[2], d.ShootTPPos[3], d.ShootTPPos[4]);
				else
					e.Position = UDim2.new(0, 30, .6, 0);
				end;
				e.BackgroundColor3 = k.Fondo;
				e.BackgroundTransparency = .3;
				e.Text = "STP";
				e.TextColor3 = k.Texto;
				e.Font = Enum.Font.GothamBold;
				e.TextSize = 11;
				e.BorderSizePixel = 0;
				e.Active = true;
				e.Draggable = true;
				e.ClipsDescendants = true;
				e.ZIndex = 998;
				e.Parent = S;
				local A = Instance.new("UICorner");
				A.CornerRadius = UDim.new(0, 10);
				A.Parent = e;
				local l = Instance.new("UIStroke");
				l.Color = k.Naranja1;
				l.Thickness = 2;
				l.Transparency = .2;
				l.Parent = e;
				task.spawn(function()
					while e.Parent do
						local e = tick();
						local A = ((math.sin(e * 1.5) + 1)) / 2;
						l.Color = k.Naranja1:Lerp(k.Morado2, A);
						l.Transparency = .4 - A * .3;
						task.wait(.05);
					end;
				end);
				e.MouseButton1Click:Connect(function()
					if _G.UZIVERT_SHOOT_TP_ACTIVO then
						return;
					end;
					e.Text = "\226\154\161";
					task.spawn(function()
						_G.UZIVERT_SHOOT_TP();
						task.wait(.3);
						e.Text = "STP";
					end);
				end);
				_G.UZIVERT_STP_BINDABLE = e;
				task.spawn(function()
					while e.Parent do
						task.wait(2);
						if e.Parent then
							d.ShootTPPos = {
									e.Position.X.Scale,
									e.Position.X.Offset,
									e.Position.Y.Scale,
									e.Position.Y.Offset,
								};
							m();
						end;
					end;
				end);
			end;
		else
			if _G.UZIVERT_STP_BINDABLE then
				_G.UZIVERT_STP_BINDABLE:Destroy();
				_G.UZIVERT_STP_BINDABLE = nil;
			end;
		end;
	end);
	if d.ShootTPVisible then
		task.wait(.5);
		if not _G.UZIVERT_STP_BINDABLE or not _G.UZIVERT_STP_BINDABLE.Parent then
			local e = Instance.new("TextButton");
			e.Name = "STP_Bindable";
			e.Size = UDim2.new(0, 40, 0, 40);
			if d.ShootTPPos then
				e.Position = UDim2.new(d.ShootTPPos[1], d.ShootTPPos[2], d.ShootTPPos[3], d.ShootTPPos[4]);
			else
				e.Position = UDim2.new(0, 30, .6, 0);
			end;
			e.BackgroundColor3 = k.Fondo;
			e.BackgroundTransparency = .3;
			e.Text = "STP";
			e.TextColor3 = k.Texto;
			e.Font = Enum.Font.GothamBold;
			e.TextSize = 11;
			e.BorderSizePixel = 0;
			e.Active = true;
			e.Draggable = true;
			e.ClipsDescendants = true;
			e.ZIndex = 998;
			e.Parent = S;
			local A = Instance.new("UICorner");
			A.CornerRadius = UDim.new(0, 10);
			A.Parent = e;
			local l = Instance.new("UIStroke");
			l.Color = k.Naranja1;
			l.Thickness = 2;
			l.Transparency = .2;
			l.Parent = e;
			task.spawn(function()
				while e.Parent do
					local e = tick();
					local A = ((math.sin(e * 1.5) + 1)) / 2;
					l.Color = k.Naranja1:Lerp(k.Morado2, A);
					l.Transparency = .4 - A * .3;
					task.wait(.05);
				end;
			end);
			e.MouseButton1Click:Connect(function()
				if _G.UZIVERT_SHOOT_TP_ACTIVO then
					return;
				end;
				e.Text = "\226\154\161";
				task.spawn(function()
					_G.UZIVERT_SHOOT_TP();
					task.wait(.3);
					e.Text = "STP";
				end);
			end);
			_G.UZIVERT_STP_BINDABLE = e;
			task.spawn(function()
				while e.Parent do
					task.wait(2);
					if e.Parent then
						d.ShootTPPos = {
								e.Position.X.Scale,
								e.Position.X.Offset,
								e.Position.Y.Scale,
								e.Position.Y.Offset,
							};
						m();
					end;
				end;
			end);
		end;
	end;
end;
local Gy = nil;
local By = nil;
local Sy = 0;
local Cy = 0;
local function Iy()
	if By then
		By:Disconnect();
		By = nil;
	end;
	if Gy then
		Gy:Destroy();
		Gy = nil;
	end;
end;
local function jy()
	Iy();
	local e = Instance.new("ScreenGui");
	e.Name = "UzivertMonitor";
	e.ResetOnSpawn = false;
	e.DisplayOrder = 998;
	e.Parent = B;
	Gy = e;
	local function A(A)
		local l = Instance.new("TextLabel");
		l.AnchorPoint = Vector2.new(1, 0);
		l.Size = UDim2.new(1, -24, 0, 19);
		l.Position = UDim2.new(1, -12, 0, A);
		l.BackgroundTransparency = 1;
		l.Font = Enum.Font.Code;
		l.TextXAlignment = Enum.TextXAlignment.Right;
		l.TextSize = 14;
		l.TextColor3 = Color3.fromRGB(240, 240, 240);
		l.TextStrokeTransparency = .4;
		l.Text = "";
		l.Parent = e;
		return l;
	end;
	local l = A(40);
	local E = A(59);
	local y = A(78);
	By = a.RenderStepped:Connect(function(e)
			if not T then
				return;
			end;
			if e > 0 then
				Sy = Sy + 1;
				Cy = Cy + e;
				if Cy >= .25 then
					local e = math.floor(Sy / Cy + .5);
					l.Text = "Ping: " .. (ay() .. " ms");
					E.Text = "FPS: " .. e;
					y.Text = "Jitter: " .. (math.floor(IB + .5) .. (" ms | " .. jB));
					Sy = 0;
					Cy = 0;
				end;
			end;
		end);
end;
local Oy = {};
local function Jy()
	for e = #Oy, 1, -1 do
		local A = Oy[e];
		pcall(function()
			A.object[A.property] = A.value;
		end);
		table.remove(Oy, e);
	end;
end;
local function qy(e, A, l)
	local E, y = pcall(function()
			return e[A];
		end);
	if E then
		table.insert(Oy, { object = e, property = A, value = y });
		pcall(function()
			e[A] = l;
		end);
	end;
end;
print("\240\159\142\131 Parte 6/10 cargada - Botones Shoot + Fling");
O(AB, "\240\159\142\131 ESP Jugadores", d.ESP, function(e)
	V = e;
	d.ESP = e;
	m();
	if not e then
		uB();
	end;
end);
O(AB, "\240\159\148\171 Gun ESP (equipada + tirada)", d.GunESP, function(e)
	H = e;
	d.GunESP = e;
	m();
	if not e then
		BB();
	end;
end);
local oy = Instance.new("TextLabel");
oy.Size = UDim2.new(1, 0, 0, 60);
oy.BackgroundColor3 = k.Morado3;
oy.BackgroundTransparency = .5;
oy.Text = "\240\159\142\131 Rojo = Murderer\n\240\159\145\187 Azul = Sheriff\n\240\159\146\128 Verde = Inocente\n\240\159\166\135 Azul brillante = Gun\n\240\159\141\172 Amarillo = Dropped Gun";
oy.TextColor3 = k.Texto;
oy.Font = Enum.Font.GothamMedium;
oy.TextSize = 10;
oy.BorderSizePixel = 0;
oy.ZIndex = 2;
oy.Parent = AB;
local vy = Instance.new("UICorner");
vy.CornerRadius = UDim.new(0, 9);
vy.Parent = oy;
local ec = Instance.new("UIStroke");
ec.Color = k.Naranja1;
ec.Thickness = 1;
ec.Transparency = .4;
ec.Parent = oy;
_G.secAim1 = Instance.new("Frame");
_G.secAim1.Size = UDim2.new(1, 0, 0, 30);
_G.secAim1.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secAim1.BackgroundTransparency = .3;
_G.secAim1.BorderSizePixel = 0;
_G.secAim1.ZIndex = 2;
_G.secAim1.Parent = lB;
_G.cSecAim1 = Instance.new("UICorner");
_G.cSecAim1.CornerRadius = UDim.new(0, 7);
_G.cSecAim1.Parent = _G.secAim1;
_G.sSecAim1 = Instance.new("UIStroke");
_G.sSecAim1.Color = k.Morado3;
_G.sSecAim1.Thickness = 1.5;
_G.sSecAim1.Transparency = .2;
_G.sSecAim1.Parent = _G.secAim1;
_G.lblSecAim1 = Instance.new("TextLabel");
_G.lblSecAim1.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecAim1.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecAim1.BackgroundTransparency = 1;
_G.lblSecAim1.Text = "\240\159\142\175 SHOOT MURDERER (Inestable)";
_G.lblSecAim1.TextColor3 = k.Naranja2;
_G.lblSecAim1.Font = Enum.Font.GothamBlack;
_G.lblSecAim1.TextSize = 12;
_G.lblSecAim1.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecAim1.ZIndex = 3;
_G.lblSecAim1.Parent = _G.secAim1;
if not _G.UZIVERT_GAMA_BAJA then
	O(lB, "\240\159\145\187 Auto Shoot (logica avanzada)", d.ShootAuto, function(e)
		r = e;
		d.ShootAuto = e;
		m();
	end);
end;
_G.UZ_PB_ON = d.PiercerBullet or false;
_G.UZ_PB_BTN = nil;
_G.UZ_PB_WALL = RaycastParams.new();
_G.UZ_PB_WALL.FilterType = Enum.RaycastFilterType.Exclude;
_G.UZ_PB_WALL.IgnoreWater = true;
_G.UZ_PB_ORIGIN = function(A, E, y)
		if not _G.UZ_PB_ON or not A or not E or not y then
			return A;
		end;
		local a = (E - A);
		local W = a.Magnitude;
		if W <= .05 then
			return A;
		end;
		local U = a.Unit;
		local t = l.Character;
		local c = { t, y.Parent };
		for e, A in ipairs(e:GetPlayers()) do
			if A.Character and A.Character ~= t then
				table.insert(c, A.Character);
			end;
		end;
		_G.UZ_PB_WALL.FilterDescendantsInstances = c;
		if workspace:Raycast(A, U * W, _G.UZ_PB_WALL) then
			local e = workspace:Raycast(E, -U * W, _G.UZ_PB_WALL);
			local A = e and (e.Position + U * .9) or (E - U * .9);
			if ((E - A)).Magnitude > .02 and not workspace:Raycast(A, E - A, _G.UZ_PB_WALL) then
				return A;
			end;
		end;
		return A;
	end;
_G.UZ_PB_CREAR_BTN = function()
		if _G.UZ_PB_BTN then
			return;
		end;
		local e = Instance.new("TextButton");
		e.Name = "PiercerBind";
		e.Size = UDim2.new(0, 40, 0, 40);
		e.Position = UDim2.new(0, 30, .75, 0);
		e.BackgroundColor3 = k.Fondo;
		e.BackgroundTransparency = .3;
		e.Text = "PB";
		e.TextColor3 = k.Texto;
		e.Font = Enum.Font.GothamBold;
		e.TextSize = 11;
		e.BorderSizePixel = 0;
		e.Active = true;
		e.Draggable = true;
		e.ZIndex = 998;
		e.Parent = S;
		if d.PiercerBtnPos then
			pcall(function()
				e.Position = UDim2.new(d.PiercerBtnPos[1], d.PiercerBtnPos[2], d.PiercerBtnPos[3], d.PiercerBtnPos[4]);
			end);
		end;
		local A = Instance.new("UICorner");
		A.CornerRadius = UDim.new(0, 10);
		A.Parent = e;
		local l = Instance.new("UIStroke");
		l.Name = "@Stroke";
		l.Color = Color3.fromRGB(100, 100, 100);
		l.Thickness = 2;
		l.Transparency = .2;
		l.Parent = e;
		task.spawn(function()
			while e.Parent do
				local e = tick();
				local A = ((math.sin(e * 1.5) + 1)) / 2;
				if _G.UZ_PB_ON then
					l.Color = k.Naranja1:Lerp(k.Morado2, A);
					l.Transparency = .4 - A * .3;
				else
					l.Color = Color3.fromRGB(100, 100, 100);
					l.Transparency = .4;
				end;
				task.wait(.05);
			end;
		end);
		e.MouseButton1Click:Connect(function()
			_G.UZ_PB_ON = not _G.UZ_PB_ON;
			d.PiercerBullet = _G.UZ_PB_ON;
			m();
			e.Text = _G.UZ_PB_ON and "ON" or "PB";
		end);
		task.spawn(function()
			while e.Parent do
				task.wait(2);
				if e.Parent then
					d.PiercerBtnPos = {
							e.Position.X.Scale,
							e.Position.X.Offset,
							e.Position.Y.Scale,
							e.Position.Y.Offset,
						};
					m();
				end;
			end;
		end);
		_G.UZ_PB_BTN = e;
		e.Text = _G.UZ_PB_ON and "ON" or "PB";
	end;
O(lB, "\240\159\142\175 Piercer Bullet", d.PiercerBullet or false, function(e)
	_G.UZ_PB_ON = e;
	d.PiercerBullet = e;
	m();
	if _G.UZ_PB_BTN then
		_G.UZ_PB_BTN.Text = e and "ON" or "PB";
	end;
end);
O(lB, "\240\159\147\177 Mostrar bot\195\179n flotante PB", d.PiercerBtnShow ~= false, function(e)
	d.PiercerBtnShow = e;
	m();
	if e then
		_G.UZ_PB_CREAR_BTN();
	else
		if _G.UZ_PB_BTN then
			_G.UZ_PB_BTN:Destroy();
			_G.UZ_PB_BTN = nil;
		end;
	end;
end);
if d.PiercerBtnShow ~= false then
	task.wait(.3);
	_G.UZ_PB_CREAR_BTN();
end;
O(lB, "\240\159\142\175 Mostrar boton SHOOT MURDERER", d.ShootMostrar ~= false, function(e)
	N = e;
	d.ShootMostrar = e;
	m();
	if fy then
		fy.Visible = e;
	end;
end);
_G.secAim2 = Instance.new("Frame");
_G.secAim2.Size = UDim2.new(1, 0, 0, 30);
_G.secAim2.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secAim2.BackgroundTransparency = .3;
_G.secAim2.BorderSizePixel = 0;
_G.secAim2.ZIndex = 2;
_G.secAim2.Parent = lB;
_G.cSecAim2 = Instance.new("UICorner");
_G.cSecAim2.CornerRadius = UDim.new(0, 7);
_G.cSecAim2.Parent = _G.secAim2;
_G.sSecAim2 = Instance.new("UIStroke");
_G.sSecAim2.Color = k.Morado3;
_G.sSecAim2.Thickness = 1.5;
_G.sSecAim2.Transparency = .2;
_G.sSecAim2.Parent = _G.secAim2;
_G.lblSecAim2 = Instance.new("TextLabel");
_G.lblSecAim2.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecAim2.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecAim2.BackgroundTransparency = 1;
_G.lblSecAim2.Text = "\240\159\142\175 AIMLOCK V2";
_G.lblSecAim2.TextColor3 = k.Naranja2;
_G.lblSecAim2.Font = Enum.Font.GothamBlack;
_G.lblSecAim2.TextSize = 12;
_G.lblSecAim2.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecAim2.ZIndex = 3;
_G.lblSecAim2.Parent = _G.secAim2;
O(lB, "\240\159\142\175 Enable Aimlock", d.AimLock or false, function(e)
	_G.AIM_ON = e;
	d.AimLock = e;
	m();
	if e then
		_G.AIM_TARGET = _G.AIM_FIND_MURDERER();
	end;
	if _G.AIM_ACTUALIZAR_BTN then
		_G.AIM_ACTUALIZAR_BTN();
	end;
end);
O(lB, "\240\159\147\177 Mostrar bot\195\179n flotante (AIM)", d.AimBtnShow ~= false, function(e)
	d.AimBtnShow = e;
	m();
	if e then
		_G.AIM_CREAR_BTN();
	else
		if _G.AIM_BTN then
			_G.AIM_BTN:Destroy();
			_G.AIM_BTN = nil;
		end;
	end;
end);
O(lB, "\240\159\167\177 Wall Check", d.AimWall or false, function(e)
	_G.AIM_WALL = e;
	d.AimWall = e;
	m();
end);
O(lB, "\240\159\142\175 FOV Check", d.AimFOV or false, function(e)
	_G.AIM_FOV_ON = e;
	d.AimFOV = e;
	m();
	_G.AIM_UPDATE_FOV();
end);
O(lB, "\226\134\148\239\184\143 Horizontal Prediction", d.AimHoriz or false, function(e)
	_G.AIM_HORIZ = e;
	d.AimHoriz = e;
	m();
end);
q(lB, "\240\159\140\128 Smoothness (0=instant)", 0, 95, d.AimSmooth or 25, function(e)
	_G.AIM_SMOOTH = e;
	d.AimSmooth = e;
	m();
end);
q(lB, "\240\159\142\175 FOV Radius (px)", 50, 800, d.AimFOVRadius or 250, function(e)
	_G.AIM_FOV_RADIUS = e;
	d.AimFOVRadius = e;
	m();
	_G.AIM_UPDATE_FOV();
end);
q(lB, "\226\154\161 Prediction (x1000)", 0, 300, math.floor(((d.AimPred or .145)) * 1000), function(e)
	_G.AIM_PRED = e / 1000;
	d.AimPred = e / 1000;
	m();
end);
_G.AIM_SELBTN = Instance.new("TextButton");
_G.AIM_SELBTN.Size = UDim2.new(1, 0, 0, 32);
_G.AIM_SELBTN.BackgroundColor3 = k.Morado3;
_G.AIM_SELBTN.BackgroundTransparency = .5;
_G.AIM_SELBTN.Text = "\240\159\145\164 Select Player: Auto Murderer";
_G.AIM_SELBTN.TextColor3 = k.Texto;
_G.AIM_SELBTN.Font = Enum.Font.GothamBold;
_G.AIM_SELBTN.TextSize = 11;
_G.AIM_SELBTN.BorderSizePixel = 0;
_G.AIM_SELBTN.ZIndex = 2;
_G.AIM_SELBTN.Parent = lB;
_G.cAimSel = Instance.new("UICorner");
_G.cAimSel.CornerRadius = UDim.new(0, 8);
_G.cAimSel.Parent = _G.AIM_SELBTN;
_G.AIM_SELBTN.MouseButton1Click:Connect(function()
	local A = { "Auto Murderer" };
	for e, E in ipairs(e:GetPlayers()) do
		if E ~= l then
			table.insert(A, E.Name);
		end;
	end;
	local E = _G.AIM_SELECTED and _G.AIM_SELECTED.Name or "Auto Murderer";
	local y = table.find(A, E) or 1;
	y = y % #A + 1;
	local a = A[y];
	if a == "Auto Murderer" then
		_G.AIM_SELECTED = nil;
		_G.AIM_SELBTN.Text = "\240\159\145\164 Select Player: Auto Murderer";
	else
		_G.AIM_SELECTED = e:FindFirstChild(a);
		_G.AIM_SELBTN.Text = "\240\159\145\164 Select Player: " .. a;
	end;
end);
_G.AIM_PARTBTN = Instance.new("TextButton");
_G.AIM_PARTBTN.Size = UDim2.new(1, 0, 0, 32);
_G.AIM_PARTBTN.BackgroundColor3 = k.Morado3;
_G.AIM_PARTBTN.BackgroundTransparency = .5;
_G.AIM_PARTBTN.Text = "\240\159\142\175 Part: " .. ((_G.AIM_PART == "Head" and "Head" or "Torso"));
_G.AIM_PARTBTN.TextColor3 = k.Texto;
_G.AIM_PARTBTN.Font = Enum.Font.GothamBold;
_G.AIM_PARTBTN.TextSize = 11;
_G.AIM_PARTBTN.BorderSizePixel = 0;
_G.AIM_PARTBTN.ZIndex = 2;
_G.AIM_PARTBTN.Parent = lB;
_G.cAimPart = Instance.new("UICorner");
_G.cAimPart.CornerRadius = UDim.new(0, 8);
_G.cAimPart.Parent = _G.AIM_PARTBTN;
_G.AIM_PARTBTN.MouseButton1Click:Connect(function()
	if _G.AIM_PART == "Head" then
		_G.AIM_PART = "HumanoidRootPart";
		_G.AIM_PARTBTN.Text = "\240\159\142\175 Part: Torso";
	else
		_G.AIM_PART = "Head";
		_G.AIM_PARTBTN.Text = "\240\159\142\175 Part: Head";
	end;
	d.AimPart = _G.AIM_PART;
	m();
end);
_G.AIM_BTN = nil;
_G.AIM_ACTUALIZAR_BTN = function()
		if not _G.AIM_BTN then
			return;
		end;
		if _G.AIM_ON then
			_G.AIM_BTN.Text = "ON";
		else
			_G.AIM_BTN.Text = "AIM";
		end;
	end;
_G.AIM_CREAR_BTN = function()
		if _G.AIM_BTN then
			return;
		end;
		local e = Instance.new("TextButton");
		e.Name = "AimBind";
		e.Size = UDim2.new(0, 40, 0, 40);
		e.Position = UDim2.new(0, 30, .4, 0);
		e.BackgroundColor3 = k.Fondo;
		e.BackgroundTransparency = .3;
		e.Text = "AIM";
		e.TextColor3 = k.Texto;
		e.Font = Enum.Font.GothamBold;
		e.TextSize = 12;
		e.BorderSizePixel = 0;
		e.Active = true;
		e.Draggable = true;
		e.ZIndex = 998;
		e.Parent = S;
		if d.AimBtnPos then
			pcall(function()
				e.Position = UDim2.new(d.AimBtnPos[1], d.AimBtnPos[2], d.AimBtnPos[3], d.AimBtnPos[4]);
			end);
		end;
		local A = Instance.new("UICorner");
		A.CornerRadius = UDim.new(0, 10);
		A.Parent = e;
		local l = Instance.new("UIStroke");
		l.Name = "@Stroke";
		l.Color = Color3.fromRGB(100, 100, 100);
		l.Thickness = 2;
		l.Transparency = .2;
		l.Parent = e;
		task.spawn(function()
			while e.Parent do
				local e = tick();
				local A = ((math.sin(e * 1.5) + 1)) / 2;
				if _G.AIM_ON then
					l.Color = k.Naranja1:Lerp(k.Morado2, A);
					l.Transparency = .4 - A * .3;
				else
					l.Color = Color3.fromRGB(100, 100, 100);
					l.Transparency = .4;
				end;
				task.wait(.05);
			end;
		end);
		e.MouseButton1Click:Connect(function()
			_G.AIM_ON = not _G.AIM_ON;
			d.AimLock = _G.AIM_ON;
			m();
			if _G.AIM_ON then
				_G.AIM_TARGET = _G.AIM_FIND_MURDERER();
			end;
			_G.AIM_ACTUALIZAR_BTN();
		end);
		task.spawn(function()
			while e.Parent do
				task.wait(2);
				if e.Parent then
					d.AimBtnPos = {
							e.Position.X.Scale,
							e.Position.X.Offset,
							e.Position.Y.Scale,
							e.Position.Y.Offset,
						};
					m();
				end;
			end;
		end);
		_G.AIM_BTN = e;
		_G.AIM_ACTUALIZAR_BTN();
	end;
if d.AimBtnShow ~= false then
	task.wait(.3);
	_G.AIM_CREAR_BTN();
end;
if d.AimFOV then
	task.wait(.5);
	_G.AIM_UPDATE_FOV();
end;
_G.secSA = Instance.new("Frame");
_G.secSA.Size = UDim2.new(1, 0, 0, 30);
_G.secSA.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secSA.BackgroundTransparency = .3;
_G.secSA.BorderSizePixel = 0;
_G.secSA.ZIndex = 2;
_G.secSA.Parent = lB;
_G.cSecSA = Instance.new("UICorner");
_G.cSecSA.CornerRadius = UDim.new(0, 7);
_G.cSecSA.Parent = _G.secSA;
_G.sSecSA = Instance.new("UIStroke");
_G.sSecSA.Color = k.Morado3;
_G.sSecSA.Thickness = 1.5;
_G.sSecSA.Transparency = .2;
_G.sSecSA.Parent = _G.secSA;
_G.lblSecSA = Instance.new("TextLabel");
_G.lblSecSA.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecSA.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecSA.BackgroundTransparency = 1;
_G.lblSecSA.Text = "\240\159\142\175 SILENT AIM v4 (Inestable)";
_G.lblSecSA.TextColor3 = k.Naranja2;
_G.lblSecSA.Font = Enum.Font.GothamBlack;
_G.lblSecSA.TextSize = 12;
_G.lblSecSA.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecSA.ZIndex = 3;
_G.lblSecSA.Parent = _G.secSA;
O(lB, "\240\159\142\175 Silent Aim", d.SilentAim or false, function(e)
	_G.UZIVERT_SA_ON = e;
	d.SilentAim = e;
	m();
end);
O(lB, "\240\159\142\175 Multi-Point (7 tiros)", d.SilentMultiPoint ~= false, function(e)
	_G.UZIVERT_SA_MULTI = e;
	d.SilentMultiPoint = e;
	m();
end);
q(lB, "\240\159\142\175 Extra Lead (x1000)", 0, 100, math.floor(((d.SilentPred or .02)) * 1000), function(e)
	_G.UZIVERT_SA_PRED = e / 1000;
	d.SilentPred = e / 1000;
	if _G.UZNOIR_CFG then
		_G.UZNOIR_CFG.extraLead = e / 1000;
	end;
	m();
end);
O(lB, "\240\159\166\152 Predict Jump", d.SilentPredictJump ~= false, function(e)
	d.SilentPredictJump = e;
	if _G.UZNOIR_CFG then
		_G.UZNOIR_CFG.predictJump = e;
	end;
	m();
end);
O(lB, "\240\159\143\131 Predict Lag", d.SilentPredictLag ~= false, function(e)
	d.SilentPredictLag = e;
	if _G.UZNOIR_CFG then
		_G.UZNOIR_CFG.predictLag = e;
	end;
	m();
end);
q(lB, "\226\154\153\239\184\143 Max Simulation (ms)", 50, 500, d.SilentMaxSimMs or 180, function(e)
	d.SilentMaxSimMs = e;
	if _G.UZNOIR_CFG then
		_G.UZNOIR_CFG.maxSimulationMs = e;
	end;
	m();
end);
q(lB, "\226\134\148\239\184\143 Horizontal Mult (%)", 50, 250, d.SilentHMult or 100, function(e)
	d.SilentHMult = e;
	if _G.UZNOIR_CFG then
		_G.UZNOIR_CFG.horizontalMultiplier = e;
	end;
	m();
end);
q(lB, "\226\134\149\239\184\143 Vertical Mult (%)", 50, 250, d.SilentVMult or 100, function(e)
	d.SilentVMult = e;
	if _G.UZNOIR_CFG then
		_G.UZNOIR_CFG.verticalMultiplier = e;
	end;
	m();
end);
q(lB, "\240\159\142\175 Prediction Interval (ms)", 30, 200, d.SilentPredInterval or 72, function(e)
	d.SilentPredInterval = e;
	if _G.UZNOIR_CFG then
		_G.UZNOIR_CFG.predictionIntervalMs = e;
	end;
	m();
end);
_G.UZNOIR_PING_LABEL = Instance.new("TextLabel");
_G.UZNOIR_PING_LABEL.Size = UDim2.new(1, 0, 0, 30);
_G.UZNOIR_PING_LABEL.BackgroundColor3 = k.Morado3;
_G.UZNOIR_PING_LABEL.BackgroundTransparency = .5;
_G.UZNOIR_PING_LABEL.Text = "\240\159\147\161 Ping: -- ms";
_G.UZNOIR_PING_LABEL.TextColor3 = k.Texto;
_G.UZNOIR_PING_LABEL.Font = Enum.Font.GothamBold;
_G.UZNOIR_PING_LABEL.TextSize = 11;
_G.UZNOIR_PING_LABEL.BorderSizePixel = 0;
_G.UZNOIR_PING_LABEL.ZIndex = 2;
_G.UZNOIR_PING_LABEL.Parent = lB;
local Ac = Instance.new("UICorner");
Ac.CornerRadius = UDim.new(0, 8);
Ac.Parent = _G.UZNOIR_PING_LABEL;
task.spawn(function()
	while task.wait(.5) do
		if _G.UZNOIR_PING_LABEL and _G.UZNOIR_PING_LABEL.Parent then
			local e = 0;
			pcall(function()
				e = math.floor(((_G.UZNOIR_cachedPing or .08)) * 1000 + .5);
			end);
			_G.UZNOIR_PING_LABEL.Text = string.format("\240\159\147\161 Ping: %d ms | Lead: %.3f", e, (_G.UZNOIR_CFG and _G.UZNOIR_CFG.extraLead) or .02);
		end;
	end;
end);
if not _G.UZIVERT_GAMA_BAJA then
	_G.secAim3 = Instance.new("Frame");
	_G.secAim3.Size = UDim2.new(1, 0, 0, 30);
	_G.secAim3.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secAim3.BackgroundTransparency = .3;
	_G.secAim3.BorderSizePixel = 0;
	_G.secAim3.ZIndex = 2;
	_G.secAim3.Parent = lB;
	_G.cSecAim3 = Instance.new("UICorner");
	_G.cSecAim3.CornerRadius = UDim.new(0, 7);
	_G.cSecAim3.Parent = _G.secAim3;
	_G.sSecAim3 = Instance.new("UIStroke");
	_G.sSecAim3.Color = k.Morado3;
	_G.sSecAim3.Thickness = 1.5;
	_G.sSecAim3.Transparency = .2;
	_G.sSecAim3.Parent = _G.secAim3;
	_G.lblSecAim3 = Instance.new("TextLabel");
	_G.lblSecAim3.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecAim3.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecAim3.BackgroundTransparency = 1;
	_G.lblSecAim3.Text = "\240\159\148\170 MATAR";
	_G.lblSecAim3.TextColor3 = k.Naranja2;
	_G.lblSecAim3.Font = Enum.Font.GothamBlack;
	_G.lblSecAim3.TextSize = 12;
	_G.lblSecAim3.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecAim3.ZIndex = 3;
	_G.lblSecAim3.Parent = _G.secAim3;
	O(lB, "\240\159\146\165 Activar KILL ALL (Murderer)", d.KillAllActivo or false, function(e)
		G = e;
		d.KillAllActivo = e;
		m();
		print(e and "\240\159\146\165 Kill All ACTIVADO" or "\226\157\140 Kill All DESACTIVADO");
	end);
	J(lB, "Matar Sheriff", function()
		_G.UZIVERT_MATAR_SHERIFF();
	end, k.Naranja1);
	_G.secAim4 = Instance.new("Frame");
	_G.secAim4.Size = UDim2.new(1, 0, 0, 30);
	_G.secAim4.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secAim4.BackgroundTransparency = .3;
	_G.secAim4.BorderSizePixel = 0;
	_G.secAim4.ZIndex = 2;
	_G.secAim4.Parent = lB;
	_G.cSecAim4 = Instance.new("UICorner");
	_G.cSecAim4.CornerRadius = UDim.new(0, 7);
	_G.cSecAim4.Parent = _G.secAim4;
	_G.sSecAim4 = Instance.new("UIStroke");
	_G.sSecAim4.Color = k.Morado3;
	_G.sSecAim4.Thickness = 1.5;
	_G.sSecAim4.Transparency = .2;
	_G.sSecAim4.Parent = _G.secAim4;
	_G.lblSecAim4 = Instance.new("TextLabel");
	_G.lblSecAim4.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecAim4.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecAim4.BackgroundTransparency = 1;
	_G.lblSecAim4.Text = "\226\154\153\239\184\143 AJUSTES DE SHOOT";
	_G.lblSecAim4.TextColor3 = k.Naranja2;
	_G.lblSecAim4.Font = Enum.Font.GothamBlack;
	_G.lblSecAim4.TextSize = 12;
	_G.lblSecAim4.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecAim4.ZIndex = 3;
	_G.lblSecAim4.Parent = _G.secAim4;
	O(lB, "\240\159\143\131 Predict Lag", d.ShootPredictLag ~= false, function(e)
		_G.UZSHOOT_CFG.predictLag = e;
		d.ShootPredictLag = e;
		m();
	end);
	O(lB, "\240\159\166\152 Predict Jump", d.ShootPredictJump or false, function(e)
		_G.UZSHOOT_CFG.predictJump = e;
		d.ShootPredictJump = e;
		m();
	end);
	O(lB, "\240\159\147\161 Prioritize Ping", d.ShootPrioritizePing ~= false, function(e)
		_G.UZSHOOT_CFG.prioritizePing = e;
		d.ShootPrioritizePing = e;
		m();
	end);
	O(lB, "\240\159\167\177 Wall Check", d.ShootWallCheck ~= false, function(e)
		_G.UZSHOOT_CFG.wallCheck = e;
		d.ShootWallCheck = e;
		m();
	end);
	O(lB, "\240\159\148\171 Auto-unequip", d.ShootAutoUnequip ~= false, function(e)
		_G.UZSHOOT_CFG.autoUnequip = e;
		d.ShootAutoUnequip = e;
		m();
	end);
	q(lB, "\240\159\142\175 Extra Lead (x1000)", 0, 100, math.floor(((d.ShootExtraLead or .02)) * 1000), function(e)
		_G.UZSHOOT_CFG.extraLead = e / 1000;
		d.ShootExtraLead = e / 1000;
		m();
	end);
	q(lB, "\226\154\153\239\184\143 Max Sim (ms)", 50, 500, d.ShootMaxSim or 180, function(e)
		_G.UZSHOOT_CFG.maxSimulationMs = e;
		d.ShootMaxSim = e;
		m();
	end);
	q(lB, "\240\159\142\175 Pred Interval (ms)", 30, 200, d.ShootPredInterval or 72, function(e)
		_G.UZSHOOT_CFG.predictionIntervalMs = e;
		d.ShootPredInterval = e;
		m();
	end);
	q(lB, "\226\134\148\239\184\143 H Mult (%)", 50, 250, d.ShootHMult or 100, function(e)
		_G.UZSHOOT_CFG.horizontalMultiplier = e;
		d.ShootHMult = e;
		m();
	end);
	q(lB, "\226\134\149\239\184\143 V Mult (%)", 50, 250, d.ShootVMult or 100, function(e)
		_G.UZSHOOT_CFG.verticalMultiplier = e;
		d.ShootVMult = e;
		m();
	end);
	task.defer(function()
		_G.UZSHOOT_CFG.predictLag = d.ShootPredictLag ~= false;
		_G.UZSHOOT_CFG.predictJump = d.ShootPredictJump or false;
		_G.UZSHOOT_CFG.prioritizePing = d.ShootPrioritizePing ~= false;
		_G.UZSHOOT_CFG.wallCheck = d.ShootWallCheck ~= false;
		_G.UZSHOOT_CFG.autoUnequip = d.ShootAutoUnequip ~= false;
		_G.UZSHOOT_CFG.extraLead = d.ShootExtraLead or .02;
		_G.UZSHOOT_CFG.maxSimulationMs = d.ShootMaxSim or 180;
		_G.UZSHOOT_CFG.predictionIntervalMs = d.ShootPredInterval or 72;
		_G.UZSHOOT_CFG.horizontalMultiplier = d.ShootHMult or 100;
		_G.UZSHOOT_CFG.verticalMultiplier = d.ShootVMult or 100;
	end);
end;
_G.secCrab1 = Instance.new("Frame");
_G.secCrab1.Size = UDim2.new(1, 0, 0, 30);
_G.secCrab1.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secCrab1.BackgroundTransparency = .3;
_G.secCrab1.BorderSizePixel = 0;
_G.secCrab1.ZIndex = 2;
_G.secCrab1.Parent = EB;
_G.cSecCrab1 = Instance.new("UICorner");
_G.cSecCrab1.CornerRadius = UDim.new(0, 7);
_G.cSecCrab1.Parent = _G.secCrab1;
_G.sSecCrab1 = Instance.new("UIStroke");
_G.sSecCrab1.Color = k.Morado3;
_G.sSecCrab1.Thickness = 1.5;
_G.sSecCrab1.Transparency = .2;
_G.sSecCrab1.Parent = _G.secCrab1;
_G.lblSecCrab1 = Instance.new("TextLabel");
_G.lblSecCrab1.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecCrab1.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecCrab1.BackgroundTransparency = 1;
_G.lblSecCrab1.Text = "\240\159\148\170 KNIFE (Murderer)";
_G.lblSecCrab1.TextColor3 = k.Naranja2;
_G.lblSecCrab1.Font = Enum.Font.GothamBlack;
_G.lblSecCrab1.TextSize = 12;
_G.lblSecCrab1.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecCrab1.ZIndex = 3;
_G.lblSecCrab1.Parent = _G.secCrab1;
O(EB, "\240\159\148\170 Knife Aura", d.KnifeAura or false, function(e)
	d.KnifeAura = e;
	m();
end);
q(EB, "Distancia Knife Aura", 5, 50, d.KnifeAuraDist or 15, function(e)
	d.KnifeAuraDist = e;
	m();
end);
if not _G.UZIVERT_GAMA_BAJA then
	O(EB, "\240\159\151\161\239\184\143 Auto Stab (Murderer)", d.AutoStab or false, function(e)
		_G.UZIVERT_AUTO_STAB_ON = e;
		d.AutoStab = e;
		m();
	end);
	q(EB, "Rango Auto Stab", 5, 25, d.AutoStabRango or 6, function(e)
		_G.UZIVERT_STAB_RANGO = e;
		d.AutoStabRango = e;
		m();
	end);
end;
_G.secCrab2 = Instance.new("Frame");
_G.secCrab2.Size = UDim2.new(1, 0, 0, 30);
_G.secCrab2.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secCrab2.BackgroundTransparency = .3;
_G.secCrab2.BorderSizePixel = 0;
_G.secCrab2.ZIndex = 2;
_G.secCrab2.Parent = EB;
_G.cSecCrab2 = Instance.new("UICorner");
_G.cSecCrab2.CornerRadius = UDim.new(0, 7);
_G.cSecCrab2.Parent = _G.secCrab2;
_G.sSecCrab2 = Instance.new("UIStroke");
_G.sSecCrab2.Color = k.Morado3;
_G.sSecCrab2.Thickness = 1.5;
_G.sSecCrab2.Transparency = .2;
_G.sSecCrab2.Parent = _G.secCrab2;
_G.lblSecCrab2 = Instance.new("TextLabel");
_G.lblSecCrab2.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecCrab2.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecCrab2.BackgroundTransparency = 1;
_G.lblSecCrab2.Text = "\240\159\148\171 GUN (Sheriff / Innocent)";
_G.lblSecCrab2.TextColor3 = k.Naranja2;
_G.lblSecCrab2.Font = Enum.Font.GothamBlack;
_G.lblSecCrab2.TextSize = 12;
_G.lblSecCrab2.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecCrab2.ZIndex = 3;
_G.lblSecCrab2.Parent = _G.secCrab2;
O(EB, "\240\159\141\172 Mostrar boton GRAB GUN", d.AutoGrabMostrar ~= false, function(e)
	d.AutoGrabMostrar = e;
	m();
end);
O(EB, "\240\159\148\171 Auto Get Gun (lejano)", d.AutoGetGun or false, function(e)
	_G.UZIVERT_AUTO_GET_GUN_ON = e;
	d.AutoGetGun = e;
	m();
end);
O(EB, "\240\159\142\175 Gun Aura (cerca)", d.GunAura or false, function(e)
	_G.UZIVERT_GUN_AURA_ON = e;
	d.GunAura = e;
	m();
end);
q(EB, "Rango Gun Aura", 5, 100, d.GunAuraRango or 25, function(e)
	_G.UZIVERT_GUN_AURA_RANGO = e;
	d.GunAuraRango = e;
	m();
end);
J(EB, "Agarrar Gun Ahora", function()
	_G.UZIVERT_AGARRAR_GUN();
end, k.Naranja1);
_G.secJug1 = Instance.new("Frame");
_G.secJug1.Size = UDim2.new(1, 0, 0, 30);
_G.secJug1.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secJug1.BackgroundTransparency = .3;
_G.secJug1.BorderSizePixel = 0;
_G.secJug1.ZIndex = 2;
_G.secJug1.Parent = yB;
_G.cSecJug1 = Instance.new("UICorner");
_G.cSecJug1.CornerRadius = UDim.new(0, 7);
_G.cSecJug1.Parent = _G.secJug1;
_G.sSecJug1 = Instance.new("UIStroke");
_G.sSecJug1.Color = k.Morado3;
_G.sSecJug1.Thickness = 1.5;
_G.sSecJug1.Transparency = .2;
_G.sSecJug1.Parent = _G.secJug1;
_G.lblSecJug1 = Instance.new("TextLabel");
_G.lblSecJug1.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecJug1.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecJug1.BackgroundTransparency = 1;
_G.lblSecJug1.Text = "\240\159\154\128 MOVIMIENTO";
_G.lblSecJug1.TextColor3 = k.Naranja2;
_G.lblSecJug1.Font = Enum.Font.GothamBlack;
_G.lblSecJug1.TextSize = 12;
_G.lblSecJug1.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecJug1.ZIndex = 3;
_G.lblSecJug1.Parent = _G.secJug1;
if not _G.UZIVERT_GAMA_BAJA then
	q(yB, "Walkspeed", 16, 200, d.Walkspeed, function(e)
		i = e;
		d.Walkspeed = e;
		m();
	end);
	O(yB, "\240\159\145\187 Noclip", d.Noclip, function(e)
		p = e;
		d.Noclip = e;
		m();
	end);
	O(yB, "\240\159\140\128 Spinbot (Anti-Aim)", d.Spinbot, function(e)
		Y = e;
		d.Spinbot = e;
		m();
	end);
end;
O(yB, "\226\154\161 Speed Glitch (Shift Lock)", d.SpeedGlitch or false, function(e)
	_G.UZIVERT_SG_ON = e;
	d.SpeedGlitch = e;
	m();
end);
q(yB, "Velocidad Speed Glitch", 1, 300, d.SpeedGlitchValor or 50, function(e)
	_G.UZIVERT_SG_VALOR = e;
	d.SpeedGlitchValor = e;
	m();
end);
_G.secJug2 = Instance.new("Frame");
_G.secJug2.Size = UDim2.new(1, 0, 0, 30);
_G.secJug2.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secJug2.BackgroundTransparency = .3;
_G.secJug2.BorderSizePixel = 0;
_G.secJug2.ZIndex = 2;
_G.secJug2.Parent = yB;
_G.cSecJug2 = Instance.new("UICorner");
_G.cSecJug2.CornerRadius = UDim.new(0, 7);
_G.cSecJug2.Parent = _G.secJug2;
_G.sSecJug2 = Instance.new("UIStroke");
_G.sSecJug2.Color = k.Morado3;
_G.sSecJug2.Thickness = 1.5;
_G.sSecJug2.Transparency = .2;
_G.sSecJug2.Parent = _G.secJug2;
_G.lblSecJug2 = Instance.new("TextLabel");
_G.lblSecJug2.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecJug2.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecJug2.BackgroundTransparency = 1;
_G.lblSecJug2.Text = "\240\159\155\161\239\184\143 DEFENSA";
_G.lblSecJug2.TextColor3 = k.Naranja2;
_G.lblSecJug2.Font = Enum.Font.GothamBlack;
_G.lblSecJug2.TextSize = 12;
_G.lblSecJug2.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecJug2.ZIndex = 3;
_G.lblSecJug2.Parent = _G.secJug2;
O(yB, "\240\159\155\161 Anti-Fling", d.AntiFling, function(e)
	s = e;
	d.AntiFling = e;
	m();
	if e then
		pcall(function()
			(loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anti-fling-73205")))();
		end);
	end;
end);
_G.UZ_INV = {
		enabled = false,
		originals = {},
		character = nil,
		humanoid = nil,
		root = nil,
	};
_G.UZ_INV_RESTORE = function()
		for e, A in pairs(_G.UZ_INV.originals) do
			if e and e.Parent then
				pcall(function()
					e.Transparency = A;
				end);
			end;
		end;
		table.clear(_G.UZ_INV.originals);
	end;
_G.UZ_INV_SETUP = function(e)
		_G.UZ_INV.character = e or l.Character;
		local A = _G.UZ_INV.character;
		_G.UZ_INV.humanoid = A and A:FindFirstChildWhichIsA("Humanoid");
		_G.UZ_INV.root = A and A:FindFirstChild("HumanoidRootPart");
		table.clear(_G.UZ_INV.originals);
		if not A then
			return;
		end;
		for e, A in ipairs(A:GetDescendants()) do
			if A:IsA("BasePart") and A.Transparency == 0 then
				_G.UZ_INV.originals[A] = A.Transparency;
			end;
		end;
	end;
_G.UZ_INV_SET_TRANSPARENCY = function(e)
		for A in pairs(_G.UZ_INV.originals) do
			if A and A.Parent then
				pcall(function()
					A.Transparency = e;
				end);
			end;
		end;
	end;
_G.UZ_INV_APPLY = function()
		_G.UZ_INV_RESTORE();
		if not _G.UZ_INV.enabled then
			return;
		end;
		_G.UZ_INV_SETUP(l.Character);
		_G.UZ_INV_SET_TRANSPARENCY(.5);
	end;
a.Heartbeat:Connect(function()
	if not _G.UZ_INV.enabled then
		return;
	end;
	local e, A = _G.UZ_INV.root, _G.UZ_INV.humanoid;
	if not ((e and (e.Parent and (A and A.Parent)))) then
		_G.UZ_INV_SETUP(l.Character);
		e, A = _G.UZ_INV.root, _G.UZ_INV.humanoid;
	end;
	if not ((e and A)) then
		return;
	end;
	local E = e.CFrame;
	local y = A.CameraOffset;
	local W = E * CFrame.new(0, -200000, 0);
	local U = pcall(function()
			e.CFrame = W;
			A.CameraOffset = (W:ToObjectSpace(CFrame.new(E.Position))).Position;
		end);
	if not U then
		return;
	end;
	a.RenderStepped:Wait();
	pcall(function()
		if e.Parent then
			e.CFrame = E;
		end;
		if A.Parent then
			A.CameraOffset = y;
		end;
	end);
end);
l.CharacterAdded:Connect(function(e)
	task.wait(1);
	_G.UZ_INV_SETUP(e);
	if _G.UZ_INV.enabled then
		_G.UZ_INV_SET_TRANSPARENCY(.5);
	end;
end);
O(yB, "\240\159\145\187 Invisible V2 (desync)", d.InvisibleV2 or false, function(e)
	_G.UZ_INV.enabled = e;
	d.InvisibleV2 = e;
	m();
	_G.UZ_INV_APPLY();
end);
_G.UZ_INV_BTN = nil;
_G.UZ_INV_UPDATE_BTN = function()
		if not _G.UZ_INV_BTN then
			return;
		end;
		if _G.UZ_INV.enabled then
			_G.UZ_INV_BTN.Text = "ON";
		else
			_G.UZ_INV_BTN.Text = "INVI";
		end;
	end;
_G.UZ_INV_CREAR_BTN = function()
		if _G.UZ_INV_BTN then
			return;
		end;
		local e = Instance.new("TextButton");
		e.Name = "InviBind";
		e.Size = UDim2.new(0, 40, 0, 40);
		e.Position = UDim2.new(0, 30, .55, 0);
		e.BackgroundColor3 = k.Fondo;
		e.BackgroundTransparency = .3;
		e.Text = "INVI";
		e.TextColor3 = k.Texto;
		e.Font = Enum.Font.GothamBold;
		e.TextSize = 11;
		e.BorderSizePixel = 0;
		e.Active = true;
		e.Draggable = true;
		e.ZIndex = 998;
		e.Parent = S;
		if d.InviBtnPos then
			pcall(function()
				e.Position = UDim2.new(d.InviBtnPos[1], d.InviBtnPos[2], d.InviBtnPos[3], d.InviBtnPos[4]);
			end);
		end;
		local A = Instance.new("UICorner");
		A.CornerRadius = UDim.new(0, 10);
		A.Parent = e;
		local l = Instance.new("UIStroke");
		l.Name = "@Stroke";
		l.Color = Color3.fromRGB(100, 100, 100);
		l.Thickness = 2;
		l.Transparency = .2;
		l.Parent = e;
		task.spawn(function()
			while e.Parent do
				local e = tick();
				local A = ((math.sin(e * 1.5) + 1)) / 2;
				if _G.UZ_INV.enabled then
					l.Color = k.Naranja1:Lerp(k.Morado2, A);
					l.Transparency = .4 - A * .3;
				else
					l.Color = Color3.fromRGB(100, 100, 100);
					l.Transparency = .4;
				end;
				task.wait(.05);
			end;
		end);
		e.MouseButton1Click:Connect(function()
			_G.UZ_INV.enabled = not _G.UZ_INV.enabled;
			d.InvisibleV2 = _G.UZ_INV.enabled;
			m();
			_G.UZ_INV_APPLY();
			_G.UZ_INV_UPDATE_BTN();
		end);
		task.spawn(function()
			while e.Parent do
				task.wait(2);
				if e.Parent then
					d.InviBtnPos = {
							e.Position.X.Scale,
							e.Position.X.Offset,
							e.Position.Y.Scale,
							e.Position.Y.Offset,
						};
					m();
				end;
			end;
		end);
		_G.UZ_INV_BTN = e;
		_G.UZ_INV_UPDATE_BTN();
	end;
O(yB, "\240\159\147\177 Mostrar bot\195\179n flotante INVI", d.InviBtnShow ~= false, function(e)
	d.InviBtnShow = e;
	m();
	if e then
		_G.UZ_INV_CREAR_BTN();
	else
		if _G.UZ_INV_BTN then
			_G.UZ_INV_BTN:Destroy();
			_G.UZ_INV_BTN = nil;
		end;
	end;
end);
if d.InviBtnShow ~= false then
	task.wait(.3);
	_G.UZ_INV_CREAR_BTN();
end;
_G.secAntiAim = Instance.new("Frame");
_G.secAntiAim.Size = UDim2.new(1, 0, 0, 30);
_G.secAntiAim.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secAntiAim.BackgroundTransparency = .3;
_G.secAntiAim.BorderSizePixel = 0;
_G.secAntiAim.ZIndex = 2;
_G.secAntiAim.Parent = yB;
_G.cSecAntiAim = Instance.new("UICorner");
_G.cSecAntiAim.CornerRadius = UDim.new(0, 7);
_G.cSecAntiAim.Parent = _G.secAntiAim;
_G.sSecAntiAim = Instance.new("UIStroke");
_G.sSecAntiAim.Color = k.Morado3;
_G.sSecAntiAim.Thickness = 1.5;
_G.sSecAntiAim.Transparency = .2;
_G.sSecAntiAim.Parent = _G.secAntiAim;
_G.lblSecAntiAim = Instance.new("TextLabel");
_G.lblSecAntiAim.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecAntiAim.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecAntiAim.BackgroundTransparency = 1;
_G.lblSecAntiAim.Text = "\240\159\142\175 ANTI-AIM";
_G.lblSecAntiAim.TextColor3 = k.Naranja2;
_G.lblSecAntiAim.Font = Enum.Font.GothamBlack;
_G.lblSecAntiAim.TextSize = 12;
_G.lblSecAntiAim.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecAntiAim.ZIndex = 3;
_G.lblSecAntiAim.Parent = _G.secAntiAim;
_G.UZIVERT_AA_ON = false;
_G.UZIVERT_AA_IGNORE = true;
_G.UZIVERT_AA_CON = nil;
_G.UZIVERT_AA_HAD_KNIFE = false;
_G.UZIVERT_AA_SLOT1 = nil;
_G.UZIVERT_AA_SLOT2 = nil;
_G.UZIVERT_AA_SLOT3 = nil;
_G.UZIVERT_AA_FIND = function(A)
		if not A or A == "None" then
			return nil;
		end;
		for e, l in ipairs(e:GetPlayers()) do
			if l.Name == A then
				return l;
			end;
		end;
		return nil;
	end;
_G.UZIVERT_AA_HAS_KNIFE = function()
		local e = l:FindFirstChild("Backpack");
		local A = l.Character;
		if e and e:FindFirstChild("Knife") then
			return true;
		end;
		if A and A:FindFirstChild("Knife") then
			return true;
		end;
		return false;
	end;
_G.UZIVERT_AA_NEARBY = function(A)
		for e, E in ipairs(e:GetPlayers()) do
			if E ~= l and (E.Character and E.Character:FindFirstChild("HumanoidRootPart")) then
				local e = E.Character.HumanoidRootPart;
				if ((e.Position - A.Position)).Magnitude <= 6 then
					return true;
				end;
			end;
		end;
		return false;
	end;
_G.UZIVERT_AA_WATER = function(e)
		local A = e:GetState();
		return A == Enum.HumanoidStateType.Swimming or e.FloorMaterial == Enum.Material.Water;
	end;
_G.UZIVERT_AA_IGNORED = function()
		if not _G.UZIVERT_AA_IGNORE then
			return false;
		end;
		local e = { _G.UZIVERT_AA_SLOT1, _G.UZIVERT_AA_SLOT2, _G.UZIVERT_AA_SLOT3 };
		for e, A in ipairs(e) do
			if A and A.Parent then
				local e = A:FindFirstChild("Backpack");
				local l = A.Character;
				if e then
					for e, A in ipairs(e:GetChildren()) do
						if A:IsA("Tool") then
							return true;
						end;
					end;
				end;
				if l then
					for e, A in ipairs(l:GetChildren()) do
						if A:IsA("Tool") then
							return true;
						end;
					end;
				end;
			end;
		end;
		return false;
	end;
_G.UZIVERT_AA_ROLE_STEP = function(e)
		task.spawn(function()
			local A = math.random() > .5 and 1 or -1;
			local l = math.random() > .5 and 1 or -1;
			local E = (Vector3.new(A, 0, l)).Unit;
			local y = tick();
			while tick() - y < .15 do
				if e and e.Parent then
					e:Move(E, false);
				end;
				a.RenderStepped:Wait();
			end;
		end);
	end;
_G.UZIVERT_AA_STOP = function()
		if _G.UZIVERT_AA_CON then
			_G.UZIVERT_AA_CON:Disconnect();
			_G.UZIVERT_AA_CON = nil;
		end;
		_G.UZIVERT_AA_HAD_KNIFE = false;
	end;
_G.UZIVERT_AA_START = function()
		if _G.UZIVERT_AA_CON then
			return;
		end;
		_G.UZIVERT_AA_CON = a.Heartbeat:Connect(function()
				if _G.UZIVERT_AA_IGNORED() then
					return;
				end;
				local e = l.Character;
				if e and (e:FindFirstChild("HumanoidRootPart") and e:FindFirstChild("Humanoid")) then
					local A = e.Humanoid;
					if A.Health > 0 then
						local l = e.HumanoidRootPart;
						local E = _G.UZIVERT_AA_HAS_KNIFE();
						if E and not _G.UZIVERT_AA_HAD_KNIFE then
							_G.UZIVERT_AA_ROLE_STEP(A);
						end;
						_G.UZIVERT_AA_HAD_KNIFE = E;
						if E and (not _G.UZIVERT_AA_NEARBY(l) and not _G.UZIVERT_AA_WATER(A)) then
							local e = l.AssemblyLinearVelocity;
							local E = A:GetState();
							local y = (E == Enum.HumanoidStateType.Jumping or E == Enum.HumanoidStateType.Freefall);
							local W = (A.MoveDirection.Magnitude == 0);
							local U = math.random(1, 2) == 1 and 320 or -320;
							if y then
								local e = math.random(1, 2) == 1 and 250 or -250;
								l.AssemblyLinearVelocity = Vector3.new(U, e, U);
							elseif W then
								local e = math.random(1, 2) == 1 and 400 or -400;
								l.AssemblyLinearVelocity = Vector3.new(e, 0, e);
							else
								l.AssemblyLinearVelocity = Vector3.new(U, 0, U);
							end;
							a.RenderStepped:Wait();
							l.AssemblyLinearVelocity = e;
						end;
					end;
				else
					_G.UZIVERT_AA_HAD_KNIFE = false;
				end;
			end);
	end;
l.CharacterAdded:Connect(function()
	_G.UZIVERT_AA_HAD_KNIFE = false;
end);
O(yB, "\240\159\142\175 Anti-Aim", d.AntiAim or false, function(e)
	_G.UZIVERT_AA_ON = e;
	d.AntiAim = e;
	m();
	if e then
		_G.UZIVERT_AA_START();
	else
		_G.UZIVERT_AA_STOP();
	end;
end);
O(yB, "\240\159\155\161\239\184\143 Anti-Aim Ignore List", d.AntiAimIgnore or true, function(e)
	_G.UZIVERT_AA_IGNORE = e;
	d.AntiAimIgnore = e;
	m();
end);
_G.UZIVERT_AA_GET_LIST = function()
		local A = { "None" };
		for e, E in ipairs(e:GetPlayers()) do
			if E ~= l then
				table.insert(A, E.Name);
			end;
		end;
		return A;
	end;
_G.UZIVERT_AA_DD1 = Instance.new("TextButton");
_G.UZIVERT_AA_DD1.Size = UDim2.new(1, 0, 0, 38);
_G.UZIVERT_AA_DD1.BackgroundColor3 = k.Morado3;
_G.UZIVERT_AA_DD1.BackgroundTransparency = .5;
_G.UZIVERT_AA_DD1.Text = "Ignorar 1: None \226\150\188";
_G.UZIVERT_AA_DD1.TextColor3 = k.Texto;
_G.UZIVERT_AA_DD1.Font = Enum.Font.GothamBold;
_G.UZIVERT_AA_DD1.TextSize = 11;
_G.UZIVERT_AA_DD1.BorderSizePixel = 0;
_G.UZIVERT_AA_DD1.ZIndex = 2;
_G.UZIVERT_AA_DD1.Parent = yB;
_G.cAADD1 = Instance.new("UICorner");
_G.cAADD1.CornerRadius = UDim.new(0, 8);
_G.cAADD1.Parent = _G.UZIVERT_AA_DD1;
_G.UZIVERT_AA_DD1.MouseButton1Click:Connect(function()
	local e = _G.UZIVERT_AA_GET_LIST();
	local A = table.find(e, _G.UZIVERT_AA_SLOT1 and _G.UZIVERT_AA_SLOT1.Name or "None");
	A = ((A or 1)) % #e + 1;
	local l = e[A];
	_G.UZIVERT_AA_SLOT1 = _G.UZIVERT_AA_FIND(l);
	_G.UZIVERT_AA_DD1.Text = "Ignorar 1: " .. (l .. " \226\150\188");
	d.AntiAimSlot1 = l;
	m();
end);
_G.UZIVERT_AA_DD2 = Instance.new("TextButton");
_G.UZIVERT_AA_DD2.Size = UDim2.new(1, 0, 0, 38);
_G.UZIVERT_AA_DD2.BackgroundColor3 = k.Morado3;
_G.UZIVERT_AA_DD2.BackgroundTransparency = .5;
_G.UZIVERT_AA_DD2.Text = "Ignorar 2: None \226\150\188";
_G.UZIVERT_AA_DD2.TextColor3 = k.Texto;
_G.UZIVERT_AA_DD2.Font = Enum.Font.GothamBold;
_G.UZIVERT_AA_DD2.TextSize = 11;
_G.UZIVERT_AA_DD2.BorderSizePixel = 0;
_G.UZIVERT_AA_DD2.ZIndex = 2;
_G.UZIVERT_AA_DD2.Parent = yB;
_G.cAADD2 = Instance.new("UICorner");
_G.cAADD2.CornerRadius = UDim.new(0, 8);
_G.cAADD2.Parent = _G.UZIVERT_AA_DD2;
_G.UZIVERT_AA_DD2.MouseButton1Click:Connect(function()
	local e = _G.UZIVERT_AA_GET_LIST();
	local A = table.find(e, _G.UZIVERT_AA_SLOT2 and _G.UZIVERT_AA_SLOT2.Name or "None");
	A = ((A or 1)) % #e + 1;
	local l = e[A];
	_G.UZIVERT_AA_SLOT2 = _G.UZIVERT_AA_FIND(l);
	_G.UZIVERT_AA_DD2.Text = "Ignorar 2: " .. (l .. " \226\150\188");
	d.AntiAimSlot2 = l;
	m();
end);
_G.UZIVERT_AA_DD3 = Instance.new("TextButton");
_G.UZIVERT_AA_DD3.Size = UDim2.new(1, 0, 0, 38);
_G.UZIVERT_AA_DD3.BackgroundColor3 = k.Morado3;
_G.UZIVERT_AA_DD3.BackgroundTransparency = .5;
_G.UZIVERT_AA_DD3.Text = "Ignorar 3: None \226\150\188";
_G.UZIVERT_AA_DD3.TextColor3 = k.Texto;
_G.UZIVERT_AA_DD3.Font = Enum.Font.GothamBold;
_G.UZIVERT_AA_DD3.TextSize = 11;
_G.UZIVERT_AA_DD3.BorderSizePixel = 0;
_G.UZIVERT_AA_DD3.ZIndex = 2;
_G.UZIVERT_AA_DD3.Parent = yB;
_G.cAADD3 = Instance.new("UICorner");
_G.cAADD3.CornerRadius = UDim.new(0, 8);
_G.cAADD3.Parent = _G.UZIVERT_AA_DD3;
_G.UZIVERT_AA_DD3.MouseButton1Click:Connect(function()
	local e = _G.UZIVERT_AA_GET_LIST();
	local A = table.find(e, _G.UZIVERT_AA_SLOT3 and _G.UZIVERT_AA_SLOT3.Name or "None");
	A = ((A or 1)) % #e + 1;
	local l = e[A];
	_G.UZIVERT_AA_SLOT3 = _G.UZIVERT_AA_FIND(l);
	_G.UZIVERT_AA_DD3.Text = "Ignorar 3: " .. (l .. " \226\150\188");
	d.AntiAimSlot3 = l;
	m();
end);
if d.AntiAimSlot1 and d.AntiAimSlot1 ~= "None" then
	_G.UZIVERT_AA_SLOT1 = _G.UZIVERT_AA_FIND(d.AntiAimSlot1);
	_G.UZIVERT_AA_DD1.Text = "Ignorar 1: " .. (d.AntiAimSlot1  .. " \226\150\188");
end;
if d.AntiAimSlot2 and d.AntiAimSlot2 ~= "None" then
	_G.UZIVERT_AA_SLOT2 = _G.UZIVERT_AA_FIND(d.AntiAimSlot2);
	_G.UZIVERT_AA_DD2.Text = "Ignorar 2: " .. (d.AntiAimSlot2  .. " \226\150\188");
end;
if d.AntiAimSlot3 and d.AntiAimSlot3 ~= "None" then
	_G.UZIVERT_AA_SLOT3 = _G.UZIVERT_AA_FIND(d.AntiAimSlot3);
	_G.UZIVERT_AA_DD3.Text = "Ignorar 3: " .. (d.AntiAimSlot3  .. " \226\150\188");
end;
if d.AntiAim then
	_G.UZIVERT_AA_ON = true;
	task.wait(.5);
	_G.UZIVERT_AA_START();
end;
if not _G.UZIVERT_GAMA_BAJA then
	_G.secJug3 = Instance.new("Frame");
	_G.secJug3.Size = UDim2.new(1, 0, 0, 30);
	_G.secJug3.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secJug3.BackgroundTransparency = .3;
	_G.secJug3.BorderSizePixel = 0;
	_G.secJug3.ZIndex = 2;
	_G.secJug3.Parent = yB;
	_G.cSecJug3 = Instance.new("UICorner");
	_G.cSecJug3.CornerRadius = UDim.new(0, 7);
	_G.cSecJug3.Parent = _G.secJug3;
	_G.sSecJug3 = Instance.new("UIStroke");
	_G.sSecJug3.Color = k.Morado3;
	_G.sSecJug3.Thickness = 1.5;
	_G.sSecJug3.Transparency = .2;
	_G.sSecJug3.Parent = _G.secJug3;
	_G.lblSecJug3 = Instance.new("TextLabel");
	_G.lblSecJug3.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecJug3.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecJug3.BackgroundTransparency = 1;
	_G.lblSecJug3.Text = "\240\159\142\167 MUSIC PLAYER";
	_G.lblSecJug3.TextColor3 = k.Naranja2;
	_G.lblSecJug3.Font = Enum.Font.GothamBlack;
	_G.lblSecJug3.TextSize = 12;
	_G.lblSecJug3.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecJug3.ZIndex = 3;
	_G.lblSecJug3.Parent = _G.secJug3;
	_G.UZIVERT_MUSIC_CANCIONES = {
			{ Nombre = "Canci\195\179n 1", ID = "84944985070181" },
			{ Nombre = "Canci\195\179n 2", ID = "87570666848900" },
			{ Nombre = "Canci\195\179n 3", ID = "82746224492420" },
			{ Nombre = "Canci\195\179n 4", ID = "71393805905055" },
			{ Nombre = "Canci\195\179n 5", ID = "75688616622595" },
			{ Nombre = "Canci\195\179n 6", ID = "135609653444873" },
			{ Nombre = "Canci\195\179n 7", ID = "93699644879957" },
			{ Nombre = "Canci\195\179n 8", ID = "110398343528156" },
			{ Nombre = "Canci\195\179n 9", ID = "138863509657081" },
			{ Nombre = "Canci\195\179n 10", ID = "115440201770223" },
			{ Nombre = "Canci\195\179n 11", ID = "128048502331483" },
			{ Nombre = "Canci\195\179n 12", ID = "135321902579514" },
			{ Nombre = "Canci\195\179n 13", ID = "131465489873214" },
		};
	if d.CancionesCustom then
		for e, A in ipairs(d.CancionesCustom) do
			table.insert(_G.UZIVERT_MUSIC_CANCIONES, A);
		end;
	end;
	_G.UZIVERT_MUSIC_INDEX = 1;
	_G.UZIVERT_MUSIC_SHUFFLE = false;
	_G.UZIVERT_MUSIC_REPEAT = false;
	_G.UZIVERT_MUSIC_VOLUMEN = d.MusicVolumen or .5;
	_G.UZIVERT_MUSIC_SOUND = Instance.new("Sound");
	_G.UZIVERT_MUSIC_SOUND.Name = "UzivertMusicPlayer";
	_G.UZIVERT_MUSIC_SOUND.Looped = false;
	_G.UZIVERT_MUSIC_SOUND.Volume = _G.UZIVERT_MUSIC_VOLUMEN;
	_G.UZIVERT_MUSIC_SOUND.Parent = game:GetService("SoundService");
	_G.UZIVERT_MUSIC_LABEL = nil;
	_G.UZIVERT_MUSIC_PLAY = function(e)
			if not _G.UZIVERT_MUSIC_CANCIONES[e] then
				return;
			end;
			_G.UZIVERT_MUSIC_INDEX = e;
			_G.UZIVERT_MUSIC_SOUND:Stop();
			_G.UZIVERT_MUSIC_SOUND.SoundId = "rbxassetid://" .. _G.UZIVERT_MUSIC_CANCIONES[e].ID;
			_G.UZIVERT_MUSIC_SOUND:Play();
			if _G.UZIVERT_MUSIC_LABEL then
				_G.UZIVERT_MUSIC_LABEL.Text = "\240\159\142\181 " .. _G.UZIVERT_MUSIC_CANCIONES[e].Nombre;
			end;
		end;
	_G.UZIVERT_MUSIC_SIGUIENTE = function()
			if _G.UZIVERT_MUSIC_SHUFFLE then
				local e = _G.UZIVERT_MUSIC_INDEX;
				while e == _G.UZIVERT_MUSIC_INDEX and #_G.UZIVERT_MUSIC_CANCIONES > 1 do
					e = math.random(1, #_G.UZIVERT_MUSIC_CANCIONES);
				end;
				_G.UZIVERT_MUSIC_PLAY(e);
			else
				local e = _G.UZIVERT_MUSIC_INDEX + 1;
				if e > #_G.UZIVERT_MUSIC_CANCIONES then
					e = 1;
				end;
				_G.UZIVERT_MUSIC_PLAY(e);
			end;
		end;
	_G.UZIVERT_MUSIC_ANTERIOR = function()
			if _G.UZIVERT_MUSIC_SHUFFLE then
				local e = _G.UZIVERT_MUSIC_INDEX;
				while e == _G.UZIVERT_MUSIC_INDEX and #_G.UZIVERT_MUSIC_CANCIONES > 1 do
					e = math.random(1, #_G.UZIVERT_MUSIC_CANCIONES);
				end;
				_G.UZIVERT_MUSIC_PLAY(e);
			else
				local e = _G.UZIVERT_MUSIC_INDEX - 1;
				if e < 1 then
					e = #_G.UZIVERT_MUSIC_CANCIONES;
				end;
				_G.UZIVERT_MUSIC_PLAY(e);
			end;
		end;
	_G.UZIVERT_MUSIC_SOUND.Ended:Connect(function()
		if _G.UZIVERT_MUSIC_REPEAT then
			_G.UZIVERT_MUSIC_PLAY(_G.UZIVERT_MUSIC_INDEX);
		else
			_G.UZIVERT_MUSIC_SIGUIENTE();
		end;
	end);
	_G.UZIVERT_MUSIC_LABEL = Instance.new("TextLabel");
	_G.UZIVERT_MUSIC_LABEL.Size = UDim2.new(1, 0, 0, 40);
	_G.UZIVERT_MUSIC_LABEL.BackgroundColor3 = Color3.fromRGB(10, 5, 15);
	_G.UZIVERT_MUSIC_LABEL.BackgroundTransparency = .3;
	_G.UZIVERT_MUSIC_LABEL.Text = "\240\159\142\181 Sin canci\195\179n";
	_G.UZIVERT_MUSIC_LABEL.TextColor3 = k.Texto;
	_G.UZIVERT_MUSIC_LABEL.Font = Enum.Font.GothamBold;
	_G.UZIVERT_MUSIC_LABEL.TextSize = 11;
	_G.UZIVERT_MUSIC_LABEL.TextWrapped = true;
	_G.UZIVERT_MUSIC_LABEL.ZIndex = 2;
	_G.UZIVERT_MUSIC_LABEL.Parent = yB;
	_G.cMusLabel = Instance.new("UICorner");
	_G.cMusLabel.CornerRadius = UDim.new(0, 8);
	_G.cMusLabel.Parent = _G.UZIVERT_MUSIC_LABEL;
	_G.musFilaPlay = Instance.new("Frame");
	_G.musFilaPlay.Size = UDim2.new(1, 0, 0, 38);
	_G.musFilaPlay.BackgroundTransparency = 1;
	_G.musFilaPlay.ZIndex = 2;
	_G.musFilaPlay.Parent = yB;
	_G.musLayoutPlay = Instance.new("UIListLayout");
	_G.musLayoutPlay.FillDirection = Enum.FillDirection.Horizontal;
	_G.musLayoutPlay.Padding = UDim.new(0, 6);
	_G.musLayoutPlay.SortOrder = Enum.SortOrder.LayoutOrder;
	_G.musLayoutPlay.Parent = _G.musFilaPlay;
	_G.UZIVERT_MUSIC_PLAYBTN = Instance.new("TextButton");
	_G.UZIVERT_MUSIC_PLAYBTN.Size = UDim2.new(.5, -3, 1, 0);
	_G.UZIVERT_MUSIC_PLAYBTN.BackgroundColor3 = Color3.fromRGB(60, 200, 100);
	_G.UZIVERT_MUSIC_PLAYBTN.BackgroundTransparency = .3;
	_G.UZIVERT_MUSIC_PLAYBTN.Text = "\226\150\182 PLAY";
	_G.UZIVERT_MUSIC_PLAYBTN.TextColor3 = k.Texto;
	_G.UZIVERT_MUSIC_PLAYBTN.Font = Enum.Font.GothamBold;
	_G.UZIVERT_MUSIC_PLAYBTN.TextSize = 12;
	_G.UZIVERT_MUSIC_PLAYBTN.BorderSizePixel = 0;
	_G.UZIVERT_MUSIC_PLAYBTN.LayoutOrder = 1;
	_G.UZIVERT_MUSIC_PLAYBTN.ZIndex = 2;
	_G.UZIVERT_MUSIC_PLAYBTN.Parent = _G.musFilaPlay;
	_G.cMusPlay = Instance.new("UICorner");
	_G.cMusPlay.CornerRadius = UDim.new(0, 9);
	_G.cMusPlay.Parent = _G.UZIVERT_MUSIC_PLAYBTN;
	_G.UZIVERT_MUSIC_PLAYBTN.MouseButton1Click:Connect(function()
		if _G.UZIVERT_MUSIC_SOUND.Playing then
			_G.UZIVERT_MUSIC_SOUND:Pause();
			_G.UZIVERT_MUSIC_PLAYBTN.Text = "\226\150\182 PLAY";
		else
			if _G.UZIVERT_MUSIC_SOUND.SoundId == "" then
				_G.UZIVERT_MUSIC_PLAY(_G.UZIVERT_MUSIC_INDEX);
			else
				_G.UZIVERT_MUSIC_SOUND:Resume();
			end;
			_G.UZIVERT_MUSIC_PLAYBTN.Text = "\226\143\184 PAUSE";
		end;
	end);
	_G.UZIVERT_MUSIC_STOPBTN = Instance.new("TextButton");
	_G.UZIVERT_MUSIC_STOPBTN.Size = UDim2.new(.5, -3, 1, 0);
	_G.UZIVERT_MUSIC_STOPBTN.BackgroundColor3 = Color3.fromRGB(200, 60, 60);
	_G.UZIVERT_MUSIC_STOPBTN.BackgroundTransparency = .3;
	_G.UZIVERT_MUSIC_STOPBTN.Text = "\226\143\185 STOP";
	_G.UZIVERT_MUSIC_STOPBTN.TextColor3 = k.Texto;
	_G.UZIVERT_MUSIC_STOPBTN.Font = Enum.Font.GothamBold;
	_G.UZIVERT_MUSIC_STOPBTN.TextSize = 12;
	_G.UZIVERT_MUSIC_STOPBTN.BorderSizePixel = 0;
	_G.UZIVERT_MUSIC_STOPBTN.LayoutOrder = 2;
	_G.UZIVERT_MUSIC_STOPBTN.ZIndex = 2;
	_G.UZIVERT_MUSIC_STOPBTN.Parent = _G.musFilaPlay;
	_G.cMusStop = Instance.new("UICorner");
	_G.cMusStop.CornerRadius = UDim.new(0, 9);
	_G.cMusStop.Parent = _G.UZIVERT_MUSIC_STOPBTN;
	_G.UZIVERT_MUSIC_STOPBTN.MouseButton1Click:Connect(function()
		_G.UZIVERT_MUSIC_SOUND:Stop();
		_G.UZIVERT_MUSIC_SOUND.SoundId = "";
		_G.UZIVERT_MUSIC_PLAYBTN.Text = "\226\150\182 PLAY";
		_G.UZIVERT_MUSIC_LABEL.Text = "\240\159\142\181 Sin canci\195\179n";
	end);
	_G.musFilaNav = Instance.new("Frame");
	_G.musFilaNav.Size = UDim2.new(1, 0, 0, 38);
	_G.musFilaNav.BackgroundTransparency = 1;
	_G.musFilaNav.ZIndex = 2;
	_G.musFilaNav.Parent = yB;
	_G.musLayoutNav = Instance.new("UIListLayout");
	_G.musLayoutNav.FillDirection = Enum.FillDirection.Horizontal;
	_G.musLayoutNav.Padding = UDim.new(0, 6);
	_G.musLayoutNav.SortOrder = Enum.SortOrder.LayoutOrder;
	_G.musLayoutNav.Parent = _G.musFilaNav;
	_G.UZIVERT_MUSIC_ANTBTN = Instance.new("TextButton");
	_G.UZIVERT_MUSIC_ANTBTN.Size = UDim2.new(.5, -3, 1, 0);
	_G.UZIVERT_MUSIC_ANTBTN.BackgroundColor3 = k.Morado1;
	_G.UZIVERT_MUSIC_ANTBTN.BackgroundTransparency = .3;
	_G.UZIVERT_MUSIC_ANTBTN.Text = "\226\151\128\226\151\128 ANT";
	_G.UZIVERT_MUSIC_ANTBTN.TextColor3 = k.Texto;
	_G.UZIVERT_MUSIC_ANTBTN.Font = Enum.Font.GothamBold;
	_G.UZIVERT_MUSIC_ANTBTN.TextSize = 12;
	_G.UZIVERT_MUSIC_ANTBTN.BorderSizePixel = 0;
	_G.UZIVERT_MUSIC_ANTBTN.LayoutOrder = 1;
	_G.UZIVERT_MUSIC_ANTBTN.ZIndex = 2;
	_G.UZIVERT_MUSIC_ANTBTN.Parent = _G.musFilaNav;
	_G.cMusAnt = Instance.new("UICorner");
	_G.cMusAnt.CornerRadius = UDim.new(0, 9);
	_G.cMusAnt.Parent = _G.UZIVERT_MUSIC_ANTBTN;
	_G.UZIVERT_MUSIC_ANTBTN.MouseButton1Click:Connect(function()
		_G.UZIVERT_MUSIC_ANTERIOR();
	end);
	_G.UZIVERT_MUSIC_SIGBTN = Instance.new("TextButton");
	_G.UZIVERT_MUSIC_SIGBTN.Size = UDim2.new(.5, -3, 1, 0);
	_G.UZIVERT_MUSIC_SIGBTN.BackgroundColor3 = k.Morado1;
	_G.UZIVERT_MUSIC_SIGBTN.BackgroundTransparency = .3;
	_G.UZIVERT_MUSIC_SIGBTN.Text = "SIG \226\150\182\226\150\182";
	_G.UZIVERT_MUSIC_SIGBTN.TextColor3 = k.Texto;
	_G.UZIVERT_MUSIC_SIGBTN.Font = Enum.Font.GothamBold;
	_G.UZIVERT_MUSIC_SIGBTN.TextSize = 12;
	_G.UZIVERT_MUSIC_SIGBTN.BorderSizePixel = 0;
	_G.UZIVERT_MUSIC_SIGBTN.LayoutOrder = 2;
	_G.UZIVERT_MUSIC_SIGBTN.ZIndex = 2;
	_G.UZIVERT_MUSIC_SIGBTN.Parent = _G.musFilaNav;
	_G.cMusSig = Instance.new("UICorner");
	_G.cMusSig.CornerRadius = UDim.new(0, 9);
	_G.cMusSig.Parent = _G.UZIVERT_MUSIC_SIGBTN;
	_G.UZIVERT_MUSIC_SIGBTN.MouseButton1Click:Connect(function()
		_G.UZIVERT_MUSIC_SIGUIENTE();
	end);
	O(yB, "?? Shuffle (aleatorio)", false, function(e)
		_G.UZIVERT_MUSIC_SHUFFLE = e;
	end);
	O(yB, "\240\159\148\129 Repeat (repetir)", false, function(e)
		_G.UZIVERT_MUSIC_REPEAT = e;
		_G.UZIVERT_MUSIC_SOUND.Looped = e;
	end);
	q(yB, "\240\159\148\138 Volumen", 0, 100, math.floor(_G.UZIVERT_MUSIC_VOLUMEN * 100), function(e)
		_G.UZIVERT_MUSIC_VOLUMEN = e / 100;
		_G.UZIVERT_MUSIC_SOUND.Volume = _G.UZIVERT_MUSIC_VOLUMEN;
		d.MusicVolumen = _G.UZIVERT_MUSIC_VOLUMEN;
		m();
	end);
	J(yB, "\240\159\147\139 Elegir Canci\195\179n", function()
		_G.UZIVERT_MUSIC_LISTA.Visible = not _G.UZIVERT_MUSIC_LISTA.Visible;
	end, k.Morado1);
	_G.UZIVERT_MUSIC_LISTA = Instance.new("Frame");
	_G.UZIVERT_MUSIC_LISTA.Size = UDim2.new(1, 0, 0, 200);
	_G.UZIVERT_MUSIC_LISTA.BackgroundColor3 = Color3.fromRGB(15, 10, 20);
	_G.UZIVERT_MUSIC_LISTA.BackgroundTransparency = .1;
	_G.UZIVERT_MUSIC_LISTA.BorderSizePixel = 0;
	_G.UZIVERT_MUSIC_LISTA.Visible = false;
	_G.UZIVERT_MUSIC_LISTA.ZIndex = 10;
	_G.UZIVERT_MUSIC_LISTA.Parent = yB;
	_G.cMusListaF = Instance.new("UICorner");
	_G.cMusListaF.CornerRadius = UDim.new(0, 9);
	_G.cMusListaF.Parent = _G.UZIVERT_MUSIC_LISTA;
	_G.UZIVERT_MUSIC_LISTA_SCROLL = Instance.new("ScrollingFrame");
	_G.UZIVERT_MUSIC_LISTA_SCROLL.Size = UDim2.new(1, 0, 1, 0);
	_G.UZIVERT_MUSIC_LISTA_SCROLL.BackgroundTransparency = 1;
	_G.UZIVERT_MUSIC_LISTA_SCROLL.BorderSizePixel = 0;
	_G.UZIVERT_MUSIC_LISTA_SCROLL.ScrollBarThickness = 3;
	_G.UZIVERT_MUSIC_LISTA_SCROLL.CanvasSize = UDim2.new(0, 0, 0, 0);
	_G.UZIVERT_MUSIC_LISTA_SCROLL.AutomaticCanvasSize = Enum.AutomaticSize.Y;
	_G.UZIVERT_MUSIC_LISTA_SCROLL.ZIndex = 11;
	_G.UZIVERT_MUSIC_LISTA_SCROLL.Parent = _G.UZIVERT_MUSIC_LISTA;
	_G.UZIVERT_MUSIC_LISTA_LAYOUT = Instance.new("UIListLayout");
	_G.UZIVERT_MUSIC_LISTA_LAYOUT.Padding = UDim.new(0, 3);
	_G.UZIVERT_MUSIC_LISTA_LAYOUT.Parent = _G.UZIVERT_MUSIC_LISTA_SCROLL;
	_G.UZIVERT_MUSIC_RECARGAR_LISTA = function()
			for e, A in ipairs(_G.UZIVERT_MUSIC_LISTA_SCROLL:GetChildren()) do
				if A:IsA("TextButton") then
					A:Destroy();
				end;
			end;
			for e, A in ipairs(_G.UZIVERT_MUSIC_CANCIONES) do
				local l = Instance.new("TextButton");
				l.Size = UDim2.new(1, -8, 0, 30);
				l.BackgroundColor3 = Color3.fromRGB(40, 20, 50);
				l.BackgroundTransparency = .4;
				l.Text = "\240\159\142\181 " .. A.Nombre;
				l.TextColor3 = k.Texto;
				l.Font = Enum.Font.GothamBold;
				l.TextSize = 10;
				l.TextXAlignment = Enum.TextXAlignment.Left;
				l.BorderSizePixel = 0;
				l.ZIndex = 12;
				l.Parent = _G.UZIVERT_MUSIC_LISTA_SCROLL;
				local E = Instance.new("UICorner");
				E.CornerRadius = UDim.new(0, 5);
				E.Parent = l;
				l.MouseButton1Click:Connect(function()
					_G.UZIVERT_MUSIC_PLAY(e);
					_G.UZIVERT_MUSIC_LISTA.Visible = false;
					_G.UZIVERT_MUSIC_PLAYBTN.Text = "\226\143\184 PAUSE";
				end);
			end;
		end;
	_G.UZIVERT_MUSIC_RECARGAR_LISTA();
	_G.UZIVERT_MUSIC_NOMBRE = "";
	_G.UZIVERT_MUSIC_ID = "";
	_G.secMusAdd = Instance.new("Frame");
	_G.secMusAdd.Size = UDim2.new(1, 0, 0, 30);
	_G.secMusAdd.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secMusAdd.BackgroundTransparency = .3;
	_G.secMusAdd.BorderSizePixel = 0;
	_G.secMusAdd.ZIndex = 2;
	_G.secMusAdd.Parent = yB;
	_G.cSecMusAdd = Instance.new("UICorner");
	_G.cSecMusAdd.CornerRadius = UDim.new(0, 7);
	_G.cSecMusAdd.Parent = _G.secMusAdd;
	_G.sSecMusAdd = Instance.new("UIStroke");
	_G.sSecMusAdd.Color = k.Morado3;
	_G.sSecMusAdd.Thickness = 1.5;
	_G.sSecMusAdd.Transparency = .2;
	_G.sSecMusAdd.Parent = _G.secMusAdd;
	_G.lblSecMusAdd = Instance.new("TextLabel");
	_G.lblSecMusAdd.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecMusAdd.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecMusAdd.BackgroundTransparency = 1;
	_G.lblSecMusAdd.Text = "\226\158\149 AGREGAR CANCI\195\147N";
	_G.lblSecMusAdd.TextColor3 = k.Naranja2;
	_G.lblSecMusAdd.Font = Enum.Font.GothamBlack;
	_G.lblSecMusAdd.TextSize = 12;
	_G.lblSecMusAdd.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecMusAdd.ZIndex = 3;
	_G.lblSecMusAdd.Parent = _G.secMusAdd;
	_G.UZIVERT_MUSIC_INP_NOMBRE = Instance.new("TextBox");
	_G.UZIVERT_MUSIC_INP_NOMBRE.Size = UDim2.new(1, 0, 0, 38);
	_G.UZIVERT_MUSIC_INP_NOMBRE.BackgroundColor3 = k.Morado3;
	_G.UZIVERT_MUSIC_INP_NOMBRE.BackgroundTransparency = .5;
	_G.UZIVERT_MUSIC_INP_NOMBRE.PlaceholderText = "Nombre de la canci\195\179n";
	_G.UZIVERT_MUSIC_INP_NOMBRE.Text = "";
	_G.UZIVERT_MUSIC_INP_NOMBRE.TextColor3 = k.Texto;
	_G.UZIVERT_MUSIC_INP_NOMBRE.PlaceholderColor3 = k.Sub;
	_G.UZIVERT_MUSIC_INP_NOMBRE.Font = Enum.Font.GothamBold;
	_G.UZIVERT_MUSIC_INP_NOMBRE.TextSize = 11;
	_G.UZIVERT_MUSIC_INP_NOMBRE.BorderSizePixel = 0;
	_G.UZIVERT_MUSIC_INP_NOMBRE.ZIndex = 2;
	_G.UZIVERT_MUSIC_INP_NOMBRE.Parent = yB;
	_G.cMusInpNom = Instance.new("UICorner");
	_G.cMusInpNom.CornerRadius = UDim.new(0, 9);
	_G.cMusInpNom.Parent = _G.UZIVERT_MUSIC_INP_NOMBRE;
	_G.sMusInpNom = Instance.new("UIStroke");
	_G.sMusInpNom.Color = k.Naranja1;
	_G.sMusInpNom.Thickness = 1;
	_G.sMusInpNom.Transparency = .4;
	_G.sMusInpNom.Parent = _G.UZIVERT_MUSIC_INP_NOMBRE;
	_G.UZIVERT_MUSIC_INP_NOMBRE.FocusLost:Connect(function()
		_G.UZIVERT_MUSIC_NOMBRE = _G.UZIVERT_MUSIC_INP_NOMBRE.Text;
	end);
	_G.UZIVERT_MUSIC_INP_ID = Instance.new("TextBox");
	_G.UZIVERT_MUSIC_INP_ID.Size = UDim2.new(1, 0, 0, 38);
	_G.UZIVERT_MUSIC_INP_ID.BackgroundColor3 = k.Morado3;
	_G.UZIVERT_MUSIC_INP_ID.BackgroundTransparency = .5;
	_G.UZIVERT_MUSIC_INP_ID.PlaceholderText = "Roblox ID (ej: 1234567890)";
	_G.UZIVERT_MUSIC_INP_ID.Text = "";
	_G.UZIVERT_MUSIC_INP_ID.TextColor3 = k.Texto;
	_G.UZIVERT_MUSIC_INP_ID.PlaceholderColor3 = k.Sub;
	_G.UZIVERT_MUSIC_INP_ID.Font = Enum.Font.GothamBold;
	_G.UZIVERT_MUSIC_INP_ID.TextSize = 11;
	_G.UZIVERT_MUSIC_INP_ID.BorderSizePixel = 0;
	_G.UZIVERT_MUSIC_INP_ID.ZIndex = 2;
	_G.UZIVERT_MUSIC_INP_ID.Parent = yB;
	_G.cMusInpID = Instance.new("UICorner");
	_G.cMusInpID.CornerRadius = UDim.new(0, 9);
	_G.cMusInpID.Parent = _G.UZIVERT_MUSIC_INP_ID;
	_G.sMusInpID = Instance.new("UIStroke");
	_G.sMusInpID.Color = k.Naranja1;
	_G.sMusInpID.Thickness = 1;
	_G.sMusInpID.Transparency = .4;
	_G.sMusInpID.Parent = _G.UZIVERT_MUSIC_INP_ID;
	_G.UZIVERT_MUSIC_INP_ID.FocusLost:Connect(function()
		_G.UZIVERT_MUSIC_ID = _G.UZIVERT_MUSIC_INP_ID.Text;
	end);
	J(yB, "\226\158\149 A\195\177adir Canci\195\179n", function()
		if _G.UZIVERT_MUSIC_NOMBRE == "" or _G.UZIVERT_MUSIC_ID == "" then
			print("\226\157\140 Complet\195\161 nombre e ID");
			return;
		end;
		local e = #_G.UZIVERT_MUSIC_CANCIONES - 13;
		if e >= 25 then
			print("\226\157\140 Lista llena (m\195\161ximo 25 custom)");
			return;
		end;
		for e, A in ipairs(_G.UZIVERT_MUSIC_CANCIONES) do
			if tostring(A.ID) == tostring(_G.UZIVERT_MUSIC_ID) then
				print("\226\157\140 Esa canci\195\179n ya existe");
				return;
			end;
		end;
		local A = { Nombre = _G.UZIVERT_MUSIC_NOMBRE, ID = _G.UZIVERT_MUSIC_ID };
		table.insert(_G.UZIVERT_MUSIC_CANCIONES, A);
		if not d.CancionesCustom then
			d.CancionesCustom = {};
		end;
		table.insert(d.CancionesCustom, A);
		m();
		_G.UZIVERT_MUSIC_RECARGAR_LISTA();
		_G.UZIVERT_MUSIC_INP_NOMBRE.Text = "";
		_G.UZIVERT_MUSIC_INP_ID.Text = "";
		_G.UZIVERT_MUSIC_NOMBRE = "";
		_G.UZIVERT_MUSIC_ID = "";
		print("\226\156\133 Canci\195\179n agregada: " .. A.Nombre);
	end, k.Verde);
	J(yB, "\240\159\151\145\239\184\143 Vaciar Lista Custom", function()
		while #_G.UZIVERT_MUSIC_CANCIONES > 13 do
			table.remove(_G.UZIVERT_MUSIC_CANCIONES);
		end;
		d.CancionesCustom = {};
		m();
		_G.UZIVERT_MUSIC_RECARGAR_LISTA();
		print("\226\156\133 Lista custom vaciada");
	end, k.Rojo);
end;
if not _G.UZIVERT_GAMA_BAJA then
	_G.secFling1 = Instance.new("Frame");
	_G.secFling1.Size = UDim2.new(1, 0, 0, 30);
	_G.secFling1.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secFling1.BackgroundTransparency = .3;
	_G.secFling1.BorderSizePixel = 0;
	_G.secFling1.ZIndex = 2;
	_G.secFling1.Parent = PaginaFling;
	_G.cSecFling1 = Instance.new("UICorner");
	_G.cSecFling1.CornerRadius = UDim.new(0, 7);
	_G.cSecFling1.Parent = _G.secFling1;
	_G.sSecFling1 = Instance.new("UIStroke");
	_G.sSecFling1.Color = k.Morado3;
	_G.sSecFling1.Thickness = 1.5;
	_G.sSecFling1.Transparency = .2;
	_G.sSecFling1.Parent = _G.secFling1;
	_G.lblSecFling1 = Instance.new("TextLabel");
	_G.lblSecFling1.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecFling1.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecFling1.BackgroundTransparency = 1;
	_G.lblSecFling1.Text = "\240\159\142\175 FLING ROLES";
	_G.lblSecFling1.TextColor3 = k.Naranja2;
	_G.lblSecFling1.Font = Enum.Font.GothamBlack;
	_G.lblSecFling1.TextSize = 12;
	_G.lblSecFling1.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecFling1.ZIndex = 3;
	_G.lblSecFling1.Parent = _G.secFling1;
	J(PaginaFling, "\240\159\140\128 FLING MURDERER", function()
		gy("Murderer");
	end, Color3.fromRGB(20, 15, 25));
	J(PaginaFling, "\240\159\140\128 FLING SHERIFF", function()
		gy("Sheriff");
	end, Color3.fromRGB(20, 15, 25));
	J(PaginaFling, "\240\159\140\128 FLING ALL", function()
		gy("all");
	end, Color3.fromRGB(20, 15, 25));
	J(PaginaFling, "\226\155\148 DETENER FLING", function()
		Fy();
	end, Color3.fromRGB(20, 15, 25));
	_G.secFling2 = Instance.new("Frame");
	_G.secFling2.Size = UDim2.new(1, 0, 0, 30);
	_G.secFling2.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secFling2.BackgroundTransparency = .3;
	_G.secFling2.BorderSizePixel = 0;
	_G.secFling2.ZIndex = 2;
	_G.secFling2.Parent = PaginaFling;
	_G.cSecFling2 = Instance.new("UICorner");
	_G.cSecFling2.CornerRadius = UDim.new(0, 7);
	_G.cSecFling2.Parent = _G.secFling2;
	_G.sSecFling2 = Instance.new("UIStroke");
	_G.sSecFling2.Color = k.Morado3;
	_G.sSecFling2.Thickness = 1.5;
	_G.sSecFling2.Transparency = .2;
	_G.sSecFling2.Parent = _G.secFling2;
	_G.lblSecFling2 = Instance.new("TextLabel");
	_G.lblSecFling2.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecFling2.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecFling2.BackgroundTransparency = 1;
	_G.lblSecFling2.Text = "\240\159\140\128 FLING PLAYER";
	_G.lblSecFling2.TextColor3 = k.Naranja2;
	_G.lblSecFling2.Font = Enum.Font.GothamBlack;
	_G.lblSecFling2.TextSize = 12;
	_G.lblSecFling2.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecFling2.ZIndex = 3;
	_G.lblSecFling2.Parent = _G.secFling2;
	_G.UZIVERT_FLING_DD_BTN = Instance.new("TextButton");
	_G.UZIVERT_FLING_DD_BTN.Size = UDim2.new(1, 0, 0, 42);
	_G.UZIVERT_FLING_DD_BTN.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.UZIVERT_FLING_DD_BTN.BackgroundTransparency = .5;
	_G.UZIVERT_FLING_DD_BTN.Text = "Elegir jugador \226\150\188";
	_G.UZIVERT_FLING_DD_BTN.TextColor3 = k.Texto;
	_G.UZIVERT_FLING_DD_BTN.Font = Enum.Font.GothamBold;
	_G.UZIVERT_FLING_DD_BTN.TextSize = 12;
	_G.UZIVERT_FLING_DD_BTN.BorderSizePixel = 0;
	_G.UZIVERT_FLING_DD_BTN.ClipsDescendants = true;
	_G.UZIVERT_FLING_DD_BTN.ZIndex = 2;
	_G.UZIVERT_FLING_DD_BTN.Parent = PaginaFling;
	_G.UZIVERT_FLING_DD_C = Instance.new("UICorner");
	_G.UZIVERT_FLING_DD_C.CornerRadius = UDim.new(0, 9);
	_G.UZIVERT_FLING_DD_C.Parent = _G.UZIVERT_FLING_DD_BTN;
	_G.UZIVERT_FLING_DD_S = Instance.new("UIStroke");
	_G.UZIVERT_FLING_DD_S.Color = k.Morado3;
	_G.UZIVERT_FLING_DD_S.Thickness = 1.5;
	_G.UZIVERT_FLING_DD_S.Transparency = .2;
	_G.UZIVERT_FLING_DD_S.Parent = _G.UZIVERT_FLING_DD_BTN;
	_G.UZIVERT_FLING_DD_LIST = Instance.new("Frame");
	_G.UZIVERT_FLING_DD_LIST.Size = UDim2.new(1, 0, 0, 0);
	_G.UZIVERT_FLING_DD_LIST.AutomaticSize = Enum.AutomaticSize.Y;
	_G.UZIVERT_FLING_DD_LIST.BackgroundColor3 = k.Morado3;
	_G.UZIVERT_FLING_DD_LIST.BackgroundTransparency = .3;
	_G.UZIVERT_FLING_DD_LIST.BorderSizePixel = 0;
	_G.UZIVERT_FLING_DD_LIST.Visible = false;
	_G.UZIVERT_FLING_DD_LIST.ZIndex = 2;
	_G.UZIVERT_FLING_DD_LIST.Parent = PaginaFling;
	_G.UZIVERT_FLING_DD_LC = Instance.new("UICorner");
	_G.UZIVERT_FLING_DD_LC.CornerRadius = UDim.new(0, 9);
	_G.UZIVERT_FLING_DD_LC.Parent = _G.UZIVERT_FLING_DD_LIST;
	_G.UZIVERT_FLING_DD_LS = Instance.new("UIStroke");
	_G.UZIVERT_FLING_DD_LS.Color = k.Morado3;
	_G.UZIVERT_FLING_DD_LS.Thickness = 1.5;
	_G.UZIVERT_FLING_DD_LS.Transparency = .2;
	_G.UZIVERT_FLING_DD_LS.Parent = _G.UZIVERT_FLING_DD_LIST;
	_G.UZIVERT_FLING_DD_LL = Instance.new("UIListLayout");
	_G.UZIVERT_FLING_DD_LL.Padding = UDim.new(0, 3);
	_G.UZIVERT_FLING_DD_LL.Parent = _G.UZIVERT_FLING_DD_LIST;
	_G.UZIVERT_FLING_DD_LP = Instance.new("UIPadding");
	_G.UZIVERT_FLING_DD_LP.PaddingTop = UDim.new(0, 5);
	_G.UZIVERT_FLING_DD_LP.PaddingBottom = UDim.new(0, 5);
	_G.UZIVERT_FLING_DD_LP.PaddingLeft = UDim.new(0, 5);
	_G.UZIVERT_FLING_DD_LP.PaddingRight = UDim.new(0, 5);
	_G.UZIVERT_FLING_DD_LP.Parent = _G.UZIVERT_FLING_DD_LIST;
	_G.UZIVERT_FLING_DD_BTN.MouseButton1Click:Connect(function()
		_G.UZIVERT_FLING_DD_LIST.Visible = not _G.UZIVERT_FLING_DD_LIST.Visible;
		if _G.UZIVERT_FLING_DD_LIST.Visible then
			_G.UZIVERT_ABRIR_LISTA(_G.UZIVERT_FLING_DD_LIST, _G.UZIVERT_FLING_DD_BTN);
		end;
	end);
	J(PaginaFling, "\240\159\140\128 FLINGEAR TARGET", function()
		if not _G.UZIVERT_FLING_TARGET then
			print("\226\157\140 Eleg\195\173 un jugador primero");
			return;
		end;
		if _G.UZIVERT_FLING_IN_PROGRESS then
			print("\226\154\160\239\184\143 Fling en progreso");
			return;
		end;
		task.spawn(_G.UZIVERT_FLING_FUNC, _G.UZIVERT_FLING_TARGET);
	end, Color3.fromRGB(20, 15, 25));
end;
_G.UZ_TF = { enabled = false, thread = nil };
_G.UZ_TF_ZERO = function()
		local e = l.Character and l.Character:FindFirstChild("HumanoidRootPart");
		if not e then
			return;
		end;
		pcall(function()
			e.Velocity = Vector3.zero;
			e.AssemblyLinearVelocity = Vector3.zero;
			e.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
_G.UZ_TF_SET = function(e)
		_G.UZ_TF.enabled = e;
		if _G.UZ_TF.thread then
			pcall(task.cancel, _G.UZ_TF.thread);
			_G.UZ_TF.thread = nil;
		end;
		if not e then
			_G.UZ_TF_ZERO();
			return;
		end;
		_G.UZ_TF.thread = task.spawn(function()
				while _G.UZ_TF.enabled do
					a.Heartbeat:Wait();
					local e = l.Character;
					local A = e and e:FindFirstChild("HumanoidRootPart");
					if not ((e and (e.Parent and (A and A.Parent)))) then
						continue;
					end;
					local E = workspace.FallenPartsDestroyHeight;
					if typeof(E) == "number" and A.Position.Y < E + 50 then
						_G.UZ_TF_ZERO();
						continue;
					end;
					local y = A.CFrame;
					local W = A.Velocity;
					pcall(function()
						A.CanCollide = true;
					end);
					A.Velocity = W * 10000 + Vector3.new(0, 10000, 0);
					a.RenderStepped:Wait();
					if not _G.UZ_TF.enabled or not A.Parent then
						break;
					end;
					A.Velocity = W;
					a.Stepped:Wait();
					if not _G.UZ_TF.enabled or not A.Parent then
						break;
					end;
					A.Velocity = W + Vector3.new(0, .1, 0);
					if typeof(E) == "number" and A.Position.Y < E + 50 then
						A.CFrame = y;
						_G.UZ_TF_ZERO();
					end;
				end;
				_G.UZ_TF_ZERO();
			end);
	end;
O(PaginaFling, "\240\159\140\128 Touch Fling", d.TouchFling or false, function(e)
	d.TouchFling = e;
	m();
	_G.UZ_TF_SET(e);
	if _G.UZ_TF_UPDATE_BTN then
		_G.UZ_TF_UPDATE_BTN();
	end;
end);
_G.UZ_TF_BTN = nil;
_G.UZ_TF_UPDATE_BTN = function()
		if not _G.UZ_TF_BTN then
			return;
		end;
		if _G.UZ_TF.enabled then
			_G.UZ_TF_BTN.Text = "ON";
		else
			_G.UZ_TF_BTN.Text = "TF";
		end;
	end;
_G.UZ_TF_CREAR_BTN = function()
		if _G.UZ_TF_BTN then
			return;
		end;
		local e = Instance.new("TextButton");
		e.Name = "TFBind";
		e.Size = UDim2.new(0, 40, 0, 40);
		e.Position = UDim2.new(0, 30, .65, 0);
		e.BackgroundColor3 = k.Fondo;
		e.BackgroundTransparency = .3;
		e.Text = "TF";
		e.TextColor3 = k.Texto;
		e.Font = Enum.Font.GothamBold;
		e.TextSize = 11;
		e.BorderSizePixel = 0;
		e.Active = true;
		e.Draggable = true;
		e.ZIndex = 998;
		e.Parent = S;
		if d.TouchFlingBtnPos then
			pcall(function()
				e.Position = UDim2.new(d.TouchFlingBtnPos[1], d.TouchFlingBtnPos[2], d.TouchFlingBtnPos[3], d.TouchFlingBtnPos[4]);
			end);
		end;
		local A = Instance.new("UICorner");
		A.CornerRadius = UDim.new(0, 10);
		A.Parent = e;
		local l = Instance.new("UIStroke");
		l.Name = "@Stroke";
		l.Color = Color3.fromRGB(100, 100, 100);
		l.Thickness = 2;
		l.Transparency = .2;
		l.Parent = e;
		task.spawn(function()
			while e.Parent do
				local e = tick();
				local A = ((math.sin(e * 1.5) + 1)) / 2;
				if _G.UZ_TF.enabled then
					l.Color = k.Naranja1:Lerp(k.Morado2, A);
					l.Transparency = .4 - A * .3;
				else
					l.Color = Color3.fromRGB(100, 100, 100);
					l.Transparency = .4;
				end;
				task.wait(.05);
			end;
		end);
		e.MouseButton1Click:Connect(function()
			_G.UZ_TF.enabled = not _G.UZ_TF.enabled;
			d.TouchFling = _G.UZ_TF.enabled;
			m();
			_G.UZ_TF_SET(_G.UZ_TF.enabled);
			_G.UZ_TF_UPDATE_BTN();
		end);
		task.spawn(function()
			while e.Parent do
				task.wait(2);
				if e.Parent then
					d.TouchFlingBtnPos = {
							e.Position.X.Scale,
							e.Position.X.Offset,
							e.Position.Y.Scale,
							e.Position.Y.Offset,
						};
					m();
				end;
			end;
		end);
		_G.UZ_TF_BTN = e;
		_G.UZ_TF_UPDATE_BTN();
	end;
O(PaginaFling, "\240\159\147\177 Mostrar bot\195\179n flotante TF", d.TouchFlingBtnShow ~= false, function(e)
	d.TouchFlingBtnShow = e;
	m();
	if e then
		_G.UZ_TF_CREAR_BTN();
	else
		if _G.UZ_TF_BTN then
			_G.UZ_TF_BTN:Destroy();
			_G.UZ_TF_BTN = nil;
		end;
	end;
end);
if d.TouchFlingBtnShow ~= false then
	task.wait(.3);
	_G.UZ_TF_CREAR_BTN();
end;
print("\240\159\142\131 Parte 7/10 cargada - P\195\161ginas Aim/Aura/Player/Fling");
if not _G.UZIVERT_GAMA_BAJA then
	O(PaginaAnims, "\240\159\142\172 Activar Animaciones", d.Anims, function(e)
		P = e;
		d.Anims = e;
		m();
		if e then
			ky();
			xy();
		else
			local e = l.Character;
			if e then
				local A = e:FindFirstChild("Animate");
				if A then
					for e, l in pairs(by) do
						local E = A:FindFirstChild(l.folder);
						if E then
							for e, A in ipairs(l.slots) do
								local l = E:FindFirstChild(A.child);
								if l and cy[A.origKey] then
									l.AnimationId = cy[A.origKey];
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end);
	o(PaginaAnims, "Animacion General", Uy, function(e)
		ty.all = e;
		xy();
	end);
	o(PaginaAnims, "Idle", Uy, function(e)
		ty.idle = e;
		xy();
	end);
	o(PaginaAnims, "Walk", Uy, function(e)
		ty.walk = e;
		xy();
	end);
	o(PaginaAnims, "Run", Uy, function(e)
		ty.run = e;
		xy();
	end);
	o(PaginaAnims, "Jump", Uy, function(e)
		ty.jump = e;
		xy();
	end);
	o(PaginaAnims, "Fall", Uy, function(e)
		ty.fall = e;
		xy();
	end);
	o(PaginaAnims, "Climb", Uy, function(e)
		ty.climb = e;
		xy();
	end);
	o(PaginaAnims, "Swim", Uy, function(e)
		ty.swim = e;
		xy();
	end);
	o(PaginaAnims, "SwimIdle", Uy, function(e)
		ty.swimidle = e;
		xy();
	end);
	o(PaginaAnims, "Death", Uy, function(e)
		ty.death = e;
		xy();
	end);
end;
local function lc(e)
	if e then
		if D then
			D:Disconnect();
		end;
		D = workspace.ChildAdded:Connect(function(e)
				if e.Name == "Handle" then
					task.spawn(function()
						local A = e:WaitForChild("creator", .5);
						if A then
							local E = false;
							if A:IsA("ObjectValue") and A.Value == l then
								E = true;
							elseif A:IsA("StringValue") and A.Value == l.Name then
								E = true;
							elseif A.Value == l.Name then
								E = true;
							end;
							if E then
								local A = l.Character;
								if A then
									local l = A:FindFirstChild("HumanoidRootPart");
									local E = A:FindFirstChildOfClass("Humanoid");
									if l and (E and e:IsA("BasePart")) then
										e.CFrame = l.CFrame * CFrame.new(0, -3, 0);
										E:ChangeState(Enum.HumanoidStateType.Jumping);
										print("\240\159\142\129 Auto Prank Bomb \226\134\146 \194\161Doble salto!");
									end;
								end;
							end;
						end;
					end);
				end;
			end);
		print("\240\159\142\129 Auto Prank Bomb ACTIVADO");
	else
		if D then
			D:Disconnect();
			D = nil;
		end;
		print("\226\157\140 Auto Prank Bomb DESACTIVADO");
	end;
end;
_G.secBomb = Instance.new("Frame");
_G.secBomb.Size = UDim2.new(1, 0, 0, 30);
_G.secBomb.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secBomb.BackgroundTransparency = .3;
_G.secBomb.BorderSizePixel = 0;
_G.secBomb.ZIndex = 2;
_G.secBomb.Parent = aB;
_G.cSecBomb = Instance.new("UICorner");
_G.cSecBomb.CornerRadius = UDim.new(0, 7);
_G.cSecBomb.Parent = _G.secBomb;
_G.sSecBomb = Instance.new("UIStroke");
_G.sSecBomb.Color = k.Morado3;
_G.sSecBomb.Thickness = 1.5;
_G.sSecBomb.Transparency = .2;
_G.sSecBomb.Parent = _G.secBomb;
_G.lblSecBomb = Instance.new("TextLabel");
_G.lblSecBomb.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecBomb.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecBomb.BackgroundTransparency = 1;
_G.lblSecBomb.Text = "AUTO BOMB JUMP";
_G.lblSecBomb.TextColor3 = k.Naranja2;
_G.lblSecBomb.Font = Enum.Font.GothamBlack;
_G.lblSecBomb.TextSize = 12;
_G.lblSecBomb.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecBomb.ZIndex = 3;
_G.lblSecBomb.Parent = _G.secBomb;
O(aB, "Auto Bomb Jump", d.AutoPrankBomb or false, function(e)
	R = e;
	d.AutoPrankBomb = e;
	m();
	lc(e);
end);
_G.secFF = Instance.new("Frame");
_G.secFF.Size = UDim2.new(1, 0, 0, 30);
_G.secFF.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secFF.BackgroundTransparency = .3;
_G.secFF.BorderSizePixel = 0;
_G.secFF.ZIndex = 2;
_G.secFF.Parent = aB;
_G.cSecFF = Instance.new("UICorner");
_G.cSecFF.CornerRadius = UDim.new(0, 7);
_G.cSecFF.Parent = _G.secFF;
_G.sSecFF = Instance.new("UIStroke");
_G.sSecFF.Color = k.Morado3;
_G.sSecFF.Thickness = 1.5;
_G.sSecFF.Transparency = .2;
_G.sSecFF.Parent = _G.secFF;
_G.lblSecFF = Instance.new("TextLabel");
_G.lblSecFF.Size = UDim2.new(1, -20, 1, 0);
_G.lblSecFF.Position = UDim2.new(0, 10, 0, 0);
_G.lblSecFF.BackgroundTransparency = 1;
_G.lblSecFF.Text = "\240\159\148\165 FIREFLY CLUTCH";
_G.lblSecFF.TextColor3 = k.Naranja2;
_G.lblSecFF.Font = Enum.Font.GothamBlack;
_G.lblSecFF.TextSize = 12;
_G.lblSecFF.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblSecFF.ZIndex = 3;
_G.lblSecFF.Parent = _G.secFF;
_G.UZIVERT_FF_ON = d.FireflyClutch or false;
_G.UZIVERT_FF_TIMER = d.FireflyTimer ~= false;
_G.UZIVERT_FF_SIZE = d.FireflyTimerSize or 5;
_G.UZIVERT_FF_HOOKED = setmetatable({}, { __mode = "k" });
_G.UZIVERT_FF_CONNS = {};
_G.UZIVERT_FF_COOLDOWN = false;
_G.UZIVERT_FF_TOKEN = 0;
_G.UZIVERT_FF_COUNTDOWN_CON = nil;
_G.UZIVERT_FF_COOLDOWN_CON = nil;
_G.UZIVERT_FF_BLOCK_CON = nil;
_G.UZIVERT_FF_COUNTDOWN_REM = nil;
_G.UZIVERT_FF_COOLDOWN_END = nil;
_G.UZIVERT_FF_LABEL = nil;
local Ec = 3;
local yc = 16;
local ac = .24;
local Wc = .4;
local Uc = Color3.fromRGB(0, 255, 0);
local tc = Color3.fromRGB(255, 200, 0);
local cc = Color3.fromRGB(255, 0, 0);
local bc = Color3.fromRGB(0, 0, 0);
_G.UZIVERT_FF_COLOR = function(e, A)
		A = math.max(tonumber(A) or 1, .001);
		local l = math.clamp(((tonumber(e) or 0)) / A, 0, 1);
		if l >= (.66666666666667) then
			return Uc;
		end;
		if l >= (.33333333333333) then
			return tc;
		end;
		return cc;
	end;
_G.UZIVERT_FF_UPDATE = function()
		if not _G.UZIVERT_FF_LABEL then
			return;
		end;
		_G.UZIVERT_FF_LABEL.Visible = _G.UZIVERT_FF_TIMER;
		if not _G.UZIVERT_FF_TIMER then
			return;
		end;
		local e = os.clock();
		local A, l;
		if _G.UZIVERT_FF_COUNTDOWN_REM and _G.UZIVERT_FF_COUNTDOWN_REM > 0 then
			A, l = _G.UZIVERT_FF_COUNTDOWN_REM, Ec;
		elseif _G.UZIVERT_FF_COOLDOWN_END and e < _G.UZIVERT_FF_COOLDOWN_END then
			A, l = _G.UZIVERT_FF_COOLDOWN_END - e, yc;
		end;
		if A then
			_G.UZIVERT_FF_LABEL.Text = string.format("%.1fCD", math.max(0, A));
			_G.UZIVERT_FF_LABEL.TextColor3 = _G.UZIVERT_FF_COLOR(A, l);
		else
			_G.UZIVERT_FF_LABEL.Text = "Ready";
			_G.UZIVERT_FF_LABEL.TextColor3 = bc;
		end;
	end;
_G.UZIVERT_FF_DISCONNECT = function(e)
		if e then
			pcall(function()
				e:Disconnect();
			end);
		end;
	end;
_G.UZIVERT_FF_OWNS = function(e)
		local A = l:FindFirstChildOfClass("Backpack");
		return (l.Character and e.Parent == l.Character) or (A and e.Parent == A) or false;
	end;
_G.UZIVERT_FF_BLOCK_ONE = function(e, A)
		if not _G.UZIVERT_FF_ON or not _G.UZIVERT_FF_COOLDOWN then
			return;
		end;
		A.blocked = true;
		if e.Enabled then
			pcall(function()
				e.Enabled = false;
			end);
		end;
	end;
_G.UZIVERT_FF_BLOCK_ALL = function()
		for e, A in pairs(_G.UZIVERT_FF_HOOKED) do
			_G.UZIVERT_FF_BLOCK_ONE(e, A);
		end;
	end;
_G.UZIVERT_FF_RELEASE = function()
		for e, A in pairs(_G.UZIVERT_FF_HOOKED) do
			if A.blocked then
				A.blocked = false;
				pcall(function()
					if not e.Enabled then
						e.Enabled = A.originalEnabled;
					end;
				end);
			end;
		end;
	end;
_G.UZIVERT_FF_BUILD = function()
		if _G.UZIVERT_FF_LABEL and _G.UZIVERT_FF_LABEL.Parent then
			return;
		end;
		_G.UZIVERT_FF_GUI = Instance.new("ScreenGui");
		_G.UZIVERT_FF_GUI.Name = "UzivertFireflyTimer";
		_G.UZIVERT_FF_GUI.ResetOnSpawn = false;
		_G.UZIVERT_FF_GUI.IgnoreGuiInset = true;
		_G.UZIVERT_FF_GUI.Parent = l:WaitForChild("PlayerGui");
		_G.UZIVERT_FF_LABEL = Instance.new("TextLabel");
		_G.UZIVERT_FF_LABEL.Name = "FireflyTimer";
		_G.UZIVERT_FF_LABEL.AnchorPoint = Vector2.new(.5, .5);
		_G.UZIVERT_FF_LABEL.Position = UDim2.new(.5, 0, .05, 0);
		_G.UZIVERT_FF_LABEL.BackgroundTransparency = 1;
		_G.UZIVERT_FF_LABEL.BorderSizePixel = 0;
		_G.UZIVERT_FF_LABEL.TextColor3 = Color3.new(0, 0, 0);
		_G.UZIVERT_FF_LABEL.TextStrokeTransparency = 1;
		_G.UZIVERT_FF_LABEL.Font = Enum.Font.GothamBold;
		_G.UZIVERT_FF_LABEL.Text = "Ready";
		_G.UZIVERT_FF_LABEL.Visible = _G.UZIVERT_FF_TIMER;
		_G.UZIVERT_FF_LABEL.Active = true;
		local e = 72 + (((_G.UZIVERT_FF_SIZE - 1)) * 8);
		local A = 24 + (((_G.UZIVERT_FF_SIZE - 1)) * 2);
		_G.UZIVERT_FF_LABEL.Size = UDim2.fromOffset(e, A);
		_G.UZIVERT_FF_LABEL.TextSize = math.max(12, math.floor(A * .65));
		_G.UZIVERT_FF_LABEL.Parent = _G.UZIVERT_FF_GUI;
		_G.UZIVERT_FF_UPDATE();
	end;
_G.UZIVERT_FF_JUMP = function()
		local e = l.Character;
		local A = e and e:FindFirstChildOfClass("Humanoid");
		if not A or A.Health <= 0 then
			return;
		end;
		A.Jump = true;
		pcall(function()
			A:ChangeState(Enum.HumanoidStateType.Jumping);
		end);
	end;
_G.UZIVERT_FF_TWO_JUMP = function(e)
		_G.UZIVERT_FF_JUMP();
		task.delay(Wc, function()
			if _G.UZIVERT_FF_ON and e == _G.UZIVERT_FF_TOKEN then
				_G.UZIVERT_FF_JUMP();
			end;
		end);
	end;
_G.UZIVERT_FF_STOP = function()
		_G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COUNTDOWN_CON);
		_G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COOLDOWN_CON);
		_G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_BLOCK_CON);
		_G.UZIVERT_FF_COUNTDOWN_CON = nil;
		_G.UZIVERT_FF_COOLDOWN_CON = nil;
		_G.UZIVERT_FF_BLOCK_CON = nil;
		_G.UZIVERT_FF_TOKEN = _G.UZIVERT_FF_TOKEN + 1;
		_G.UZIVERT_FF_COOLDOWN = false;
		_G.UZIVERT_FF_RELEASE();
		_G.UZIVERT_FF_COUNTDOWN_REM = nil;
		_G.UZIVERT_FF_COOLDOWN_END = nil;
		_G.UZIVERT_FF_UPDATE();
	end;
_G.UZIVERT_FF_START_COUNTDOWN = function()
		if not _G.UZIVERT_FF_ON then
			return;
		end;
		_G.UZIVERT_FF_BUILD();
		_G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COUNTDOWN_CON);
		_G.UZIVERT_FF_COUNTDOWN_CON = nil;
		local e = _G.UZIVERT_FF_TOKEN;
		local A = false;
		_G.UZIVERT_FF_UPDATE();
		_G.UZIVERT_FF_COUNTDOWN_CON = a.Heartbeat:Connect(function(l)
				if not _G.UZIVERT_FF_ON or e ~= _G.UZIVERT_FF_TOKEN or not _G.UZIVERT_FF_COUNTDOWN_REM then
					return;
				end;
				_G.UZIVERT_FF_COUNTDOWN_REM = math.max(0, _G.UZIVERT_FF_COUNTDOWN_REM - l);
				if not A and _G.UZIVERT_FF_COUNTDOWN_REM <= ac then
					A = true;
					_G.UZIVERT_FF_TWO_JUMP(e);
				end;
				_G.UZIVERT_FF_UPDATE();
				if _G.UZIVERT_FF_COUNTDOWN_REM <= 0 then
					_G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COUNTDOWN_CON);
					_G.UZIVERT_FF_COUNTDOWN_CON = nil;
				end;
			end);
	end;
_G.UZIVERT_FF_START_COOLDOWN = function()
		_G.UZIVERT_FF_BUILD();
		_G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COOLDOWN_CON);
		_G.UZIVERT_FF_COOLDOWN_CON = nil;
		_G.UZIVERT_FF_COOLDOWN_CON = a.Heartbeat:Connect(function()
				if not _G.UZIVERT_FF_COOLDOWN_END then
					return;
				end;
				if _G.UZIVERT_FF_COUNTDOWN_REM and _G.UZIVERT_FF_COUNTDOWN_REM > 0 then
					return;
				end;
				local e = _G.UZIVERT_FF_COOLDOWN_END - os.clock();
				if e <= 0 then
					_G.UZIVERT_FF_UPDATE();
					_G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_COOLDOWN_CON);
					_G.UZIVERT_FF_COOLDOWN_CON = nil;
					return;
				end;
				_G.UZIVERT_FF_UPDATE();
			end);
	end;
_G.UZIVERT_FF_START_BLOCK = function()
		_G.UZIVERT_FF_COOLDOWN = true;
		local e = _G.UZIVERT_FF_TOKEN;
		task.defer(function()
			if _G.UZIVERT_FF_ON and (_G.UZIVERT_FF_COOLDOWN and e == _G.UZIVERT_FF_TOKEN) then
				_G.UZIVERT_FF_BLOCK_ALL();
			end;
		end);
		_G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_BLOCK_CON);
		_G.UZIVERT_FF_BLOCK_CON = nil;
		_G.UZIVERT_FF_BLOCK_CON = a.Heartbeat:Connect(function()
				if _G.UZIVERT_FF_COOLDOWN_END and os.clock() >= _G.UZIVERT_FF_COOLDOWN_END then
					_G.UZIVERT_FF_COOLDOWN = false;
					_G.UZIVERT_FF_RELEASE();
					_G.UZIVERT_FF_DISCONNECT(_G.UZIVERT_FF_BLOCK_CON);
					_G.UZIVERT_FF_BLOCK_CON = nil;
				else
					_G.UZIVERT_FF_BLOCK_ALL();
				end;
			end);
	end;
_G.UZIVERT_FF_CYCLE = function()
		if not _G.UZIVERT_FF_ON or _G.UZIVERT_FF_COOLDOWN then
			return;
		end;
		_G.UZIVERT_FF_BUILD();
		_G.UZIVERT_FF_TOKEN = _G.UZIVERT_FF_TOKEN + 1;
		local e = os.clock();
		_G.UZIVERT_FF_COUNTDOWN_REM = Ec;
		_G.UZIVERT_FF_COOLDOWN_END = e + yc;
		_G.UZIVERT_FF_START_COUNTDOWN();
		_G.UZIVERT_FF_START_COOLDOWN();
		_G.UZIVERT_FF_START_BLOCK();
	end;
_G.UZIVERT_FF_CONNECT_TOOL = function(e)
		if not e or not e:IsA("Tool") or e.Name ~= "Fireflies" then
			return;
		end;
		if _G.UZIVERT_FF_HOOKED[e] then
			_G.UZIVERT_FF_BLOCK_ONE(e, _G.UZIVERT_FF_HOOKED[e]);
			return;
		end;
		local A = { originalEnabled = e.Enabled, blocked = false };
		_G.UZIVERT_FF_HOOKED[e] = A;
		table.insert(_G.UZIVERT_FF_CONNS, (e:GetPropertyChangedSignal("Enabled")):Connect(function()
			if _G.UZIVERT_FF_ON and _G.UZIVERT_FF_COOLDOWN then
				if e.Enabled then
					A.originalEnabled = true;
				end;
				_G.UZIVERT_FF_BLOCK_ONE(e, A);
			elseif not A.blocked then
				A.originalEnabled = e.Enabled;
			end;
		end));
		table.insert(_G.UZIVERT_FF_CONNS, e.Activated:Connect(function()
			if not _G.UZIVERT_FF_ON or _G.UZIVERT_FF_COOLDOWN then
				return;
			end;
			if not _G.UZIVERT_FF_OWNS(e) then
				return;
			end;
			A.originalEnabled = true;
			_G.UZIVERT_FF_CYCLE();
		end));
	end;
_G.UZIVERT_FF_SCAN = function()
		local e = l:FindFirstChildOfClass("Backpack");
		local A = l.Character;
		local function E(e)
			if e then
				for e, A in ipairs(e:GetChildren()) do
					if A:IsA("Tool") and A.Name == "Fireflies" then
						_G.UZIVERT_FF_CONNECT_TOOL(A);
					end;
				end;
			end;
		end;
		E(e);
		E(A);
	end;
_G.UZIVERT_FF_HOOK = function()
		_G.UZIVERT_FF_SCAN();
		local e = l:FindFirstChildOfClass("Backpack");
		if e then
			table.insert(_G.UZIVERT_FF_CONNS, e.ChildAdded:Connect(function(e)
				if e:IsA("Tool") and e.Name == "Fireflies" then
					_G.UZIVERT_FF_CONNECT_TOOL(e);
				end;
			end));
		end;
		l.ChildAdded:Connect(function(e)
			if e:IsA("Backpack") then
				table.insert(_G.UZIVERT_FF_CONNS, e.ChildAdded:Connect(function(e)
					if e:IsA("Tool") and e.Name == "Fireflies" then
						_G.UZIVERT_FF_CONNECT_TOOL(e);
					end;
				end));
			end;
		end);
		l.CharacterAdded:Connect(function(e)
			task.wait(1);
			_G.UZIVERT_FF_SCAN();
		end);
	end;
O(aB, "\240\159\148\165 Auto Firefly Clutch", d.FireflyClutch or false, function(e)
	_G.UZIVERT_FF_ON = e;
	d.FireflyClutch = e;
	m();
	if e then
		_G.UZIVERT_FF_HOOK();
		_G.UZIVERT_FF_BUILD();
	else
		_G.UZIVERT_FF_STOP();
	end;
end);
O(aB, "\226\143\176 Timer Firefly", d.FireflyTimer ~= false, function(e)
	_G.UZIVERT_FF_TIMER = e;
	d.FireflyTimer = e;
	m();
	if _G.UZIVERT_FF_LABEL then
		_G.UZIVERT_FF_LABEL.Visible = e;
	end;
end);
q(aB, "Tama\195\177o Timer Firefly", 1, 10, d.FireflyTimerSize or 5, function(e)
	_G.UZIVERT_FF_SIZE = math.clamp(math.floor(e), 1, 10);
	d.FireflyTimerSize = _G.UZIVERT_FF_SIZE;
	m();
	if _G.UZIVERT_FF_LABEL then
		local e = 72 + (((_G.UZIVERT_FF_SIZE - 1)) * 8);
		local A = 24 + (((_G.UZIVERT_FF_SIZE - 1)) * 2);
		_G.UZIVERT_FF_LABEL.Size = UDim2.fromOffset(e, A);
		_G.UZIVERT_FF_LABEL.TextSize = math.max(12, math.floor(A * .65));
	end;
end);
if _G.UZIVERT_FF_ON then
	_G.UZIVERT_FF_HOOK();
	_G.UZIVERT_FF_BUILD();
end;
if not _G.UZIVERT_GAMA_BAJA then
	_G.UZIVERT_HEADLESS_ON = d.Headless or false;
	_G.UZIVERT_KORBLOX_RIGHT = d.KorbloxRight or false;
	_G.UZIVERT_KORBLOX_LEFT = d.KorbloxLeft or false;
	_G.UZIVERT_APLICAR_HEADLESS = function(e)
			if not e then
				return;
			end;
			local A = e:FindFirstChild("Head");
			if not A then
				return;
			end;
			if _G.UZIVERT_HEADLESS_ON then
				A.Transparency = 1;
				A.LocalTransparencyModifier = 1;
				for e, A in ipairs(A:GetChildren()) do
					if A:IsA("Decal") then
						A.Transparency = 1;
					end;
				end;
			else
				A.Transparency = 0;
				A.LocalTransparencyModifier = 0;
				for e, A in ipairs(A:GetChildren()) do
					if A:IsA("Decal") then
						A.Transparency = 0;
					end;
				end;
			end;
		end;
	_G.UZIVERT_KORBLOX_RIGHT_ASSET = 139607718;
	_G.UZIVERT_KORBLOX_LEFT_ASSET = 139607673;
	_G.UZIVERT_KORBLOX_MARKER = "UzivertKorbloxSide";
	_G.UZIVERT_KORBLOX_SIDE_NAMES = { Right = { "RightUpperLeg", "RightLowerLeg", "RightFoot" }, Left = { "LeftUpperLeg", "LeftLowerLeg", "LeftFoot" } };
	_G.UZIVERT_KORBLOX_SIDE_ENUMS = { Right = { Enum.BodyPartR15.RightUpperLeg, Enum.BodyPartR15.RightLowerLeg, Enum.BodyPartR15.RightFoot }, Left = { Enum.BodyPartR15.LeftUpperLeg, Enum.BodyPartR15.LeftLowerLeg, Enum.BodyPartR15.LeftFoot } };
	_G.UZIVERT_KORBLOX_STATE = nil;
	_G.UZIVERT_KORBLOX_TEMPLATES = nil;
	_G.UZIVERT_KORBLOX_BUILDING = false;
	_G.UZIVERT_KORBLOX_SIDE_ENABLED = function(e)
			if e == "Right" then
				return _G.UZIVERT_KORBLOX_RIGHT;
			end;
			return _G.UZIVERT_KORBLOX_LEFT;
		end;
	_G.UZIVERT_KORBLOX_DISCONNECT = function(e)
			if e then
				pcall(function()
					e:Disconnect();
				end);
			end;
		end;
	_G.UZIVERT_KORBLOX_DESTROY_MOTORS = function(e)
			if not e then
				return;
			end;
			for e, A in ipairs(e:GetDescendants()) do
				if A:IsA("Motor6D") then
					pcall(function()
						A:Destroy();
					end);
				end;
			end;
		end;
	_G.UZIVERT_KORBLOX_CLONE_PART = function(e)
			if not e or not e:IsA("BasePart") then
				return nil;
			end;
			local A = e.Archivable;
			if not A then
				pcall(function()
					e.Archivable = true;
				end);
			end;
			local l, E = pcall(function()
					return e:Clone();
				end);
			if not A then
				pcall(function()
					e.Archivable = false;
				end);
			end;
			if not l or not E then
				return nil;
			end;
			_G.UZIVERT_KORBLOX_DESTROY_MOTORS(E);
			E.Parent = nil;
			return E;
		end;
	_G.UZIVERT_KORBLOX_CLEAR_STATE = function(e)
			if not e then
				return;
			end;
			for e, A in ipairs(e.Connections or {}) do
				_G.UZIVERT_KORBLOX_DISCONNECT(A);
			end;
			e.Connections = {};
			for A, l in ipairs({ "Left", "Right" }) do
				for e, A in ipairs((e.PartConnections and e.PartConnections[l]) or {}) do
					_G.UZIVERT_KORBLOX_DISCONNECT(A);
				end;
				if e.PartConnections then
					e.PartConnections[l] = {};
				end;
			end;
		end;
	_G.UZIVERT_KORBLOX_GET_HUMANOID = function(e)
			if not e then
				return nil;
			end;
			return e:FindFirstChildOfClass("Humanoid") or e:WaitForChild("Humanoid", 2);
		end;
	_G.UZIVERT_KORBLOX_GET_SIDE_PARTS = function(e, A)
			local l = _G.UZIVERT_KORBLOX_SIDE_NAMES[A];
			if not e or not l then
				return nil;
			end;
			local E = {};
			for A, l in ipairs(l) do
				local y = e:FindFirstChild(l);
				if not y or not y:IsA("BasePart") then
					return nil;
				end;
				E[A] = y;
			end;
			return E;
		end;
	_G.UZIVERT_KORBLOX_WAIT_PARTS = function(e, A, E)
			local y = os.clock() + ((E or 2.5));
			repeat
				if l.Character ~= e then
					return nil;
				end;
				local E = _G.UZIVERT_KORBLOX_GET_SIDE_PARTS(e, A);
				if E then
					return E;
				end;
				task.wait(.05);
			until os.clock() >= y;
			return _G.UZIVERT_KORBLOX_GET_SIDE_PARTS(e, A);
		end;
	_G.UZIVERT_KORBLOX_BEGIN_STATE = function(e)
			if _G.UZIVERT_KORBLOX_STATE and _G.UZIVERT_KORBLOX_STATE.Character == e then
				return _G.UZIVERT_KORBLOX_STATE;
			end;
			_G.UZIVERT_KORBLOX_CLEAR_STATE(_G.UZIVERT_KORBLOX_STATE);
			local A = _G.UZIVERT_KORBLOX_GET_HUMANOID(e);
			_G.UZIVERT_KORBLOX_STATE = {
					Character = e,
					Humanoid = A,
					Connections = {},
					PartConnections = { Left = {}, Right = {} },
					Applying = { Left = false, Right = false },
				};
			return _G.UZIVERT_KORBLOX_STATE;
		end;
	_G.UZIVERT_KORBLOX_EXTRACT = function(e)
			if not e then
				return nil;
			end;
			local A = { Left = {}, Right = {} };
			for l, E in ipairs({ "Left", "Right" }) do
				for l, y in ipairs(_G.UZIVERT_KORBLOX_SIDE_NAMES[E]) do
					local a = e:FindFirstChild(y);
					local W = _G.UZIVERT_KORBLOX_CLONE_PART(a);
					if not W then
						return nil;
					end;
					W.Name = y;
					A[E][l] = W;
				end;
			end;
			return A;
		end;
	_G.UZIVERT_KORBLOX_BUILD_TEMPLATES = function()
			if _G.UZIVERT_KORBLOX_TEMPLATES then
				return true;
			end;
			if _G.UZIVERT_KORBLOX_BUILDING then
				local e = os.clock() + 4;
				repeat
					if _G.UZIVERT_KORBLOX_TEMPLATES then
						return true;
					end;
					if not _G.UZIVERT_KORBLOX_BUILDING then
						break;
					end;
					task.wait(.05);
				until os.clock() >= e;
				return _G.UZIVERT_KORBLOX_TEMPLATES ~= nil;
			end;
			_G.UZIVERT_KORBLOX_BUILDING = true;
			local A = Instance.new("HumanoidDescription");
			A.LeftLeg = _G.UZIVERT_KORBLOX_LEFT_ASSET;
			A.RightLeg = _G.UZIVERT_KORBLOX_RIGHT_ASSET;
			local l = nil;
			local E = pcall(function()
					l = e:CreateHumanoidModelFromDescriptionAsync(A, Enum.HumanoidRigType.R15);
				end);
			if not E or not l then
				E = pcall(function()
						l = e:CreateHumanoidModelFromDescription(A, Enum.HumanoidRigType.R15);
					end);
			end;
			local y = nil;
			if E and l then
				y = _G.UZIVERT_KORBLOX_EXTRACT(l);
			end;
			pcall(function()
				A:Destroy();
			end);
			if l then
				pcall(function()
					l:Destroy();
				end);
			end;
			if y then
				_G.UZIVERT_KORBLOX_TEMPLATES = y;
			end;
			_G.UZIVERT_KORBLOX_BUILDING = false;
			return _G.UZIVERT_KORBLOX_TEMPLATES ~= nil;
		end;
	_G.UZIVERT_KORBLOX_REPLACE_PART = function(e, A, E, y)
			if not e or not e.Humanoid or not y then
				return false;
			end;
			if l.Character ~= e.Character then
				return false;
			end;
			local a = _G.UZIVERT_KORBLOX_CLONE_PART(y);
			if not a then
				return false;
			end;
			a.Name = _G.UZIVERT_KORBLOX_SIDE_NAMES[A][E];
			a:SetAttribute(_G.UZIVERT_KORBLOX_MARKER, A);
			local W, U = pcall(function()
					return e.Humanoid:ReplaceBodyPartR15(_G.UZIVERT_KORBLOX_SIDE_ENUMS[A][E], a);
				end);
			if not W or U == false then
				pcall(function()
					a:Destroy();
				end);
				return false;
			end;
			return true;
		end;
	_G.UZIVERT_KORBLOX_APPLY_SIDE = function(e, A)
			if not e or not _G.UZIVERT_KORBLOX_SIDE_ENABLED(A) then
				return false;
			end;
			if l.Character ~= e.Character then
				return false;
			end;
			local E = _G.UZIVERT_KORBLOX_WAIT_PARTS(e.Character, A, 2.5);
			if not E then
				return false;
			end;
			if not _G.UZIVERT_KORBLOX_BUILD_TEMPLATES() then
				return false;
			end;
			e.Applying[A] = true;
			local y = true;
			for l = 1, 3, 1 do
				if not _G.UZIVERT_KORBLOX_REPLACE_PART(e, A, l, _G.UZIVERT_KORBLOX_TEMPLATES[A][l]) then
					y = false;
					break;
				end;
			end;
			e.Applying[A] = false;
			return y;
		end;
	_G.UZIVERT_APLICAR_COSMETICOS = function(e)
			if not e then
				return;
			end;
			task.wait(.5);
			_G.UZIVERT_APLICAR_HEADLESS(e);
			local A = e:FindFirstChild("UpperTorso") ~= nil;
			if not A then
				return;
			end;
			local l = _G.UZIVERT_KORBLOX_BEGIN_STATE(e);
			if _G.UZIVERT_KORBLOX_RIGHT then
				_G.UZIVERT_KORBLOX_APPLY_SIDE(l, "Right");
			end;
			if _G.UZIVERT_KORBLOX_LEFT then
				_G.UZIVERT_KORBLOX_APPLY_SIDE(l, "Left");
			end;
		end;
	l.CharacterAdded:Connect(function(e)
		task.wait(1);
		if _G.UZIVERT_HEADLESS_ON or _G.UZIVERT_KORBLOX_RIGHT or _G.UZIVERT_KORBLOX_LEFT then
			_G.UZIVERT_APLICAR_COSMETICOS(e);
		end;
	end);
	if l.Character and ((_G.UZIVERT_HEADLESS_ON or _G.UZIVERT_KORBLOX_RIGHT or _G.UZIVERT_KORBLOX_LEFT)) then
		task.spawn(function()
			_G.UZIVERT_APLICAR_COSMETICOS(l.Character);
		end);
	end;
	_G.secSkin = Instance.new("Frame");
	_G.secSkin.Size = UDim2.new(1, 0, 0, 30);
	_G.secSkin.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secSkin.BackgroundTransparency = .3;
	_G.secSkin.BorderSizePixel = 0;
	_G.secSkin.ZIndex = 2;
	_G.secSkin.Parent = PaginaRend;
	_G.cSecSkin = Instance.new("UICorner");
	_G.cSecSkin.CornerRadius = UDim.new(0, 7);
	_G.cSecSkin.Parent = _G.secSkin;
	_G.sSecSkin = Instance.new("UIStroke");
	_G.sSecSkin.Color = k.Morado3;
	_G.sSecSkin.Thickness = 1.5;
	_G.sSecSkin.Transparency = .2;
	_G.sSecSkin.Parent = _G.secSkin;
	_G.lblSecSkin = Instance.new("TextLabel");
	_G.lblSecSkin.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecSkin.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecSkin.BackgroundTransparency = 1;
	_G.lblSecSkin.Text = "\240\159\146\128 SKIN (Headless + Korblox)";
	_G.lblSecSkin.TextColor3 = k.Naranja2;
	_G.lblSecSkin.Font = Enum.Font.GothamBlack;
	_G.lblSecSkin.TextSize = 12;
	_G.lblSecSkin.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecSkin.ZIndex = 3;
	_G.lblSecSkin.Parent = _G.secSkin;
	O(PaginaRend, "\240\159\146\128 Headless", d.Headless or false, function(e)
		_G.UZIVERT_HEADLESS_ON = e;
		d.Headless = e;
		m();
		if l.Character then
			_G.UZIVERT_APLICAR_HEADLESS(l.Character);
		end;
	end);
	O(PaginaRend, "\240\159\166\181 Korblox Right Leg", d.KorbloxRight or false, function(e)
		_G.UZIVERT_KORBLOX_RIGHT = e;
		d.KorbloxRight = e;
		m();
		if e and l.Character then
			local e = _G.UZIVERT_KORBLOX_BEGIN_STATE(l.Character);
			_G.UZIVERT_KORBLOX_APPLY_SIDE(e, "Right");
		end;
	end);
	O(PaginaRend, "\240\159\166\181 Korblox Left Leg", d.KorbloxLeft or false, function(e)
		_G.UZIVERT_KORBLOX_LEFT = e;
		d.KorbloxLeft = e;
		m();
		if e and l.Character then
			local e = _G.UZIVERT_KORBLOX_BEGIN_STATE(l.Character);
			_G.UZIVERT_KORBLOX_APPLY_SIDE(e, "Left");
		end;
	end);
	J(PaginaRend, "\240\159\148\132 Resetear Apariencia", function()
		_G.UZIVERT_HEADLESS_ON = false;
		_G.UZIVERT_KORBLOX_RIGHT = false;
		_G.UZIVERT_KORBLOX_LEFT = false;
		d.Headless = false;
		d.KorbloxRight = false;
		d.KorbloxLeft = false;
		m();
		if l.Character then
			_G.UZIVERT_APLICAR_HEADLESS(l.Character);
		end;
		_G.UZIVERT_KORBLOX_TEMPLATES = nil;
		_G.UZIVERT_KORBLOX_STATE = nil;
		if l.Character then
			local e = l.Character:FindFirstChildOfClass("Humanoid");
			if e then
				e.Health = 0;
			end;
		end;
		print("\240\159\148\132 Apariencia reseteada (respawneando)");
	end, k.Rojo);
	_G.secAp1 = Instance.new("Frame");
	_G.secAp1.Size = UDim2.new(1, 0, 0, 30);
	_G.secAp1.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secAp1.BackgroundTransparency = .3;
	_G.secAp1.BorderSizePixel = 0;
	_G.secAp1.ZIndex = 2;
	_G.secAp1.Parent = PaginaRend;
	_G.cSecAp1 = Instance.new("UICorner");
	_G.cSecAp1.CornerRadius = UDim.new(0, 7);
	_G.cSecAp1.Parent = _G.secAp1;
	_G.sSecAp1 = Instance.new("UIStroke");
	_G.sSecAp1.Color = k.Morado3;
	_G.sSecAp1.Thickness = 1.5;
	_G.sSecAp1.Transparency = .2;
	_G.sSecAp1.Parent = _G.secAp1;
	_G.lblSecAp1 = Instance.new("TextLabel");
	_G.lblSecAp1.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecAp1.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecAp1.BackgroundTransparency = 1;
	_G.lblSecAp1.Text = "\240\159\142\168 SHADERS";
	_G.lblSecAp1.TextColor3 = k.Naranja2;
	_G.lblSecAp1.Font = Enum.Font.GothamBlack;
	_G.lblSecAp1.TextSize = 12;
	_G.lblSecAp1.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecAp1.ZIndex = 3;
	_G.lblSecAp1.Parent = _G.secAp1;
	O(PaginaRend, "\240\159\142\168 Shaders Tokyowami", false, function(e)
		_G.UZIVERT_SHADER_TOKYO = e;
		local A = game:GetService("Lighting");
		if not _G.UZIVERT_SHADER_TOKYO_EFFECTS then
			_G.UZIVERT_SHADER_TOKYO_EFFECTS = {};
		end;
		if e then
			for e, A in ipairs(_G.UZIVERT_SHADER_TOKYO_EFFECTS) do
				pcall(function()
					A:Destroy();
				end);
			end;
			_G.UZIVERT_SHADER_TOKYO_EFFECTS = {};
			local e = Instance.new("BloomEffect");
			e.Intensity = .1;
			e.Threshold = 0;
			e.Size = 100;
			e.Parent = A;
			table.insert(_G.UZIVERT_SHADER_TOKYO_EFFECTS, e);
			local l = Instance.new("BlurEffect");
			l.Size = 2;
			l.Parent = A;
			table.insert(_G.UZIVERT_SHADER_TOKYO_EFFECTS, l);
			local E = Instance.new("ColorCorrectionEffect");
			E.Saturation = .05;
			E.TintColor = Color3.fromRGB(255, 224, 219);
			E.Parent = A;
			table.insert(_G.UZIVERT_SHADER_TOKYO_EFFECTS, E);
			local y = Instance.new("Sky");
			y.Name = "UzivertTokyowami";
			y.SkyboxUp = "rbxassetid://323493360";
			y.SkyboxLf = "rbxassetid://323494252";
			y.SkyboxBk = "rbxassetid://323494035";
			y.SkyboxFt = "rbxassetid://323494130";
			y.SkyboxDn = "rbxassetid://323494368";
			y.SkyboxRt = "rbxassetid://323494067";
			y.Parent = A;
			table.insert(_G.UZIVERT_SHADER_TOKYO_EFFECTS, y);
			A.Brightness = 2.14;
			A.ColorShift_Bottom = Color3.fromRGB(11, 0, 20);
			A.ColorShift_Top = Color3.fromRGB(240, 127, 14);
			A.OutdoorAmbient = Color3.fromRGB(34, 0, 49);
			A.ClockTime = 6.7;
			A.FogColor = Color3.fromRGB(94, 76, 106);
			A.FogEnd = 1000;
			A.ExposureCompensation = .24;
			A.Ambient = Color3.fromRGB(59, 33, 27);
		else
			for e, A in ipairs(_G.UZIVERT_SHADER_TOKYO_EFFECTS) do
				pcall(function()
					A:Destroy();
				end);
			end;
			_G.UZIVERT_SHADER_TOKYO_EFFECTS = {};
			A.Brightness = 2;
			A.ClockTime = 14;
			A.FogEnd = 100000;
			A.ExposureCompensation = 0;
		end;
	end);
	O(PaginaRend, "\240\159\140\184 Pink Hour", false, function(e)
		_G.UZIVERT_PINK_HOUR = e;
		local A = game:GetService("Lighting");
		if not _G.UZIVERT_PINK_EFFECTS then
			_G.UZIVERT_PINK_EFFECTS = {};
		end;
		if e then
			for e, A in ipairs(_G.UZIVERT_PINK_EFFECTS) do
				pcall(function()
					A:Destroy();
				end);
			end;
			_G.UZIVERT_PINK_EFFECTS = {};
			local e = Instance.new("ColorCorrectionEffect");
			e.TintColor = Color3.fromRGB(255, 100, 200);
			e.Saturation = .4;
			e.Parent = A;
			table.insert(_G.UZIVERT_PINK_EFFECTS, e);
			local l = Instance.new("BloomEffect");
			l.Intensity = .3;
			l.Size = 25;
			l.Threshold = .85;
			l.Parent = A;
			table.insert(_G.UZIVERT_PINK_EFFECTS, l);
			local E = Instance.new("BlurEffect");
			E.Size = 2;
			E.Parent = A;
			table.insert(_G.UZIVERT_PINK_EFFECTS, E);
			A.Brightness = 2;
			A.ClockTime = 6.7;
			A.FogColor = Color3.fromRGB(120, 20, 150);
			A.FogEnd = 1200;
			A.ColorShift_Top = Color3.fromRGB(255, 100, 220);
			A.ColorShift_Bottom = Color3.fromRGB(100, 0, 150);
		else
			for e, A in ipairs(_G.UZIVERT_PINK_EFFECTS) do
				pcall(function()
					A:Destroy();
				end);
			end;
			_G.UZIVERT_PINK_EFFECTS = {};
			A.Brightness = 2;
			A.ClockTime = 14;
			A.FogEnd = 100000;
			A.ColorShift_Top = Color3.fromRGB(0, 0, 0);
			A.ColorShift_Bottom = Color3.fromRGB(0, 0, 0);
		end;
	end);
	_G.secAp2 = Instance.new("Frame");
	_G.secAp2.Size = UDim2.new(1, 0, 0, 30);
	_G.secAp2.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secAp2.BackgroundTransparency = .3;
	_G.secAp2.BorderSizePixel = 0;
	_G.secAp2.ZIndex = 2;
	_G.secAp2.Parent = PaginaRend;
	_G.cSecAp2 = Instance.new("UICorner");
	_G.cSecAp2.CornerRadius = UDim.new(0, 7);
	_G.cSecAp2.Parent = _G.secAp2;
	_G.sSecAp2 = Instance.new("UIStroke");
	_G.sSecAp2.Color = k.Morado3;
	_G.sSecAp2.Thickness = 1.5;
	_G.sSecAp2.Transparency = .2;
	_G.sSecAp2.Parent = _G.secAp2;
	_G.lblSecAp2 = Instance.new("TextLabel");
	_G.lblSecAp2.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecAp2.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecAp2.BackgroundTransparency = 1;
	_G.lblSecAp2.Text = "\240\159\140\153 AMBIENTE";
	_G.lblSecAp2.TextColor3 = k.Naranja2;
	_G.lblSecAp2.Font = Enum.Font.GothamBlack;
	_G.lblSecAp2.TextSize = 12;
	_G.lblSecAp2.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecAp2.ZIndex = 3;
	_G.lblSecAp2.Parent = _G.secAp2;
	O(PaginaRend, "\240\159\140\153 Modo Noche", d.ModoNoche or false, function(e)
		_G.UZIVERT_MODO_NOCHE(e);
		d.ModoNoche = e;
		m();
	end);
	O(PaginaRend, "\226\143\176 Round Timer", d.RoundTimer or false, function(e)
		_G.UZIVERT_TIMER_ON = e;
		d.RoundTimer = e;
		m();
		if e then
			_G.UZIVERT_TIMER_START();
		else
			_G.UZIVERT_TIMER_STOP();
		end;
	end);
	_G.secAp3 = Instance.new("Frame");
	_G.secAp3.Size = UDim2.new(1, 0, 0, 30);
	_G.secAp3.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
	_G.secAp3.BackgroundTransparency = .3;
	_G.secAp3.BorderSizePixel = 0;
	_G.secAp3.ZIndex = 2;
	_G.secAp3.Parent = PaginaRend;
	_G.cSecAp3 = Instance.new("UICorner");
	_G.cSecAp3.CornerRadius = UDim.new(0, 7);
	_G.cSecAp3.Parent = _G.secAp3;
	_G.sSecAp3 = Instance.new("UIStroke");
	_G.sSecAp3.Color = k.Morado3;
	_G.sSecAp3.Thickness = 1.5;
	_G.sSecAp3.Transparency = .2;
	_G.sSecAp3.Parent = _G.secAp3;
	_G.lblSecAp3 = Instance.new("TextLabel");
	_G.lblSecAp3.Size = UDim2.new(1, -20, 1, 0);
	_G.lblSecAp3.Position = UDim2.new(0, 10, 0, 0);
	_G.lblSecAp3.BackgroundTransparency = 1;
	_G.lblSecAp3.Text = "\226\154\153\239\184\143 RENDIMIENTO";
	_G.lblSecAp3.TextColor3 = k.Naranja2;
	_G.lblSecAp3.Font = Enum.Font.GothamBlack;
	_G.lblSecAp3.TextSize = 12;
	_G.lblSecAp3.TextXAlignment = Enum.TextXAlignment.Left;
	_G.lblSecAp3.ZIndex = 3;
	_G.lblSecAp3.Parent = _G.secAp3;
	O(PaginaRend, "\226\154\176\239\184\143 Monitor HUD", d.Monitor, function(e)
		T = e;
		d.Monitor = e;
		m();
		if e then
			yy();
			jy();
		else
			Iy();
		end;
	end);
	O(PaginaRend, "\226\154\161 FPS Boost", d.FPSBoost, function(e)
		u = e;
		d.FPSBoost = e;
		m();
		if e then
			Jy();
			qy(U, "GlobalShadows", false);
			qy(U, "OutdoorAmbient", Color3.fromRGB(128, 128, 128));
			local e = workspace:FindFirstChildOfClass("Terrain");
			if e then
				qy(e, "WaterWaveSize", 0);
				qy(e, "WaterWaveSpeed", 0);
				qy(e, "WaterReflectance", 0);
				qy(e, "WaterTransparency", 0);
			end;
		else
			Jy();
		end;
	end);
end;
print("\240\159\142\131 Parte 8/10 cargada - Selector + Anims + Bomb Jump + Rend");
local kc = Instance.new("TextLabel");
kc.Size = UDim2.new(1, 0, 0, 50);
kc.BackgroundColor3 = k.Morado3;
kc.BackgroundTransparency = .4;
kc.Text = "\240\159\142\131 Uzivert Hub " .. (b .. " \240\159\142\131\nProyecto inicial por Uzivert\nCon ayuda explicativa de Nexvyr");
kc.TextColor3 = k.Texto;
kc.Font = Enum.Font.GothamBold;
kc.TextSize = 10;
kc.TextWrapped = true;
kc.BorderSizePixel = 0;
kc.ZIndex = 2;
kc.Parent = UB;
local xc = Instance.new("UICorner");
xc.CornerRadius = UDim.new(0, 9);
xc.Parent = kc;
local zc = Instance.new("UIStroke");
zc.Color = k.Naranja1;
zc.Thickness = 1;
zc.Transparency = .3;
zc.Parent = kc;
local dc = Instance.new("TextLabel");
dc.Size = UDim2.new(1, 0, 0, 70);
dc.BackgroundColor3 = Color3.fromRGB(20, 50, 20);
dc.BackgroundTransparency = .4;
dc.Text = "TODO OPERATIVO\n\nTodos los sistemas funcionando.\nReport\195\161 cualquier bug en Discord.";
dc.TextColor3 = k.Verde;
dc.Font = Enum.Font.GothamMedium;
dc.TextSize = 10;
dc.TextWrapped = true;
dc.TextXAlignment = Enum.TextXAlignment.Left;
dc.TextYAlignment = Enum.TextYAlignment.Top;
dc.BorderSizePixel = 0;
dc.ZIndex = 2;
dc.Parent = UB;
local wc = Instance.new("UICorner");
wc.CornerRadius = UDim.new(0, 9);
wc.Parent = dc;
local mc = Instance.new("UIStroke");
mc.Color = k.Verde;
mc.Thickness = 1;
mc.Transparency = .4;
mc.Parent = dc;
J(UB, "\240\159\144\155 Reportar Bug", function()
	local e = "REPORTE DE BUG - UZIVERT HUB v4.7.8\nJugador: " .. (l.Name .. ("\nFecha: " .. (os.date("%d/%m/%Y %H:%M") .. ("\nVersion: " .. b))));
	pcall(function()
		if setclipboard then
			setclipboard(e);
		end;
	end);
	print("Reporte copiado.");
end, Color3.fromRGB(200, 100, 60));
J(UB, "\240\159\146\172 Copiar Discord", function()
	pcall(function()
		if setclipboard then
			setclipboard("https://discord.gg/vHhERWcbXe");
		end;
	end);
	print("Discord copiado.");
end, Color3.fromRGB(80, 100, 200));
v(tB, "\240\159\147\133 \195\154ltima actualizaci\195\179n: 24/10/2026", "Uzivert Hub v4.7.8 HALLOWEEN", k.Naranja2);
v(tB, "\240\159\159\162 NUEVO EN v4.7.8", "\226\128\162 Piercer Bullet (Mata al murder Atrav\195\169s de las paredes)\n\226\128\162 TouchFling (Saca volando a alguien cuando lo tocas)\n\226\128\162 WallHop\n\226\128\162 Invisibilidad con desync\n\226\128\162 Nuevos botones blindable\n\226\128\162 Optimizaci\195\179n\n\226\128\162 Mejoras en los shoots\n\226\128\162 Bypass Integrado para eludir el anti-Cheat\n\226\128\162 Desync", k.Verde);
v(tB, "\240\159\159\162 NUEVO EN v4.7.7", "\240\159\142\175 SHOOT MURDERER v9 (Motor NOIR Completo)\n\226\128\162 PingProfiles interpolados por ping (20ms a 300ms)\n\226\128\162 sampleMotion con buffer de 8 posiciones\n\226\128\162 estimatedAcceleration (predicci\195\179n de lag)\n\226\128\162 leadTime con samplingDelay (m\195\161s preciso)\n\226\128\162 predictLag con peso din\195\161mico\n\226\128\162 predictJump con gravedad real del juego\n\226\128\162 Loop 30Hz alimentando sampleMotion\n\226\128\162 Wall Check integrado\n\226\128\162 Auto-equip / Auto-unequip\n\n\240\159\142\175 SILENT AIM v4 NOIR\n\226\128\162 Motor completo del NOIR integrado\n\226\128\162 Hook __namecall unificado (Gun + Knife)\n\226\128\162 Predicci\195\179n completa con PingProfiles\n\226\128\162 cachedPing EXACTO (0.7/0.3 cada 0.5s)\n\226\128\162 Multi-Point (7 tiros) opcional\n\226\128\162 Sliders: Extra Lead, Max Sim, Pred Interval, H Mult, V Mult\n\226\128\162 Toggles: Predict Jump, Predict Lag\n\226\128\162 Label de Ping en vivo", k.Verde);
v(tB, "\240\159\151\161\239\184\143 NOVEDADES DEL KNIFE Y LIMPIEZA", "\226\154\153\239\184\143 NUEVOS CONTROLES DE PREDICCI\195\147N\n\226\128\162 5 toggles: Predict Lag/Jump, Prioritize Ping, Wall Check, Auto-unequip\n\226\128\162 5 sliders: Extra Lead, Max Sim, Pred Interval, H Mult, V Mult\n\226\128\162 Todo guarda config con guardarConfig()\n\n\240\159\151\161\239\184\143 KNIFE NOIR COMPLETO\n\226\128\162 Knife Silent Aim integrado al hook\n\226\128\162 Predicci\195\179n con travelTime (distancia/110)\n\226\128\162 SwallowKnifeRemote (bloquea doble throw)\n\226\128\162 Instant Throw / Fast Throw\n\226\128\162 Auto Throw + Auto Kill Everyone / Sheriff\n\226\128\162 Kill Player (dropdown)\n\226\128\162 Knife Throw Aura + Sheriff Bind Button\n\n\240\159\148\165 LIMPIEZA DE C\195\147DIGO\n\226\128\162 SHOOT AVANZADO (V2) eliminado por completo\n\226\128\162 Auto Shoot ahora usa el motor NOIR\n\226\128\162 Menos c\195\179digo, menos lag, m\195\161s estable", k.Verde);
v(tB, "\240\159\144\155 BUGS ARREGLADOS EN v4.7.7", "\226\156\147 Error de sintaxis (end)i en Knife que mataba el script\n\226\156\147 Orden de funciones en dispararV1 (ya no crashea)\n\226\156\147 Motor NOIR integrado correctamente\n\226\156\147 Secci\195\179n 4 reemplazada sin errores\n\226\156\147 Bot\195\179n SHOOT MURDERER funcionando con motor nuevo\n\226\156\147 Config del Shoot guardada y restaurada al arrancar\n\226\156\147 Hook __namecall manejando Gun y Knife a la vez\n\226\156\147 Predicci\195\179n del Knife con travelTime real", k.Verde);
v(tB, "\240\159\159\162 NUEVO EN v4.7.5", "\240\159\140\190 AUTO FARM COINS\n\226\128\162 Recolecta monedas autom\195\161ticamente\n\226\128\162 Sistema LinearVelocity (estable)\n\226\128\162 Anti-AFK + Noclip + Anti-Void\n\226\128\162 Auto-Reset cuando llena la mochila\n\n\240\159\142\168 UI HALLOWEEN (REDISE\195\145O)\n\226\128\162 Sistema de \195\173conos dibujados con frames\n\226\128\162 Luna + telara\195\177as + murci\195\169lagos animados\n\226\128\162 Borde animado RGB\n\226\128\162 Optimizado para gama alta y baja\n\n\240\159\142\175 AIMLOCK V2\n\226\128\162 Smoothing ajustable + FOV Check\n\226\128\162 Select Player + Wall Check mejorado\n\226\128\162 Bot\195\179n flotante AIM con ON/OFF\n\226\128\162 Guarda la posici\195\179n del bot\195\179n", k.Verde);
v(tB, "\240\159\159\162 NUEVO EN v4.7.4", "\240\159\142\175 AIMLOCK V2\n\226\128\162 Smoothing + FOV Check\n\226\128\162 Select Player + Wall Check mejorado\n\226\128\162 Bot\195\179n flotante AIM\n\n\240\159\142\172 23 ANIMACIONES NUEVAS\n\226\128\162 Total: 51 animaciones\n\n\240\159\142\175 SILENT AIM MEJORADO\n\226\128\162 Auto Ping adaptativo\n\226\128\162 Multi-Point (7 tiros)\n\226\128\162 Anti-Hack (vuelo/tp)\n\n\240\159\148\171 SHOOT TELEPORT\n\226\128\162 Teletransporte detr\195\161s del murderer\n\n\240\159\146\128 FE HEADLESS (3 versiones)", k.Verde);
v(tB, "\240\159\159\162 NUEVO EN v4.7.3", "\240\159\142\174 SELECTOR DE GAMA\n\226\128\162 Eleg\195\173s GAMA ALTA o GAMA BAJA al iniciar\n\226\128\162 GAMA BAJA \226\134\146 solo lo esencial (menos lag)\n\226\128\162 GAMA ALTA \226\134\146 todas las funciones\n\n\240\159\142\175 NUEVAS FUNCIONES:\n\226\128\162 \240\159\142\175 Anti-Aim\n\226\128\162 \226\154\161 Speed Glitch\n\226\128\162 \240\159\146\128 Headless + \240\159\166\181 Korblox\n\226\128\162 \240\159\142\146 Inventory Unlimiter\n\226\128\162 \240\159\142\146 Auto Get Tools\n\226\128\162 \240\159\148\165 Firefly Clutch\n\n\240\159\147\139 NUEVAS PESTA\195\145AS:\n\226\128\162 \240\159\167\176 Utilidades\n\226\128\162 \240\159\148\165 Clutchs (antes Bomb Jump)", k.Verde);
v(tB, "\240\159\148\180 DESCARTADO", "- Silent Aim con Mouse.Hit\n- Silent Aim con Camera\n- Shoot Murderer con Camera Snap\n- Speed Glitch manual\n- Headless / Korblox con ID viejo\n- Dual Wield\n- ESP Skeleton\n- Skin Copier\n- Anti Silent Aim\n- Herobrine\n- SHOOT AVANZADO (V2) \226\134\146 Descontinuado en v4.7.7\n", k.Rojo);
v(tB, "\240\159\142\175 ROADMAP PR\195\147XIMAS VERSIONES", "\240\159\148\156 Pr\195\179ximamente:\n\n\226\128\162 \240\159\155\161\239\184\143 God Mode\n\226\128\162 \226\156\136\239\184\143 Fly con slider\n\226\128\162 \240\159\166\152 Infinity Jump\n\226\128\162 \240\159\147\166 Hitbox Expander\n\226\128\162 \240\159\140\128 TP Enemies (Im\195\161n)\n\226\128\162 \240\159\146\172 Exponer Roles en Chat\n\226\128\162 \240\159\148\148 Gun Drop Sound\n\226\128\162 \240\159\145\187 Spoof Name + Tag + Arco\195\173ris\n\226\128\162 \240\159\146\190 Gestor de Configs\n\226\128\162 \240\159\148\146 Lock por UserId\n\226\128\162 \240\159\147\162 Aviso de update en pantalla\n\226\128\162 \240\159\147\138 Contador de usuarios en pantalla\n\226\128\162 \240\159\142\175 Target Modes (Sheriff/Nearest/Crosshair)\n\226\128\162 \240\159\145\129\239\184\143 ESP Tracer / Chams / Box\n\n\240\159\146\172 Sugerencias \226\134\146 Discord oficial", k.Naranja2);
v(cB, "\226\154\160\239\184\143 Aviso Importante", "El script est\195\161 en fase de desarrollo.\nPuede contener bugs y errores.", k.Amarillo);
v(cB, "\240\159\154\168 Aviso Oficial \226\128\148 Incidente 08/10/2026", "El d\195\173a 08/10/2026 el c\195\179digo de Uzivert Hub fue robado por terceros.\n\n\226\154\160\239\184\143 Aclaraci\195\179n importante:\nEl Uzivert Hub ORIGINAL y OFICIAL es \195\186nicamente el que distribuimos desde nuestro Discord y Gist.\n\nSi ves el hub publicado en otro lado (canales de YouTube, otros servidores, otros usuarios) \226\134\146 NO es oficial.\n\nLas copias pueden:\n\226\128\162 Tener virus\n\226\128\162 Estar modificadas para robar tu cuenta\n\226\128\162 Estar desactualizadas sin soporte\n\n\240\159\148\146 Protegete:\n\226\128\162 Descarg\195\161 solo desde nuestro Discord oficial\n\226\128\162 No ejecutes versiones de otros usuarios\n\226\128\162 Report\195\161 copias al staff\n\n\240\159\146\172 Discord oficial: discord.gg/vHhERWcbXe\n\nGracias por el apoyo. Seguimos mejorando el hub para ustedes. \240\159\142\131\n\n\226\128\148 Uzivert", k.Rojo);
v(cB, "\240\159\154\171 Responsabilidad", "El equipo de Uzivert Hub no se hace responsable si result\195\161s baneado del juego.\nUsalo bajo tu propia responsabilidad.", k.Rojo);
local Vc = Instance.new("Frame");
Vc.Size = UDim2.new(1, 0, 0, 90);
Vc.BackgroundColor3 = Color3.fromRGB(30, 15, 40);
Vc.BackgroundTransparency = .35;
Vc.BorderSizePixel = 0;
Vc.Parent = bB;
local Hc = Instance.new("UICorner");
Hc.CornerRadius = UDim.new(0, 10);
Hc.Parent = Vc;
local sc = Instance.new("UIStroke");
sc.Color = k.Morado2;
sc.Thickness = 1.5;
sc.Transparency = .3;
sc.Parent = Vc;
local pc = Instance.new("TextLabel");
pc.Size = UDim2.new(0, 60, 0, 60);
pc.Position = UDim2.new(0, 12, 0, 15);
pc.BackgroundColor3 = Color3.fromRGB(50, 25, 65);
pc.BackgroundTransparency = .3;
pc.Text = "\240\159\142\131";
pc.TextSize = 32;
pc.BorderSizePixel = 0;
pc.Parent = Vc;
local ic = Instance.new("UICorner");
ic.CornerRadius = UDim.new(0, 10);
ic.Parent = pc;
local Yc = Instance.new("TextLabel");
Yc.Size = UDim2.new(1, -90, 0, 20);
Yc.Position = UDim2.new(0, 82, 0, 15);
Yc.BackgroundTransparency = 1;
Yc.Text = "UZIVERT";
Yc.TextColor3 = k.Texto;
Yc.Font = Enum.Font.GothamBold;
Yc.TextSize = 15;
Yc.TextXAlignment = Enum.TextXAlignment.Left;
Yc.Parent = Vc;
local Tc = Instance.new("TextLabel");
Tc.Size = UDim2.new(1, -90, 0, 16);
Tc.Position = UDim2.new(0, 82, 0, 36);
Tc.BackgroundTransparency = 1;
Tc.Text = "\240\159\145\145 Fundador y creador del proyecto";
Tc.TextColor3 = k.Naranja2;
Tc.Font = Enum.Font.GothamBold;
Tc.TextSize = 11;
Tc.TextXAlignment = Enum.TextXAlignment.Left;
Tc.Parent = Vc;
local uc = Instance.new("TextLabel");
uc.Size = UDim2.new(1, -90, 0, 16);
uc.Position = UDim2.new(0, 82, 0, 55);
uc.BackgroundTransparency = 1;
uc.Text = "Uzivert Hub \226\128\148 Open Hub";
uc.TextColor3 = k.Sub;
uc.Font = Enum.Font.GothamMedium;
uc.TextSize = 10;
uc.TextXAlignment = Enum.TextXAlignment.Left;
uc.Parent = Vc;
v(bB, "\240\159\146\172 Mensaje del Creador", "\194\161Hola! Soy Uzivert, fundador y creador del Uzivert Hub. \240\159\142\131\n\nEste proyecto naci\195\179 como una idea peque\195\177a, sin muchas pretensiones. Pero con esfuerzo, dedicaci\195\179n y muchas horas de prueba y error, lo fuimos mejorando versi\195\179n tras versi\195\179n hasta convertirlo en lo que es hoy.\n\nAgradezco enormemente a Nexvyr, mi colaborador, quien me ayud\195\179 con ideas, c\195\179digo y sobre todo con la motivaci\195\179n para no rendirme cuando las cosas se complicaban.\n\nTambi\195\169n a todos los que probaron el hub, reportaron bugs y me bancaron en el proceso. Sin ustedes, esto no tendr\195\173a sentido.\n\nSeguimos actualizando, mejorando y agregando funciones nuevas. El objetivo es que tengas la mejor experiencia posible en MM2.\n\nSi te gusta el hub \226\134\146 compartilo con tus amigos. Si encontr\195\161s bugs \226\134\146 reportalos en el Discord. Si ten\195\169s ideas \226\134\146 dec\195\173melas.\n\n\240\159\147\177 Redes sociales:\n\226\128\162 TikTok: Uzivert550\n\226\128\162 Instagram: hxuntedluv77\n\n\240\159\146\172 Discord oficial: discord.gg/vHhERWcbXe\n\n\194\161Gracias por usar Uzivert Hub! \240\159\142\131\n\n\226\128\148 Uzivert", k.Morado2);
print("\240\159\142\131 Parte 9/10 cargada - Info + Update + Avisos + Creador");
if P then
	task.wait(.5);
	ky();
	xy();
end;
if R then
	task.wait(.5);
	lc(true);
end;
print("====================================");
print("\240\159\142\131 Uzivert Hub " .. (b .. " cargado \240\159\142\131"));
print("Proyecto inicial por Uzivert");
print("Con ayuda explicativa de Nexvyr");
print("====================================");
print("\240\159\166\135 Murci\195\169lagos volando");
print("\240\159\149\184\239\184\143 Telara\195\177as en esquinas");
print("\240\159\145\187 Niebla animada");
print("\240\159\142\131 Iconos tem\195\161ticos");
print("\240\159\146\128 Colores de Halloween");
print("====================================");
print("\240\159\142\131 Parte 10/10 cargada - SCRIPT COMPLETO v4.7.8");
_G.UZIVERT_TIMER_ON = false;
_G.UZIVERT_TIMER_LABEL = nil;
_G.UZIVERT_TIMER_CON = nil;
_G.UZIVERT_TIMER_START = function()
		if _G.UZIVERT_TIMER_LABEL then
			_G.UZIVERT_TIMER_LABEL:Destroy();
			_G.UZIVERT_TIMER_LABEL = nil;
		end;
		local e = Instance.new("TextLabel");
		e.Size = UDim2.new(0, 150, 0, 40);
		e.Position = UDim2.new(.5, -75, .05, 0);
		e.BackgroundTransparency = 1;
		e.Text = "...";
		e.TextColor3 = Color3.fromRGB(255, 255, 255);
		e.TextStrokeTransparency = 0;
		e.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
		e.Font = Enum.Font.GothamBlack;
		e.TextSize = 24;
		e.BorderSizePixel = 0;
		e.Active = false;
		e.Draggable = false;
		e.Parent = S;
		_G.UZIVERT_TIMER_LABEL = e;
		_G.UZIVERT_TIMER_CON = a.Heartbeat:Connect(function()
				local A = workspace:FindFirstChild("RoundTimerPart", true);
				if A then
					local l = A:FindFirstChild("SurfaceGui", true);
					if l then
						local A = l:FindFirstChild("Timer", true);
						if A and A:IsA("TextLabel") then
							e.Text = A.Text;
						end;
					end;
				end;
			end);
	end;
_G.UZIVERT_TIMER_STOP = function()
		if _G.UZIVERT_TIMER_LABEL then
			_G.UZIVERT_TIMER_LABEL:Destroy();
			_G.UZIVERT_TIMER_LABEL = nil;
		end;
		if _G.UZIVERT_TIMER_CON then
			_G.UZIVERT_TIMER_CON:Disconnect();
			_G.UZIVERT_TIMER_CON = nil;
		end;
	end;
_G.UZIVERT_FLING_TARGET = nil;
_G.UZIVERT_FLING_IN_PROGRESS = false;
_G.UZIVERT_FLING_FUNC = function(e)
		if _G.UZIVERT_FLING_IN_PROGRESS then
			return;
		end;
		_G.UZIVERT_FLING_IN_PROGRESS = true;
		local A = l.Character;
		if not A then
			_G.UZIVERT_FLING_IN_PROGRESS = false;
			return;
		end;
		local E = A:FindFirstChildOfClass("Humanoid");
		local y = A:FindFirstChild("HumanoidRootPart");
		if not ((E and y)) then
			_G.UZIVERT_FLING_IN_PROGRESS = false;
			return;
		end;
		local a = e.Character;
		if not a then
			_G.UZIVERT_FLING_IN_PROGRESS = false;
			return;
		end;
		local W = a:FindFirstChildOfClass("Humanoid");
		local U = W and W.RootPart;
		local t = a:FindFirstChild("Head");
		local c = a:FindFirstChildOfClass("Accessory");
		local b = c and c:FindFirstChild("Handle");
		local k = y.CFrame;
		repeat
			task.wait();
			workspace.CurrentCamera.CameraSubject = t or b or W;
		until workspace.CurrentCamera.CameraSubject == ((t or b or W));
		local function x(e, l, E)
			local a = (CFrame.new(e.Position) * l) * E;
			y.CFrame = a;
			A:SetPrimaryPartCFrame(a);
			y.Velocity = Vector3.new(90000000, 900000000, 90000000);
			y.RotVelocity = Vector3.new(900000000, 900000000, 900000000);
		end;
		local function z(e)
			local A = tick();
			local l = 0;
			repeat
				if y and W then
					l = l + 100;
					for A, E in ipairs({
						CFrame.new(0, 1.5, 0),
						CFrame.new(0, -1.5, 0),
						CFrame.new(2.25, 1.5, -2.25),
						CFrame.new(-2.25, -1.5, 2.25),
					}) do
						x(e, E + W.MoveDirection, CFrame.Angles(math.rad(l), 0, 0));
						task.wait();
					end;
				end;
			until e.Velocity.Magnitude > 500 or tick() - A > 2.5;
		end;
		local d = Instance.new("BodyVelocity");
		d.Name = "UzivertFlingDropdown";
		d.Velocity = Vector3.new(900000000, 900000000, 900000000);
		d.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
		d.Parent = y;
		E:SetStateEnabled(Enum.HumanoidStateType.Seated, false);
		local w = U or t or b;
		if w then
			z(w);
		end;
		d:Destroy();
		E:SetStateEnabled(Enum.HumanoidStateType.Seated, true);
		repeat
			task.wait();
			workspace.CurrentCamera.CameraSubject = E;
		until workspace.CurrentCamera.CameraSubject == E;
		repeat
			local e = k * CFrame.new(0, .5, 0);
			y.CFrame = e;
			A:SetPrimaryPartCFrame(e);
			E:ChangeState(Enum.HumanoidStateType.GettingUp);
			for e, A in ipairs(A:GetChildren()) do
				if A:IsA("BasePart") then
					A.Velocity = Vector3.zero;
					A.RotVelocity = Vector3.zero;
				end;
			end;
			task.wait();
		until ((y.Position - k.p)).Magnitude < 25;
		_G.UZIVERT_FLING_IN_PROGRESS = false;
	end;
_G.UZIVERT_ABRIR_LISTA = function(A, E)
		for e, A in ipairs(A:GetChildren()) do
			if A:IsA("TextButton") then
				A:Destroy();
			end;
		end;
		for e, y in ipairs(e:GetPlayers()) do
			if y ~= l then
				local e = Instance.new("TextButton");
				e.Size = UDim2.new(1, 0, 0, 30);
				e.BackgroundColor3 = k.Morado3;
				e.BackgroundTransparency = .4;
				e.Text = y.Name;
				e.TextColor3 = k.Texto;
				e.Font = Enum.Font.GothamBold;
				e.TextSize = 11;
				e.BorderSizePixel = 0;
				e.Parent = A;
				local l = Instance.new("UICorner");
				l.CornerRadius = UDim.new(0, 5);
				l.Parent = e;
				e.MouseButton1Click:Connect(function()
					_G.UZIVERT_FLING_TARGET = y;
					E.Text = "Fling: " .. y.Name;
					A.Visible = false;
				end);
			end;
		end;
	end;
_G.UZIVERT_SG_ON = false;
_G.UZIVERT_SG_VALOR = d.SpeedGlitchValor or 50;
if not _G.UZIVERT_GAMA_BAJA then
	a.Heartbeat:Connect(function()
		if not _G.UZIVERT_SG_ON then
			return;
		end;
		local e = E.MouseBehavior == Enum.MouseBehavior.LockCenter;
		if not e then
			return;
		end;
		local A = l.Character;
		local y = A and A:FindFirstChildOfClass("Humanoid");
		local a = A and A:FindFirstChild("HumanoidRootPart");
		if y and (a and y.FloorMaterial == Enum.Material.Air) then
			local e = y.MoveDirection;
			if e.Magnitude > 0 then
				local A = a.AssemblyLinearVelocity;
				a.AssemblyLinearVelocity = Vector3.new(e.X * _G.UZIVERT_SG_VALOR, A.Y, e.Z * _G.UZIVERT_SG_VALOR);
			end;
		end;
	end);
end;
task.wait(.5);
if d.AutoGetGun then
	_G.UZIVERT_AUTO_GET_GUN_ON = true;
end;
if d.AimLock then
	_G.AIM_ON = true;
end;
if d.GunAura then
	_G.UZIVERT_GUN_AURA_ON = true;
end;
if d.SilentAim then
	_G.UZIVERT_SILENT_AIM_ON = true;
end;
if not _G.UZIVERT_GAMA_BAJA then
	if d.RoundTimer then
		_G.UZIVERT_TIMER_START();
	end;
	if d.ModoNoche then
		_G.UZIVERT_MODO_NOCHE(true);
	end;
	if d.AutoStab then
		_G.UZIVERT_AUTO_STAB_ON = true;
	end;
	if d.AntiFling then
		pcall(function()
			(loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anti-fling-73205")))();
		end);
	end;
end;
if d.AntiAim then
	_G.UZIVERT_AA_ON = true;
	_G.UZIVERT_AA_START();
end;
if d.SpeedGlitch then
	_G.UZIVERT_SG_ON = true;
end;
if d.SpeedGlitchValor then
	_G.UZIVERT_SG_VALOR = d.SpeedGlitchValor;
end;
if d.Headless or d.KorbloxRight or d.KorbloxLeft then
	task.wait(1);
	if l.Character then
		_G.UZIVERT_APLICAR_COSMETICOS(l.Character);
	end;
end;
if d.InventoryUnlimiter then
	_G.UZIVERT_INV_ON = true;
	_G.UZIVERT_REQUEST_RECOVERY(true);
end;
if d.AutoGetTools then
	_G.UZIVERT_AUTOGET_ON = true;
end;
if d.InventoryMaxItems then
	_G.UZIVERT_INV_LIMIT = d.InventoryMaxItems;
end;
_G.UZIVERT_KNIFE_SA = false;
_G.UZIVERT_KNIFE_WALL_CHECK = false;
_G.UZIVERT_KNIFE_PRIORITIZE_SHERIFF = false;
_G.UZIVERT_KNIFE_PREDICT_JUMP = true;
_G.UZIVERT_KNIFE_PREDICT_LAG = true;
_G.UZIVERT_KNIFE_EXTRA_LEAD = .02;
_G.UZIVERT_KNIFE_FIXED_LEAD = .075;
_G.UZIVERT_KNIFE_MANUAL_PING = 80;
_G.UZIVERT_KNIFE_PRIORITIZE_PING = true;
_G.UZIVERT_KNIFE_ADAPTIVE = true;
_G.UZIVERT_KNIFE_MAX_SIM = 180;
_G.UZIVERT_KNIFE_PRED_INTERVAL = 72;
_G.UZIVERT_KNIFE_H_MULT = 100;
_G.UZIVERT_KNIFE_V_MULT = 100;
_G.UZIVERT_KNIFE_OFF_X = 0;
_G.UZIVERT_KNIFE_OFF_Y = 0;
_G.UZIVERT_KNIFE_OFF_Z = 0;
_G.UZIVERT_KNIFE_HIT_PART = "Head";
_G.UZIVERT_KNIFE_INSTANT = false;
_G.UZIVERT_KNIFE_FAST = false;
_G.UZIVERT_KNIFE_AUTO_THROW = false;
_G.UZIVERT_KNIFE_AUTO_THROW_RADIUS = 25;
_G.UZIVERT_KNIFE_AUTO_KILL_ALL = false;
_G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = false;
_G.UZIVERT_KNIFE_KILL_PLAYER = "None";
_G.UZIVERT_KNIFE_THROWN_AURA = false;
_G.UZIVERT_KNIFE_RADIUS = 15;
_G.UZIVERT_KNIFE_SHERIFF_BIND = false;
_G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE = "Circle";
_G.UZIVERT_KNIFE_REMOTE = nil;
_G.UZIVERT_KNIFE_AIM = nil;
_G.UZIVERT_KNIFE_ORIGIN = nil;
_G.UZIVERT_KNIFE_INSTANT_LAST = 0;
_G.UZIVERT_KNIFE_LAST_THROW = 0;
_G.UZIVERT_KNIFE_MOTION_PART = nil;
_G.UZIVERT_KNIFE_MOTION_SAMPLES = {};
_G.UZIVERT_KNIFE_MEASURED_VEL = Vector3.zero;
_G.UZIVERT_KNIFE_ACTIVE = {};
_G.UZIVERT_KNIFE_BIND_GUI = nil;
_G.UZIVERT_KNIFE_BIND_BTN = nil;
_G.UZIVERT_KNIFE_BIND_CONNS = {};
_G.UZIVERT_KNIFE_BIND_POS = UDim2.new(.7, 0, .72, 0);
_G.UZIVERT_KNIFE_PROFILE = {
		Sim = 180,
		Interval = 72,
		H = 100,
		V = 100,
	};
_G.UZIVERT_KNIFE_LAST_TUNE = 0;
_G.UZIVERT_KNIFE_PingProfiles = {
		{
			Ping = 20,
			Sim = 52,
			Interval = 70,
			H = 156,
			V = 146,
			X = -5,
			Y = -14,
			Z = 0,
		},
		{
			Ping = 50,
			Sim = 60,
			Interval = 66,
			H = 166,
			V = 156,
			X = -6,
			Y = -14,
			Z = 0,
		},
		{
			Ping = 100,
			Sim = 72,
			Interval = 60,
			H = 180,
			V = 170,
			X = -8,
			Y = -15,
			Z = 0,
		},
		{
			Ping = 150,
			Sim = 82,
			Interval = 64,
			H = 188,
			V = 176,
			X = -9,
			Y = -12,
			Z = 0,
		},
		{
			Ping = 200,
			Sim = 94,
			Interval = 70,
			H = 198,
			V = 184,
			X = -10,
			Y = -11,
			Z = 0,
		},
		{
			Ping = 250,
			Sim = 104,
			Interval = 74,
			H = 206,
			V = 192,
			X = -11,
			Y = -10,
			Z = 0,
		},
		{
			Ping = 300,
			Sim = 114,
			Interval = 78,
			H = 214,
			V = 200,
			X = -12,
			Y = -9,
			Z = 0,
		},
		{
			Ping = 350,
			Sim = 124,
			Interval = 82,
			H = 222,
			V = 206,
			X = -13,
			Y = -8,
			Z = 0,
		},
		{
			Ping = 450,
			Sim = 138,
			Interval = 86,
			H = 232,
			V = 214,
			X = -14,
			Y = -7,
			Z = 0,
		},
	};
_G.UZKNIFE_interpProfile = function(e)
		local A = _G.UZIVERT_KNIFE_PingProfiles;
		local l, E = A[1], A[1];
		if e >= A[#A].Ping then
			l, E = A[#A], A[#A];
		elseif e > l.Ping then
			for y = 1, #A - 1, 1 do
				if e <= A[y + 1].Ping then
					l, E = A[y], A[y + 1];
					break;
				end;
			end;
		end;
		local y = E.Ping - l.Ping;
		local a = y > 0 and math.clamp(((e - l.Ping)) / y, 0, 1) or 0;
		a = (a * a) * ((3 - 2 * a));
		local function W(e)
			return math.floor((l[e] + ((E[e] - l[e])) * a) + .5);
		end;
		return {
			Sim = W("Sim"),
			Interval = W("Interval"),
			H = W("H"),
			V = W("V"),
		};
	end;
_G.UZKNIFE_autoTune = function()
		local e = os.clock();
		if e - _G.UZIVERT_KNIFE_LAST_TUNE < .4 then
			return;
		end;
		_G.UZIVERT_KNIFE_LAST_TUNE = e;
		local A = _G.UZKNIFE_interpProfile(math.clamp(math.floor(((_G.UZNOIR_cachedPing or .08)) * 1000 + .5), 5, 1000));
		_G.UZIVERT_KNIFE_PROFILE.Sim = A.Sim;
		_G.UZIVERT_KNIFE_PROFILE.Interval = A.Interval;
		_G.UZIVERT_KNIFE_PROFILE.H = A.H;
		_G.UZIVERT_KNIFE_PROFILE.V = A.V;
	end;
_G.UZKNIFE_lead = function()
		local e = _G.UZIVERT_KNIFE_PRIORITIZE_PING and ((_G.UZNOIR_cachedPing or .08)) or (_G.UZIVERT_KNIFE_MANUAL_PING / 1000);
		local A;
		if _G.UZIVERT_KNIFE_ADAPTIVE then
			A = (e + _G.UZIVERT_KNIFE_EXTRA_LEAD) + e * .06;
			if _G.UZIVERT_KNIFE_PREDICT_LAG then
				local l = math.clamp(_G.UZIVERT_KNIFE_PRED_INTERVAL / 2000, 0, .05);
				A = (A + l) + math.max(0, e - .1) * .22;
			end;
		else
			A = _G.UZIVERT_KNIFE_FIXED_LEAD;
		end;
		local l = _G.UZIVERT_KNIFE_MAX_SIM / 1000;
		if _G.UZIVERT_KNIFE_ADAPTIVE then
			l = math.min(.52, l + math.clamp(e - .1, 0, .4) * .62);
		end;
		return math.clamp(A, .02, l);
	end;
_G.UZKNIFE_sampleMotion = function(e)
		local A = os.clock();
		if _G.UZIVERT_KNIFE_MOTION_PART ~= e then
			_G.UZIVERT_KNIFE_MOTION_PART = e;
			_G.UZIVERT_KNIFE_MOTION_SAMPLES = {};
			_G.UZIVERT_KNIFE_MEASURED_VEL = e.AssemblyLinearVelocity;
		end;
		local l = _G.UZIVERT_KNIFE_MOTION_SAMPLES;
		local E = l[#l];
		local y = _G.UZIVERT_KNIFE_PRED_INTERVAL / 1000;
		if not E or A - E.time >= math.max(.016, y) then
			l[#l + 1] = { position = e.Position, time = A };
			while #l > 8 or (#l > 2 and A - l[1].time > .35) do
				table.remove(l, 1);
			end;
			if #l >= 2 then
				local e = l[1];
				local A = l[#l];
				local E = A.time - e.time;
				if E > .015 then
					local l = ((A.position - e.position)) / E;
					if l.Magnitude < 150 then
						_G.UZIVERT_KNIFE_MEASURED_VEL = _G.UZIVERT_KNIFE_MEASURED_VEL:Lerp(l, .55);
					end;
				end;
			end;
		end;
	end;
_G.UZKNIFE_calculateAim = function(e, A)
		_G.UZKNIFE_sampleMotion(e);
		local l = e.AssemblyLinearVelocity;
		local E = l;
		if _G.UZIVERT_KNIFE_PREDICT_LAG and (_G.UZIVERT_KNIFE_MOTION_PART == e and #_G.UZIVERT_KNIFE_MOTION_SAMPLES >= 2) then
			local e = ((l - _G.UZIVERT_KNIFE_MEASURED_VEL)).Magnitude;
			local A = math.clamp(.75 - e / 120, .35, .75);
			E = l:Lerp(_G.UZIVERT_KNIFE_MEASURED_VEL, A);
		end;
		local y = _G.UZIVERT_KNIFE_H_MULT / 100;
		local a = _G.UZIVERT_KNIFE_V_MULT / 100;
		local W = Vector3.new(E.X * y, _G.UZIVERT_KNIFE_PREDICT_JUMP and E.Y * a or 0, E.Z * y);
		local U = ((e.Position - A)).Magnitude;
		local t = math.clamp(U / 110, 0, .65);
		local c = math.clamp(_G.UZKNIFE_lead() + t, .03, .7);
		local b = Vector3.new((e.Size.X * _G.UZIVERT_KNIFE_OFF_X) / 100, (e.Size.Y * _G.UZIVERT_KNIFE_OFF_Y) / 100, (e.Size.Z * _G.UZIVERT_KNIFE_OFF_Z) / 100);
		return (e.Position + W * c) + b;
	end;
_G.UZKNIFE_wallParams = RaycastParams.new();
_G.UZKNIFE_wallParams.FilterType = Enum.RaycastFilterType.Exclude;
_G.UZKNIFE_wallParams.IgnoreWater = true;
_G.UZKNIFE_targetVisible = function(e)
		if not _G.UZIVERT_KNIFE_WALL_CHECK then
			return true;
		end;
		local A = l.Character;
		if not A then
			return false;
		end;
		local E = A:FindFirstChild("Head") or A:FindFirstChild("HumanoidRootPart");
		if not E or not e then
			return false;
		end;
		_G.UZKNIFE_wallParams.FilterDescendantsInstances = { A };
		local y = Workspace:Raycast(E.Position, e.Position - E.Position, _G.UZKNIFE_wallParams);
		return y == nil or y.Instance:IsDescendantOf(e.Parent);
	end;
_G.UZKNIFE_getKnife = function()
		local e = l.Character;
		if not e then
			return nil, nil;
		end;
		local A = e:FindFirstChild("Knife");
		if A then
			return A, "equipada";
		end;
		local E = l:FindFirstChild("Backpack");
		if E then
			A = E:FindFirstChild("Knife");
			if A then
				return A, "backpack";
			end;
		end;
		return nil, nil;
	end;
_G.UZKNIFE_equip = function()
		local e, A = _G.UZKNIFE_getKnife();
		if e and A == "backpack" then
			local A = l.Character;
			local E = A and A:FindFirstChildOfClass("Humanoid");
			if E then
				pcall(function()
					E:EquipTool(e);
				end);
			end;
			task.wait(.1);
		end;
		return _G.UZKNIFE_getKnife();
	end;
_G.UZKNIFE_getRemote = function(e)
		if not e then
			return nil;
		end;
		for e, A in ipairs(e:GetDescendants()) do
			if A:IsA("RemoteEvent") and A.Name == "KnifeThrown" then
				return A;
			end;
		end;
	end;
_G.UZKNIFE_getAimPart = function(e)
		if not e or not e.Character then
			return nil;
		end;
		if _G.UZIVERT_KNIFE_HIT_PART == "Head" then
			return e.Character:FindFirstChild("Head") or e.Character:FindFirstChild("HumanoidRootPart");
		end;
		return e.Character:FindFirstChild("HumanoidRootPart") or e.Character:FindFirstChild("Head");
	end;
_G.UZKNIFE_findNearest = function(A)
		local E = l.Character;
		local y = E and E:FindFirstChild("HumanoidRootPart");
		if not y then
			return nil;
		end;
		local a, W = nil, A or math.huge;
		for e, A in ipairs(e:GetPlayers()) do
			if A ~= l and A.Character then
				local e = A.Character:FindFirstChildOfClass("Humanoid");
				local l = A.Character:FindFirstChild("HumanoidRootPart");
				if e and (e.Health > 0 and l) then
					local e = ((l.Position - y.Position)).Magnitude;
					if e < W then
						W = e;
						a = A;
					end;
				end;
			end;
		end;
		return a;
	end;
_G.UZKNIFE_selectTarget = function()
		if _G.UZIVERT_KNIFE_PRIORITIZE_SHERIFF then
			local e = wB();
			if e and e.Character then
				local A = e.Character:FindFirstChildOfClass("Humanoid");
				if A and A.Health > 0 then
					return e;
				end;
			end;
		end;
		return _G.UZKNIFE_findNearest();
	end;
_G.UZKNIFE_throwAt = function(e)
		if not e or not e.Character then
			return false;
		end;
		local A = _G.UZKNIFE_equip();
		if not A then
			return false;
		end;
		local l = _G.UZKNIFE_getRemote(A);
		if not l then
			return false;
		end;
		local E = A:FindFirstChild("Handle");
		if not E then
			return false;
		end;
		local y = _G.UZKNIFE_getAimPart(e);
		if not y then
			return false;
		end;
		if not _G.UZKNIFE_targetVisible(y) then
			return false;
		end;
		local a = .38;
		if _G.UZIVERT_KNIFE_INSTANT then
			a = .05;
		elseif _G.UZIVERT_KNIFE_FAST then
			a = .12;
		end;
		local W = tick();
		if W - _G.UZIVERT_KNIFE_LAST_THROW < a then
			return false;
		end;
		_G.UZIVERT_KNIFE_LAST_THROW = W;
		if _G.UZIVERT_KNIFE_INSTANT then
			_G.UZIVERT_KNIFE_INSTANT_LAST = W;
		end;
		local U = E.Position;
		local t = _G.UZKNIFE_calculateAim(y, U);
		local c = CFrame.lookAt(U, t);
		local b = CFrame.new(t);
		pcall(function()
			l:FireServer(c, b);
		end);
		return true;
	end;
task.spawn(function()
	while task.wait(.25) do
		local e = _G.UZKNIFE_getKnife();
		_G.UZIVERT_KNIFE_REMOTE = e and _G.UZKNIFE_getRemote(e) or nil;
	end;
end);
task.spawn(function()
	while task.wait(.15) do
		if not HB() then
			task.wait(.5);
			continue;
		end;
		if _G.UZIVERT_KNIFE_AUTO_KILL_ALL then
			for e, A in ipairs(e:GetPlayers()) do
				if A ~= l and A.Character then
					local e = A.Character:FindFirstChildOfClass("Humanoid");
					if e and e.Health > 0 then
						if _G.UZKNIFE_throwAt(A) then
							task.wait(.4);
						end;
					end;
				end;
			end;
		elseif _G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF then
			local e = wB();
			if e then
				_G.UZKNIFE_throwAt(e);
			end;
		elseif _G.UZIVERT_KNIFE_KILL_PLAYER ~= "None" then
			local A = e:FindFirstChild(_G.UZIVERT_KNIFE_KILL_PLAYER);
			if A then
				_G.UZKNIFE_throwAt(A);
			end;
		end;
	end;
end);
task.spawn(function()
	while task.wait(.2) do
		if not _G.UZIVERT_KNIFE_AUTO_THROW then
			continue;
		end;
		if not HB() then
			continue;
		end;
		if _G.UZIVERT_KNIFE_AUTO_KILL_ALL or _G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF or _G.UZIVERT_KNIFE_KILL_PLAYER ~= "None" then
			continue;
		end;
		local e = _G.UZKNIFE_findNearest(_G.UZIVERT_KNIFE_AUTO_THROW_RADIUS);
		if e then
			_G.UZKNIFE_throwAt(e);
		end;
	end;
end);
a.RenderStepped:Connect(function()
	if not _G.UZIVERT_KNIFE_SA or not HB() then
		_G.UZIVERT_KNIFE_AIM = nil;
		return;
	end;
	local e = _G.UZKNIFE_selectTarget();
	if not e then
		_G.UZIVERT_KNIFE_AIM = nil;
		return;
	end;
	local A = _G.UZKNIFE_getAimPart(e);
	if not A then
		_G.UZIVERT_KNIFE_AIM = nil;
		return;
	end;
	if not _G.UZKNIFE_targetVisible(A) then
		_G.UZIVERT_KNIFE_AIM = nil;
		return;
	end;
	local l = _G.UZKNIFE_getKnife();
	if not l then
		_G.UZIVERT_KNIFE_AIM = nil;
		return;
	end;
	local E = l:FindFirstChild("Handle");
	if not E then
		_G.UZIVERT_KNIFE_AIM = nil;
		return;
	end;
	_G.UZIVERT_KNIFE_ORIGIN = E.Position;
	_G.UZIVERT_KNIFE_AIM = _G.UZKNIFE_calculateAim(A, _G.UZIVERT_KNIFE_ORIGIN);
end);
task.spawn(function()
	while task.wait(.5) do
		_G.UZKNIFE_autoTune();
	end;
end);
_G.UZKNIFE_knifePos = function(e)
		if not e or not e.Parent then
			return nil;
		end;
		local A = e:FindFirstChild("BladePosition");
		if A and A:IsA("BasePart") then
			return A.Position;
		end;
		if A and A:IsA("Attachment") then
			return A.WorldPosition;
		end;
		local l = e:FindFirstChild("KnifeVisual");
		if l and l:IsA("BasePart") then
			return l.Position;
		end;
		if e:IsA("BasePart") then
			return e.Position;
		end;
		local E = e:FindFirstChildWhichIsA("BasePart", true);
		return E and E.Position or nil;
	end;
_G.UZKNIFE_isOwn = function(e)
		local A = e:FindFirstChild("HandleLink");
		local E = l.Character;
		local y = l:FindFirstChild("Backpack");
		if A and (A:IsA("ObjectValue") and A.Value) then
			if E and A.Value:IsDescendantOf(E) then
				return true;
			end;
			if y and A.Value:IsDescendantOf(y) then
				return true;
			end;
		end;
		return false;
	end;
_G.UZKNIFE_touchPair = function(e, A)
		if type(firetouchinterest) ~= "function" then
			return;
		end;
		if not e or not A or not e.Parent or not A.Parent then
			return;
		end;
		pcall(firetouchinterest, e, A, 0);
		task.wait();
		pcall(firetouchinterest, e, A, 1);
	end;
_G.UZKNIFE_strike = function(e, A)
		local l = _G.UZKNIFE_getKnife();
		local E = l and l:FindFirstChild("Handle", true);
		local y = e:FindFirstChild("BladePosition");
		if not ((y and y:IsA("BasePart"))) then
			y = e:IsA("BasePart") and e or e:FindFirstChildWhichIsA("BasePart", true);
		end;
		_G.UZKNIFE_touchPair(y, A);
		if E and (E:IsA("BasePart") and E ~= y) then
			_G.UZKNIFE_touchPair(E, A);
		end;
		if l then
			local e = l:FindFirstChild("HandleTouched", true);
			if e and e:IsA("RemoteEvent") then
				pcall(function()
					e:FireServer(A);
				end);
			end;
			local E = l:FindFirstChild("KnifeStabbed", true);
			if E and E:IsA("RemoteEvent") then
				pcall(function()
					E:FireServer();
				end);
			end;
		end;
	end;
_G.UZKNIFE_track = function(e)
		if _G.UZIVERT_KNIFE_ACTIVE[e] or not _G.UZIVERT_KNIFE_THROWN_AURA then
			return;
		end;
		local A = e.Name == "ThrowingKnife" or e:HasTag("ThrowingKnife") or e:FindFirstChild("HandleLink") ~= nil or e:FindFirstChild("BladePosition") ~= nil;
		if not A then
			return;
		end;
		if not _G.UZKNIFE_isOwn(e) then
			e:WaitForChild("HandleLink", .1);
			if not _G.UZKNIFE_isOwn(e) then
				return;
			end;
		end;
		_G.UZIVERT_KNIFE_ACTIVE[e] = { started = os.clock(), hit = {} };
	end;
((game:GetService("CollectionService")):GetInstanceAddedSignal("ThrowingKnife")):Connect(function(e)
	task.defer(_G.UZKNIFE_track, e);
end);
Workspace.ChildAdded:Connect(function(e)
	if e.Name == "ThrowingKnife" or e:HasTag("ThrowingKnife") then
		task.defer(_G.UZKNIFE_track, e);
	end;
end);
a.Heartbeat:Connect(function()
	if not _G.UZIVERT_KNIFE_THROWN_AURA then
		_G.UZIVERT_KNIFE_ACTIVE = {};
		return;
	end;
	local A = os.clock();
	for E, y in pairs(_G.UZIVERT_KNIFE_ACTIVE) do
		if not E.Parent or A - y.started > 3.5 then
			_G.UZIVERT_KNIFE_ACTIVE[E] = nil;
		else
			local a = _G.UZKNIFE_knifePos(E);
			if a then
				for e, W in ipairs(e:GetPlayers()) do
					if W ~= l and W.Character then
						local e = W.Character:FindFirstChild("HumanoidRootPart");
						local l = W.Character:FindFirstChildOfClass("Humanoid");
						if e and (l and l.Health > 0) then
							if ((e.Position - a)).Magnitude <= _G.UZIVERT_KNIFE_RADIUS then
								if A - ((y.hit[W] or 0)) >= .08 then
									y.hit[W] = A;
									_G.UZKNIFE_strike(E, e);
								end;
							end;
						end;
					end;
				end;
			end;
		end;
	end;
end);
_G.UZKNIFE_destroyBind = function()
		for e, A in ipairs(_G.UZIVERT_KNIFE_BIND_CONNS) do
			pcall(function()
				A:Disconnect();
			end);
		end;
		_G.UZIVERT_KNIFE_BIND_CONNS = {};
		if _G.UZIVERT_KNIFE_BIND_GUI then
			_G.UZIVERT_KNIFE_BIND_GUI:Destroy();
		end;
		_G.UZIVERT_KNIFE_BIND_GUI, _G.UZIVERT_KNIFE_BIND_BTN = nil, nil;
	end;
_G.UZKNIFE_createBind = function()
		if _G.UZIVERT_KNIFE_BIND_BTN then
			return;
		end;
		local e = l:FindFirstChild("PlayerGui");
		local A = Instance.new("ScreenGui");
		A.Name = "UzivertKnifeSheriffBind";
		A.ResetOnSpawn = false;
		A.IgnoreGuiInset = true;
		A.DisplayOrder = 90;
		A.Parent = e;
		local y = Instance.new("ImageButton");
		y.AnchorPoint = Vector2.new(.5, .5);
		y.Position = _G.UZIVERT_KNIFE_BIND_POS;
		y.Size = UDim2.fromOffset(64, 64);
		y.BackgroundColor3 = Color3.fromRGB(8, 8, 10);
		y.BackgroundTransparency = .28;
		y.BorderSizePixel = 0;
		y.AutoButtonColor = false;
		y.Image = "";
		y.Parent = A;
		local a = Instance.new("UICorner");
		a.Name = "KnifeShape";
		a.CornerRadius = _G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE == "Circle" and UDim.new(1, 0) or UDim.new(0, 12);
		a.Parent = y;
		local W = Instance.new("UIStroke");
		W.Color = Color3.fromRGB(255, 255, 255);
		W.Thickness = 2;
		W.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		W.Parent = y;
		local U = Instance.new("TextLabel");
		U.AnchorPoint = Vector2.new(.5, .5);
		U.Position = UDim2.fromScale(.5, .5);
		U.Size = UDim2.fromScale(.85, .85);
		U.BackgroundTransparency = 1;
		U.Text = "Kill\nSheriff";
		U.TextColor3 = Color3.new(1, 1, 1);
		U.TextSize = 10;
		U.TextWrapped = true;
		U.Font = Enum.Font.GothamBold;
		U.Parent = y;
		local t, c, b, k, x = false, false, nil, nil, nil;
		_G.UZIVERT_KNIFE_BIND_CONNS[#_G.UZIVERT_KNIFE_BIND_CONNS + 1] = y.InputBegan:Connect(function(e)
				if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
					t, c = true, false;
					b, k = e.Position, y.Position;
				end;
			end);
		_G.UZIVERT_KNIFE_BIND_CONNS[#_G.UZIVERT_KNIFE_BIND_CONNS + 1] = y.InputChanged:Connect(function(e)
				if e.UserInputType == Enum.UserInputType.MouseMovement or e.UserInputType == Enum.UserInputType.Touch then
					x = e;
				end;
			end);
		_G.UZIVERT_KNIFE_BIND_CONNS[#_G.UZIVERT_KNIFE_BIND_CONNS + 1] = E.InputChanged:Connect(function(e)
				if not t or e ~= x then
					return;
				end;
				local A = e.Position - b;
				if A.Magnitude > 7 then
					c = true;
				end;
				y.Position = UDim2.new(k.X.Scale, k.X.Offset + A.X, k.Y.Scale, k.Y.Offset + A.Y);
			end);
		_G.UZIVERT_KNIFE_BIND_CONNS[#_G.UZIVERT_KNIFE_BIND_CONNS + 1] = E.InputEnded:Connect(function(e)
				if not t then
					return;
				end;
				if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
					t = false;
					_G.UZIVERT_KNIFE_BIND_POS = y.Position;
					if not c then
						local e = wB();
						if e then
							_G.UZKNIFE_throwAt(e);
						end;
					end;
				end;
			end);
		_G.UZIVERT_KNIFE_BIND_GUI, _G.UZIVERT_KNIFE_BIND_BTN = A, y;
	end;
_G.UZKNIFE_updateBindShape = function()
		if _G.UZIVERT_KNIFE_BIND_BTN then
			local e = _G.UZIVERT_KNIFE_BIND_BTN:FindFirstChild("KnifeShape");
			if e then
				e.CornerRadius = _G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE == "Circle" and UDim.new(1, 0) or UDim.new(0, 12);
			end;
		end;
	end;
_G.secKnifeNoir = Instance.new("Frame");
_G.secKnifeNoir.Size = UDim2.new(1, 0, 0, 30);
_G.secKnifeNoir.BackgroundColor3 = Color3.fromRGB(20, 15, 25);
_G.secKnifeNoir.BackgroundTransparency = .3;
_G.secKnifeNoir.BorderSizePixel = 0;
_G.secKnifeNoir.ZIndex = 2;
_G.secKnifeNoir.Parent = EB;
_G.cKnifeNoir = Instance.new("UICorner");
_G.cKnifeNoir.CornerRadius = UDim.new(0, 7);
_G.cKnifeNoir.Parent = _G.secKnifeNoir;
_G.sKnifeNoir = Instance.new("UIStroke");
_G.sKnifeNoir.Color = k.Morado3;
_G.sKnifeNoir.Thickness = 1.5;
_G.sKnifeNoir.Transparency = .2;
_G.sKnifeNoir.Parent = _G.secKnifeNoir;
_G.lblKnifeNoir = Instance.new("TextLabel");
_G.lblKnifeNoir.Size = UDim2.new(1, -20, 1, 0);
_G.lblKnifeNoir.Position = UDim2.new(0, 10, 0, 0);
_G.lblKnifeNoir.BackgroundTransparency = 1;
_G.lblKnifeNoir.Text = "\240\159\151\161\239\184\143 KNIFE NOIR (Completo)";
_G.lblKnifeNoir.TextColor3 = k.Naranja2;
_G.lblKnifeNoir.Font = Enum.Font.GothamBlack;
_G.lblKnifeNoir.TextSize = 12;
_G.lblKnifeNoir.TextXAlignment = Enum.TextXAlignment.Left;
_G.lblKnifeNoir.ZIndex = 3;
_G.lblKnifeNoir.Parent = _G.secKnifeNoir;
O(EB, "\240\159\151\161\239\184\143 Knife Silent Aim", d.UZKNIFE_SA or false, function(e)
	_G.UZIVERT_KNIFE_SA = e;
	d.UZKNIFE_SA = e;
	m();
end);
O(EB, "\240\159\167\177 Knife Wall Check", d.UZKNIFE_WallCheck or false, function(e)
	_G.UZIVERT_KNIFE_WALL_CHECK = e;
	d.UZKNIFE_WallCheck = e;
	m();
end);
O(EB, "\240\159\142\175 Prioritize Sheriff", d.UZKNIFE_PrioritizeSheriff or false, function(e)
	_G.UZIVERT_KNIFE_PRIORITIZE_SHERIFF = e;
	d.UZKNIFE_PrioritizeSheriff = e;
	m();
end);
O(EB, "\240\159\166\152 Predict Jump", d.UZKNIFE_PredictJump ~= false, function(e)
	_G.UZIVERT_KNIFE_PREDICT_JUMP = e;
	d.UZKNIFE_PredictJump = e;
	m();
end);
O(EB, "\240\159\143\131 Predict Lag", d.UZKNIFE_PredictLag ~= false, function(e)
	_G.UZIVERT_KNIFE_PREDICT_LAG = e;
	d.UZKNIFE_PredictLag = e;
	m();
end);
O(EB, "\240\159\147\161 Prioritize Ping", d.UZKNIFE_PrioritizePing ~= false, function(e)
	_G.UZIVERT_KNIFE_PRIORITIZE_PING = e;
	d.UZKNIFE_PrioritizePing = e;
	m();
end);
q(EB, "\240\159\142\175 Extra Lead (x1000)", 0, 100, math.floor(((d.UZKNIFE_ExtraLead or .02)) * 1000), function(e)
	_G.UZIVERT_KNIFE_EXTRA_LEAD = e / 1000;
	d.UZKNIFE_ExtraLead = e / 1000;
	m();
end);
q(EB, "\226\154\153\239\184\143 Max Sim (ms)", 50, 500, d.UZKNIFE_MaxSim or 180, function(e)
	_G.UZIVERT_KNIFE_MAX_SIM = e;
	d.UZKNIFE_MaxSim = e;
	m();
end);
q(EB, "\240\159\142\175 Pred Interval (ms)", 30, 200, d.UZKNIFE_PredInterval or 72, function(e)
	_G.UZIVERT_KNIFE_PRED_INTERVAL = e;
	d.UZKNIFE_PredInterval = e;
	m();
end);
q(EB, "\226\134\148\239\184\143 H Mult (%)", 50, 250, d.UZKNIFE_HMult or 100, function(e)
	_G.UZIVERT_KNIFE_H_MULT = e;
	d.UZKNIFE_HMult = e;
	m();
end);
q(EB, "\226\134\149\239\184\143 V Mult (%)", 50, 250, d.UZKNIFE_VMult or 100, function(e)
	_G.UZIVERT_KNIFE_V_MULT = e;
	d.UZKNIFE_VMult = e;
	m();
end);
q(EB, "\226\172\133\239\184\143 Offset X (%)", -100, 100, d.UZKNIFE_OffX or 0, function(e)
	_G.UZIVERT_KNIFE_OFF_X = e;
	d.UZKNIFE_OffX = e;
	m();
end);
q(EB, "\226\172\134\239\184\143 Offset Y (%)", -100, 100, d.UZKNIFE_OffY or 0, function(e)
	_G.UZIVERT_KNIFE_OFF_Y = e;
	d.UZKNIFE_OffY = e;
	m();
end);
q(EB, "\226\134\151\239\184\143 Offset Z (%)", -100, 100, d.UZKNIFE_OffZ or 0, function(e)
	_G.UZIVERT_KNIFE_OFF_Z = e;
	d.UZKNIFE_OffZ = e;
	m();
end);
O(EB, "\226\154\161 Instant Throw", d.UZKNIFE_InstantThrow or false, function(e)
	_G.UZIVERT_KNIFE_INSTANT = e;
	d.UZKNIFE_InstantThrow = e;
	if e then
		_G.UZIVERT_KNIFE_FAST = false;
		d.UZKNIFE_FastThrow = false;
	end;
	m();
end);
O(EB, "\240\159\143\131 Fast Throw", d.UZKNIFE_FastThrow or false, function(e)
	_G.UZIVERT_KNIFE_FAST = e;
	d.UZKNIFE_FastThrow = e;
	if e then
		_G.UZIVERT_KNIFE_INSTANT = false;
		d.UZKNIFE_InstantThrow = false;
	end;
	m();
end);
O(EB, "\240\159\142\175 Auto Throw (cerca)", d.UZKNIFE_AutoThrow or false, function(e)
	_G.UZIVERT_KNIFE_AUTO_THROW = e;
	d.UZKNIFE_AutoThrow = e;
	m();
end);
q(EB, "Rango Auto Throw", 5, 100, d.UZKNIFE_AutoThrowRadius or 25, function(e)
	_G.UZIVERT_KNIFE_AUTO_THROW_RADIUS = e;
	d.UZKNIFE_AutoThrowRadius = e;
	m();
end);
O(EB, "\240\159\146\165 Auto Kill Everyone", d.UZKNIFE_AutoKillAll or false, function(e)
	_G.UZIVERT_KNIFE_AUTO_KILL_ALL = e;
	d.UZKNIFE_AutoKillAll = e;
	if e then
		_G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = false;
		d.UZKNIFE_AutoKillSheriff = false;
		_G.UZIVERT_KNIFE_KILL_PLAYER = "None";
		d.UZKNIFE_KillPlayer = "None";
	end;
	m();
end);
O(EB, "\240\159\146\165 Auto Kill Sheriff", d.UZKNIFE_AutoKillSheriff or false, function(e)
	_G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = e;
	d.UZKNIFE_AutoKillSheriff = e;
	if e then
		_G.UZIVERT_KNIFE_AUTO_KILL_ALL = false;
		d.UZKNIFE_AutoKillAll = false;
		_G.UZIVERT_KNIFE_KILL_PLAYER = "None";
		d.UZKNIFE_KillPlayer = "None";
	end;
	m();
end);
_G.lblKnifeKillPlayer = Instance.new("TextButton");
_G.lblKnifeKillPlayer.Size = UDim2.new(1, 0, 0, 38);
_G.lblKnifeKillPlayer.BackgroundColor3 = k.Morado3;
_G.lblKnifeKillPlayer.BackgroundTransparency = .5;
_G.lblKnifeKillPlayer.Text = "Kill Player: " .. ((_G.UZIVERT_KNIFE_KILL_PLAYER or "None"));
_G.lblKnifeKillPlayer.TextColor3 = k.Texto;
_G.lblKnifeKillPlayer.Font = Enum.Font.GothamBold;
_G.lblKnifeKillPlayer.TextSize = 11;
_G.lblKnifeKillPlayer.BorderSizePixel = 0;
_G.lblKnifeKillPlayer.ZIndex = 2;
_G.lblKnifeKillPlayer.Parent = EB;
_G.ckp = Instance.new("UICorner");
_G.ckp.CornerRadius = UDim.new(0, 8);
_G.ckp.Parent = _G.lblKnifeKillPlayer;
_G.lblKnifeKillPlayer.MouseButton1Click:Connect(function()
	local A = { "None" };
	for e, E in ipairs(e:GetPlayers()) do
		if E ~= l then
			A[#A + 1] = E.Name;
		end;
	end;
	local E = table.find(A, _G.UZIVERT_KNIFE_KILL_PLAYER) or 1;
	E = E % #A + 1;
	_G.UZIVERT_KNIFE_KILL_PLAYER = A[E];
	d.UZKNIFE_KillPlayer = A[E];
	_G.lblKnifeKillPlayer.Text = "Kill Player: " .. A[E];
	if A[E] ~= "None" then
		_G.UZIVERT_KNIFE_AUTO_KILL_ALL = false;
		_G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = false;
		d.UZKNIFE_AutoKillAll = false;
		d.UZKNIFE_AutoKillSheriff = false;
	end;
	m();
end);
O(EB, "\240\159\151\161\239\184\143 Knife Throw Aura", d.UZKNIFE_ThrowAura or false, function(e)
	_G.UZIVERT_KNIFE_THROWN_AURA = e;
	d.UZKNIFE_ThrowAura = e;
	m();
end);
q(EB, "Aura Radius", 5, 40, d.UZKNIFE_AuraRadius or 15, function(e)
	_G.UZIVERT_KNIFE_RADIUS = e;
	d.UZKNIFE_AuraRadius = e;
	m();
end);
O(EB, "\240\159\142\175 Sheriff Bind Button", d.UZKNIFE_SheriffBind or false, function(e)
	_G.UZIVERT_KNIFE_SHERIFF_BIND = e;
	d.UZKNIFE_SheriffBind = e;
	if e then
		_G.UZKNIFE_createBind();
	else
		_G.UZKNIFE_destroyBind();
	end;
	m();
end);
O(EB, "Shape: Circle", ((d.UZKNIFE_SheriffBindShape or "Circle")) == "Circle", function(e)
	_G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE = e and "Circle" or "Square";
	d.UZKNIFE_SheriffBindShape = _G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE;
	_G.UZKNIFE_updateBindShape();
	m();
end);
task.defer(function()
	_G.UZIVERT_KNIFE_SA = d.UZKNIFE_SA or false;
	_G.UZIVERT_KNIFE_WALL_CHECK = d.UZKNIFE_WallCheck or false;
	_G.UZIVERT_KNIFE_PRIORITIZE_SHERIFF = d.UZKNIFE_PrioritizeSheriff or false;
	_G.UZIVERT_KNIFE_PREDICT_JUMP = d.UZKNIFE_PredictJump ~= false;
	_G.UZIVERT_KNIFE_PREDICT_LAG = d.UZKNIFE_PredictLag ~= false;
	_G.UZIVERT_KNIFE_PRIORITIZE_PING = d.UZKNIFE_PrioritizePing ~= false;
	_G.UZIVERT_KNIFE_EXTRA_LEAD = d.UZKNIFE_ExtraLead or .02;
	_G.UZIVERT_KNIFE_MAX_SIM = d.UZKNIFE_MaxSim or 180;
	_G.UZIVERT_KNIFE_PRED_INTERVAL = d.UZKNIFE_PredInterval or 72;
	_G.UZIVERT_KNIFE_H_MULT = d.UZKNIFE_HMult or 100;
	_G.UZIVERT_KNIFE_V_MULT = d.UZKNIFE_VMult or 100;
	_G.UZIVERT_KNIFE_OFF_X = d.UZKNIFE_OffX or 0;
	_G.UZIVERT_KNIFE_OFF_Y = d.UZKNIFE_OffY or 0;
	_G.UZIVERT_KNIFE_OFF_Z = d.UZKNIFE_OffZ or 0;
	_G.UZIVERT_KNIFE_INSTANT = d.UZKNIFE_InstantThrow or false;
	_G.UZIVERT_KNIFE_FAST = d.UZKNIFE_FastThrow or false;
	_G.UZIVERT_KNIFE_AUTO_THROW = d.UZKNIFE_AutoThrow or false;
	_G.UZIVERT_KNIFE_AUTO_THROW_RADIUS = d.UZKNIFE_AutoThrowRadius or 25;
	_G.UZIVERT_KNIFE_AUTO_KILL_ALL = d.UZKNIFE_AutoKillAll or false;
	_G.UZIVERT_KNIFE_AUTO_KILL_SHERIFF = d.UZKNIFE_AutoKillSheriff or false;
	_G.UZIVERT_KNIFE_KILL_PLAYER = d.UZKNIFE_KillPlayer or "None";
	_G.UZIVERT_KNIFE_THROWN_AURA = d.UZKNIFE_ThrowAura or false;
	_G.UZIVERT_KNIFE_RADIUS = d.UZKNIFE_AuraRadius or 15;
	_G.UZIVERT_KNIFE_SHERIFF_BIND = d.UZKNIFE_SheriffBind or false;
	_G.UZIVERT_KNIFE_SHERIFF_BIND_SHAPE = d.UZKNIFE_SheriffBindShape or "Circle";
	if _G.UZIVERT_KNIFE_SHERIFF_BIND then
		_G.UZKNIFE_createBind();
	end;
end);
print("\240\159\151\161\239\184\143 [KNIFE NOIR] Cargado en pesta\195\177a Crab");

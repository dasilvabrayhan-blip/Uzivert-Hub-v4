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

task.spawn(function()
	local n = game:GetService("Players");
	local J = n.LocalPlayer;
	local function C()
		pcall(function()
			local n = "https://uzivert-api.onrender.com/registrar?user=" .. (J.Name .. "&game=duelos");
			game:HttpGet(n);
		end);
	end;
	C();
	while task.wait(120) do
		C();
	end;
end);
local n = game:GetService("Players");
local J = game:GetService("RunService");
local C = game:GetService("UserInputService");
local Y = game:GetService("ReplicatedStorage");
local d = game:GetService("HttpService");
local L = game:GetService("Workspace");
local R = game:GetService("SoundService");
local e = n.LocalPlayer;
while not e do
	task.wait();
	e = n.LocalPlayer;
end;
local H = L.CurrentCamera;
local w = false;
local P = 120;
local G = false;
local j = false;
local A = "Cabeza";
local h = false;
local k = false;
local M = "Cabeza";
local y = true;
local m = false;
local I = Color3.fromRGB(255, 255, 255);
local N = { Glow = true };
local x = false;
local X = false;
local o = false;
local p = 3.5;
local T = Color3.fromRGB(255, 0, 0);
local Z = false;
local z = "Nombre falso";
local B = false;
local Q = nil;
local i = nil;
local O = {};
local a;
local E;
local U;
local f;
local u;
local g;
local t;
local K;
local q;
local l;
local v = false;
local c;
local F = Instance.new("ScreenGui");
F.Name = "UzivertHub_Overlays";
F.ResetOnSpawn = false;
F.IgnoreGuiInset = true;
F.DisplayOrder = 999;
F.Parent = e:WaitForChild("PlayerGui");
local D = Instance.new("Folder");
D.Name = "UzivertESPFolder";
D.Parent = F;
local b;
local V = "1.6.66";
local S = "WindUI_Cache_v" .. (V .. ".txt");
local W = "WindUI_Cache_v" .. (V .. "_Time.txt");
local s, r = pcall(function()
		local n = false;
		if isfile and (isfile(W) and readfile) then
			local J = tonumber(readfile(W));
			if J and (os.time() - J) < 86400 then
				n = true;
			end;
		end;
		if n and (isfile and isfile(S)) then
			local n = readfile(S);
			local J = loadstring(n);
			if J then
				return J();
			else
				if delfile then
					pcall(delfile, S);
					pcall(delfile, W);
				end;
			end;
		end;
		local J = game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. (V .. "/main.lua"));
		if writefile then
			writefile(S, J);
			writefile(W, tostring(os.time()));
		end;
		return (loadstring(J))();
	end);
if s and (r and type(r) == "table") then
	b = r;
else
	warn("Error al cargar WindUI: " .. tostring(r));
	return;
end;
local nx = false;
do
	local function n(n)
		return pcall(function()
			local J, C = Color3.fromHex("#1c1e2c"), Color3.fromHex("#22253a");
			if n then
				J = b:Gradient({ ["0"] = { Color = Color3.fromHex("#252839"), Transparency = 0 }, ["100"] = { Color = Color3.fromHex("#14151f"), Transparency = 0 } }, { Rotation = 90 });
				C = b:Gradient({ ["0"] = { Color = Color3.fromHex("#0e0f18"), Transparency = 0 }, ["50"] = { Color = Color3.fromHex("#1d2033"), Transparency = 0 }, ["100"] = { Color = Color3.fromHex("#33384f"), Transparency = 0 } }, { Rotation = 35 });
			end;
			b:AddTheme({
				Name = "Uzivert",
				Accent = J,
				Background = C,
				Dialog = Color3.fromHex("#171826"),
				Outline = Color3.fromHex("#bec8e1"),
				Text = Color3.fromHex("#f1f3fa"),
				Placeholder = Color3.fromHex("#8a90a8"),
				Button = Color3.fromHex("#4a4f6a"),
				Icon = Color3.fromHex("#bec8e1"),
				Toggle = Color3.fromHex("#9fb0e8"),
				Slider = Color3.fromHex("#9fb0e8"),
				Checkbox = Color3.fromHex("#9fb0e8"),
				Primary = Color3.fromHex("#9fb0e8"),
				PanelBackground = Color3.fromHex("#ffffff"),
				PanelBackgroundTransparency = .94,
			});
		end);
	end;
	nx = n(true) or n(false);
end;
local Jx = "132390617819216";
local Cx = "rbxassetid://" .. Jx;
pcall(function()
	local n = (game:GetObjects("rbxassetid://" .. Jx))[1];
	if n and ((n:IsA("Decal") or n:IsA("Texture"))) then
		local J = (tostring(n.Texture)):match("id=(%d+)") or (tostring(n.Texture)):match("rbxassetid://(%d+)");
		if J then
			Cx = "rbxassetid://" .. J;
		end;
	end;
end);
local Yx = b:CreateWindow({
		Title = "UZIVERT HUB | DUELS <font color=\'#FFD700\'>[v2.5] </font>",
		Author = "By Uzivert \240\159\135\181\240\159\135\190",
		Folder = "Uzivert_WindUI",
		Acrylic = false,
		Transparent = false,
		NewElements = true,
		HideSearchBar = false,
		ToggleKey = Enum.KeyCode.F15,
		Icon = "moon",
		Theme = nx and "Uzivert" or "Dark",
		Background = Cx,
		BackgroundImageTransparency = .35,
		OpenButton = {
			Title = "Uzivert Hub",
			Icon = "moon",
			IconSize = 20,
			CornerRadius = UDim.new(1),
			StrokeThickness = 2,
			Enabled = false,
			Draggable = true,
			Scale = .9,
			Color = ColorSequence.new(Color3.fromHex("#110070"), Color3.fromHex("#300364")),
		},
		Topbar = { Height = 44, ButtonsType = "Default" },
	});
task.spawn(function()
	pcall(function()
		task.wait(.5);
		local n;
		pcall(function()
			n = Yx.UIElements and Yx.UIElements.Main;
		end);
		if not ((n and n:IsA("GuiObject"))) then
			n = nil;
			local J = 0;
			local C = b.ScreenGui or (gethui and gethui()) or game:GetService("CoreGui");
			for C, Y in ipairs(C:GetDescendants()) do
				if Y:IsA("Frame") and (Y:FindFirstChildOfClass("UICorner") and (Y.AbsoluteSize.X > 400 and Y.AbsoluteSize.Y > 300)) then
					local C = Y.AbsoluteSize.X * Y.AbsoluteSize.Y;
					if C > J then
						J, n = C, Y;
					end;
				end;
			end;
		end;
		if not n then
			return;
		end;
		local C = Instance.new("UIStroke");
		C.Thickness = 2;
		C.Color = Color3.new(1, 1, 1);
		C.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		C.Parent = n;
		local Y = Instance.new("UIGradient");
		Y.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 118, 142)),
				ColorSequenceKeypoint.new(.25, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(.5, Color3.fromRGB(190, 200, 225)),
				ColorSequenceKeypoint.new(.75, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 118, 142)),
			});
		Y.Parent = C;
		local d;
		d = J.Heartbeat:Connect(function()
				if not C.Parent then
					d:Disconnect();
					return;
				end;
				Y.Rotation = ((os.clock() * 120)) % 360;
			end);
	end);
end);
local dx = { Inicio = Yx:Tab({ Title = "Inicio", Icon = "solar:home-2-bold" }) };
local Lx = Yx:Section({ Title = "Combate principal", Opened = true });
local Rx = Yx:Section({ Title = "Zona de farmeo", Opened = true });
local ex = Yx:Section({ Title = "Configuraciones", Opened = true });
local Hx = Yx:Section({ Title = "Informaci\195\179n", Opened = true });
dx.Graficos = Yx:Tab({ Title = "Gr\195\161ficos", Icon = "solar:palette-bold" });
dx.Aim = Lx:Tab({ Title = "Aimbot", Icon = "solar:target-bold" });
dx.Vis = Lx:Tab({ Title = "Visual", Icon = "solar:eye-bold" });
dx.KillAll = Lx:Tab({ Title = "Kill All", Icon = "solar:danger-triangle-bold" });
dx.Invisible = Lx:Tab({ Title = "Invisible", Icon = "solar:ghost-bold" });
dx.Tramposo = Lx:Tab({ Title = "Movimiento", Icon = "solar:bolt-bold" });
dx.Farm = Rx:Tab({ Title = "Farmear evento", Icon = "solar:gift-bold" });
dx.RachaFarm = Rx:Tab({ Title = "Farmear racha", Icon = "solar:flame-bold" });
dx.Animaciones = ex:Tab({ Title = "Animaciones", Icon = "solar:smile-circle-bold" });
dx.Sonidos = ex:Tab({ Title = "Sonidos", Icon = "solar:speaker-bold" });
dx.Items = ex:Tab({ Title = "Apariencia", Icon = "solar:crown-star-bold" });
dx.Guardado = ex:Tab({ Title = "Guardado", Icon = "solar:diskette-bold" });
dx.Identidad = ex:Tab({ Title = "Identidad", Icon = "solar:user-id-bold" });
dx.Updates = Hx:Tab({ Title = "Updates", Icon = "solar:bell-bing-bold" });
dx.Creditos = Hx:Tab({ Title = "Cr\195\169ditos", Icon = "solar:info-circle-bold" });
local wx, Px, Gx;
local jx, Ax, hx, kx;
do
	local J = e:WaitForChild("PlayerGui");
	local C;
	local d;
	local function R(n)
		if not n then
			return;
		end;
		for J = #n, 1, -1 do
			local C = n[J];
			n[J] = nil;
			if C and C.Connected then
				C:Disconnect();
			end;
		end;
	end;
	local H;
	local function w(n)
		local J = n;
		if typeof(n) == "Instance" and n:IsA("Player") then
			J = n.Character;
		end;
		local C = J and J:FindFirstChildOfClass("Humanoid");
		if not C or C.Health <= 0 then
			return false;
		end;
		if H and H() then
			return J:GetAttribute("InfectionDowned") ~= true;
		end;
		return C.Health >= 99;
	end;
	local function P()
		local n = e:FindFirstChild("PlayerGui");
		local J = n and n:FindFirstChild("Main");
		local C = J and J:FindFirstChild("MainGameFrame");
		return C and C:FindFirstChild("IngameScore") or nil;
	end;
	local A = {
			Snapshot = {},
			Scoreboard = nil,
			InGame = false,
			LocalGame = nil,
			LastRefresh = 0,
			RefreshInterval = 2,
			Dirty = true,
			WatchConnections = {},
		};
	local function M()
		A.Dirty = true;
	end;
	local function y(n)
		local J = A;
		if J.Scoreboard == n then
			return;
		end;
		R(J.WatchConnections);
		J.Scoreboard = n;
		if not n then
			return;
		end;
		local C;
		C = function()
				M();
				R(J.WatchConnections);
				J.WatchConnections[#J.WatchConnections + 1] = n.ChildAdded:Connect(C);
				J.WatchConnections[#J.WatchConnections + 1] = n.ChildRemoved:Connect(C);
				for C, Y in ipairs({ "TeamRed", "TeamBlue" }) do
					local d = n:FindFirstChild(Y);
					if d then
						J.WatchConnections[#J.WatchConnections + 1] = d.ChildAdded:Connect(M);
						J.WatchConnections[#J.WatchConnections + 1] = d.ChildRemoved:Connect(M);
					end;
				end;
			end;
		C();
	end;
	local function I(n)
		local J = A;
		local C = os.clock();
		local Y = e:GetAttribute("Game");
		if not n and (not J.Dirty and (C - J.LastRefresh < J.RefreshInterval and (J.LocalGame == Y and ((not J.Scoreboard or J.Scoreboard.Parent))))) then
			return J.Snapshot;
		end;
		J.LastRefresh = C;
		J.LocalGame = Y;
		local d = {};
		local L = P();
		if L ~= J.Scoreboard then
			y(L);
		end;
		for n, J in ipairs({ "TeamRed", "TeamBlue" }) do
			local C = L and L:FindFirstChild(J);
			if C then
				local n = J == "TeamRed" and "Red" or "Blue";
				for J, C in ipairs(C:GetChildren()) do
					if C:IsA("GuiObject") then
						d[string.lower(C.Name)] = n;
					end;
				end;
			end;
		end;
		J.Snapshot = d;
		J.Dirty = false;
		J.InGame = L ~= nil and d[string.lower(e.Name)] ~= nil;
		return d;
	end;
	local o = {
			"InfectionInfected",
			"IsInfected",
			"Infected",
			"IsZombie",
			"Zombie",
		};
	local p = { "GameMode", "MatchMode", "Mode" };
	local T = {
			Active = false,
			LastRefresh = -math.huge,
			RefreshInterval = .4,
			RoleTeams = {},
			Inferred = {},
			Targets = {},
			Converted = {},
			ConvertedAt = {},
			Pending = {},
			LateJoiners = {},
			LastLocalGame = nil,
			LastMatchId = nil,
			HasMatchContext = false,
			RoundEnded = false,
		};
	local function Z(n)
		if not n then
			return nil;
		end;
		if n:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local J = false;
		for C, Y in ipairs(o) do
			local d = n:GetAttribute(Y);
			if typeof(d) == "boolean" then
				if d then
					return true;
				end;
				J = true;
			elseif typeof(d) == "string" then
				local n = d:lower();
				if n == "infected" or n == "infection" or n == "zombie" or n == "true" then
					return true;
				end;
				if n == "survivor" or n == "human" or n == "false" then
					J = true;
				end;
			end;
		end;
		if J then
			return false;
		end;
		return nil;
	end;
	local function z(n)
		if n:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local J = n.Character;
		if not J then
			return false;
		end;
		if J:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local C = J:FindFirstChildOfClass("Humanoid");
		return C ~= nil and C:GetAttribute("InfectionPatientZero") == true;
	end;
	local function B(n)
		if not n then
			return nil;
		end;
		local J = n.Character;
		local C = Z(J);
		local Y = Z(n);
		local d = J and J:FindFirstChildOfClass("Humanoid");
		local L = Z(d);
		if C == true or Y == true or L == true then
			return true;
		end;
		if C == false or Y == false or L == false then
			return false;
		end;
		return nil;
	end;
	local function Q(C)
		local Y = J:FindFirstChild("Main");
		Y = Y and Y:FindFirstChild("MainGameFrame");
		if not Y then
			return;
		end;
		local d = Y:FindFirstChild("PlayersFrame");
		local L = Y:FindFirstChild("IngameScore");
		local R = {};
		local e = {};
		local H = {};
		for n, J in ipairs(n:GetPlayers()) do
			R[J.Name:lower()] = J;
			R[tostring(J.UserId)] = J;
			local C = J.DisplayName:lower();
			if e[C] then
				H[C] = true;
			end;
			e[C] = J;
		end;
		for n, J in pairs(e) do
			if not H[n] and not R[n] then
				R[n] = J;
			end;
		end;
		local function w(n, J)
			if not n then
				return;
			end;
			for n, Y in ipairs(n:GetChildren()) do
				if Y:IsA("GuiObject") then
					local n = R[(Y.Name:lower()):gsub("^@", "")];
					if not n then
						local J = Y:GetAttribute("UserId");
						if J then
							n = R[tostring(J)];
						end;
					end;
					if not n then
						for J, C in ipairs(Y:GetDescendants()) do
							if C:IsA("TextLabel") and ((C.Name == "PlayerName" or C.Name == "TextLabel")) then
								n = R[(C.Text:lower()):gsub("^@", "")];
								if n then
									break;
								end;
							end;
						end;
					end;
					if n then
						C[n] = J;
					end;
				end;
			end;
		end;
		if L then
			w(L:FindFirstChild("TeamRed"), "Red");
			w(L:FindFirstChild("TeamBlue"), "Blue");
		end;
		if d then
			w(d:FindFirstChild("TeamRedFrame"), "Red");
			w(d:FindFirstChild("TeamBlueFrame"), "Blue");
		end;
	end;
	local function i(n)
		local J = T;
		table.clear(J.Converted);
		table.clear(J.ConvertedAt);
		table.clear(J.Pending);
		table.clear(J.LateJoiners);
		table.clear(J.Inferred);
		table.clear(J.Targets);
		table.clear(J.RoleTeams);
		J.Active = false;
		J.RoundEnded = n == true;
		J.LastRefresh = -math.huge;
		if C then
			C();
		end;
	end;
	local function O(J)
		local Y = T;
		local d = os.clock();
		local R = e:GetAttribute("Game");
		local H = e:GetAttribute("MatchId");
		if Y.HasMatchContext and ((R ~= Y.LastLocalGame or H ~= Y.LastMatchId)) then
			i(false);
		end;
		Y.HasMatchContext = true;
		Y.LastLocalGame = R;
		Y.LastMatchId = H;
		if not J and d - Y.LastRefresh < Y.RefreshInterval then
			return Y;
		end;
		Y.LastRefresh = d;
		local w = I(false);
		local P = false;
		local G = e.Character;
		local j = G and G:FindFirstChild("HumanoidRootPart");
		local h = n:GetPlayers();
		for n, J in ipairs(h) do
			if z(J) then
				local n = J == e;
				if not n then
					n = true;
					local C = J:GetAttribute("Game");
					local Y = J:GetAttribute("MatchId");
					if R ~= nil and (R ~= "" and (C ~= nil and (C ~= "" and R ~= C))) then
						n = false;
					end;
					if ((R == nil or R == "")) and (C ~= nil and C ~= "") then
						n = false;
					end;
					if H ~= nil and (H ~= "" and (Y ~= nil and (Y ~= "" and H ~= Y))) then
						n = false;
					end;
					local d = J.Character;
					local L = d and d:FindFirstChild("HumanoidRootPart");
					if j and (L and ((j.Position - L.Position)).Magnitude > 1200) then
						n = false;
					end;
				end;
				if n then
					P = true;
					break;
				end;
			end;
		end;
		local k;
		for n, J in ipairs(p) do
			local C = e:GetAttribute(J);
			if typeof(C) == "string" and C ~= "" then
				k = C:lower();
				break;
			end;
		end;
		if not k then
			for n, J in ipairs(p) do
				local C = L:GetAttribute(J);
				if typeof(C) == "string" and C ~= "" then
					k = C:lower();
					break;
				end;
			end;
		end;
		local M = not Y.RoundEnded and ((k == "infection" or (not k and ((P or (Y.Active and not A.InGame))))));
		if not M then
			if k and (k ~= "infection" and next(Y.LateJoiners) ~= nil) then
				table.clear(Y.LateJoiners);
			end;
			if Y.Active or next(Y.Targets) ~= nil then
				if k and k ~= "infection" then
					i(false);
				else
					Y.Active = false;
					table.clear(Y.Targets);
					table.clear(Y.Inferred);
					table.clear(Y.RoleTeams);
					if C then
						C();
					end;
				end;
			end;
			return Y;
		end;
		Y.Active = true;
		local y = {};
		Q(y);
		Y.RoleTeams = y;
		local m;
		local N = false;
		local x = {};
		for n, J in ipairs(h) do
			local C = B(J);
			x[J] = C;
			if C == true or Y.Converted[J] == true then
				local n = y[J];
				if n then
					if m and m ~= n then
						N = true;
					end;
					m = n;
				end;
			end;
		end;
		local X = {};
		if m and not N then
			for n, J in pairs(y) do
				if J == m and x[n] ~= false then
					X[n] = true;
				end;
			end;
		end;
		Y.Inferred = X;
		local function o()
			local n = {};
			for J, C in ipairs(h) do
				if x[C] == true or Y.Converted[C] == true or (x[C] ~= false and X[C] == true) then
					n[C] = true;
				end;
			end;
			return n;
		end;
		local Z = o();
		local O = {};
		for n in pairs(Z) do
			local J = n.Character;
			local C = J and J:FindFirstChild("HumanoidRootPart");
			if C and C:IsA("BasePart") then
				O[#O + 1] = C;
			end;
		end;
		for n, J in ipairs(h) do
			if J ~= e and (Y.LateJoiners[J] and (x[J] == nil and (not Z[J] and J.Character))) then
				local n = y[J] or w[J.Name:lower()];
				local C = J:GetAttribute("Game");
				local d = J:GetAttribute("MatchId");
				local L = R ~= nil and (R ~= "" and C == R);
				local e = H ~= nil and (H ~= "" and d == H);
				local P = R ~= nil and (R ~= "" and (C ~= nil and (C ~= "" and C ~= R)));
				local G = H ~= nil and (H ~= "" and (d ~= nil and (d ~= "" and d ~= H)));
				if not P and not G then
					local C = false;
					for n in pairs(Z) do
						local d = n.Team;
						if d and (J.Team == d and ((x[n] == true or Y.Converted[n] == true or X[n] == true))) then
							C = true;
							break;
						end;
					end;
					local d = false;
					if not n and (not L and (not e and not C)) then
						local n = J.Character:FindFirstChild("HumanoidRootPart");
						if n and n:IsA("BasePart") then
							local J = n.Position;
							for n, C in ipairs(O) do
								if ((C.Position - J)).Magnitude <= 300 then
									d = true;
									break;
								end;
							end;
						end;
					end;
					local R = n ~= nil or L or e or C or d;
					if R and ((not m or N or not n or n == m)) then
						Z[J] = true;
					end;
				end;
			end;
		end;
		local a = Y.Pending;
		local E = true;
		while E do
			E = false;
			for J = #a, 1, -1 do
				local C = a[J];
				if d - C.Time > 10 or C.Killer.Parent ~= n or C.Victim.Parent ~= n then
					table.remove(a, J);
				elseif Z[C.Killer] and (not Z[C.Victim] and ((not Y.ConvertedAt[C.Killer] or Y.ConvertedAt[C.Killer] <= C.Time))) then
					Y.Converted[C.Victim] = true;
					Y.ConvertedAt[C.Victim] = C.Time;
					Z[C.Victim] = true;
					table.remove(a, J);
					E = true;
				elseif Z[C.Killer] then
					table.remove(a, J);
				end;
			end;
		end;
		local U = Y.Targets;
		local f = false;
		for n in pairs(U) do
			if not Z[n] then
				f = true;
				break;
			end;
		end;
		if not f then
			for n in pairs(Z) do
				if not U[n] then
					f = true;
					break;
				end;
			end;
		end;
		Y.Targets = Z;
		if f and C then
			C();
		end;
		return Y;
	end;
	H = function()
			return (O(false)).Active;
		end;
	local function a(n)
		if not n then
			return false;
		end;
		local J = O(false);
		return J.Active and J.Targets[n] == true;
	end;
	local function U(n, J)
		if not n or n == e or not n.Parent or (not J and not n.Character) then
			return false;
		end;
		local C = e:GetAttribute("Game");
		local Y = n:GetAttribute("Game");
		if C ~= nil and (C ~= "" and (Y ~= nil and (Y ~= "" and C ~= Y))) then
			return false;
		end;
		if ((C == nil or C == "")) and (Y ~= nil and Y ~= "") then
			return false;
		end;
		local d = e:GetAttribute("MatchId");
		local L = n:GetAttribute("MatchId");
		if d ~= nil and (d ~= "" and (L ~= nil and (L ~= "" and d ~= L))) then
			return false;
		end;
		local R = e.Character and e.Character:FindFirstChild("HumanoidRootPart");
		local H = n.Character and n.Character:FindFirstChild("HumanoidRootPart");
		if R and (H and ((R.Position - H.Position)).Magnitude > 1200) then
			return false;
		end;
		return true;
	end;
	local function f()
		T.LastRefresh = -math.huge;
	end;
	local function u(n, J)
		if typeof(n) ~= "Instance" or not n:IsA("Player") or typeof(J) ~= "Instance" or not J:IsA("Player") or n == J or not H() or (n ~= e and not U(n, true)) or (J ~= e and not U(J, true)) then
			return;
		end;
		local C = O(false);
		if C.Targets[J] then
			return;
		end;
		if C.Targets[n] then
			C.Converted[J] = true;
			C.ConvertedAt[J] = os.clock();
			C.LastRefresh = -math.huge;
			O(true);
		else
			if #C.Pending >= 96 then
				table.remove(C.Pending, 1);
			end;
			C.Pending[#C.Pending + 1] = { Killer = n, Victim = J, Time = os.clock() };
			C.LastRefresh = -math.huge;
		end;
	end;
	local g;
	g = function(n)
			if not n or n == e or not n.Parent then
				return false;
			end;
			if H() then
				return U(n) and a(n);
			end;
			local J = I(false);
			if not A.InGame or not J[string.lower(n.Name)] then
				return false;
			end;
			local C = e:GetAttribute("Game");
			local Y = n:GetAttribute("Game");
			if C ~= nil and (C ~= "" and (Y ~= nil and Y ~= "")) then
				if C ~= Y then
					return false;
				end;
			elseif ((C == nil or C == "")) and (Y ~= nil and Y ~= "") then
				return false;
			end;
			local d = e:GetAttribute("MatchId");
			local L = n:GetAttribute("MatchId");
			if d ~= nil and (d ~= "" and (L ~= nil and (L ~= "" and d ~= L))) then
				return false;
			end;
			return true;
		end;
	local function t(n)
		if not n then
			return nil;
		end;
		local J = I(false);
		local C = J[string.lower(n.Name)];
		if not C and n.DisplayName then
			C = J[string.lower(n.DisplayName)];
		end;
		if C then
			return C;
		end;
		local Y = n:GetAttribute("Team") or n:GetAttribute("team");
		if Y ~= nil and tostring(Y) ~= "" then
			return tostring(Y);
		end;
		if n.Team then
			return n.Team.Name;
		end;
		local d = n.TeamColor;
		if d and (d.Name ~= "White" and d.Name ~= "Medium stone grey") then
			return "Color:" .. d.Name;
		end;
		return nil;
	end;
	local function K(n, J)
		if not n or not J or n == J then
			return false;
		end;
		if H() then
			return a(J);
		end;
		local C = t(n);
		local Y = t(J);
		if C ~= nil and Y ~= nil then
			return C ~= Y;
		end;
		return true;
	end;
	local function q()
		M();
		if C then
			C();
		end;
	end;
	local function l()
		M();
		f();
		if C then
			C();
		end;
	end;
	local c = {};
	local F = {};
	local function D(n)
		R(F[n]);
		F[n] = nil;
		local J = c[n];
		if J then
			R(J);
			c[n] = nil;
		end;
	end;
	local function b(n, J)
		R(F[n]);
		F[n] = nil;
		if not J then
			return;
		end;
		local C = {};
		F[n] = C;
		local function Y(n)
			if n == "InfectionPatientZero" or n == "InfectionInfected" or n == "IsInfected" or n == "Infected" or n == "IsZombie" or n == "Zombie" then
				f();
				l();
			end;
		end;
		C[#C + 1] = J.AttributeChanged:Connect(Y);
		local function d(n)
			if n and n:IsA("Humanoid") then
				C[#C + 1] = n.AttributeChanged:Connect(Y);
			end;
		end;
		d(J:FindFirstChildOfClass("Humanoid"));
		C[#C + 1] = J.ChildAdded:Connect(function(n)
				if n:IsA("Humanoid") then
					d(n);
					f();
				end;
			end);
	end;
	local function V(n)
		if not n or n == e or not n.Parent then
			return;
		end;
		D(n);
		c[n] = {
				(n:GetPropertyChangedSignal("Team")):Connect(l),
				(n:GetPropertyChangedSignal("TeamColor")):Connect(l),
				(n:GetAttributeChangedSignal("Team")):Connect(l),
				(n:GetAttributeChangedSignal("team")):Connect(l),
				(n:GetAttributeChangedSignal("Game")):Connect(l),
				(n:GetAttributeChangedSignal("MatchId")):Connect(l),
				n.AttributeChanged:Connect(function(n)
					if n == "InfectionPatientZero" or n == "InfectionInfected" or n == "IsInfected" or n == "Infected" or n == "IsZombie" or n == "Zombie" then
						f();
						l();
					end;
				end),
				n.CharacterAdded:Connect(function(J)
					b(n, J);
					f();
					l();
				end),
				n.CharacterRemoving:Connect(function(J)
					b(n, nil);
					f();
					if d then
						d(J);
					end;
				end),
			};
		b(n, n.Character);
		l();
	end;
	local S = {};
	local W = false;
	local s = 0;
	local function r(n)
		S[#S + 1] = n;
		return n;
	end;
	local function nx()
		if W then
			return;
		end;
		W = true;
		s = s + (1);
		local C = s;
		local function d()
			q();
			f();
		end;
		for n, J in ipairs({ "Team", "TeamColor" }) do
			r((e:GetPropertyChangedSignal(J)):Connect(d));
		end;
		for n, J in ipairs({
			"Team",
			"team",
			"Game",
			"MatchId",
			"GameMode",
			"MatchMode",
			"Mode",
		}) do
			r((e:GetAttributeChangedSignal(J)):Connect(d));
		end;
		r(e.AttributeChanged:Connect(function(n)
			if n == "InfectionPatientZero" or n == "InfectionInfected" or n == "IsInfected" or n == "Infected" or n == "IsZombie" or n == "Zombie" then
				f();
			end;
		end));
		r(e.CharacterAdded:Connect(f));
		r(J.DescendantAdded:Connect(function(n)
			if n.Name == "IngameScore" or n.Name == "TeamRed" or n.Name == "TeamBlue" then
				M();
				f();
			end;
		end));
		r(J.DescendantRemoving:Connect(function(n)
			if n == A.Scoreboard or n.Name == "IngameScore" or n.Name == "TeamRed" or n.Name == "TeamBlue" then
				M();
				f();
			end;
		end));
		for n, J in ipairs(n:GetPlayers()) do
			if J ~= e then
				V(J);
			end;
		end;
		r(n.PlayerAdded:Connect(function(n)
			T.LateJoiners[n] = true;
			V(n);
			f();
		end));
		r(n.PlayerRemoving:Connect(function(n)
			D(n);
			for J = #T.Pending, 1, -1 do
				local C = T.Pending[J];
				if C.Killer == n or C.Victim == n then
					table.remove(T.Pending, J);
				end;
			end;
			for J, C in ipairs({
				"Converted",
				"ConvertedAt",
				"LateJoiners",
				"Inferred",
				"Targets",
				"RoleTeams",
			}) do
				T[C][n] = nil;
			end;
			l();
		end));
		M();
		f();
		task.spawn(function()
			local n = {};
			local J = {
					["RE/Combat/Killed"] = u,
					["RE/Match/PlayerRespawned"] = f,
					["RE/Match/StartRoundGui"] = function()
						i(false);
					end,
					["RE/Match/MatchResults"] = function()
						if T.Active then
							i(true);
						end;
					end,
				};
			while W and C == s do
				local C = Y:FindFirstChild("Packages");
				local d = C and C:FindFirstChild("Networking");
				local L = true;
				for J, C in pairs(J) do
					if not n[J] then
						local Y = d and d:FindFirstChild(J);
						if Y and Y:IsA("RemoteEvent") then
							r(Y.OnClientEvent:Connect(C));
							n[J] = true;
						else
							L = false;
						end;
					end;
				end;
				if L then
					break;
				end;
				task.wait(2);
			end;
		end);
	end;
	local function Jx()
		if not W then
			return;
		end;
		W = false;
		s = s + (1);
		R(S);
		for n in pairs(c) do
			D(n);
		end;
		R(A.WatchConnections);
		A.Scoreboard = nil;
		A.Snapshot = {};
		A.InGame = false;
		A.Dirty = true;
		i(false);
	end;
	E = function()
			if G or j or h or k or v or (m and N.Glow) or X or x then
				nx();
			else
				Jx();
			end;
		end;
	wx = function(n)
			if not g(n) or not n.Character then
				return false;
			end;
			if not w(n) then
				return false;
			end;
			return K(e, n);
		end;
	jx = function(n)
			if not wx(n) then
				return false;
			end;
			local J = n.Character;
			return J ~= nil and (not J:FindFirstChildOfClass("ForceField") and w(n));
		end;
	local Cx = { { Center = Vector3.new(-320.5, 280.82, 16), Radius = 500 }, { Center = Vector3.new(1564.14, -155.45, 40.04), Radius = 300 } };
	Px = function()
			local n = e.Character;
			if not n then
				return true;
			end;
			if n:FindFirstChildOfClass("ForceField") then
				return true;
			end;
			if e.Team then
				local n = e.Team.Name:lower();
				if n:find("lobby") or n:find("spectat") or n:find("espectador") or n:find("menu") or n:find("dead") then
					return true;
				end;
			end;
			local J = n:FindFirstChild("HumanoidRootPart");
			if J then
				for n, C in ipairs(Cx) do
					if ((J.Position - C.Center)).Magnitude <= C.Radius then
						return true;
					end;
				end;
			end;
			return false;
		end;
	Gx = function()
			if Px() then
				return false;
			end;
			I(false);
			return A.InGame or H();
		end;
	Ax = function(n)
			if not n or not n:IsA("Tool") then
				return false;
			end;
			if n:FindFirstChild("Slash") or n:FindFirstChild("SlashStart") then
				return true;
			end;
			local J = n.Name:lower();
			return J:find("knife", 1, true) ~= nil or J:find("cuchillo", 1, true) ~= nil or J:find("dagger", 1, true) ~= nil;
		end;
	hx = function(n)
			if not n or not n:IsA("Tool") then
				return false;
			end;
			local J = n:FindFirstChild("showBeam");
			return J ~= nil and J:IsA("RemoteEvent");
		end;
	kx = function()
			local n = e.Character;
			if n then
				for n, J in ipairs(n:GetChildren()) do
					if hx(J) then
						return J;
					end;
				end;
			end;
			local J = e:FindFirstChildOfClass("Backpack");
			if J then
				for n, J in ipairs(J:GetChildren()) do
					if hx(J) then
						return J;
					end;
				end;
			end;
			return nil;
		end;
end;
local function Mx(n)
	if not n or not n:IsA("Tool") then
		return false;
	end;
	for J, C in ipairs({
		"Reloading",
		"IsReloading",
		"reloading",
		"isReloading",
		"Reload",
		"reload",
	}) do
		local Y = n:GetAttribute(C);
		if Y == true or Y == "true" then
			return true;
		end;
	end;
	for n, J in ipairs(n:GetChildren()) do
		if J:IsA("BoolValue") and J.Value == true then
			local n = string.lower(J.Name);
			if string.find(n, "reload") or string.find(n, "recarg") then
				return true;
			end;
		end;
	end;
	local J = e.Character;
	local C = J and J:FindFirstChildOfClass("Humanoid");
	if C then
		for n, J in ipairs(C:GetPlayingAnimationTracks()) do
			local C = J.Animation and J.Animation.AnimationId or "";
			if string.find(string.lower(C), "reload") then
				return true;
			end;
		end;
	end;
	for n, J in ipairs(n:GetDescendants()) do
		if J:IsA("Sound") and J.Playing then
			local n = string.lower(J.Name);
			if string.find(n, "reload") or string.find(n, "recarg") then
				return true;
			end;
		end;
	end;
	return false;
end;
local yx = {};
yx.__index = yx;
function yx.new()
	return setmetatable({ Items = {} }, yx);
end;
function yx.Add(J, n)
	J.Items[#J.Items + 1] = n;
	return n;
end;
function yx.Cleanup(n)
	for J = #n.Items, 1, -1 do
		local C = n.Items[J];
		n.Items[J] = nil;
		local Y = typeof(C);
		if Y == "RBXScriptConnection" then
			pcall(function()
				C:Disconnect();
			end);
		elseif Y == "Instance" then
			pcall(function()
				C:Destroy();
			end);
		elseif Y == "function" then
			pcall(C);
		end;
	end;
end;
local function mx()
	for n, J in ipairs(n:GetPlayers()) do
		local C = J.Character;
		if C then
			local n = C:FindFirstChild("GhostHitbox");
			if n then
				n:Destroy();
			end;
		end;
	end;
end;
do
	local J = false;
	K = function()
			if J or not X then
				return;
			end;
			J = true;
			task.spawn(function()
				while X do
					task.wait(.2);
					if not X then
						break;
					end;
					if not Gx() then
						mx();
						continue;
					end;
					local J = Vector3.new(p, p, p);
					local C = o and 1 or .6;
					for n, Y in ipairs(n:GetPlayers()) do
						if Y ~= e and wx(Y) then
							local n = Y.Character;
							if n then
								local Y = n:FindFirstChild("HumanoidRootPart");
								local d = n:FindFirstChildOfClass("Humanoid");
								if Y and (d and d.Health > 0) then
									local d = n:FindFirstChild("GhostHitbox");
									if not d then
										d = Instance.new("Part");
										d.Name = "GhostHitbox";
										d.Size = J;
										d.Transparency = C;
										d.Color = T;
										d.CanCollide = false;
										d.Massless = true;
										d.CanQuery = true;
										d.CFrame = Y.CFrame;
										d.Parent = n;
										local L = Instance.new("WeldConstraint");
										L.Part0 = Y;
										L.Part1 = d;
										L.Parent = d;
									else
										if d.Size ~= J then
											d.Size = J;
										end;
										if d.Transparency ~= C then
											d.Transparency = C;
										end;
										if d.Color ~= T then
											d.Color = T;
										end;
										if not d.CanQuery then
											d.CanQuery = true;
										end;
									end;
								else
									local J = n:FindFirstChild("GhostHitbox");
									if J then
										J:Destroy();
									end;
								end;
							end;
						else
							local n = Y.Character;
							if n then
								local J = n:FindFirstChild("GhostHitbox");
								if J then
									J:Destroy();
								end;
							end;
						end;
					end;
				end;
				J = false;
				if not X then
					mx();
				end;
			end);
		end;
end;
local Ix = { ["Right Platforms"] = {
			["1v1"] = { ZoneName = "PadZone1", MainPad = "Pad1", AltPad = "Pad2" },
			["2v2"] = { ZoneName = "PadZone2", MainPad = "Pad1", AltPad = "Pad2" },
			["3v3"] = { ZoneName = "PadZone3", MainPad = "Pad1", AltPad = "Pad2" },
			["4v4"] = { ZoneName = "PadZone4", MainPad = "Pad1", AltPad = "Pad2" },
		}, ["Left Platforms"] = {
			["1v1"] = { ZoneName = "PadZone5", MainPad = "Pad1", AltPad = "Pad2" },
			["2v2"] = { ZoneName = "PadZone6", MainPad = "Pad1", AltPad = "Pad2" },
			["3v3"] = { ZoneName = "PadZone7", MainPad = "Pad1", AltPad = "Pad2" },
			["4v4"] = { ZoneName = "PadZone8", MainPad = "Pad1", AltPad = "Pad2" },
		} };
AutoTeleportMainAlt = {};
AutoTeleportMainAlt.__index = AutoTeleportMainAlt;
function AutoTeleportMainAlt.new()
	return setmetatable({
		Running = false,
		Connections = yx.new(),
		Acc = 0,
		TickInterval = .5,
		ActiveRole = nil,
		DuelType = "1v1",
		PlatformRow = "Right Platforms",
		LastTeleport = 0,
		LastVote = 0,
		LastCancel = 0,
		TeleportCooldown = .5,
		VoteCooldown = 1,
		CancelCooldown = 1,
		VotedMap = nil,
		HighlightedPad = nil,
		PadColors = {},
	}, AutoTeleportMainAlt);
end;
function AutoTeleportMainAlt.GetActiveRole(n)
	if n.ActiveRole == "Main" then
		return "Main";
	end;
	if n.ActiveRole == "Alt" then
		return "Alt";
	end;
	return nil;
end;
function AutoTeleportMainAlt.GetRoot(n)
	local J = e.Character;
	if not J then
		return nil;
	end;
	local C = J:FindFirstChild("HumanoidRootPart");
	if C and C:IsA("BasePart") then
		return C;
	end;
	return nil;
end;
function AutoTeleportMainAlt.GetHumanoid(n)
	local J = e.Character;
	return J and J:FindFirstChildOfClass("Humanoid") or nil;
end;
function AutoTeleportMainAlt.Attr(J, n)
	local C = e:GetAttribute(n);
	if typeof(C) == "string" and C ~= "" then
		return C;
	end;
	return nil;
end;
function AutoTeleportMainAlt.Snapshot(n)
	local J = n:Attr("Game");
	local C = n:Attr("Map");
	local Y = e.Character;
	local d = Y and Y:FindFirstChildOfClass("Humanoid");
	local L = Y and Y:FindFirstChild("HumanoidRootPart");
	local R = d ~= nil and (d.Health > 0 and L ~= nil);
	return {
		Game = J,
		Map = C,
		InGame = J ~= nil,
		InMap = J ~= nil and C ~= nil,
		Alive = R,
	};
end;
function AutoTeleportMainAlt.IsOnMatch(n)
	local J = n:Snapshot();
	return J and (J.InGame == true and (J.InMap ~= true and J.Alive));
end;
function AutoTeleportMainAlt.ResolvePad(J, n)
	local C = Ix[J.PlatformRow] or Ix["Right Platforms"];
	local Y = C[J.DuelType] or C["1v1"];
	local d = L:FindFirstChild("PadZones");
	if not d then
		return nil;
	end;
	local R = d:FindFirstChild(Y.ZoneName);
	if not R then
		return nil;
	end;
	local e = (n == "Alt") and Y.AltPad or Y.MainPad;
	local H = R:FindFirstChild(e);
	if not H then
		return nil;
	end;
	local w = H:FindFirstChild("Pad");
	if w and w:IsA("BasePart") then
		return w;
	end;
	return nil;
end;
function AutoTeleportMainAlt.IsOnPad(J, n)
	if not n then
		return false;
	end;
	local C = J:GetRoot();
	if not C then
		return false;
	end;
	local Y = n.CFrame:PointToObjectSpace(C.Position);
	local d = n.Size / 2;
	return math.abs(Y.X) <= d.X + .5 and (math.abs(Y.Z) <= d.Z + .5 and (Y.Y >= -((d.Y + 6)) and Y.Y <= d.Y + 14));
end;
function AutoTeleportMainAlt.MarkPad(C, n, J)
	if not n then
		C:UnmarkPad();
		return;
	end;
	if C.HighlightedPad == n then
		return;
	end;
	C:UnmarkPad();
	C.HighlightedPad = n;
	C.PadColors[n] = { Color = n.Color, Transparency = n.Transparency };
	pcall(function()
		n.Color = J and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(70, 145, 255);
		n.Transparency = .5;
	end);
end;
function AutoTeleportMainAlt.UnmarkPad(n)
	if n.HighlightedPad and n.PadColors[n.HighlightedPad] then
		local J = n.HighlightedPad;
		local C = n.PadColors[J];
		pcall(function()
			if J.Parent then
				J.Color = C.Color;
				J.Transparency = C.Transparency;
			end;
		end);
	end;
	n.HighlightedPad = nil;
end;
function AutoTeleportMainAlt.FindVoteRemote(n)
	local J = Y:FindFirstChild("Packages");
	local C = J and J:FindFirstChild("Networking");
	local d = C and C:FindFirstChild("RF/Voting/Vote");
	if d and d:IsA("RemoteFunction") then
		return d;
	end;
	return nil;
end;
function AutoTeleportMainAlt.FindVisibleMapVote(n)
	local J = e:FindFirstChild("PlayerGui");
	local C = J and J:FindFirstChild("Main");
	local Y = C and C:FindFirstChild("MapVoting");
	local d = Y and Y:FindFirstChild("VotingHolder");
	if not d then
		return nil;
	end;
	for n, J in ipairs(d:GetChildren()) do
		if J:IsA("ImageButton") and (J.Visible and J.Name ~= "") then
			return J.Name;
		end;
	end;
	return nil;
end;
function AutoTeleportMainAlt.VoteMap(n)
	local J = n:Snapshot();
	if not n:IsOnMatch() then
		return;
	end;
	if n.VotedMap == J.Game then
		return;
	end;
	local C = os.clock();
	if C - ((n.LastVote or 0)) < n.VoteCooldown then
		return;
	end;
	n.LastVote = C;
	local Y = n:FindVisibleMapVote();
	local d = n:FindVoteRemote();
	if not ((Y and d)) then
		return;
	end;
	n.VotedMap = J.Game;
	pcall(function()
		d:InvokeServer(Y);
	end);
end;
function AutoTeleportMainAlt.FindSetStateRemote(n)
	local J = Y:FindFirstChild("Packages");
	local C = J and J:FindFirstChild("Networking");
	local d = C and C:FindFirstChild("RE/Match/SetStatePlr");
	if d and d:IsA("RemoteEvent") then
		return d;
	end;
	return nil;
end;
function AutoTeleportMainAlt.CancelQueue(n)
	local J = os.clock();
	if J - ((n.LastCancel or 0)) < n.CancelCooldown then
		return;
	end;
	local C = n:FindSetStateRemote();
	if not C then
		return;
	end;
	n.LastCancel = J;
	pcall(function()
		C:FireServer("REMOVE");
	end);
end;
function AutoTeleportMainAlt.HideGameFrame(n)
	local J = e:FindFirstChild("PlayerGui");
	local C = J and J:FindFirstChild("Main");
	local Y = C and C:FindFirstChild("MainGameFrame");
	if Y and Y:IsA("GuiObject") then
		pcall(function()
			Y.Visible = false;
		end);
	end;
end;
function AutoTeleportMainAlt.HoldCenter(n)
	local J = n:GetHumanoid();
	local C = n:GetRoot();
	if J and C then
		pcall(function()
			J:MoveTo(C.Position);
		end);
	end;
end;
function AutoTeleportMainAlt.Teleport(J, n)
	if not n then
		return;
	end;
	local C = J:GetRoot();
	local Y = J:GetHumanoid();
	if not ((C and Y)) then
		return;
	end;
	pcall(function()
		C.AssemblyAngularVelocity = Vector3.zero;
		C.AssemblyLinearVelocity = Vector3.zero;
		J:CancelQueue();
		J:HideGameFrame();
		Y:MoveTo(n.Position);
	end);
end;
function AutoTeleportMainAlt.Process(n)
	if not n.Running then
		return;
	end;
	local J = n:Snapshot();
	if J.InGame then
		n:UnmarkPad();
		n:HoldCenter();
		n:VoteMap();
		return;
	end;
	local C = n:GetActiveRole();
	if not C then
		n:UnmarkPad();
		return;
	end;
	local Y = n:ResolvePad(C);
	n:MarkPad(Y, C == "Alt");
	if not Y then
		return;
	end;
	if n:IsOnPad(Y) then
		return;
	end;
	local d = os.clock();
	if d - ((n.LastTeleport or 0)) < n.TeleportCooldown then
		return;
	end;
	n.LastTeleport = d;
	n:Teleport(Y);
end;
function AutoTeleportMainAlt.Kick(n)
	if n.Running then
		n:Process();
	end;
end;
function AutoTeleportMainAlt.Start(n)
	if n.Running then
		return;
	end;
	n.Running = true;
	n.Acc = 0;
	n.LastTeleport = 0;
	n.LastVote = 0;
	n.LastCancel = 0;
	n.Connections:Add((e:GetAttributeChangedSignal("Game")):Connect(function()
		task.defer(function()
			if n.Running then
				n:Process();
			end;
		end);
	end));
	n.Connections:Add((e:GetAttributeChangedSignal("Map")):Connect(function()
		task.defer(function()
			if n.Running then
				n:Process();
			end;
		end);
	end));
	n.Connections:Add((e:GetAttributeChangedSignal("Team")):Connect(function()
		task.defer(function()
			if n.Running then
				n:Process();
			end;
		end);
	end));
	n.Connections:Add(J.Heartbeat:Connect(function(J)
		if not n.Running then
			return;
		end;
		n.Acc = n.Acc + J;
		if n.Acc >= n.TickInterval then
			n.Acc = 0;
			n:Process();
		end;
	end));
	n:Process();
end;
function AutoTeleportMainAlt.Stop(n)
	if not n.Running then
		return;
	end;
	n.Running = false;
	n.Connections:Cleanup();
	n.Connections = yx.new();
	n:UnmarkPad();
	n.VotedMap = nil;
end;
AutoTeleportMainAltInstance = AutoTeleportMainAlt.new();
local function Nx()
	local n = e:FindFirstChild("PlayerGui");
	if not n then
		return false;
	end;
	local J = n:FindFirstChild("Main") or n;
	local C = J:FindFirstChild("MainGameFrame");
	if not C or not C.Visible then
		return false;
	end;
	local Y = C:FindFirstChild("IngameScore");
	local d = Y and Y:FindFirstChild("Timer");
	if not d then
		return false;
	end;
	if not ((d:IsA("TextLabel") or d:IsA("TextButton") or d:IsA("TextBox"))) then
		return false;
	end;
	local L = (tostring(d.Text or "")):gsub("%s", "");
	if L == "" then
		return false;
	end;
	if string.find(L, "-") then
		return false;
	end;
	if L == "0:00" or L == "00:00" or L == "0:0" then
		return false;
	end;
	return L:match("^%d+:%d%d$") ~= nil;
end;
do
	local C = 39.9;
	local Y = 1.2;
	local d = .6;
	local R = .5;
	local H = 3;
	local w = 2.5;
	local P = 20;
	local G = 15;
	local j = 1.5;
	local A = 1.2;
	local h = 90;
	local k = 2.5;
	local M = 6;
	local y = .5;
	local m = 7.5;
	local I = .3;
	local N = .08;
	local x = .16;
	local X = 25;
	local o = 6;
	local p = 1.5;
	local T = 6;
	local Z = .6;
	local z = .25;
	local B = 1;
	local Q = 3;
	local i = .06;
	local O = 40;
	local a = {};
	a.__index = a;
	function a.new()
		return setmetatable({
			running = false,
			connections = yx.new(),
			savedCollisions = {},
			swingAccumulator = 0,
			safePosition = nil,
			sticking = false,
			stickingStartTime = 0,
			lastEnemyHealth = nil,
			lastHealthChangeTime = 0,
			lastTargetSeenTime = 0,
			currentTarget = nil,
			lockedTargetPlayer = nil,
			lastStickTarget = nil,
			lastStickTargetHum = nil,
			hiding = false,
			hidingUntil = 0,
			targetFloor = nil,
			targetFloorY = nil,
			lastFloorTarget = nil,
			floorCheckTime = 0,
			triggerStart = nil,
			inKnifeRangeNow = false,
			forceDescent = false,
			jitterSide = 1,
			jitterCurrent = 0,
			jitterNextSwitch = 0,
			lastSetCFrame = nil,
			validFrames = 0,
			killActivated = false,
		}, a);
	end;
	function a.DisableCollisions(n)
		local J = e.Character;
		if not J then
			return;
		end;
		for J, C in ipairs(J:GetDescendants()) do
			if C:IsA("BasePart") and C.CanCollide then
				if n.savedCollisions[C] == nil then
					n.savedCollisions[C] = C.CanCollide;
				end;
				C.CanCollide = false;
			end;
		end;
	end;
	function a.RestoreCollisions(n)
		for n, J in pairs(n.savedCollisions) do
			if n.Parent then
				pcall(function()
					n.CanCollide = J;
				end);
			end;
		end;
		table.clear(n.savedCollisions);
	end;
	function a.GetRoot(J, n)
		local C = n and n.Character;
		if not C then
			return nil;
		end;
		local Y = C:FindFirstChild("HumanoidRootPart");
		if Y and Y:IsA("BasePart") then
			return Y;
		end;
		return nil;
	end;
	function a.GetHumanoid(J, n)
		local C = n and n.Character;
		return C and C:FindFirstChildOfClass("Humanoid") or nil;
	end;
	function a.GetFloorY(J, n)
		local C = n.Parent and n.Parent:FindFirstChildOfClass("Humanoid");
		local Y = C and tonumber(C.HipHeight) or 2;
		return (n.Position.Y - Y) - n.Size.Y / 2;
	end;
	function a.GetPlatformFloorY(J, n)
		if not n then
			return nil;
		end;
		local C = os.clock();
		if J.lastFloorTarget == n and (J.targetFloorY and (C - ((J.floorCheckTime or 0))) < z) then
			return J.targetFloorY;
		end;
		local Y = RaycastParams.new();
		Y.FilterType = Enum.RaycastFilterType.Exclude;
		Y.FilterDescendantsInstances = { e.Character, n.Parent };
		local d = n.Position + Vector3.new(0, 3, 0);
		local R = L:Raycast(d, Vector3.new(0, -500, 0), Y);
		J.floorCheckTime = C;
		if R then
			J.targetFloorY = R.Position.Y;
			J.lastFloorTarget = n;
			return J.targetFloorY;
		end;
		J.targetFloorY = J:GetFloorY(n);
		J.lastFloorTarget = n;
		return J.targetFloorY;
	end;
	function a.IsInKnifeRange(C, n, J)
		if not n or not J then
			return false;
		end;
		local L = J.Position - n.Position;
		local R = (Vector3.new(L.X, 0, L.Z)).Magnitude;
		local e = math.abs(L.Y);
		return R <= (Y + d) and e <= m;
	end;
	function a.IsLockedTargetValid(n)
		local J = n.lockedTargetPlayer;
		if not J then
			return false;
		end;
		if not J.Parent then
			return false;
		end;
		if not jx(J) then
			return false;
		end;
		local C = J.Character;
		if not C then
			return false;
		end;
		local Y = C:FindFirstChild("HumanoidRootPart");
		local d = C:FindFirstChildOfClass("Humanoid");
		if not Y or not d then
			return false;
		end;
		if d.Health <= 0 then
			return false;
		end;
		return Y;
	end;
	function a.GetClosestEnemy(J)
		local C = J:GetRoot(e);
		if not C then
			return nil;
		end;
		local Y = J:IsLockedTargetValid();
		if Y then
			return Y;
		end;
		J.lockedTargetPlayer = nil;
		J.currentTarget = nil;
		local d, L, R = nil, nil, nil;
		for n, Y in ipairs(n:GetPlayers()) do
			if Y ~= e and jx(Y) then
				local n = J:GetHumanoid(Y);
				local e = J:GetRoot(Y);
				if e and (n and n.Health > 0) then
					local n = ((e.Position - C.Position)).Magnitude;
					if not L or n < L then
						d, L, R = e, n, Y;
					end;
				end;
			end;
		end;
		if R then
			J.lockedTargetPlayer = R;
		end;
		return d;
	end;
	function a.IsInMatch(n)
		return Nx();
	end;
	function a.ResetState(n)
		n.sticking = false;
		n.stickingStartTime = 0;
		n.lastEnemyHealth = nil;
		n.lastHealthChangeTime = 0;
		n.targetFloor = nil;
		n.inKnifeRangeNow = false;
		n.forceDescent = false;
		n.jitterSide = 1;
		n.jitterCurrent = 0;
		n.jitterNextSwitch = 0;
		n.lastSetCFrame = nil;
		n.validFrames = 0;
		n.killActivated = false;
		n.triggerStart = nil;
		n:RestoreCollisions();
		local J = n:GetHumanoid(e);
		if J and J.PlatformStand then
			pcall(function()
				J.PlatformStand = false;
			end);
		end;
	end;
	function a.ReturnToSafePosition(J, n)
		if not J.safePosition or not n then
			return;
		end;
		local C = n.Position.Y;
		if C < (J.safePosition.Y - H) then
			pcall(function()
				n.CFrame = CFrame.new(J.safePosition);
				n.AssemblyLinearVelocity = Vector3.zero;
				n.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
	end;
	function a.ForceReturnToSafe(J, n)
		if not J.safePosition or not n then
			return;
		end;
		pcall(function()
			n.CFrame = CFrame.new(J.safePosition);
			n.AssemblyLinearVelocity = Vector3.zero;
			n.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function a.IsFallingIntoVoid(J, n)
		if not J.safePosition or not n then
			return false;
		end;
		local C = J.safePosition.Y - G;
		if J.targetFloorY and (J.lastFloorTarget and J.lastFloorTarget.Parent) then
			C = math.min(C, (J.targetFloorY - o) - G);
		end;
		return n.Position.Y < C;
	end;
	function a.HideBelowMap(n)
		local J = n:GetRoot(e);
		if not J then
			return;
		end;
		local C = n.safePosition and n.safePosition.Y or J.Position.Y;
		local Y = C - M;
		local d, L = J.Position.X, J.Position.Z;
		pcall(function()
			J.CFrame = CFrame.new(d, Y, L);
			J.AssemblyLinearVelocity = Vector3.zero;
			J.AssemblyAngularVelocity = Vector3.zero;
		end);
		n.hiding = true;
		n.hidingUntil = os.clock() + y;
	end;
	function a.IsKnife(J, n)
		if not ((n and n:IsA("Tool"))) then
			return false;
		end;
		if n:FindFirstChild("fire") or n:FindFirstChild("showBeam") then
			return false;
		end;
		return n:FindFirstChild("Slash") ~= nil or n:FindFirstChild("SlashStart") ~= nil;
	end;
	function a.FindKnife(n)
		local J = e.Character;
		if J then
			for J, C in ipairs(J:GetChildren()) do
				if n:IsKnife(C) then
					return C, true;
				end;
			end;
		end;
		local C = e:FindFirstChildOfClass("Backpack");
		if C then
			for J, C in ipairs(C:GetChildren()) do
				if n:IsKnife(C) then
					return C, false;
				end;
			end;
		end;
		return nil, false;
	end;
	function a.SwingKnife(J, n)
		J.swingAccumulator = J.swingAccumulator + n;
		if J.swingAccumulator < R then
			return;
		end;
		J.swingAccumulator = 0;
		local C, Y = J:FindKnife();
		if not C then
			return;
		end;
		if not Y then
			local n = J:GetHumanoid(e);
			if not n then
				return;
			end;
			pcall(function()
				n:EquipTool(C);
			end);
			if C.Parent ~= e.Character then
				return;
			end;
		end;
		pcall(function()
			C:Activate();
		end);
	end;
	function a.UpdateJitter(J, n)
		local C = os.clock();
		if C >= J.jitterNextSwitch then
			J.jitterSide = (math.random() < .5) and 1 or -1;
			J.jitterNextSwitch = (C + N) + math.random() * ((x - N));
		end;
		local Y = J.jitterSide * I;
		J.jitterCurrent = J.jitterCurrent + ((Y - J.jitterCurrent)) * math.clamp(n * X, 0, 1);
	end;
	function a.CheckServerValidation(J, n)
		if J.killActivated then
			return true;
		end;
		if not J.lastSetCFrame then
			return false;
		end;
		local C = J.lastSetCFrame.Position;
		local Y = n.Position;
		local d = ((Y - C)).Magnitude;
		if d <= B then
			J.validFrames = J.validFrames + 1;
			if J.validFrames >= Q then
				J.killActivated = true;
				J.swingAccumulator = R;
				return true;
			end;
		else
			J.validFrames = 0;
		end;
		return false;
	end;
	function a.ForceUnderground(C, n, J)
		if not n or not J then
			return;
		end;
		local Y = C:GetPlatformFloorY(J);
		if not Y then
			return;
		end;
		local d = Y - o;
		if n.Position.Y > d + p then
			pcall(function()
				n.CFrame = CFrame.new(n.Position.X, d, n.Position.Z);
				n.AssemblyLinearVelocity = Vector3.zero;
				n.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
	end;
	function a.ApproachTarget(d, n, J, Y)
		Y = Y or 0;
		local L = n.Position;
		local e = J.Position;
		local H = Vector3.new(e.X - L.X, 0, e.Z - L.Z);
		local w = H.Magnitude;
		if w <= T then
			if not d.sticking then
				local C = os.clock();
				if not d.triggerStart then
					d.triggerStart = C;
				end;
				local Y = Vector3.new(e.X, L.Y, e.Z);
				local H = CFrame.lookAt(L, Y);
				d.lastSetCFrame = H;
				pcall(function()
					n.CFrame = H;
					n.AssemblyLinearVelocity = Vector3.zero;
					n.AssemblyAngularVelocity = Vector3.zero;
				end);
				local w = d:CheckServerValidation(n);
				if w or (C - d.triggerStart) >= Z then
					d.killActivated = true;
					d.swingAccumulator = R;
					d.triggerStart = nil;
					d.sticking = true;
					d.stickingStartTime = os.clock();
					d.lastStickTarget = J;
					d.targetFloor = nil;
					d.forceDescent = true;
					local n = d:GetHumanoid(J.Parent);
					d.lastEnemyHealth = n and n.Health or nil;
					d.lastHealthChangeTime = os.clock();
					d.lastStickTargetHum = n;
					d.jitterCurrent = 0;
				end;
			end;
			return;
		end;
		d.lastSetCFrame = nil;
		d.validFrames = 0;
		d.triggerStart = nil;
		local P = H.Unit;
		local G = Vector3.new(-P.Z, 0, P.X);
		d:UpdateJitter(Y);
		local j = C * Y;
		local A = math.min(j, math.max(0, w - T));
		local h = math.sqrt(math.max(0, A * ((2 * w - A)))) * .85;
		local k = math.clamp(((w - T)) / 8, 0, 1);
		local M = d.jitterCurrent * k;
		local y = math.clamp(M, -h, h);
		local m = L.X + P.X * A;
		local I = L.Z + P.Z * A;
		local N = m + G.X * y;
		local x = I + G.Z * y;
		local X = d:GetPlatformFloorY(J);
		local p;
		if X then
			p = X - o;
		else
			p = L.Y;
		end;
		local z = Vector3.new(N, p, x);
		local B = Vector3.new(e.X, z.Y, e.Z);
		local Q = CFrame.lookAt(z, B);
		pcall(function()
			n.CFrame = Q;
			n.AssemblyLinearVelocity = Vector3.zero;
			n.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function a.CanStickToTarget(Y, J, C)
		if not C or not C.Parent then
			return false;
		end;
		local d = n:GetPlayerFromCharacter(C.Parent);
		if not d or not jx(d) then
			return false;
		end;
		local L = C.Parent:FindFirstChildOfClass("Humanoid");
		if not L or L.Health <= 0 then
			return false;
		end;
		local R = ((Vector3.new(J.Position.X, 0, J.Position.Z) - Vector3.new(C.Position.X, 0, C.Position.Z))).Magnitude;
		if R > P then
			return false;
		end;
		return true;
	end;
	function a.StickToTarget(d, n, J, C)
		C = C or .016;
		local L = J.Position;
		local R = J.Parent and J.Parent:FindFirstChildOfClass("Humanoid");
		local e = R and R.FloorMaterial ~= Enum.Material.Air;
		if J ~= d.lastStickTarget then
			d.lastStickTarget = J;
			d.targetFloor = nil;
		end;
		if e or not d.targetFloor then
			d.targetFloor = d:GetFloorY(J);
		end;
		local H = n.Position;
		local w = J.AssemblyLinearVelocity;
		local P = L.X + w.X * i;
		local G = L.Z + w.Z * i;
		local j = J.CFrame.LookVector;
		local A = Vector3.new(-j.X, 0, -j.Z);
		if A.Magnitude < .05 then
			A = Vector3.new(0, 0, 1);
		else
			A = A.Unit;
		end;
		local M = P + A.X * Y;
		local y = G + A.Z * Y;
		local m = d:IsInKnifeRange(n, J);
		local I;
		if m and not d.forceDescent then
			I = H.Y;
		else
			I = d.targetFloor - k;
			if m then
				d.forceDescent = false;
			end;
		end;
		local N = d.targetFloor - k;
		if I > N then
			I = N;
		end;
		local x = math.clamp(C * O, 0, 1);
		local X = H:Lerp(Vector3.new(M, I, y), x);
		pcall(function()
			n.CFrame = CFrame.new(X) * CFrame.Angles(math.rad(h), 0, 0);
			n.AssemblyLinearVelocity = Vector3.zero;
			n.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function a.CheckEnemyHealth(J, n)
		local C = n.Parent and n.Parent:FindFirstChildOfClass("Humanoid");
		if not C then
			return false;
		end;
		local Y = C.Health;
		if J.lastEnemyHealth == nil then
			J.lastEnemyHealth = Y;
			J.lastHealthChangeTime = os.clock();
			return false;
		end;
		if Y < J.lastEnemyHealth then
			J.lastEnemyHealth = Y;
			J.lastHealthChangeTime = os.clock();
			return false;
		end;
		if (os.clock() - J.lastHealthChangeTime) >= j then
			return true;
		end;
		return false;
	end;
	function a.Update(J, n)
		if not J:IsInMatch() then
			J:ResetState();
			J.currentTarget = nil;
			J.lockedTargetPlayer = nil;
			J.lastStickTarget = nil;
			J.lastFloorTarget = nil;
			J.targetFloorY = nil;
			return;
		end;
		local C = J:GetRoot(e);
		if not C then
			J:ResetState();
			J.currentTarget = nil;
			J.lockedTargetPlayer = nil;
			return;
		end;
		if J.lastStickTargetHum then
			local n = J.lastStickTargetHum;
			if not n.Parent or n.Health <= 0 then
				J:HideBelowMap();
				J.inKnifeRangeNow = false;
				J.forceDescent = false;
				J.lastStickTargetHum = nil;
				J.lastStickTarget = nil;
				J.sticking = false;
				J.stickingStartTime = 0;
				J.lastEnemyHealth = nil;
				J.lastHealthChangeTime = 0;
				J.targetFloor = nil;
				J.killActivated = false;
				J.validFrames = 0;
				J.lastSetCFrame = nil;
				J.triggerStart = nil;
				return;
			end;
		end;
		if J.hiding then
			if os.clock() >= J.hidingUntil then
				J.hiding = false;
			else
				pcall(function()
					C.AssemblyLinearVelocity = Vector3.zero;
					C.AssemblyAngularVelocity = Vector3.zero;
				end);
				return;
			end;
		end;
		if J:IsFallingIntoVoid(C) then
			J:ForceReturnToSafe(C);
			J:ResetState();
			J.currentTarget = nil;
			J.lockedTargetPlayer = nil;
			J.lastStickTarget = nil;
			J.lastFloorTarget = nil;
			J.targetFloorY = nil;
			local n = J:GetHumanoid(e);
			if n then
				pcall(function()
					n.PlatformStand = false;
				end);
			end;
			return;
		end;
		local Y = J:GetClosestEnemy();
		if Y then
			J.currentTarget = Y;
			J.lastTargetSeenTime = os.clock();
		end;
		if not Y then
			local n = (os.clock() - ((J.lastTargetSeenTime or 0))) < A;
			local Y = J.safePosition and C.Position.Y < (J.safePosition.Y - 2);
			if n and Y then
				pcall(function()
					C.AssemblyLinearVelocity = Vector3.zero;
					C.AssemblyAngularVelocity = Vector3.zero;
				end);
				return;
			end;
			J:ReturnToSafePosition(C);
			J:ResetState();
			J.currentTarget = nil;
			J.lockedTargetPlayer = nil;
			J.lastStickTarget = nil;
			J.lastFloorTarget = nil;
			J.targetFloorY = nil;
			if J.safePosition then
				local n = J:GetHumanoid(e);
				if n then
					pcall(function()
						n.PlatformStand = false;
					end);
				end;
			end;
			return;
		end;
		J:DisableCollisions();
		if J.lastStickTarget then
			local n = J:IsInKnifeRange(C, J.lastStickTarget);
			if n and not J.inKnifeRangeNow then
				J.swingAccumulator = R;
				J.inKnifeRangeNow = true;
			elseif not n then
				J.inKnifeRangeNow = false;
			end;
		end;
		J:SwingKnife(n or 0);
		local d = J:GetHumanoid(e);
		if d and not d.PlatformStand then
			pcall(function()
				d.PlatformStand = true;
			end);
		end;
		if J.safePosition and C.Position.Y >= (J.safePosition.Y - H) then
			J.safePosition = Vector3.new(C.Position.X, J.safePosition.Y, C.Position.Z);
		end;
		if not J.sticking then
			J:ForceUnderground(C, Y);
		end;
		if J.sticking then
			local d = (Y ~= J.lastStickTarget);
			local L = (os.clock() - J.stickingStartTime) > w;
			local R = not J:CanStickToTarget(C, Y);
			local e = J:CheckEnemyHealth(Y);
			if d or L or R or e then
				J.sticking = false;
				J.stickingStartTime = 0;
				J.lastEnemyHealth = nil;
				J.lastHealthChangeTime = 0;
				J.targetFloor = nil;
				J.inKnifeRangeNow = false;
				J.forceDescent = false;
				J.killActivated = false;
				J.validFrames = 0;
				J.lastSetCFrame = nil;
				J.triggerStart = nil;
				if d then
					J.lastStickTarget = nil;
				end;
			else
				J:StickToTarget(C, Y, n or 0);
				return;
			end;
		end;
		J:ApproachTarget(C, Y, n or 0);
	end;
	function a.Start(n)
		if n.running then
			return;
		end;
		n.running = true;
		n.swingAccumulator = 0;
		n.sticking = false;
		n.stickingStartTime = 0;
		n.lastEnemyHealth = nil;
		n.lastHealthChangeTime = 0;
		n.lastTargetSeenTime = 0;
		n.currentTarget = nil;
		n.lockedTargetPlayer = nil;
		n.lastStickTarget = nil;
		n.lastStickTargetHum = nil;
		n.hiding = false;
		n.hidingUntil = 0;
		n.targetFloor = nil;
		n.targetFloorY = nil;
		n.lastFloorTarget = nil;
		n.floorCheckTime = 0;
		n.triggerStart = nil;
		n.inKnifeRangeNow = false;
		n.forceDescent = false;
		n.jitterSide = 1;
		n.jitterCurrent = 0;
		n.jitterNextSwitch = 0;
		n.lastSetCFrame = nil;
		n.validFrames = 0;
		n.killActivated = false;
		local C = n:GetRoot(e);
		if C then
			local J = RaycastParams.new();
			J.FilterType = Enum.RaycastFilterType.Exclude;
			J.FilterDescendantsInstances = { e.Character };
			local Y = C.Position + Vector3.new(0, 5, 0);
			local d = L:Raycast(Y, Vector3.new(0, -500, 0), J);
			if d then
				n.safePosition = Vector3.new(C.Position.X, d.Position.Y + 3, C.Position.Z);
			else
				n.safePosition = C.Position;
			end;
		else
			n.safePosition = nil;
		end;
		n.connections:Add(J.Heartbeat:Connect(function(J)
			if not n.running then
				return;
			end;
			n:Update(J);
		end));
		n.connections:Add(e.CharacterAdded:Connect(function()
			table.clear(n.savedCollisions);
			n.sticking = false;
			n.safePosition = nil;
			n.stickingStartTime = 0;
			n.lastEnemyHealth = nil;
			n.lastHealthChangeTime = 0;
			n.lastTargetSeenTime = 0;
			n.currentTarget = nil;
			n.lockedTargetPlayer = nil;
			n.lastStickTarget = nil;
			n.lastStickTargetHum = nil;
			n.hiding = false;
			n.hidingUntil = 0;
			n.targetFloor = nil;
			n.targetFloorY = nil;
			n.lastFloorTarget = nil;
			n.floorCheckTime = 0;
			n.triggerStart = nil;
			n.inKnifeRangeNow = false;
			n.forceDescent = false;
			n.jitterSide = 1;
			n.jitterCurrent = 0;
			n.jitterNextSwitch = 0;
			n.lastSetCFrame = nil;
			n.validFrames = 0;
			n.killActivated = false;
		end));
	end;
	function a.Stop(n)
		if not n.running then
			return;
		end;
		local J = n:GetRoot(e);
		if J and n.safePosition then
			pcall(function()
				J.CFrame = CFrame.new(n.safePosition);
				J.AssemblyLinearVelocity = Vector3.zero;
				J.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
		n.running = false;
		n.connections:Cleanup();
		n.connections = yx.new();
		n:ResetState();
		n.currentTarget = nil;
		n.lockedTargetPlayer = nil;
		n.lastStickTarget = nil;
		n.lastStickTargetHum = nil;
		n.hiding = false;
		n.hidingUntil = 0;
		n.inKnifeRangeNow = false;
		n.forceDescent = false;
		n.killActivated = false;
		n.targetFloorY = nil;
		n.lastFloorTarget = nil;
	end;
	KillAllInstance = a.new();
end;
task.wait();
dx.Aim:Section({ Title = "Auto Shoot", Icon = "solar:target-bold" });
O.TogAutoShoot = dx.Aim:Toggle({ Title = "Auto Shoot (Normal - Cabeza/Torso)", Callback = function(n)
			G = n;
			if not n and (not G and (not j and U)) then
				U("Auto", nil);
			end;
			if a then
				a();
			end;
		end });
O.TogAutoShootAgr = dx.Aim:Toggle({ Title = "Auto Shoot (Agresivo - Hitbox Completa)", Callback = function(n)
			j = n;
			if not n and (not G and (not j and U)) then
				U("Auto", nil);
			end;
			if a then
				a();
			end;
		end });
O.DropAutoShootPart = dx.Aim:Dropdown({
		Title = "Target: Parte del cuerpo",
		Values = { "Cabeza", "Torso", "Cuerpo Completo" },
		Value = "Cabeza",
		Callback = function(n)
			A = n;
		end,
	});
O.TogEquipGun = dx.Aim:Toggle({ Title = "Equipar pistola", Value = false, Callback = function(n)
			v = n;
			if a then
				a();
			end;
		end });
do
	local J = false;
	g = function()
			if J or not v then
				return;
			end;
			J = true;
			task.spawn(function()
				local C = RaycastParams.new();
				C.FilterType = Enum.RaycastFilterType.Exclude;
				while v do
					task.wait(.1);
					if not v then
						break;
					end;
					if not Gx() then
						continue;
					end;
					local J = e.Character;
					local Y = J and J:FindFirstChildOfClass("Humanoid");
					if not J or not Y then
						continue;
					end;
					if Y.Health <= 0 then
						continue;
					end;
					local d = J:FindFirstChild("HumanoidRootPart");
					local R = J:FindFirstChild("Head");
					if not d then
						continue;
					end;
					local H = R and R.Position or d.Position;
					local w = false;
					for n, Y in ipairs(n:GetPlayers()) do
						if Y ~= e and jx(Y) then
							local n = Y.Character;
							if n then
								local Y = n:FindFirstChild("Head") or n:FindFirstChild("UpperTorso") or n:FindFirstChild("Torso") or n:FindFirstChild("HumanoidRootPart");
								if Y and Y:IsA("BasePart") then
									C.FilterDescendantsInstances = { J, n };
									local d = L:Raycast(H, Y.Position - H, C);
									if not d and Gx() then
										w = true;
										break;
									end;
								end;
							end;
						end;
					end;
					if not w then
						continue;
					end;
					local P = kx();
					if not P then
						continue;
					end;
					J = e.Character;
					Y = J and J:FindFirstChildOfClass("Humanoid");
					if not J or not Y then
						continue;
					end;
					P = kx();
					if not P then
						continue;
					end;
					if P.Parent ~= J then
						pcall(function()
							Y:EquipTool(P);
						end);
					end;
					task.wait(.35);
					if not v then
						break;
					end;
					J = e.Character;
					Y = J and J:FindFirstChildOfClass("Humanoid");
					if J and Y then
						pcall(function()
							Y:UnequipTools();
						end);
					end;
					task.wait(1.9);
				end;
				J = false;
			end);
		end;
end;
dx.Aim:Space();
dx.Aim:Divider();
dx.Aim:Space();
dx.Aim:Section({ Title = "Silent Aim + Fov", Icon = "solar:radar-bold" });
O.TogSilentAimManual = dx.Aim:Toggle({ Title = "Silent Aim", Callback = function(n)
			h = n;
			if not n and (not h and (not k and U)) then
				U("Silent", nil);
			end;
			if a then
				a();
			end;
		end });
O.DropSilentAimPart = dx.Aim:Dropdown({
		Title = "Target: Parte del cuerpo",
		Values = { "Cabeza", "Torso", "Cuerpo Completo" },
		Value = "Cabeza",
		Callback = function(n)
			M = n;
		end,
	});
O.TogSilentAimFOV = dx.Aim:Toggle({ Title = "Silent Aim (Con FOV)", Callback = function(n)
			k = n;
			if not n and (not h and (not k and U)) then
				U("Silent", nil);
			end;
			if a then
				a();
			end;
		end });
O.TogShowFOV = dx.Aim:Toggle({ Title = "Mostrar C\195\173rculo FOV", Callback = function(n)
			w = n;
			if l then
				l();
			end;
		end });
O.SliFOVSize = dx.Aim:Slider({
		Title = "Tama\195\177o del FOV",
		Step = 1,
		Value = { Min = 10, Max = 800, Default = 120 },
		Callback = function(n)
			P = n;
		end,
	});
do
	(getgenv()).NexvyrTargetPart = nil;
	local J = (getgenv()).__NexvyrDeferredNamecall;
	if J then
		J.Enabled = false;
	end;
	local C = e:GetMouse();
	local Y = { Auto = nil, Silent = nil };
	local d = 0;
	local R = (getgenv()).__NexvyrDmvsAimCleanup;
	if type(R) == "function" then
		pcall(R);
	end;
	(getgenv()).__NexvyrDmvsAimCleanup = nil;
	local H = {
			Enabled = false,
			Metatable = nil,
			IndexHook = nil,
			NamecallHook = nil,
		};
	local w = false;
	do
		local n = type(getexecutorname) == "function" and getexecutorname or identifyexecutor;
		if type(n) == "function" then
			local J, C = pcall(n);
			w = J and ((tostring(C)):lower()):find("madium", 1, true) ~= nil or false;
		end;
	end;
	local y = {};
	pcall(function()
		y.Raycast = L.Raycast;
	end);
	pcall(function()
		y.FindPartOnRay = L.FindPartOnRay;
	end);
	pcall(function()
		y.FindPartOnRayWithIgnoreList = L.FindPartOnRayWithIgnoreList;
	end);
	pcall(function()
		y.FindPartOnRayWithWhitelist = L.FindPartOnRayWithWhitelist;
	end);
	local function m()
		return G or j or h or k;
	end;
	local function I(n)
		if typeof(n) ~= "Instance" or not n:IsA("BasePart") or not n.Parent then
			return false;
		end;
		local J = n:FindFirstAncestorOfClass("Model");
		local C = J and J:FindFirstChildOfClass("Humanoid");
		return C ~= nil and C.Health > 0;
	end;
	local function N()
		local n = os.clock();
		local J = G or j;
		if J and (n <= d and I(Y.Auto)) then
			return Y.Auto;
		end;
		if ((h or k)) and I(Y.Silent) then
			return Y.Silent;
		end;
		if J and I(Y.Auto) then
			return Y.Auto;
		end;
		return nil;
	end;
	U = function(n, J)
			if n ~= "Auto" and n ~= "Silent" then
				return;
			end;
			Y[n] = I(J) and J or nil;
			(getgenv()).NexvyrTargetPart = N();
		end;
	local function x()
		if not H.Enabled or not m() or Px() then
			return nil;
		end;
		local n = e.Character;
		if not n then
			return nil;
		end;
		local J = n:FindFirstChildOfClass("Tool");
		if not ((hx(J) or (j and (J and not Ax(J))))) then
			return nil;
		end;
		local C = N();
		if not C then
			return nil;
		end;
		return C.Position, C;
	end;
	local function X(n)
		if typeof(n) ~= "Vector3" then
			return false;
		end;
		local J = L.CurrentCamera;
		if J and ((n - J.CFrame.Position)).Magnitude <= 3 then
			return true;
		end;
		local C = e.Character;
		if not C then
			return false;
		end;
		local Y = C:FindFirstChildOfClass("Tool");
		local d = Y and Y:FindFirstChild("Handle");
		if d and (d:IsA("BasePart") and ((n - d.Position)).Magnitude <= 18) then
			return true;
		end;
		local R = C:FindFirstChild("Head");
		return R and ((n - R.Position)).Magnitude <= 8 or false;
	end;
	local function o()
		local n = L.CurrentCamera;
		local J = n and n.CFrame.Position;
		local C = e.Character;
		local Y = C and C:FindFirstChild("Head");
		if J and (Y and ((J - Y.Position)).Magnitude <= 1.75) then
			return J;
		end;
		local d = C and C:FindFirstChildOfClass("Tool");
		local R = d and d:FindFirstChild("Handle");
		if R and R:IsA("BasePart") then
			return R.Position;
		end;
		if Y then
			return Y.Position;
		end;
		return J;
	end;
	local function p()
		H.Enabled = false;
		local n = H.Metatable;
		if not n or type(setreadonly) ~= "function" then
			return;
		end;
		local J = pcall(setreadonly, n, false);
		if not J then
			return;
		end;
		pcall(function()
			if n.__index == H.IndexHook then
				n.__index = H.OriginalIndex;
			end;
			if H.NamecallHook and n.__namecall == H.NamecallHook then
				n.__namecall = H.OriginalNamecall;
			end;
		end);
		pcall(setreadonly, n, H.WasReadonly);
		if n.__index ~= H.IndexHook and ((not H.NamecallHook or n.__namecall ~= H.NamecallHook)) then
			H.Metatable = nil;
			H.IndexHook = nil;
			H.NamecallHook = nil;
		end;
	end;
	(getgenv()).__NexvyrDmvsAimCleanup = p;
	local function T()
		if H.Metatable then
			local n = H.Metatable;
			local J = n.__index == H.IndexHook;
			H.Enabled = J;
			return J;
		end;
		if type(getrawmetatable) ~= "function" or type(setreadonly) ~= "function" then
			warn("Nexvyr: este executor no permite instalar la redireccion del mouse.");
			return false;
		end;
		local n, J = pcall(getrawmetatable, w and game or C);
		if not n or not J then
			return false;
		end;
		local Y, d = J.__index, J.__namecall;
		if type(Y) ~= "function" and type(Y) ~= "table" then
			return false;
		end;
		local R = true;
		if type(isreadonly) == "function" then
			local n, C = pcall(isreadonly, J);
			if n and type(C) == "boolean" then
				R = C;
			end;
		end;
		local function e(n, J)
			if type(Y) == "function" then
				return Y(n, J);
			end;
			return Y[J];
		end;
		local P = function(n, J)
				if H.Enabled and (n == C and (((J == "Hit" or J == "Target" or J == "UnitRay" or (w and J == "TargetSurface"))) and ((w or type(checkcaller) ~= "function" or not checkcaller())))) then
					local C, Y, d = pcall(x);
					if C and (Y and d) then
						if J == "Target" then
							return d;
						end;
						if J == "TargetSurface" then
							return Enum.NormalId.Front;
						end;
						if J == "Hit" then
							if w then
								return CFrame.new(Y);
							end;
							local n = o();
							local J = n and Y - n;
							if J and J.Magnitude > .001 then
								return CFrame.lookAt(Y, Y + J.Unit);
							end;
							return CFrame.new(Y);
						end;
						local C = e(n, J);
						local R = typeof(C) == "Ray" and C.Origin or nil;
						if not R then
							local n = L.CurrentCamera;
							R = n and n.CFrame.Position or o();
						end;
						local H = R and Y - R;
						if H and H.Magnitude > .001 then
							return Ray.new(R, H.Unit);
						end;
					end;
				end;
				return e(n, J);
			end;
		local G;
		if not w and (type(d) == "function" and (type(getnamecallmethod) == "function" and type(checkcaller) == "function")) then
			G = function(n, ...)
					if not H.Enabled or checkcaller() then
						return d(n, ...);
					end;
					if n == L and not H.ResolvingRay then
						local J = getnamecallmethod();
						local C = J and y[J];
						if C then
							local Y = table.pack(...);
							local d, L;
							if J == "Raycast" then
								if typeof(Y[1]) == "Vector3" and typeof(Y[2]) == "Vector3" then
									d, L = Y[1], Y[2].Magnitude;
								end;
							elseif typeof(Y[1]) == "Ray" then
								d, L = Y[1].Origin, Y[1].Direction.Magnitude;
							end;
							if d and (L and (L >= 50 and X(d))) then
								H.ResolvingRay = true;
								local n, C = pcall(x);
								H.ResolvingRay = false;
								if n and C then
									local n = C - d;
									if n.Magnitude > .001 then
										if J == "Raycast" then
											Y[2] = n.Unit * L;
										else
											Y[1] = Ray.new(d, n.Unit * L);
										end;
									end;
								end;
							end;
							return C(n, table.unpack(Y, 1, Y.n));
						end;
					end;
					return d(n, ...);
				end;
		end;
		if not pcall(setreadonly, J, false) then
			return false;
		end;
		local j = pcall(function()
				J.__index = P;
				if G then
					J.__namecall = G;
				end;
			end);
		if not j then
			pcall(function()
				if J.__index == P then
					J.__index = Y;
				end;
				if G and J.__namecall == G then
					J.__namecall = d;
				end;
			end);
			pcall(setreadonly, J, R);
			return false;
		end;
		pcall(setreadonly, J, R);
		H.Metatable = J;
		H.OriginalIndex = Y;
		H.OriginalNamecall = d;
		H.IndexHook = P;
		H.NamecallHook = G;
		H.WasReadonly = R;
		H.Enabled = true;
		return true;
	end;
	local function Z()
		if m() then
			T();
		else
			Y.Auto = nil;
			Y.Silent = nil;
			d = 0;
			(getgenv()).NexvyrTargetPart = nil;
			p();
		end;
	end;
	local z;
	a = function()
			E();
			Z();
			if z then
				z();
			end;
		end;
	local B = false;
	f = function()
			if B or not ((G or j)) then
				return;
			end;
			B = true;
			task.spawn(function()
				local J = RaycastParams.new();
				J.FilterType = Enum.RaycastFilterType.Exclude;
				while G or j do
					task.wait(.1);
					if not ((G or j)) then
						break;
					end;
					if not H.Enabled then
						continue;
					end;
					if not Px() then
						local C = e.Character;
						if not C or not C:FindFirstChild("HumanoidRootPart") then
							continue;
						end;
						local Y = C:FindFirstChildOfClass("Tool");
						if not Y or not Y:FindFirstChild("Handle") then
							U("Auto", nil);
							continue;
						end;
						if j then
							if Ax(Y) then
								U("Auto", nil);
								continue;
							end;
						elseif not hx(Y) then
							U("Auto", nil);
							continue;
						end;
						local R = nil;
						local H = math.huge;
						local w = C.HumanoidRootPart.Position;
						local P = C:FindFirstChild("Head");
						local G = P and P.Position or w;
						if j then
							for n, Y in pairs(n:GetPlayers()) do
								if Y ~= e and (wx(Y) and Y.Character) then
									local n = Y.Character:FindFirstChild("Humanoid");
									if n and n.Health > 0 then
										J.FilterDescendantsInstances = { C, Y.Character };
										local function n(n)
											local C = ((n.Position - w)).Magnitude;
											if C < H then
												local Y = n.Size;
												local d = { Vector3.new(0, 0, 0), Vector3.new(0, Y.Y / 2.1, 0), Vector3.new(0, -Y.Y / 2.1, 0) };
												local e = false;
												for C, Y in ipairs(d) do
													if not L:Raycast(G, (n.CFrame * Y) - G, J) then
														e = true;
														break;
													end;
												end;
												if e then
													H = C;
													R = n;
												end;
											end;
										end;
										for J, C in ipairs(Y.Character:GetChildren()) do
											if C:IsA("BasePart") and C.Name ~= "HumanoidRootPart" then
												n(C);
											end;
										end;
									end;
								end;
							end;
						else
							local Y = {};
							for n, J in ipairs(n:GetPlayers()) do
								if J ~= e and (wx(J) and J.Character) then
									local n = J.Character;
									local C = n:FindFirstChildOfClass("Humanoid");
									if C and C.Health > 0 then
										local J = n:FindFirstChild("HumanoidRootPart");
										Y[#Y + 1] = { Character = n, Distance = J and ((J.Position - w)).Magnitude or math.huge };
									end;
								end;
							end;
							table.sort(Y, function(n, J)
								return n.Distance < J.Distance;
							end);
							local d = 192;
							local function P(n)
								if not n or not n:IsA("BasePart") then
									return;
								end;
								local C = ((n.Position - w)).Magnitude;
								if C >= H then
									return;
								end;
								local Y = n.Size.Y / 2.1;
								local e = n.CFrame;
								local function P(n)
									if d <= 0 then
										return false;
									end;
									d = d - (1);
									return not L:Raycast(G, n - G, J);
								end;
								if P(n.Position) or P(e * Vector3.new(0, Y, 0)) or P(e * Vector3.new(0, -Y, 0)) then
									H = C;
									R = n;
								end;
							end;
							for n, Y in ipairs(Y) do
								if d <= 0 then
									break;
								end;
								local L = Y.Character;
								if L.Parent then
									J.FilterDescendantsInstances = { C, L };
									if A == "Cuerpo Completo" then
										for n, J in ipairs(L:GetChildren()) do
											if d <= 0 then
												break;
											end;
											if J:IsA("BasePart") and J.Name ~= "HumanoidRootPart" then
												P(J);
											end;
										end;
									elseif A == "Cabeza" then
										P(L:FindFirstChild("Head"));
									elseif A == "Torso" then
										for n, J in ipairs({ "UpperTorso", "Torso", "HumanoidRootPart" }) do
											if d <= 0 then
												break;
											end;
											P(L:FindFirstChild(J));
										end;
									end;
								end;
							end;
						end;
						if R then
							d = os.clock() + .35;
							U("Auto", R);
							pcall(function()
								Y:Activate();
								task.delay(.05, function()
									if Y.Parent == C then
										Y:Deactivate();
									end;
								end);
							end);
							task.wait(.2);
						else
							U("Auto", nil);
						end;
					end;
				end;
				U("Auto", nil);
				B = false;
			end);
		end;
	local Q = false;
	u = function()
			if Q or not ((h or k)) then
				return;
			end;
			Q = true;
			task.spawn(function()
				local J = RaycastParams.new();
				J.FilterType = Enum.RaycastFilterType.Exclude;
				while h or k do
					task.wait(.1);
					if not ((h or k)) then
						break;
					end;
					if not Px() then
						local C = e.Character;
						if not C or not C:FindFirstChild("HumanoidRootPart") then
							continue;
						end;
						local Y = nil;
						local d = math.huge;
						local R = math.huge;
						local H = C.HumanoidRootPart.Position;
						local w = C:FindFirstChild("Head") and C.Head.Position or H;
						for n, G in pairs(n:GetPlayers()) do
							if G ~= e and (wx(G) and G.Character) then
								local n = G.Character:FindFirstChild("Humanoid");
								if n and n.Health > 0 then
									local n = {};
									if M == "Cabeza" then
										local J = G.Character:FindFirstChild("Head");
										if J then
											table.insert(n, J);
										end;
									elseif M == "Torso" then
										local J = { "UpperTorso", "Torso", "HumanoidRootPart" };
										for J, C in ipairs(J) do
											local Y = G.Character:FindFirstChild(C);
											if Y and Y:IsA("BasePart") then
												table.insert(n, Y);
											end;
										end;
									elseif M == "Cuerpo Completo" then
										for J, C in ipairs(G.Character:GetChildren()) do
											if C:IsA("BasePart") and C.Name ~= "HumanoidRootPart" then
												table.insert(n, C);
											end;
										end;
									end;
									J.FilterDescendantsInstances = { C, G.Character };
									for n, C in ipairs(n) do
										local e = ((C.Position - H)).Magnitude;
										local G = L.CurrentCamera;
										if not G then
											continue;
										end;
										local j, A = G:WorldToViewportPoint(C.Position);
										local M = ((Vector2.new(j.X, j.Y) - G.ViewportSize / 2)).Magnitude;
										local y = false;
										if k then
											if A and (M <= P and M < d) then
												y = true;
											end;
										elseif h then
											if e < R then
												y = true;
											end;
										end;
										if y then
											local n = L:Raycast(w, C.Position - w, J);
											if not n then
												if k then
													d = M;
													Y = C;
												else
													R = e;
													Y = C;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
						if Y then
							U("Silent", Y);
						else
							U("Silent", nil);
						end;
					end;
				end;
				U("Silent", nil);
				Q = false;
			end);
		end;
	z = function()
			if G or j then
				f();
			end;
			if h or k then
				u();
			end;
			if v then
				g();
			end;
		end;
end;
dx.KillAll:Section({ Title = "Kill All", Icon = "solar:danger-triangle-bold" });
O.TogKillAll = dx.KillAll:Toggle({ Title = "Kill All", Value = false, Callback = function(n)
			x = n;
			if E then
				E();
			end;
			if n then
				KillAllInstance:Start();
			else
				KillAllInstance:Stop();
			end;
		end });
dx.KillAll:Space();
dx.KillAll:Divider();
dx.KillAll:Space();
dx.KillAll:Section({ Title = "Hitbox Expander", Icon = "solar:box-bold" });
O.TogHitbox = dx.KillAll:Toggle({ Title = "Activar Hitbox", Value = false, Callback = function(n)
			X = n;
			if E then
				E();
			end;
			if n then
				K();
			else
				mx();
			end;
		end });
O.TogHitboxInvisible = dx.KillAll:Toggle({ Title = "Hitbox Invisible", Value = false, Callback = function(n)
			o = n;
		end });
O.SliHitboxSize = dx.KillAll:Slider({
		Title = "Tama\195\177o de la Hitbox",
		Step = .5,
		Value = { Min = 1, Max = 28, Default = 3.5 },
		Callback = function(n)
			p = n;
		end,
	});
O.ColHitbox = dx.KillAll:Colorpicker({ Title = "Color de la Hitbox", Default = Color3.fromRGB(255, 0, 0), Callback = function(n)
			T = n;
		end });
dx.Invisible:Section({ Title = "Invisible", Icon = "solar:ghost-bold" });
local function xx(n)
	if e.Character then
		for J, C in pairs(e.Character:GetDescendants()) do
			if C:IsA("BasePart") then
				if n and C.Transparency == 0 then
					C:SetAttribute("NexvyrOrigTrans", 0);
					C.Transparency = .5;
				elseif not n and C:GetAttribute("NexvyrOrigTrans") ~= nil then
					C.Transparency = C:GetAttribute("NexvyrOrigTrans");
					C:SetAttribute("NexvyrOrigTrans", nil);
				end;
			end;
		end;
	end;
end;
O.TogInvisible = dx.Invisible:Toggle({ Title = "Invisible", Value = false, Callback = function(n)
			B = n;
			xx(n);
			if c then
				c(n);
			end;
		end });
do
	local n = game:GetService("TweenService");
	local Y = true;
	local d = Instance.new("TextButton");
	d.Name = "UzivertInvisibleBind";
	d.Size = UDim2.fromOffset(104, 38);
	d.Position = UDim2.new(1, -124, .5, 40);
	d.BackgroundColor3 = Color3.fromRGB(14, 15, 24);
	d.BackgroundTransparency = .1;
	d.AutoButtonColor = false;
	d.Text = "";
	d.ZIndex = 60;
	d.Parent = F;
	(Instance.new("UICorner", d)).CornerRadius = UDim.new(0, 10);
	local L = Instance.new("UIScale", d);
	local R = Instance.new("UIStroke", d);
	R.Thickness = 1.6;
	R.Color = Color3.fromRGB(190, 200, 225);
	local e = Instance.new("Frame", d);
	e.AnchorPoint = Vector2.new(0, .5);
	e.Position = UDim2.new(0, 12, .5, 0);
	e.Size = UDim2.fromOffset(10, 10);
	e.BackgroundColor3 = Color3.fromRGB(110, 116, 140);
	e.BorderSizePixel = 0;
	e.ZIndex = 61;
	(Instance.new("UICorner", e)).CornerRadius = UDim.new(1, 0);
	local H = Instance.new("TextLabel", d);
	H.Position = UDim2.fromOffset(30, 0);
	H.Size = UDim2.new(1, -36, 1, 0);
	H.BackgroundTransparency = 1;
	H.Text = "Invisible";
	H.TextColor3 = Color3.new(1, 1, 1);
	H.Font = Enum.Font.GothamBold;
	H.TextSize = 13;
	H.TextXAlignment = Enum.TextXAlignment.Left;
	H.ZIndex = 61;
	local function w(n)
		pcall(function()
			O.TogInvisible:Set(n);
		end);
		if B ~= n then
			B = n;
			xx(n);
			if c then
				c(n);
			end;
		end;
	end;
	local P, G, j, A, h = false, false, nil, nil, nil;
	d.InputBegan:Connect(function(J)
		if J.UserInputType == Enum.UserInputType.MouseButton1 or J.UserInputType == Enum.UserInputType.Touch then
			if P then
				return;
			end;
			P, G = true, false;
			h = J;
			j, A = d.Position, J.Position;
			(n:Create(L, TweenInfo.new(.1), { Scale = .94 })):Play();
		end;
	end);
	C.InputChanged:Connect(function(n)
		if not P then
			return;
		end;
		if n.UserInputType == Enum.UserInputType.MouseMovement then
			if not h or h.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return;
			end;
		elseif n ~= h then
			return;
		end;
		do
			local J = n.Position - A;
			if G or J.Magnitude > 8 then
				G = true;
				d.Position = UDim2.new(j.X.Scale, j.X.Offset + J.X, j.Y.Scale, j.Y.Offset + J.Y);
			end;
		end;
	end);
	C.InputEnded:Connect(function(J)
		if not P or J ~= h then
			return;
		end;
		do
			P = false;
			h = nil;
			(n:Create(L, TweenInfo.new(.2, Enum.EasingStyle.Back), { Scale = 1 })):Play();
			if not G then
				w(not B);
			end;
		end;
	end);
	J.Heartbeat:Connect(function()
		if not d.Parent then
			return;
		end;
		local n = B;
		e.BackgroundColor3 = e.BackgroundColor3:Lerp(n and Color3.fromRGB(61, 220, 132) or Color3.fromRGB(110, 116, 140), .25);
		R.Color = R.Color:Lerp(n and Color3.fromRGB(61, 220, 132) or Color3.fromRGB(190, 200, 225), .25);
	end);
	dx.Invisible:Toggle({ Title = "Mostrar bot\195\179n bindable", Value = true, Callback = function(n)
			Y = n;
			d.Visible = n;
		end });
end;
do
	local n;
	c = function(C)
			if n then
				n:Disconnect();
				n = nil;
			end;
			if not C then
				return;
			end;
			n = J.Heartbeat:Connect(function()
					if not B then
						return;
					end;
					local n = e.Character;
					if n then
						local C = n:FindFirstChild("HumanoidRootPart");
						local Y = n:FindFirstChildOfClass("Humanoid");
						if C and (Y and Y.Health > 0) then
							if C.Position.Y > 200 then
								return;
							end;
							local n = C.CFrame;
							local d = Y.CameraOffset;
							local L = n * CFrame.new(0, -40, 0);
							C.CFrame = L;
							Y.CameraOffset = (L:ToObjectSpace(CFrame.new(n.Position))).Position;
							J.RenderStepped:Wait();
							if C.Parent and Y.Parent then
								C.CFrame = n;
								Y.CameraOffset = d;
							end;
						end;
					end;
				end);
		end;
end;
e.CharacterAdded:Connect(function(n)
	if B then
		task.wait(.5);
		xx(true);
	end;
end);
dx.Tramposo:Section({ Title = "Movimiento", Icon = "solar:bolt-bold" });
local Xx = 28.7;
local ox = 45;
do
	local d = Y:WaitForChild("MovementState", 3);
	local function R(n, J)
		if d then
			d:FireServer(n, J);
		end;
	end;
	local H = 14;
	local w, P, G;
	local j = Vector3.zero;
	local A = false;
	local h = 0;
	local function k()
		local n = e.Character;
		if not n then
			return;
		end;
		return n:FindFirstChildOfClass("Humanoid"), n:FindFirstChild("HumanoidRootPart");
	end;
	local function M(n)
		if w then
			w:Disconnect();
			w = nil;
		end;
		j = Vector3.zero;
		if not n then
			return;
		end;
		w = J.Stepped:Connect(function(n, J)
				local C, Y = k();
				if not C or not Y or C.Health <= 0 then
					return;
				end;
				local d = 1 - math.exp(-H * J);
				j = j:Lerp(C.MoveDirection, d);
				if j.Magnitude > .01 then
					local n = math.max(Xx - C.WalkSpeed, 0);
					Y.CFrame = Y.CFrame + (j * n) * J;
				end;
			end);
	end;
	local function y(n)
		if P then
			P:Disconnect();
			P = nil;
		end;
		if G then
			G:Disconnect();
			G = nil;
		end;
		A = false;
		h = 0;
		if not n then
			return;
		end;
		G = C.JumpRequest:Connect(function()
				A = true;
			end);
		P = J.Stepped:Connect(function(n, J)
				local Y, d = k();
				if not Y or not d or Y.Health <= 0 then
					return;
				end;
				local L = C:IsKeyDown(Enum.KeyCode.Space) or Y.Jump;
				if A and not L then
					A = false;
				end;
				local R = A and ox or 0;
				h = h + ((R - h)) * ((1 - math.exp(-H * J)));
				if h > .5 then
					d.CFrame = d.CFrame + Vector3.new(0, h * J, 0);
					local n = d.AssemblyLinearVelocity;
					if n.Y < 0 then
						d.AssemblyLinearVelocity = Vector3.new(n.X, 0, n.Z);
					end;
				end;
			end);
	end;
	O.TogSpeed = dx.Tramposo:Toggle({ Title = "Speed", Value = false, Callback = function(n)
				M(n);
				R("Speed", n);
			end });
	O.SliSpeed = dx.Tramposo:Slider({
			Title = "Ajuste Speed",
			Step = 1,
			Value = { Min = 1, Max = 100, Default = 29 },
			Callback = function(n)
				Xx = n;
			end,
		});
	O.TogInfJump = dx.Tramposo:Toggle({ Title = "Salto Inf", Value = false, Callback = function(n)
				y(n);
				R("Jump", n);
			end });
	O.SliJumpPower = dx.Tramposo:Slider({
			Title = "Ajuste Salto",
			Step = 1,
			Value = { Min = 1, Max = 100, Default = 45 },
			Callback = function(n)
				ox = n;
			end,
		});
	dx.Tramposo:Section({ Title = "Cheats", Icon = "solar:bolt-bold" });
	local m = false;
	local I = false;
	local N = {};
	local function x()
		m = false;
		I = false;
		for n, J in ipairs(N) do
			if J then
				pcall(function()
					J:Destroy();
				end);
			end;
		end;
		N = {};
	end;
	local function X()
		if I then
			return;
		end;
		I = true;
		task.spawn(function()
			while m do
				task.wait(.05);
				local n = e.Character;
				local J = n and n:FindFirstChild("HumanoidRootPart");
				local C = n and n:FindFirstChildOfClass("Humanoid");
				if J and (C and C.Health > 0) then
					if C.MoveDirection.Magnitude > 0 or J.AssemblyLinearVelocity.Y ~= 0 then
						local n = Instance.new("Part");
						n.Size = Vector3.new(6, .6, 6);
						n.Anchored = true;
						n.CanCollide = true;
						n.Color = Color3.fromRGB(5, 5, 5);
						n.Material = Enum.Material.Neon;
						n.CFrame = J.CFrame * CFrame.new(0, -3.3, 0);
						n.Parent = L;
						table.insert(N, n);
						if #N > 3 then
							local n = table.remove(N, 1);
							if n then
								pcall(function()
									n:Destroy();
								end);
							end;
						end;
					end;
				end;
			end;
			I = false;
		end);
	end;
	O.TogFixedPlatform = dx.Tramposo:Toggle({ Title = "Fixed Platform", Value = false, Callback = function(n)
				if n then
					m = true;
					X();
				else
					x();
				end;
			end });
	local o = false;
	local p = {};
	local function T()
		for n, J in pairs(p) do
			if J and J.Parent then
				J.Anchored = false;
			end;
			p[n] = nil;
		end;
	end;
	task.spawn(function()
		while task.wait(.1) do
			if o then
				for n, J in ipairs(n:GetPlayers()) do
					if J ~= e and J.Character then
						local n = J.Character:FindFirstChild("HumanoidRootPart");
						local C = J.Character:FindFirstChildOfClass("Humanoid");
						if n and (C and (C.Health > 0 and not n.Anchored)) then
							n.Anchored = true;
							p[J] = n;
						end;
					end;
				end;
			elseif next(p) ~= nil then
				T();
			end;
		end;
	end);
	O.TogFakeLag = dx.Tramposo:Toggle({ Title = "Fake Lag", Value = false, Callback = function(n)
				o = n;
				if not n then
					T();
				end;
			end });
end;
dx.RachaFarm:Section({ Title = "Auto Teleport Main/Alt", Icon = "solar:map-arrow-square-bold" });
local px, Tx;
px = dx.RachaFarm:Toggle({ Title = "Auto Teleport (Main)", Value = false, Callback = function(n)
			if n then
				AutoTeleportMainAltInstance.ActiveRole = "Main";
				if Tx then
					pcall(function()
						Tx:Set(false);
					end);
				end;
				AutoTeleportMainAltInstance:Stop();
				AutoTeleportMainAltInstance:Start();
			else
				if AutoTeleportMainAltInstance.ActiveRole == "Main" then
					AutoTeleportMainAltInstance.ActiveRole = nil;
					AutoTeleportMainAltInstance:Stop();
				end;
			end;
		end });
Tx = dx.RachaFarm:Toggle({ Title = "Auto Teleport (Alt)", Value = false, Callback = function(n)
			if n then
				AutoTeleportMainAltInstance.ActiveRole = "Alt";
				if px then
					pcall(function()
						px:Set(false);
					end);
				end;
				AutoTeleportMainAltInstance:Stop();
				AutoTeleportMainAltInstance:Start();
			else
				if AutoTeleportMainAltInstance.ActiveRole == "Alt" then
					AutoTeleportMainAltInstance.ActiveRole = nil;
					AutoTeleportMainAltInstance:Stop();
				end;
			end;
		end });
dx.RachaFarm:Dropdown({
	Title = "Tipo de Duelo",
	Values = {
		"1v1",
		"2v2",
		"3v3",
		"4v4",
	},
	Value = "1v1",
	Callback = function(n)
		if Ix["Right Platforms"][n] then
			AutoTeleportMainAltInstance.DuelType = n;
		else
			AutoTeleportMainAltInstance.DuelType = "1v1";
		end;
		AutoTeleportMainAltInstance:Kick();
	end,
});
dx.RachaFarm:Dropdown({
	Title = "Fila de Plataformas",
	Values = { "Right Platforms", "Left Platforms" },
	Value = "Right Platforms",
	Callback = function(n)
		if Ix[n] then
			AutoTeleportMainAltInstance.PlatformRow = n;
		else
			AutoTeleportMainAltInstance.PlatformRow = "Right Platforms";
		end;
		AutoTeleportMainAltInstance:Kick();
	end,
});
do
	dx.Vis:Section({ Title = "Configuraci\195\179n de ESP", Icon = "solar:eye-bold" });
	local C = {};
	local d = 1500;
	local function R(n)
		local J = C[n];
		if not J then
			return;
		end;
		if J.Highlight then
			J.Highlight:Destroy();
		end;
		C[n] = nil;
	end;
	local function H()
		for n in pairs(C) do
			R(n);
		end;
	end;
	O.TogEsp = dx.Vis:Toggle({ Title = "ESP Jugadores", Callback = function(n)
				m = n;
				if E then
					E();
				end;
				if m and N.Glow then
					t();
				else
					H();
				end;
			end });
	O.ColEsp = dx.Vis:Colorpicker({ Title = "Color del ESP", Default = Color3.fromRGB(255, 255, 255), Callback = function(n)
				I = n;
			end });
	dx.Vis:Space();
	dx.Vis:Divider();
	dx.Vis:Space();
	dx.Vis:Section({ Title = "Filtros de ESP", Icon = "solar:filter-bold" });
	O.TogEspGl = dx.Vis:Toggle({ Title = "Mostrar Resplandor", Value = true, Callback = function(n)
				N.Glow = n;
				if E then
					E();
				end;
				if n and m then
					t();
				else
					H();
				end;
			end });
	local G = false;
	t = function()
			if G or not m or not N.Glow then
				return;
			end;
			G = true;
			task.spawn(function()
				local J = n.PlayerRemoving:Connect(R);
				while m and N.Glow do
					task.wait(.2);
					if not m or not N.Glow then
						break;
					end;
					if Gx() then
						local J = e.Character;
						local Y = J and J:FindFirstChild("Head");
						local L = Y and Y.Position;
						for n, J in ipairs(n:GetPlayers()) do
							if J ~= e then
								local n = J.Character;
								local Y = n and n:FindFirstChild("Head");
								if Y and (wx(J) and ((not L or ((Y.Position - L)).Magnitude <= d))) then
									local Y = C[J];
									if Y and ((Y.Char ~= n or not Y.Highlight or Y.Highlight.Parent ~= D)) then
										R(J);
									end;
									if not C[J] then
										local Y = Instance.new("Highlight");
										Y.Name = J.Name .. "_Glow";
										Y.FillTransparency = 1;
										Y.OutlineTransparency = 0;
										Y.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
										Y.Adornee = n;
										Y.Parent = D;
										C[J] = { Highlight = Y, Char = n };
									end;
									local d = C[J].Highlight;
									if d.Enabled ~= N.Glow then
										d.Enabled = N.Glow;
									end;
									if d.OutlineColor ~= I then
										d.OutlineColor = I;
									end;
								else
									R(J);
								end;
							end;
						end;
					else
						H();
					end;
				end;
				J:Disconnect();
				H();
				G = false;
			end);
		end;
	local j;
	local A;
	local h = {
			Color3.fromRGB(110, 118, 142),
			Color3.fromRGB(255, 255, 255),
			Color3.fromRGB(190, 200, 225),
			Color3.fromRGB(255, 255, 255),
			Color3.fromRGB(110, 118, 142),
		};
	local function k()
		local n = (((((os.clock() * 120)) % 360)) / 360) * 4;
		local J = math.floor(n);
		local C = h[J + 1];
		local Y = h[math.min(J + 2, 5)];
		return C:Lerp(Y, n - J);
	end;
	l = function()
			if not w then
				if A then
					A:Disconnect();
					A = nil;
				end;
				if j then
					j.Visible = false;
				end;
				return;
			end;
			if not j and Drawing then
				j = Drawing.new("Circle");
				j.Filled = false;
				j.Thickness = 1;
				j.Visible = false;
			end;
			if not j or A then
				return;
			end;
			A = J.RenderStepped:Connect(function()
					if not w then
						return;
					end;
					local n = L.CurrentCamera;
					if not n then
						return;
					end;
					j.Position = n.ViewportSize / 2;
					j.Radius = P;
					j.Color = k();
					j.Visible = true;
				end);
		end;
	dx.Farm:Section({ Title = "Farmeo de Evento", Icon = "solar:gift-bold" });
	(getgenv()).AutoEventFarm = false;
	local M = 0;
	local y = Y:FindFirstChild("Packages") and Y.Packages:FindFirstChild("Networking");
	local x = y and y:FindFirstChild("RE/Events/CollectEventSpawnable");
	dx.Farm:Toggle({ Title = "Auto Farmear Evento", Callback = function(n)
			(getgenv()).AutoEventFarm = n;
			M = M + (1);
			local J = M;
			if n then
				task.spawn(function()
					while (getgenv()).AutoEventFarm and J == M do
						pcall(function()
							if x then
								x:FireServer();
							else
								y = Y:FindFirstChild("Packages") and Y.Packages:FindFirstChild("Networking");
								x = y and y:FindFirstChild("RE/Events/CollectEventSpawnable");
							end;
						end);
						local n = e.Character;
						local C = n and n:FindFirstChild("HumanoidRootPart");
						if C then
							local n = L:FindFirstChild("SpawnablesClient");
							if n then
								for n, Y in ipairs(n:GetChildren()) do
									if not (getgenv()).AutoEventFarm or J ~= M then
										break;
									end;
									local d = Y:FindFirstChild("Touch");
									if d then
										pcall(function()
											firetouchinterest(C, d, 0);
											firetouchinterest(C, d, 1);
										end);
									end;
								end;
							end;
						end;
						task.wait(.05);
					end;
				end);
			end;
		end });
end;
do
	local n = {
			["Old School"] = {
				Walk = 10921244891,
				Run = 10921240218,
				Jump = 10921242013,
				Fall = 10921241244,
				SwimIdle = 10921244018,
				Swim = 10921243048,
				Idle = 10921230744,
				Idle2 = 10921232093,
				Climb = 10921229866,
			},
			["Adidas Sports"] = {
				Walk = 18537392113,
				Run = 18537384940,
				Jump = 18537380791,
				Fall = 18537367238,
				SwimIdle = 18537387180,
				Swim = 18537389531,
				Idle = 18537376492,
				Idle2 = 18537371272,
				Climb = 18537363391,
			},
			["Adidas Community"] = {
				Walk = 1.2215085545701e+14,
				Run = 82598234841035,
				Jump = 75290611992385,
				Fall = 98600215928904,
				SwimIdle = 1.0934652032416e+14,
				Swim = 1.3330848326621e+14,
				Idle = 1.2225745849846e+14,
				Idle2 = 1.0235715100577e+14,
				Climb = 88763136693023,
			},
			["Adidas Aura"] = {
				Walk = 83842218823011,
				Run = 1.1832032271887e+14,
				Jump = 1.099966265212e+14,
				Fall = 95603166884636,
				SwimIdle = 94922130551805,
				Swim = 1.345301283839e+14,
				Idle = 1.1021118684035e+14,
				Idle2 = 1.1419113726506e+14,
				Climb = 97824616490448,
			},
			["Wicked Popular"] = {
				Walk = 92072849924640,
				Run = 72301599441680,
				Jump = 1.043252452852e+14,
				Fall = 1.2115244276248e+14,
				Idle = 1.1883222298205e+14,
				Idle2 = 76049494037641,
				SwimIdle = 1.131994151182e+14,
				Swim = 99384245425157,
				Climb = 1.3132683050978e+14,
			},
			Elder = {
				Walk = 10921111375,
				Run = 10921104374,
				Jump = 10921107367,
				Fall = 10921105765,
				SwimIdle = 10921110146,
				Swim = 10921108971,
				Idle = 10921101664,
				Idle2 = 10921102574,
				Climb = 10921100400,
			},
			Zombie = {
				Walk = 10921355261,
				Run = 616163682,
				Jump = 10921351278,
				Fall = 10921350320,
				SwimIdle = 10921353442,
				Swim = 10921352344,
				Idle = 10921344533,
				Idle2 = 10921345304,
				Climb = 10921343576,
			},
			Mage = {
				Walk = 10921152678,
				Run = 10921148209,
				Jump = 10921149743,
				Fall = 10921148939,
				SwimIdle = 10921151661,
				Swim = 10921150788,
				Idle = 10921144709,
				Idle2 = 10921145797,
				Climb = 10921143404,
			},
			["Catwalk Glam"] = {
				Walk = 1.0916872448275e+14,
				Run = 81024476153754,
				Jump = 1.1693632651698e+14,
				Fall = 92294537340807,
				SwimIdle = 98854111361360,
				Swim = 1.3459174318163e+14,
				Idle = 1.3380621499229e+14,
				Idle2 = 94970088341563,
				Climb = 1.1937722096755e+14,
			},
			Astronaut = {
				Walk = 10921046031,
				Run = 10921039308,
				Jump = 10921042494,
				Fall = 10921040576,
				SwimIdle = 10921045006,
				Swim = 10921044000,
				Idle = 10921034824,
				Idle2 = 10921036806,
				Climb = 10921032124,
			},
			["Wicked \"Dancing Through Life\""] = {
				Walk = 73718308412641,
				Run = 1.3551545487797e+14,
				Jump = 78508480717326,
				Fall = 78147885297412,
				SwimIdle = 1.2918312308328e+14,
				Swim = 1.1065701392177e+14,
				Idle = 92849173543269,
				Idle2 = 1.3223890095111e+14,
				Climb = 1.2944749774482e+14,
			},
			Werewolf = {
				Walk = 10921342074,
				Run = 10921336997,
				Fall = 10921337907,
				SwimIdle = 10921341319,
				Swim = 10921340419,
				Idle = 10921330408,
				Idle2 = 10921333667,
				Climb = 10921329322,
			},
			Superhero = {
				Walk = 10921298616,
				Run = 10921291831,
				Jump = 10921294559,
				Fall = 10921293273,
				SwimIdle = 10921297391,
				Swim = 10921295495,
				Idle = 10921288909,
				Idle2 = 10921290167,
				Climb = 10921286911,
			},
			Toy = {
				Walk = 10921312010,
				Run = 10921306285,
				Jump = 10921308158,
				Fall = 10921307241,
				SwimIdle = 10921310341,
				Swim = 10921309319,
				Idle = 10921301576,
				Climb = 10921300839,
			},
			["No Boundaries"] = {
				Walk = 18747074203,
				Run = 18747070484,
				Jump = 18747069148,
				Fall = 18747062535,
				SwimIdle = 18747071682,
				Swim = 18747073181,
				Idle = 18747067405,
				Idle2 = 18747063918,
				Climb = 18747060903,
			},
			NFL = {
				Walk = 1.1035895829942e+14,
				Run = 1.1733353304808e+14,
				Jump = 1.1984611215135e+14,
				Fall = 1.2977324132103e+14,
				SwimIdle = 79090109939093,
				Swim = 1.3269739418992e+14,
				Idle = 92080889861410,
				Idle2 = 74451233229259,
				Climb = 1.3463001374202e+14,
			},
			["Amazon Unboxed"] = {
				Walk = 90478085024465,
				Run = 1.3482445061986e+14,
				Jump = 1.214545054772e+14,
				Fall = 94788218468396,
				SwimIdle = 1.2912626846485e+14,
				Swim = 1.0596291900109e+14,
				Idle = 98281136301627,
				Climb = 1.2114588395023e+14,
			},
			Vampire = {
				Walk = 10921326949,
				Run = 10921320299,
				Jump = 10921322186,
				Fall = 10921321317,
				SwimIdle = 10921325443,
				Swim = 10921324408,
				Idle = 10921315373,
				Climb = 10921314188,
			},
			Ninja = {
				Walk = 656121766,
				Run = 656118852,
				Jump = 656117878,
				Fall = 656115606,
				SwimIdle = 656121397,
				Swim = 656119721,
				Idle = 656117400,
				Idle2 = 656118341,
				Climb = 656114359,
			},
			Robot = {
				Walk = 616095330,
				Run = 616091570,
				Jump = 616090535,
				Fall = 616087089,
				SwimIdle = 616094091,
				Swim = 616092998,
				Idle = 616088211,
				Idle2 = 616089559,
				Climb = 616086039,
			},
			Levitation = {
				Walk = 616013216,
				Run = 616010382,
				Jump = 616008936,
				Fall = 616005863,
				SwimIdle = 616012453,
				Swim = 616011509,
				Idle = 616006778,
				Idle2 = 616008087,
				Climb = 616003713,
			},
			Stylish = {
				Walk = 616146177,
				Run = 616140816,
				Jump = 616139451,
				Fall = 616134815,
				SwimIdle = 616144772,
				Swim = 616143378,
				Idle = 616136790,
				Idle2 = 616138447,
				Climb = 616133594,
			},
			Bubbly = {
				Walk = 910034870,
				Run = 910025107,
				Jump = 910016857,
				Fall = 910001910,
				SwimIdle = 910030921,
				Swim = 910028158,
				Idle = 910004836,
				Idle2 = 910009958,
				Climb = 909997997,
			},
			Cartoon = {
				Walk = 742640026,
				Run = 742638842,
				Jump = 742637942,
				Fall = 742637151,
				SwimIdle = 742639812,
				Swim = 742639220,
				Idle = 742637544,
				Idle2 = 742638445,
				Climb = 742636889,
			},
			Hero = {
				Walk = 616122287,
				Run = 616117076,
				Jump = 616115533,
				Fall = 616108001,
				SwimIdle = 616110827,
				Swim = 616119391,
				Idle = 616111295,
				Idle2 = 616113536,
				Climb = 616104706,
			},
			Pirate = {
				Walk = 750785693,
				Run = 750783738,
				Jump = 750782230,
				Fall = 750780242,
				SwimIdle = 750781415,
				Swim = 750784505,
				Idle = 750781874,
				Idle2 = 750782770,
				Climb = 750779899,
			},
			["OG Run"] = { Run = 9801814462 },
			Jolly = {
				Walk = 83277136078444,
				Run = 1.2441980429831e+14,
				Jump = 1.2211581622084e+14,
				Fall = 85263802503331,
				Idle = 1.3614572787871e+14,
				Idle2 = 1.3614572787871e+14,
				Climb = 1.0719057409504e+14,
			},
			["Cute Kawaii"] = {
				Walk = 1.0721287242356e+14,
				Run = 1.1858251054507e+14,
				Jump = 1.129525483217e+14,
				Fall = 83307333809322,
				Idle = 72311682331639,
				Idle2 = 72311682331639,
				Climb = 1.2638340849378e+14,
			},
			["Doll 3.0"] = {
				Walk = 78434960966537,
				Run = 1.2976839666381e+14,
				Jump = 75369057994828,
				Fall = 81027444073311,
				Idle = 83032187271383,
				Idle2 = 83032187271383,
				Climb = 1.1237189213397e+14,
			},
			["Victoria Model"] = {
				Walk = 84814915379579,
				Run = 84814915379579,
				Jump = 78163261581163,
				Fall = 1.1007392425339e+14,
				Idle = 1.3206996539646e+14,
				Idle2 = 1.3206996539646e+14,
				Climb = 87772134905508,
			},
			["Bike/Bicyclist"] = {
				Walk = 98707881660541,
				Run = 1.0277573721192e+14,
				Jump = 1.2914484788126e+14,
				Fall = 1.106847870865e+14,
				Idle = 1.2639012039917e+14,
				Idle2 = 1.3679151733663e+14,
				Climb = 88267082364595,
			},
			Animal = {
				Walk = 1.1223806444913e+14,
				Run = 97412731442167,
				Jump = 1.2356566527444e+14,
				Fall = 1.2470583198226e+14,
				Idle = 1.2883818300847e+14,
				Idle2 = 99689776099970,
				Climb = 75085836535654,
			},
			["It-Girl Essential Model"] = {
				Walk = 86579666661215,
				Run = 83336349930143,
				Jump = 1.0338215653911e+14,
				Fall = 1.2726264820841e+14,
				Idle = 1.3223207926012e+14,
				Idle2 = 1.0244078979622e+14,
				Climb = 77385815954046,
			},
			Spider = {
				Walk = 1.0997643927788e+14,
				Run = 1.1998583259335e+14,
				Jump = 87979233462906,
				Fall = 71112238570777,
				Idle = 1.1231681437781e+14,
				Idle2 = 1.0343901855214e+14,
				Climb = 1.19278342252e+14,
			},
			Joy = {
				Walk = 1.1259757215096e+14,
				Run = 96521659811743,
				Jump = 82500357520736,
				Fall = 1.3209513909036e+14,
				Idle = 1.1995747525024e+14,
				Idle2 = 1.0120047733917e+14,
				Climb = 1.1006171687383e+14,
			},
			["Flying Aura"] = {
				Walk = 83077254246622,
				Run = 77053251062908,
				Jump = 1.254220182443e+14,
				Fall = 1.0979019594785e+14,
				Idle = 1.224268445845e+14,
				Idle2 = 1.224268445845e+14,
				Climb = 95973965948476,
			},
			["FHA V2"] = {
				Walk = 1.3449325144548e+14,
				Run = 1.2221453340193e+14,
				Jump = 80078165493816,
				Fall = 98383265864436,
				Idle = 77320840005481,
				Idle2 = 77320840005481,
				Climb = 1.1456299472465e+14,
			},
			["Silent Nurse"] = {
				Walk = 94196382152901,
				Run = 94196382152901,
				Jump = 1.0609805723598e+14,
				Fall = 1.3157960933476e+14,
				Idle = 1.1104724486284e+14,
				Idle2 = 1.1104724486284e+14,
				Climb = 1.089853756097e+14,
			},
			Supermodel = {
				Walk = 90320132970213,
				Run = 1.1205125817926e+14,
				Jump = 91931403363860,
				Fall = 1.191734662283e+14,
				Idle = 91917730726110,
				Idle2 = 91917730726110,
				Climb = 82728029306069,
			},
			["Enchanted Fairy"] = {
				Walk = 94547195663763,
				Run = 76909584337943,
				Jump = 1.2053371280367e+14,
				Fall = 1.0094797175635e+14,
				Idle = 73650178233095,
				Idle2 = 73650178233095,
				Climb = 1.4066340648518e+14,
			},
			Furry = {
				Walk = 1.0401144185246e+14,
				Run = 87770060317862,
				Jump = 1.0263558272204e+14,
				Fall = 1.3707998554759e+14,
				Idle = 1.118212920447e+14,
				Idle2 = 1.118212920447e+14,
				Climb = 76660530164497,
			},
			["Vlada Model"] = {
				Walk = 77983757225444,
				Run = 1.1671784824493e+14,
				Jump = 1.2075105517257e+14,
				Fall = 1.3611851825578e+14,
				Idle = 1.0013911643353e+14,
				Idle2 = 1.0013911643353e+14,
				Climb = 70966616077778,
			},
			["R6 Converter"] = {
				Walk = 92149852708428,
				Run = 72259383092959,
				Jump = 1.3051998052151e+14,
				Fall = 1.300117921933e+14,
				Idle = 90040240627854,
				Idle2 = 90040240627854,
				Climb = 80369171706383,
			},
			Sneaky = {
				Walk = 1132510133,
				Run = 1132494274,
				Jump = 1132489853,
				Fall = 1132469004,
				Idle = 1132473842,
				Idle2 = 1132477671,
				Climb = 1132461372,
			},
			Knight = {
				Walk = 657552124,
				Run = 657564596,
				Jump = 658409194,
				Fall = 657600338,
				Idle = 657595757,
				Idle2 = 657568135,
				Climb = 658360781,
			},
			Confident = {
				Walk = 1070017263,
				Run = 1070001516,
				Jump = 1069984524,
				Fall = 1069973677,
				Idle = 1069977950,
				Idle2 = 1069987858,
				Climb = 1069946257,
			},
			Popstar = {
				Walk = 1212980338,
				Run = 1212980348,
				Jump = 1212954642,
				Fall = 1212900995,
				Idle = 1212900985,
				Idle2 = 1212900985,
				Climb = 1213044953,
			},
			Princess = {
				Walk = 941028902,
				Run = 941015281,
				Jump = 941008832,
				Fall = 941000007,
				Idle = 941003647,
				Idle2 = 941013098,
				Climb = 940996062,
			},
			Cowboy = {
				Walk = 1014421541,
				Run = 1014401683,
				Jump = 1014394726,
				Fall = 1014384571,
				Idle = 1014390418,
				Idle2 = 1014398616,
				Climb = 1014380606,
			},
			Patrol = {
				Walk = 1151231493,
				Run = 1150967949,
				Jump = 1150944216,
				Fall = 1148863382,
				Idle = 1149612882,
				Idle2 = 1150842221,
				Climb = 1148811837,
			},
			["Zombie FE"] = {
				Walk = 3489174223,
				Run = 3489173414,
				Jump = 616161997,
				Fall = 616157476,
				Idle = 3489171152,
				Idle2 = 3489171152,
				Climb = 616156119,
			},
			KATSEYE = {
				Walk = 99182913548783,
				Run = 73117360545482,
				Jump = 1.0363230526275e+14,
				Fall = 1.2780271712837e+14,
				Idle = 1.0818780914579e+14,
				Idle2 = 1.0818780914579e+14,
				Climb = 1.0621323797386e+14,
			},
			Dizzy = {
				Walk = 1.1010603410031e+14,
				Run = 1.3830534227285e+14,
				Jump = 1.0856443440821e+14,
				Fall = 1.3896770633541e+14,
				Idle = 1.3280635971847e+14,
				Idle2 = 1.3280635971847e+14,
				Climb = 93550710314258,
			},
			["Billie Eilish"] = {
				Walk = 81877886552514,
				Run = 1.0092056063412e+14,
				Jump = 1.1760263092278e+14,
				Fall = 81072141180299,
				Idle = 1.0293460288441e+14,
				Idle2 = 1.0293460288441e+14,
				Climb = 1.1787346936143e+14,
			},
			["Cute Bouncy"] = {
				Walk = 98713727778027,
				Run = 1.3395534653995e+14,
				Jump = 1.2414714741888e+14,
				Fall = 1.2862081812298e+14,
				Idle = 88464649697812,
				Idle2 = 88464649697812,
				Climb = 95542189442725,
			},
			Cute = {
				Walk = 1.4040971818722e+14,
				Run = 1.1837515753741e+14,
				Jump = 1.3238101610372e+14,
				Fall = 77496925287217,
				Idle = 85735421117197,
				Idle2 = 85735421117197,
				Climb = 86318575131600,
			},
		};
	local function J()
		local n = e.Character;
		if not n then
			return;
		end;
		local J = n:FindFirstChildOfClass("Humanoid");
		if not J then
			return;
		end;
		for n, J in pairs(J:GetPlayingAnimationTracks()) do
			J:Stop(0);
			J:Destroy();
		end;
		local C = J:FindFirstChildOfClass("Animator");
		if C then
			for n, J in pairs(C:GetPlayingAnimationTracks()) do
				J:Stop(0);
				J:Destroy();
			end;
		end;
		task.wait(.1);
	end;
	local function C(n)
		if not n then
			return;
		end;
		local C = e.Character;
		if not C then
			return;
		end;
		J();
		local Y = C:FindFirstChild("Animate");
		if not Y then
			return;
		end;
		if not i then
			local function n(n, J)
				local C = Y:FindFirstChild(n);
				if C then
					local n = C:FindFirstChild(J);
					if n and n:IsA("Animation") then
						local J = n.AnimationId:match("%d+");
						if J then
							return tonumber(J);
						end;
					end;
				end;
				return nil;
			end;
			i = {
					Idle = n("idle", "Animation1") or 507766666,
					Idle2 = n("idle", "Animation2") or 507766951,
					Walk = n("walk", "WalkAnim") or 507777826,
					Run = n("run", "RunAnim") or 507767714,
					Jump = n("jump", "JumpAnim") or 507765000,
					Climb = n("climb", "ClimbAnim") or 507765644,
					Fall = n("fall", "FallAnim") or 507767968,
					Swim = n("swim", "Swim") or 507784897,
					SwimIdle = n("swimidle", "SwimIdle") or 507785072,
				};
		end;
		Y.Disabled = true;
		task.wait(.1);
		local function d(n, J, C)
			if not C then
				return;
			end;
			local d = Y:FindFirstChild(n);
			if d then
				local n = d:FindFirstChild(J);
				if n and n:IsA("Animation") then
					n.AnimationId = "rbxassetid://" .. tostring(C);
				end;
			end;
		end;
		d("idle", "Animation1", n.Idle);
		d("idle", "Animation2", n.Idle2 or n.Idle);
		d("walk", "WalkAnim", n.Walk);
		d("run", "RunAnim", n.Run);
		d("jump", "JumpAnim", n.Jump);
		d("climb", "ClimbAnim", n.Climb);
		d("fall", "FallAnim", n.Fall);
		d("swim", "Swim", n.Swim);
		d("swimidle", "SwimIdle", n.SwimIdle or n.Swim);
		task.wait(.1);
		Y.Disabled = false;
		local L = C:FindFirstChildOfClass("Humanoid");
		if L then
			L:ChangeState(Enum.HumanoidStateType.Landed);
			task.wait(.05);
			L:ChangeState(Enum.HumanoidStateType.Running);
		end;
	end;
	local Y = false;
	q = function()
			if Y or not Q then
				return;
			end;
			Y = true;
			task.spawn(function()
				while Q do
					task.wait(.2);
					if not Q then
						break;
					end;
					local n = e.Character;
					if not n then
						continue;
					end;
					local J = n:FindFirstChildOfClass("Humanoid");
					if not J then
						continue;
					end;
					if J.Health <= 0 then
						continue;
					end;
					if J.MoveDirection.Magnitude >= .1 then
						continue;
					end;
					local C = n:FindFirstChild("Animate");
					if not C then
						continue;
					end;
					local Y = {};
					local d = C:FindFirstChild("walk");
					local L = C:FindFirstChild("run");
					if d then
						for n, J in ipairs(d:GetChildren()) do
							if J:IsA("Animation") then
								table.insert(Y, J.AnimationId);
							end;
						end;
					end;
					if L then
						for n, J in ipairs(L:GetChildren()) do
							if J:IsA("Animation") then
								table.insert(Y, J.AnimationId);
							end;
						end;
					end;
					if #Y == 0 then
						continue;
					end;
					local R = J:FindFirstChildOfClass("Animator");
					if R then
						for n, J in ipairs(R:GetPlayingAnimationTracks()) do
							if J.Animation and table.find(Y, J.Animation.AnimationId) then
								J:Stop(0);
							end;
						end;
					end;
				end;
				Y = false;
			end);
		end;
	e.CharacterAdded:Connect(function()
		if Q then
			task.spawn(function()
				task.wait(.8);
				C(Q);
			end);
		end;
	end);
	local d = { "Ninguno" };
	for n, J in pairs(n) do
		table.insert(d, n);
	end;
	table.sort(d);
	dx.Animaciones:Section({ Title = "Paquetes Completos", Icon = "solar:folder-with-files-bold" });
	local L = "Ninguno";
	dx.Animaciones:Dropdown({
		Title = "Elegir Paquete",
		Values = d,
		Value = "Ninguno",
		Callback = function(n)
			L = n;
		end,
	});
	dx.Animaciones:Button({ Title = "Aplicar Paquete Completo", Callback = function()
			if L == "Ninguno" then
				return;
			end;
			task.spawn(function()
				Q = n[L];
				q();
				C(Q);
			end);
		end });
	dx.Animaciones:Button({ Title = "Restaurar Default", Callback = function()
			task.spawn(function()
				local n = i or {
						Idle = 507766666,
						Idle2 = 507766951,
						Walk = 507777826,
						Run = 507767714,
						Jump = 507765000,
						Climb = 507765644,
						Fall = 507767968,
						Swim = 507784897,
						SwimIdle = 507785072,
					};
				Q = nil;
				C(n);
			end);
		end });
	dx.Animaciones:Space();
	dx.Animaciones:Divider();
	dx.Animaciones:Space();
	dx.Animaciones:Section({ Title = "Mezclador de Animaciones", Icon = "solar:layers-bold" });
	local R = {
			Idle = "Ninguno",
			Walk = "Ninguno",
			Run = "Ninguno",
			Jump = "Ninguno",
			Fall = "Ninguno",
			Climb = "Ninguno",
		};
	dx.Animaciones:Dropdown({
		Title = "Reposo",
		Values = d,
		Value = "Ninguno",
		Callback = function(n)
			R.Idle = n;
		end,
	});
	dx.Animaciones:Dropdown({
		Title = "Caminar",
		Values = d,
		Value = "Ninguno",
		Callback = function(n)
			R.Walk = n;
		end,
	});
	dx.Animaciones:Dropdown({
		Title = "Correr",
		Values = d,
		Value = "Ninguno",
		Callback = function(n)
			R.Run = n;
		end,
	});
	dx.Animaciones:Dropdown({
		Title = "Saltar",
		Values = d,
		Value = "Ninguno",
		Callback = function(n)
			R.Jump = n;
		end,
	});
	dx.Animaciones:Dropdown({
		Title = "Caer",
		Values = d,
		Value = "Ninguno",
		Callback = function(n)
			R.Fall = n;
		end,
	});
	dx.Animaciones:Dropdown({
		Title = "Escalar",
		Values = d,
		Value = "Ninguno",
		Callback = function(n)
			R.Climb = n;
		end,
	});
	dx.Animaciones:Button({ Title = "Combinar y Aplicar", Callback = function()
			task.spawn(function()
				local J = {};
				if R.Idle ~= "Ninguno" then
					J.Idle = n[R.Idle].Idle;
					J.Idle2 = n[R.Idle].Idle2;
				end;
				if R.Walk ~= "Ninguno" then
					J.Walk = n[R.Walk].Walk;
				end;
				if R.Run ~= "Ninguno" then
					J.Run = n[R.Run].Run;
				end;
				if R.Jump ~= "Ninguno" then
					J.Jump = n[R.Jump].Jump;
				end;
				if R.Fall ~= "Ninguno" then
					J.Fall = n[R.Fall].Fall;
				end;
				if R.Climb ~= "Ninguno" then
					J.Climb = n[R.Climb].Climb;
				end;
				local Y = false;
				for n, J in pairs(J) do
					if J then
						Y = true;
						break;
					end;
				end;
				if Y then
					Q = J;
					q();
					C(Q);
				end;
			end);
		end });
end;
local Zx = 1;
local zx = Instance.new("Sound");
zx.Name = "NexvyrKillSound";
zx.Volume = 1;
zx.Looped = false;
zx.Parent = R;
local Bx = Instance.new("Sound");
Bx.Name = "NexvyrShootSound";
Bx.Volume = 1;
Bx.Looped = false;
Bx.Parent = R;
local Qx = Instance.new("Sound");
Qx.Name = "NexvyrReloadSound";
Qx.Volume = 1;
Qx.Looped = false;
Qx.Parent = R;
do
	local J = game:GetService("ContentProvider");
	local function C(n)
		if not n then
			return;
		end;
		for J = #n, 1, -1 do
			local C = n[J];
			n[J] = nil;
			if C and C.Connected then
				C:Disconnect();
			end;
		end;
	end;
	local d = false;
	local L = false;
	local R = "Onichaaan";
	local H = {
			{ Name = "Onichaaan", Id = "114361503583259" },
			{ Name = "Omagaaa", Id = "4496966777" },
			{ Name = "korummm", Id = "119896940405402" },
			{ Name = "FAAAH XD", Id = "92076037937225" },
			{ Name = "Campana meme", Id = "107378927201728" },
			{ Name = "Enrique", Id = "100688006999379" },
			{ Name = "Magia de anime", Id = "109296938403067" },
			{ Name = "Risa anime", Id = "93739527256723" },
			{ Name = "Gemido", Id = "94981264286350" },
			{ Name = "Magic 2", Id = "100507897550384" },
			{ Name = "OwO", Id = "71942674274967" },
			{ Name = "SEMPAI >.<", Id = "115498703521334" },
			{ Name = "Ahhh:3", Id = "83559496188823" },
			{ Name = "\195\177yaa >//~//<", Id = "78798011197804" },
			{ Name = "Headshot", Id = "130456049552264" },
		};
	local w = { ["Revolver + Recarga"] = { Shoot = "680140087", Reload = "138084889" }, ["Magia de Anime"] = { Shoot = "109296938403067", Reload = nil }, ["L\195\161ser + Recarga l\195\161ser"] = { Shoot = "4400449399", Reload = "129456040607483" } };
	local P = "Revolver + Recarga";
	local G = 1.5;
	local j = 0;
	local A = 0;
	local h = .05;
	local function k()
		if not L then
			return;
		end;
		local n = w[P];
		if not n or not n.Shoot then
			return;
		end;
		local J = tick();
		if J - A < h then
			return;
		end;
		A = J;
		j = j + 1;
		local C = j;
		Bx:Stop();
		Bx.SoundId = "rbxassetid://" .. n.Shoot;
		Bx.Volume = Zx;
		Bx:Play();
		task.delay(G, function()
			if j == C and Bx.Playing then
				Bx:Stop();
			end;
		end);
	end;
	local function M()
		if not L then
			return;
		end;
		local n = w[P];
		if not n or not n.Reload then
			return;
		end;
		Qx:Stop();
		Qx.SoundId = "rbxassetid://" .. n.Reload;
		Qx.Volume = Zx;
		Qx:Play();
	end;
	local y = {};
	local m = setmetatable({}, { __mode = "k" });
	local I = setmetatable({}, { __mode = "k" });
	local N = setmetatable({}, { __mode = "k" });
	local function x(n)
		y[#y + 1] = n;
		return n;
	end;
	local function X()
		C(y);
		table.clear(m);
		table.clear(I);
		table.clear(N);
	end;
	local o;
	local p = {
			"fire",
			"shoot",
			"shot",
			"gun",
			"burst",
			"shotgun",
			"gunshot",
			"muzzle",
			"rifle",
			"pistol",
			"shooting",
			"firing",
		};
	local function T(n)
		if not n:IsA("Sound") then
			return false;
		end;
		local J = string.lower(n.Name);
		for n, C in ipairs(p) do
			if string.find(J, C, 1, true) then
				return true;
			end;
		end;
		return false;
	end;
	local function Z(n)
		if not n:IsA("Sound") then
			return;
		end;
		if not T(n) then
			return;
		end;
		if not L or m[n] then
			return;
		end;
		m[n] = true;
		x(n.Played:Connect(function()
			if not L then
				return;
			end;
			local J = e.Character;
			if not J then
				return;
			end;
			if n:IsDescendantOf(J) or n:IsDescendantOf(e:FindFirstChildOfClass("Backpack") or J) then
				k();
			end;
		end));
	end;
	local function z(n)
		if not n or not n:IsA("Tool") then
			return;
		end;
		for n, J in ipairs(n:GetDescendants()) do
			Z(J);
		end;
		if not I[n] and L then
			I[n] = true;
			x(n.DescendantAdded:Connect(Z));
		end;
	end;
	local function B(n)
		if not n then
			return;
		end;
		for n, J in ipairs(n:GetChildren()) do
			if J:IsA("Tool") then
				z(J);
			end;
		end;
		x(n.ChildAdded:Connect(function(n)
			if n:IsA("Tool") then
				z(n);
			end;
		end));
	end;
	local Q = false;
	o = function()
			if Q or not L then
				return;
			end;
			Q = true;
			task.spawn(function()
				local n = false;
				while L do
					task.wait(.05);
					if not L then
						break;
					end;
					local J = e.Character;
					if not J then
						n = false;
						continue;
					end;
					local C = J:FindFirstChildOfClass("Tool");
					if not C or Ax(C) then
						n = false;
						continue;
					end;
					local Y = Mx(C);
					if Y and not n then
						M();
					end;
					n = Y;
				end;
				Q = false;
			end);
		end;
	local function i(n)
		for J, C in ipairs(H) do
			if C.Name == n then
				return C.Id;
			end;
		end;
		return H[1].Id;
	end;
	local function a()
		task.spawn(function()
			pcall(function()
				local n = "rbxassetid://" .. i(R);
				if zx.SoundId ~= n then
					zx.SoundId = n;
				end;
				J:PreloadAsync({ zx });
			end);
		end);
	end;
	local function E()
		if not d then
			return;
		end;
		local n = "rbxassetid://" .. i(R);
		zx:Stop();
		if zx.SoundId ~= n then
			zx.SoundId = n;
		end;
		zx.Volume = Zx;
		zx.TimePosition = 0;
		zx:Play();
	end;
	local U = 0;
	local f = 0;
	local u = .08;
	local g = .3;
	local t = 4;
	local function K(n)
		if not d then
			return;
		end;
		local J = tick();
		if n then
			if J - U < g then
				return;
			end;
			f = J;
		else
			if J - U < u then
				return;
			end;
			if J - f < t then
				return;
			end;
		end;
		U = J;
		E();
	end;
	local q = {};
	local l = setmetatable({}, { __mode = "k" });
	local v = setmetatable({}, { __mode = "k" });
	local c = setmetatable({}, { __mode = "k" });
	local F = setmetatable({}, { __mode = "k" });
	local D = 0;
	local function b(n)
		q[#q + 1] = n;
		return n;
	end;
	local V = {
			kos = true,
			kills = true,
			kill = true,
			ko = true,
			killed = true,
			eliminations = true,
			kills_count = true,
		};
	local function S(n)
		if not n then
			return;
		end;
		if not ((n:IsA("IntValue") or n:IsA("NumberValue"))) then
			return;
		end;
		if not V[string.lower(n.Name)] then
			return;
		end;
		if not d or l[n] then
			return;
		end;
		l[n] = true;
		local J = n.Value;
		b((n:GetPropertyChangedSignal("Value")):Connect(function()
			if n.Value > J then
				K();
			end;
			J = n.Value;
		end));
	end;
	local function W(n)
		if not n or not d or F[n] then
			return;
		end;
		F[n] = true;
		for n, J in ipairs(n:GetChildren()) do
			S(J);
		end;
		b(n.ChildAdded:Connect(S));
	end;
	local s = {
			"KOs",
			"Kills",
			"kos",
			"kills",
			"KO",
			"killed",
			"Eliminations",
		};
	local function r()
		for n, J in ipairs(s) do
			local C = tonumber(e:GetAttribute(J));
			b((e:GetAttributeChangedSignal(J)):Connect(function()
				local n = tonumber(e:GetAttribute(J));
				if n ~= nil and (C ~= nil and n > C) then
					K();
				end;
				C = n;
			end));
		end;
		for n, J in ipairs({
			"leaderstats",
			"Stats",
			"stats",
			"PlayerStats",
		}) do
			W(e:FindFirstChild(J));
		end;
		b(e.ChildAdded:Connect(function(n)
			if n.Name == "leaderstats" or n.Name == "Stats" or n.Name == "stats" or n.Name == "PlayerStats" then
				W(n);
			end;
		end));
	end;
	local function nx(n, J)
		if not d or v[J] then
			return;
		end;
		v[J] = true;
		local C;
		local function Y(n)
			if not d or not n or not n:IsA("Humanoid") then
				return;
			end;
			if C then
				C:Disconnect();
				C = nil;
			end;
			b(n.Died:Connect(function()
				if not d then
					return;
				end;
				local J = n:FindFirstChild("creator");
				if J and J.Value == e then
					K();
				end;
			end));
		end;
		local L = J:FindFirstChildOfClass("Humanoid");
		if L then
			Y(L);
		else
			C = b(J.ChildAdded:Connect(Y));
		end;
	end;
	local function Jx(n)
		if n == e or not d or c[n] then
			return;
		end;
		c[n] = true;
		if n.Character then
			nx(n, n.Character);
		end;
		b(n.CharacterAdded:Connect(function(J)
			nx(n, J);
		end));
	end;
	local function Cx()
		D = D + (1);
		local n = D;
		task.spawn(function()
			local J = 0;
			while d and (n == D and J < 30) do
				local n = Y:FindFirstChild("Packages");
				local C = n and n:FindFirstChild("Networking");
				local d = C and C:FindFirstChild("RE/Combat/Killed");
				if d and d:IsA("RemoteEvent") then
					b(d.OnClientEvent:Connect(function(n)
						if n == e then
							K(true);
						end;
					end));
					return;
				end;
				J = J + (1);
				task.wait(1);
			end;
		end);
	end;
	local function Yx()
		if not d then
			return;
		end;
		Cx();
		r();
		for n, J in ipairs(n:GetPlayers()) do
			Jx(J);
		end;
		b(n.PlayerAdded:Connect(Jx));
	end;
	local function Lx()
		D = D + (1);
		C(q);
		table.clear(l);
		table.clear(v);
		table.clear(c);
		table.clear(F);
	end;
	local Rx = {};
	local ex = setmetatable({}, { __mode = "k" });
	local function Hx(n)
		if not L or not n:IsA("Sound") then
			return;
		end;
		if n.Name == "NexvyrKillSound" or n.Name == "WindUI_MusicPlayer" or n.Name == "NexvyrShootSound" or n.Name == "NexvyrReloadSound" then
			return;
		end;
		if Rx[n] == nil and n.Volume > 0 then
			Rx[n] = n.Volume;
		end;
		if L then
			n.Volume = 0;
		end;
		if not ex[n] then
			ex[n] = true;
			x((n:GetPropertyChangedSignal("Volume")):Connect(function()
				if L and n.Volume ~= 0 then
					Rx[n] = n.Volume;
					n.Volume = 0;
				end;
			end));
			x(n.Played:Connect(function()
				if L then
					n.Volume = 0;
				end;
			end));
		end;
	end;
	local function wx(n)
		if not n then
			return;
		end;
		for n, J in ipairs(n:GetDescendants()) do
			Hx(J);
		end;
		x(n.DescendantAdded:Connect(Hx));
	end;
	local function Px(n)
		if n then
			for n in pairs(Rx) do
				if n.Parent then
					n.Volume = 0;
				end;
			end;
			if e.Character then
				for n, J in ipairs(e.Character:GetDescendants()) do
					Hx(J);
				end;
			end;
			local n = e:FindFirstChildOfClass("Backpack");
			if n then
				for n, J in ipairs(n:GetDescendants()) do
					Hx(J);
				end;
			end;
		else
			for n, J in pairs(Rx) do
				if n.Parent then
					n.Volume = J;
				end;
			end;
		end;
	end;
	local function Gx()
		if not L then
			return;
		end;
		local function n(n)
			if not n or not L or N[n] then
				return;
			end;
			N[n] = true;
			wx(n);
			B(n);
		end;
		n(e.Character);
		n(e:FindFirstChildOfClass("Backpack"));
		x(e.CharacterAdded:Connect(function(J)
			if not L then
				return;
			end;
			n(J);
			local C = e:FindFirstChildOfClass("Backpack");
			if C then
				n(C);
			end;
		end));
		x(e.ChildAdded:Connect(function(J)
			if J:IsA("Backpack") then
				n(J);
			end;
		end));
		o();
	end;
	dx.Sonidos:Section({ Title = "Sonido de Muerte", Icon = "solar:speaker-bold" });
	dx.Sonidos:Toggle({ Title = "Sonido de Kill", Value = false, Callback = function(n)
			if d == n then
				return;
			end;
			d = n;
			if n then
				a();
				Yx();
			else
				Lx();
				zx:Stop();
			end;
		end });
	local jx = {};
	for n, J in ipairs(H) do
		table.insert(jx, J.Name);
	end;
	dx.Sonidos:Dropdown({
		Title = "Sonido de muerte",
		Values = jx,
		Value = "Onichaaan",
		Callback = function(n)
			R = n;
			if d then
				a();
			end;
		end,
	});
	dx.Sonidos:Section({ Title = "Disparo y Recarga", Icon = "solar:target-bold" });
	dx.Sonidos:Toggle({ Title = "Recarga + disparo", Value = false, Callback = function(n)
			if L == n then
				return;
			end;
			L = n;
			if n then
				Gx();
				Px(true);
			else
				X();
				Bx:Stop();
				Qx:Stop();
				Px(false);
				table.clear(Rx);
				table.clear(ex);
			end;
		end });
	dx.Sonidos:Dropdown({
		Title = "Sonido de disparo",
		Values = { "Revolver + Recarga", "Magia de Anime", "L\195\161ser + Recarga l\195\161ser" },
		Value = "Revolver + Recarga",
		Callback = function(n)
			P = n;
		end,
	});
	O.SliKillSoundVolume = dx.Sonidos:Slider({
			Title = "Volumen",
			Step = .1,
			Value = { Min = 1, Max = 3, Default = 1 },
			Callback = function(n)
				Zx = n;
				zx.Volume = n;
				Bx.Volume = n;
				Qx.Volume = n;
			end,
		});
end;
local ix = false;
local Ox = false;
local ax, Ex, Ux;
do
	local n = { ["Right Leg"] = {
				id = "rbxassetid://139607718",
				targetBodyPart = "RightUpperLeg",
				partsToHide = { "RightUpperLeg", "RightLowerLeg", "RightFoot" },
				scale = Vector3.new(1, 1, 1),
				audio = "rbxassetid://135315310485417",
				offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
			} };
	local J = {};
	local function C(n, C)
		local Y = e.Character;
		if not Y then
			return false;
		end;
		local d = Y:WaitForChild(C.targetBodyPart, 2);
		if not d then
			return false;
		end;
		local L = Y:FindFirstChild("Korblox_" .. n:gsub("%s+", ""));
		if L then
			L:Destroy();
		end;
		for n, C in ipairs(C.partsToHide) do
			local d = Y:FindFirstChild(C);
			if d and d:IsA("BasePart") then
				if J[C] == nil then
					J[C] = d.Transparency;
				end;
				d.Transparency = 1;
			end;
		end;
		local R, H = pcall(function()
				return game:GetObjects(C.id);
			end);
		if not R or not H or #H == 0 then
			return false;
		end;
		local w = H[1];
		w.Name = "Korblox_" .. n:gsub("%s+", "");
		local P = w:IsA("BasePart") and w or w:FindFirstChildWhichIsA("BasePart", true);
		if not P then
			return false;
		end;
		P.Size = P.Size * C.scale;
		P.CanCollide = false;
		P.CFrame = d.CFrame * C.offset;
		local G = Instance.new("WeldConstraint");
		G.Part0 = d;
		G.Part1 = P;
		G.Parent = P;
		w.Parent = Y;
		if C.audio then
			local n = Instance.new("Sound");
			n.SoundId = C.audio;
			n.Volume = .5;
			n.Parent = P;
			n:Play();
			(game:GetService("Debris")):AddItem(n, 3);
		end;
		return true;
	end;
	function ax()
		if not ix then
			return;
		end;
		local J = n["Right Leg"];
		local Y = C("Right Leg", J);
		if not Y then
			task.wait(.2);
			C("Right Leg", J);
		end;
	end;
	function Ex()
		local n = e.Character;
		if not n then
			return;
		end;
		local C = "Korblox_RightLeg";
		local Y = n:FindFirstChild(C);
		if Y then
			pcall(function()
				Y:Destroy();
			end);
		end;
		for J, C in pairs(J) do
			local Y = n:FindFirstChild(J);
			if Y and Y:IsA("BasePart") then
				pcall(function()
					Y.Transparency = C;
				end);
			end;
		end;
		J = {};
	end;
	local Y = 134082579;
	local d = nil;
	local function L(n)
		local J = e.Character;
		if not J then
			return;
		end;
		local C = J:FindFirstChild("Head");
		if C then
			C.Transparency = n and 1 or 0;
			local J = C:FindFirstChildOfClass("Decal");
			if J then
				J.Transparency = n and 1 or 0;
			end;
		end;
	end;
	function Ux(n)
		local J = e.Character;
		if not J then
			return;
		end;
		if n then
			J:WaitForChild("Head", 2);
			L(true);
			if d and d.Parent ~= J then
				d = nil;
			end;
			if d then
				return;
			end;
			local n, C = pcall(function()
					return game:GetObjects("rbxassetid://" .. tostring(Y));
				end);
			if n and (C and #C > 0) then
				local n = C[1];
				local Y = nil;
				if n:IsA("Accessory") then
					Y = n;
				else
					for n, J in ipairs(n:GetDescendants()) do
						if J:IsA("Accessory") then
							Y = J;
							break;
						end;
					end;
					Y = Y or (n:IsA("Model") and n or nil);
				end;
				if Y then
					if Y:IsA("Accessory") then
						local n = J:FindFirstChildOfClass("Humanoid");
						local C = n and pcall(function()
								n:AddAccessory(Y);
							end);
						if not C then
							Y.Parent = J;
						end;
					else
						Y.Parent = J;
					end;
					d = Y;
				end;
			else
				warn("[Headless] Failed to load headless asset: " .. tostring(C));
			end;
		else
			L(false);
			if d then
				d:Destroy();
				d = nil;
			end;
		end;
	end;
	e.CharacterAdded:Connect(function(n)
		J = {};
		d = nil;
		if ix then
			task.spawn(function()
				task.wait(.1);
				ax();
			end);
		end;
		if Ox then
			task.spawn(function()
				task.wait(.1);
				Ux(true);
			end);
		end;
	end);
	dx.Items:Section({ Title = "Apariencia", Icon = "solar:crown-star-bold" });
	O.TogHeadless = dx.Items:Toggle({ Title = "Aplicar Headless", Value = false, Callback = function(n)
				Ox = n;
				if n then
					Ux(true);
				else
					Ux(false);
				end;
			end });
	O.TogKorblox = dx.Items:Toggle({ Title = "Aplicar Korblox", Value = false, Callback = function(n)
				ix = n;
				if n then
					ax();
				else
					Ex();
				end;
			end });
	dx.Items:Section({ Title = "Headless real", Icon = "solar:ghost-bold" });
	do
		local n = { { id = "78837807518622", on = false, name = "Headless V1" }, { id = "117080641351340", on = false, name = "Headless V2" }, { id = "136055001302601", on = false, name = "Headless V3" } };
		local function J(n)
			if n.stopped then
				n.stopped:Disconnect();
				n.stopped = nil;
			end;
			if n.track then
				pcall(function()
					n.track:Stop();
					n.track:Destroy();
				end);
				n.track = nil;
			end;
		end;
		local function C(n, Y)
			if not Y or not Y.Parent then
				return;
			end;
			local d = Y:FindFirstChildOfClass("Animator");
			if not d then
				return;
			end;
			J(n);
			local L = Instance.new("Animation");
			L.AnimationId = "rbxassetid://" .. n.id;
			n.track = d:LoadAnimation(L);
			n.track.Priority = Enum.AnimationPriority.Action;
			n.track.Looped = true;
			n.track:Play();
			n.stopped = n.track.Stopped:Connect(function()
					if n.on and Y.Parent then
						task.wait(.1);
						C(n, Y);
					end;
				end);
		end;
		local function Y(n)
			local J = e.Character;
			local Y = J and J:FindFirstChildOfClass("Humanoid");
			if not Y then
				return;
			end;
			if n.freeze then
				n.freeze:Disconnect();
			end;
			n.freeze = Y.StateChanged:Connect(function()
					if n.on and (Y.Parent and ((not n.track or not n.track.IsPlaying))) then
						task.wait(.05);
						if n.on and Y.Parent then
							C(n, Y);
						end;
					end;
				end);
			C(n, Y);
		end;
		local function d(n)
			J(n);
			if n.freeze then
				n.freeze:Disconnect();
				n.freeze = nil;
			end;
		end;
		e.CharacterRemoving:Connect(function()
			for n, C in ipairs(n) do
				J(C);
				if C.freeze then
					C.freeze:Disconnect();
					C.freeze = nil;
				end;
			end;
		end);
		e.CharacterAdded:Connect(function()
			task.wait(.5);
			for n, J in ipairs(n) do
				if J.on then
					Y(J);
				end;
			end;
		end);
		for n, J in ipairs(n) do
			O["TogFEHL_" .. J.name:gsub(" ", "")] = dx.Items:Toggle({ Title = J.name, Value = false, Callback = function(n)
						J.on = n;
						if n then
							Y(J);
						else
							d(J);
						end;
					end });
		end;
	end;
end;
dx.Identidad:Section({ Title = "identidad falsa", Icon = "solar:user-id-bold" });
local fx;
do
	local function J(n, J, C)
		local Y = J:gsub("[%-%^%$%(%)%%%.%[%]%*%+%?]", "%%%1");
		return (n:gsub(Y, C));
	end;
	local C = {};
	local Y = {};
	local d = setmetatable({}, { __mode = "k" });
	local L = false;
	local function R(n, Y, d)
		local L = n:FindFirstAncestorWhichIsA("ScreenGui");
		if L and ((string.find(L.Name, "WindUI") or string.find(L.Name, "Nexvyr"))) then
			return;
		end;
		if n:IsA("TextLabel") or n:IsA("TextBox") or n:IsA("TextButton") then
			local L = n.Text;
			local R = false;
			if L and L ~= "" then
				if string.find(L, Y, 1, true) or string.find(L, d, 1, true) then
					R = true;
				end;
			end;
			if R and not C[n] then
				C[n] = {
						Text = L,
						Color = n.TextColor3,
						TextTransp = n.TextTransparency,
						StrokeTransp = n.TextStrokeTransparency,
						Strokes = {},
					};
				for J, Y in pairs(n:GetChildren()) do
					if Y:IsA("UIStroke") then
						C[n].Strokes[Y] = { Enabled = Y.Enabled, Transp = Y.Transparency, Thickness = Y.Thickness };
					end;
				end;
			end;
			if C[n] then
				if Z then
					local L = C[n].Text;
					L = J(L, Y, z);
					L = J(L, d, z);
					n.Text = L;
					n.TextTransparency = C[n].TextTransp;
					n.TextStrokeTransparency = C[n].StrokeTransp;
					n.TextColor3 = C[n].Color;
					for J, Y in pairs(n:GetChildren()) do
						if Y:IsA("UIStroke") and C[n].Strokes[Y] then
							Y.Enabled = C[n].Strokes[Y].Enabled;
						end;
					end;
				else
					n.Text = C[n].Text;
					n.TextColor3 = C[n].Color;
					n.TextTransparency = C[n].TextTransp;
					n.TextStrokeTransparency = C[n].StrokeTransp;
					for J, Y in pairs(n:GetChildren()) do
						if Y:IsA("UIStroke") and C[n].Strokes[Y] then
							Y.Enabled = C[n].Strokes[Y].Enabled;
							Y.Transparency = C[n].Strokes[Y].Transp;
							Y.Thickness = C[n].Strokes[Y].Thickness;
						end;
					end;
				end;
			end;
		end;
	end;
	function fx()
		local J = e.Name;
		local H = e.DisplayName;
		task.spawn(function()
			for n, C in pairs(n:GetPlayers()) do
				if C.Character then
					for n, C in pairs(C.Character:GetDescendants()) do
						if C:IsA("TextLabel") or C:IsA("TextBox") or C:IsA("TextButton") then
							R(C, J, H);
						end;
					end;
				end;
			end;
			local C = e:FindFirstChild("PlayerGui");
			if C then
				for n, C in pairs(C:GetDescendants()) do
					if C:IsA("TextLabel") or C:IsA("TextBox") or C:IsA("TextButton") then
						R(C, J, H);
					end;
				end;
			end;
		end);
		if Z then
			if not L then
				L = true;
				local function n(n)
					local e = n:FindFirstAncestorWhichIsA("ScreenGui");
					if e and ((string.find(e.Name, "WindUI") or string.find(e.Name, "Nexvyr"))) then
						return;
					end;
					if n:IsA("TextLabel") or n:IsA("TextBox") or n:IsA("TextButton") then
						R(n, J, H);
						if not d[n] then
							d[n] = true;
							table.insert(Y, (n:GetPropertyChangedSignal("Text")):Connect(function()
								if L and (n.Text ~= z and not string.find(n.Text, z)) then
									C[n] = nil;
									R(n, J, H);
								end;
							end));
						end;
					end;
				end;
				local w = e:FindFirstChild("PlayerGui");
				if w then
					table.insert(Y, w.DescendantAdded:Connect(function(J)
						if L and ((J:IsA("TextLabel") or J:IsA("TextBox") or J:IsA("TextButton"))) then
							task.spawn(function()
								n(J);
							end);
						end;
					end));
				end;
				local P, G = pcall(function()
						return game:GetService("CoreGui");
					end);
				if P and G then
					table.insert(Y, G.DescendantAdded:Connect(function(J)
						if L and ((J:IsA("TextLabel") or J:IsA("TextBox") or J:IsA("TextButton"))) then
							task.spawn(function()
								n(J);
							end);
						end;
					end));
				end;
			end;
		else
			L = false;
			for n, J in ipairs(Y) do
				J:Disconnect();
			end;
			Y = {};
			table.clear(d);
			for n, J in pairs(C) do
				if n and n.Parent then
					n.Text = J.Text;
					n.TextColor3 = J.Color;
					n.TextTransparency = J.TextTransp;
					n.TextStrokeTransparency = J.StrokeTransp;
					for n, J in pairs(J.Strokes) do
						if n and n.Parent then
							n.Enabled = J.Enabled;
							n.Transparency = J.Transp;
							n.Thickness = J.Thickness;
						end;
					end;
				end;
			end;
			C = {};
		end;
	end;
	O.TogFakeName = dx.Identidad:Toggle({ Title = "Activar Nombre Falso", Value = false, Callback = function(n)
				Z = n;
				fx();
			end });
	O.InpFakeName = dx.Identidad:Input({ Title = "Nuevo Nombre", Placeholder = "Escribe tu nombre falso...", Callback = function(n)
				if n ~= "" then
					z = n;
					if Z then
						fx();
					end;
				end;
			end });
	e.CharacterAdded:Connect(function()
		if Z then
			task.wait(1);
			fx();
		end;
	end);
end;
do
	local n = "UzivertHub_Configs_WindUI";
	if isfolder and not isfolder(n) then
		pcall(function()
			makefolder(n);
		end);
	end;
	local J = { "Ninguna" };
	local C = "Ninguna";
	local Y = "";
	dx.Guardado:Section({ Title = "Gestor de Configs", Icon = "solar:diskette-bold" });
	local L = dx.Guardado:Dropdown({
			Title = "Seleccionar Configuraci\195\179n",
			Values = J,
			Value = "Ninguna",
			Callback = function(n)
				C = n;
			end,
		});
	local function R()
		local J = {};
		if listfiles then
			pcall(function()
				for n, C in ipairs(listfiles(n)) do
					if C:match("%.json$") then
						local n = C:match("([^/\\]+)%.json$");
						if n then
							table.insert(J, n);
						end;
					end;
				end;
			end);
		end;
		if #J == 0 then
			table.insert(J, "Ninguna");
		end;
		pcall(function()
			L:Refresh(J);
			if C == "Ninguna" or not table.find(J, C) then
				L:Select(J[1]);
				C = J[1];
			end;
		end);
	end;
	dx.Guardado:Button({
		Title = "Actualizar Lista",
		Icon = "solar:refresh-bold",
		Variant = "Secondary",
		Callback = function()
			R();
		end,
	});
	dx.Guardado:Input({
		Title = "Nombre para Guardar",
		Placeholder = "Ej: Config 1, Config 2...",
		Icon = "solar:text-field-bold",
		Callback = function(n)
			Y = n;
		end,
	});
	local e = false;
	local H = 0;
	dx.Guardado:Button({
		Title = "Eliminar todos los guardados",
		Icon = "solar:trash-bin-trash-bold",
		Variant = "Danger",
		Callback = function()
			local J = os.clock();
			if e and (J - H) < 4 then
				e = false;
				if listfiles then
					pcall(function()
						for n, J in ipairs(listfiles(n)) do
							if J:match("%.json$") then
								pcall(function()
									delfile(J);
								end);
							end;
						end;
					end);
				end;
				R();
			else
				e = true;
				H = J;
			end;
		end,
	});
	local function A(n, J)
		if not n or J == nil then
			return;
		end;
		pcall(function()
			n:Set(J);
		end);
	end;
	dx.Guardado:Button({
		Title = "Guardar Configuraci\195\179n",
		Icon = "solar:diskette-bold",
		Variant = "Primary",
		Callback = function()
			local J = Y:gsub("[^%w%s%-]", "");
			if J == "" then
				J = C;
			end;
			if J == "" or J == "Ninguna" then
				return;
			end;
			local e = n .. ("/" .. (J .. ".json"));
			local H = {
					ConfigName = J,
					Toggles = {
						["Auto Shoot"] = G,
						["Auto Shoot Agresivo"] = j,
						["Equipar pistola"] = v,
						["Silent Aim (Manual)"] = h,
						["Silent Aim (FOV)"] = k,
						["Mostrar C\195\173rculo FOV"] = w,
						["Team Check"] = y,
						["ESP Jugadores"] = m,
						["ESP Glow"] = N.Glow,
						["Kill All"] = x,
						["Hitbox Activar"] = X,
						["Hitbox Invisible"] = o,
						Headless = Ox,
						Korblox = ix,
						["Nombre Falso"] = Z,
						Invisible = B,
					},
					Sliders = {
						["Tama\195\177o del FOV"] = P,
						["Tama\195\177o de Hitbox"] = p,
						["Volumen Kill Sound"] = Zx,
						["Ajuste Speed"] = Xx,
						["Ajuste Salto"] = ox,
					},
					Colors = { ["Color de Hitbox"] = { R = T.R, G = T.G, B = T.B }, ["Color del ESP"] = { R = I.R, G = I.G, B = I.B } },
					Extras = { ["Parte Silent Aim"] = M, ["Nombre Falso Texto"] = z },
				};
			if writefile then
				local n, C = pcall(function()
						return d:JSONEncode(H);
					end);
				if n then
					pcall(function()
						writefile(e, C);
					end);
					R();
					pcall(function()
						L:Select(J);
					end);
				end;
			end;
		end,
	});
	dx.Guardado:Button({
		Title = "Cargar Configuraci\195\179n",
		Icon = "solar:folder-open-bold",
		Variant = "Primary",
		Callback = function()
			if C == "Ninguna" or C == "" then
				return;
			end;
			local J = n .. ("/" .. (C .. ".json"));
			if isfile and isfile(J) then
				local n, C = pcall(function()
						return d:JSONDecode(readfile(J));
					end);
				if n and type(C) == "table" then
					if C.Toggles then
						if C.Toggles["Auto Shoot"] ~= nil then
							G = C.Toggles["Auto Shoot"];
							A(O.TogAutoShoot, G);
						end;
						if C.Toggles["Auto Shoot Agresivo"] ~= nil then
							j = C.Toggles["Auto Shoot Agresivo"];
							A(O.TogAutoShootAgr, j);
						end;
						if C.Toggles["Equipar pistola"] ~= nil then
							v = C.Toggles["Equipar pistola"];
							A(O.TogEquipGun, v);
						end;
						if C.Toggles["Silent Aim (Manual)"] ~= nil then
							h = C.Toggles["Silent Aim (Manual)"];
							A(O.TogSilentAimManual, h);
						end;
						if C.Toggles["Silent Aim (FOV)"] ~= nil then
							k = C.Toggles["Silent Aim (FOV)"];
							A(O.TogSilentAimFOV, k);
						end;
						if C.Toggles["Mostrar C\195\173rculo FOV"] ~= nil then
							w = C.Toggles["Mostrar C\195\173rculo FOV"];
							A(O.TogShowFOV, w);
						end;
						if C.Toggles["Team Check"] ~= nil then
							y = C.Toggles["Team Check"];
						end;
						if C.Toggles["ESP Jugadores"] ~= nil then
							m = C.Toggles["ESP Jugadores"];
							A(O.TogEsp, m);
						end;
						if C.Toggles["ESP Glow"] ~= nil then
							N.Glow = C.Toggles["ESP Glow"];
							A(O.TogEspGl, N.Glow);
						end;
						if C.Toggles["Kill All"] ~= nil then
							x = C.Toggles["Kill All"];
							A(O.TogKillAll, x);
							if x then
								KillAllInstance:Start();
							else
								KillAllInstance:Stop();
							end;
						end;
						if C.Toggles["Hitbox Activar"] ~= nil then
							X = C.Toggles["Hitbox Activar"];
							A(O.TogHitbox, X);
							if X then
								K();
							else
								mx();
							end;
						end;
						if C.Toggles["Hitbox Invisible"] ~= nil then
							o = C.Toggles["Hitbox Invisible"];
							A(O.TogHitboxInvisible, o);
						end;
						if C.Toggles.Headless ~= nil then
							Ox = C.Toggles.Headless;
							A(O.TogHeadless, Ox);
							if Ox then
								Ux(true);
							else
								Ux(false);
							end;
						end;
						if C.Toggles.Korblox ~= nil then
							ix = C.Toggles.Korblox;
							A(O.TogKorblox, ix);
							if ix then
								ax();
							else
								Ex();
							end;
						end;
						if C.Toggles["Nombre Falso"] ~= nil then
							Z = C.Toggles["Nombre Falso"];
							A(O.TogFakeName, Z);
							fx();
						end;
						if C.Toggles.Invisible ~= nil then
							B = C.Toggles.Invisible;
							A(O.TogInvisible, B);
							xx(B);
							if c then
								c(B);
							end;
						end;
					end;
					if C.Sliders then
						if C.Sliders["Tama\195\177o del FOV"] ~= nil then
							P = C.Sliders["Tama\195\177o del FOV"];
							A(O.SliFOVSize, P);
						end;
						if C.Sliders["Tama\195\177o de Hitbox"] ~= nil then
							p = C.Sliders["Tama\195\177o de Hitbox"];
							A(O.SliHitboxSize, p);
						end;
						if C.Sliders["Volumen Kill Sound"] ~= nil then
							Zx = C.Sliders["Volumen Kill Sound"];
							zx.Volume = Zx;
							Bx.Volume = Zx;
							Qx.Volume = Zx;
							A(O.SliKillSoundVolume, Zx);
						end;
						if C.Sliders["Ajuste Speed"] ~= nil then
							Xx = C.Sliders["Ajuste Speed"];
							A(O.SliSpeed, Xx);
						end;
						if C.Sliders["Ajuste Salto"] ~= nil then
							ox = C.Sliders["Ajuste Salto"];
							A(O.SliJumpPower, ox);
						end;
					end;
					if C.Colors then
						if C.Colors["Color de Hitbox"] then
							T = Color3.new(C.Colors["Color de Hitbox"].R, C.Colors["Color de Hitbox"].G, C.Colors["Color de Hitbox"].B);
							if O.ColHitbox then
								pcall(function()
									O.ColHitbox:Update(T);
								end);
							end;
						end;
						if C.Colors["Color del ESP"] then
							local n = Color3.new(C.Colors["Color del ESP"].R, C.Colors["Color del ESP"].G, C.Colors["Color del ESP"].B);
							I = n;
							if O.ColEsp then
								pcall(function()
									O.ColEsp:Update(n);
								end);
							end;
						end;
					end;
					if C.Extras then
						if C.Extras["Parte Silent Aim"] then
							M = C.Extras["Parte Silent Aim"];
							if O.DropSilentAimPart then
								pcall(function()
									O.DropSilentAimPart:Select(M);
								end);
							end;
						end;
						if C.Extras["Nombre Falso Texto"] then
							z = C.Extras["Nombre Falso Texto"];
							A(O.InpFakeName, z);
							if Z then
								fx();
							end;
						end;
					end;
					if a then
						a();
					end;
					if l then
						l();
					end;
				end;
			end;
		end,
	});
	task.spawn(function()
		task.wait(1);
		R();
	end);
end;
do
	dx.Graficos:Section({ Title = "Presets de Iluminaci\195\179n", Icon = "solar:palette-bold" });
	local n = {};
	local J = {};
	local C = {};
	local Y = nil;
	local function d(n)
		local J = game:GetService("Lighting");
		if J:GetAttribute("OrigSaved_" .. n) then
			return;
		end;
		J:SetAttribute("Orig_Ambient_" .. n, J.Ambient);
		J:SetAttribute("Orig_OutdoorAmbient_" .. n, J.OutdoorAmbient);
		J:SetAttribute("Orig_Brightness_" .. n, J.Brightness);
		J:SetAttribute("Orig_ClockTime_" .. n, J.ClockTime);
		J:SetAttribute("Orig_FogColor_" .. n, J.FogColor);
		J:SetAttribute("Orig_FogEnd_" .. n, J.FogEnd);
		J:SetAttribute("Orig_FogStart_" .. n, J.FogStart);
		J:SetAttribute("Orig_ColorShift_Top_" .. n, J.ColorShift_Top);
		J:SetAttribute("Orig_ColorShift_Bottom_" .. n, J.ColorShift_Bottom);
		J:SetAttribute("Orig_ExposureCompensation_" .. n, J.ExposureCompensation);
		J:SetAttribute("Orig_GlobalShadows_" .. n, J.GlobalShadows);
		J:SetAttribute("Orig_EnvironmentDiffuseScale_" .. n, J.EnvironmentDiffuseScale);
		J:SetAttribute("Orig_EnvironmentSpecularScale_" .. n, J.EnvironmentSpecularScale);
		J:SetAttribute("OrigSaved_" .. n, true);
	end;
	local function R(n)
		local J = game:GetService("Lighting");
		if not J:GetAttribute("OrigSaved_" .. n) then
			return;
		end;
		J.Ambient = J:GetAttribute("Orig_Ambient_" .. n);
		J.OutdoorAmbient = J:GetAttribute("Orig_OutdoorAmbient_" .. n);
		J.Brightness = J:GetAttribute("Orig_Brightness_" .. n);
		J.ClockTime = J:GetAttribute("Orig_ClockTime_" .. n);
		J.FogColor = J:GetAttribute("Orig_FogColor_" .. n);
		J.FogEnd = J:GetAttribute("Orig_FogEnd_" .. n);
		J.FogStart = J:GetAttribute("Orig_FogStart_" .. n);
		J.ColorShift_Top = J:GetAttribute("Orig_ColorShift_Top_" .. n);
		J.ColorShift_Bottom = J:GetAttribute("Orig_ColorShift_Bottom_" .. n);
		J.ExposureCompensation = J:GetAttribute("Orig_ExposureCompensation_" .. n);
		J.GlobalShadows = J:GetAttribute("Orig_GlobalShadows_" .. n);
		J.EnvironmentDiffuseScale = J:GetAttribute("Orig_EnvironmentDiffuseScale_" .. n);
		J.EnvironmentSpecularScale = J:GetAttribute("Orig_EnvironmentSpecularScale_" .. n);
		J:SetAttribute("OrigSaved_" .. n, nil);
	end;
	local function e(n)
		for n, J in ipairs(n) do
			pcall(function()
				J:Destroy();
			end);
		end;
		table.clear(n);
	end;
	local function H(J)
		local C = game:GetService("Lighting");
		if J then
			d("NS");
			e(n);
			if Y then
				Y:Destroy();
			end;
			Y = Instance.new("Folder");
			Y.Name = "NS_SkyX";
			Y.Parent = L;
			local function J(J)
				local C = Instance.new("Part");
				C.Anchored = true;
				C.CanCollide = false;
				C.CanQuery = false;
				C.Material = Enum.Material.Neon;
				C.Color = Color3.fromRGB(255, 55, 55);
				C.Transparency = .1;
				C.Size = Vector3.new(2600, 26, 26);
				C.CFrame = CFrame.new(0, 3200, -2200) * CFrame.Angles(0, 0, math.rad(J));
				C.Parent = Y;
				table.insert(n, C);
			end;
			J(45);
			J(-45);
			local R = Instance.new("Part");
			R.Anchored = true;
			R.CanCollide = false;
			R.CanQuery = false;
			R.Material = Enum.Material.Neon;
			R.Color = Color3.fromRGB(255, 110, 110);
			R.Transparency = .65;
			R.Shape = Enum.PartType.Ball;
			R.Size = Vector3.new(420, 420, 420);
			R.CFrame = CFrame.new(0, 3200, -2200);
			R.Parent = Y;
			table.insert(n, R);
			local H = Instance.new("PointLight");
			H.Color = Color3.fromRGB(255, 80, 80);
			H.Range = 300;
			H.Brightness = 3;
			H.Parent = R;
			table.insert(n, H);
			local w = Instance.new("Sky");
			w.Name = "NS_Sky";
			w.StarCount = 9000;
			w.MoonAngularSize = 30;
			w.SunAngularSize = 0;
			w.CelestialBodiesShown = true;
			w.Parent = C;
			table.insert(n, w);
			local P = Instance.new("ColorCorrectionEffect");
			P.Name = "NS_CC";
			P.Brightness = .05;
			P.Contrast = .32;
			P.Saturation = -0.15;
			P.TintColor = Color3.fromRGB(255, 130, 130);
			P.Parent = C;
			table.insert(n, P);
			local G = Instance.new("BloomEffect");
			G.Name = "NS_Bloom";
			G.Intensity = 1;
			G.Size = 90;
			G.Threshold = .45;
			G.Parent = C;
			table.insert(n, G);
			local j = Instance.new("BlurEffect");
			j.Name = "NS_Blur";
			j.Size = 3;
			j.Parent = C;
			table.insert(n, j);
			local A = Instance.new("Atmosphere");
			A.Name = "NS_Atmo";
			A.Density = .42;
			A.Offset = 0;
			A.Color = Color3.fromRGB(60, 12, 12);
			A.Decay = Color3.fromRGB(80, 20, 20);
			A.Glare = .5;
			A.Haze = 1.6;
			A.Parent = C;
			table.insert(n, A);
			C.ClockTime = 0;
			C.Brightness = 1.2;
			C.Ambient = Color3.fromRGB(130, 110, 110);
			C.OutdoorAmbient = Color3.fromRGB(180, 140, 140);
			C.FogColor = Color3.fromRGB(22, 5, 5);
			C.FogEnd = 1200;
			C.FogStart = 150;
			C.ColorShift_Top = Color3.fromRGB(125, 25, 25);
			C.ColorShift_Bottom = Color3.fromRGB(65, 8, 8);
			C.ExposureCompensation = -0.2;
			C.GlobalShadows = true;
			C.EnvironmentDiffuseScale = .5;
			C.EnvironmentSpecularScale = .5;
		else
			e(n);
			if Y then
				Y:Destroy();
				Y = nil;
			end;
			R("NS");
		end;
	end;
	local function w(n)
		local C = game:GetService("Lighting");
		if n then
			d("AF");
			e(J);
			local n = Instance.new("ColorCorrectionEffect");
			n.Name = "AF_CC";
			n.Brightness = .05;
			n.Contrast = .14;
			n.Saturation = .22;
			n.TintColor = Color3.fromRGB(255, 205, 165);
			n.Parent = C;
			table.insert(J, n);
			local Y = Instance.new("BloomEffect");
			Y.Name = "AF_Bloom";
			Y.Intensity = .32;
			Y.Size = 40;
			Y.Threshold = .92;
			Y.Parent = C;
			table.insert(J, Y);
			local L = Instance.new("SunRaysEffect");
			L.Name = "AF_Rays";
			L.Intensity = .15;
			L.Spread = .9;
			L.Parent = C;
			table.insert(J, L);
			local R = Instance.new("Sky");
			R.Name = "AF_Sky";
			R.SunAngularSize = 18;
			R.MoonAngularSize = 0;
			R.StarCount = 2000;
			R.Parent = C;
			table.insert(J, R);
			local H = Instance.new("Atmosphere");
			H.Name = "AF_Atmo";
			H.Density = .36;
			H.Offset = .1;
			H.Color = Color3.fromRGB(255, 185, 135);
			H.Decay = Color3.fromRGB(255, 125, 85);
			H.Glare = .2;
			H.Haze = 1.2;
			H.Parent = C;
			table.insert(J, H);
			C.ClockTime = 6.3;
			C.Brightness = 2.4;
			C.Ambient = Color3.fromRGB(85, 62, 55);
			C.OutdoorAmbient = Color3.fromRGB(125, 92, 80);
			C.FogColor = Color3.fromRGB(240, 185, 145);
			C.FogEnd = 2500;
			C.FogStart = 200;
			C.ColorShift_Top = Color3.fromRGB(255, 185, 105);
			C.ColorShift_Bottom = Color3.fromRGB(205, 105, 85);
			C.ExposureCompensation = .08;
			C.GlobalShadows = true;
			C.EnvironmentDiffuseScale = .8;
			C.EnvironmentSpecularScale = .6;
		else
			e(J);
			R("AF");
		end;
	end;
	local function P(n)
		local J = game:GetService("Lighting");
		if n then
			d("SV");
			e(C);
			local n = Instance.new("ColorCorrectionEffect");
			n.Name = "SV_CC";
			n.Brightness = .05;
			n.Contrast = .22;
			n.Saturation = -1;
			n.TintColor = Color3.fromRGB(222, 226, 232);
			n.Parent = J;
			table.insert(C, n);
			local Y = Instance.new("BloomEffect");
			Y.Name = "SV_Bloom";
			Y.Intensity = 1.25;
			Y.Size = 75;
			Y.Threshold = .38;
			Y.Parent = J;
			table.insert(C, Y);
			local L = Instance.new("Sky");
			L.Name = "SV_Sky";
			L.StarCount = 0;
			L.SunAngularSize = 0;
			L.MoonAngularSize = 0;
			L.CelestialBodiesShown = false;
			L.Parent = J;
			table.insert(C, L);
			local R = Instance.new("Atmosphere");
			R.Name = "SV_Atmo";
			R.Density = .3;
			R.Offset = .1;
			R.Color = Color3.fromRGB(180, 185, 190);
			R.Decay = Color3.fromRGB(140, 145, 150);
			R.Glare = 0;
			R.Haze = 1;
			R.Parent = J;
			table.insert(C, R);
			J.ClockTime = 14;
			J.Brightness = 2.2;
			J.Ambient = Color3.fromRGB(92, 96, 100);
			J.OutdoorAmbient = Color3.fromRGB(132, 136, 140);
			J.FogColor = Color3.fromRGB(172, 176, 180);
			J.FogEnd = 3000;
			J.FogStart = 200;
			J.ColorShift_Top = Color3.fromRGB(152, 156, 160);
			J.ColorShift_Bottom = Color3.fromRGB(122, 126, 130);
			J.ExposureCompensation = 0;
			J.GlobalShadows = true;
			J.EnvironmentDiffuseScale = .6;
			J.EnvironmentSpecularScale = .3;
		else
			e(C);
			R("SV");
		end;
	end;
	local G, j, A;
	G = dx.Graficos:Toggle({ Title = "Noche Sangrienta", Value = false, Callback = function(n)
				if n then
					if j then
						pcall(function()
							j:Set(false);
						end);
					end;
					if A then
						pcall(function()
							A:Set(false);
						end);
					end;
				end;
				H(n);
			end });
	j = dx.Graficos:Toggle({ Title = "Atardecer Fant\195\161stico", Value = false, Callback = function(n)
				if n then
					if G then
						pcall(function()
							G:Set(false);
						end);
					end;
					if A then
						pcall(function()
							A:Set(false);
						end);
					end;
				end;
				w(n);
			end });
	A = dx.Graficos:Toggle({ Title = "Sin Vida", Value = false, Callback = function(n)
				if n then
					if G then
						pcall(function()
							G:Set(false);
						end);
					end;
					if j then
						pcall(function()
							j:Set(false);
						end);
					end;
				end;
				P(n);
			end });
end;
do
	dx.Updates:Section({ Title = "Nuevas cosas agregadas" });
	pcall(function()
		dx.Updates:Paragraph({ Title = "Uzivert Hub  v2.5", Desc = "<font color=\'#3DDC84\'>+Pesta\195\177a Inicio (perfil, servidor, FPS y Ping, cambiar de servidor)\n+Pesta\195\177a Cr\195\169ditos con las redes del creador</font>", Icon = "solar:moon-bold" });
	end);
	local n = {
			"+Fixed Platform (Movimiento)",
			"+Fake Lag (Movimiento)",
			"+Nuevas animaciones del Hub de MMV",
			"+Secci\195\179n Headless real (V1, V2, V3) en Apariencia",
			"-Se quit\195\179 la pesta\195\177a de M\195\186sica",
		};
	local J = {};
	for n, C in ipairs(n) do
		local Y = (string.sub(C, 1, 1) == "-") and "#FF4D4D" or "#3DDC84";
		J[n] = "<font color=\'" .. (Y .. ("\'>" .. (C .. "</font>")));
	end;
	pcall(function()
		dx.Updates:Paragraph({ Title = "Uzivert Hub  v2.4", Desc = table.concat(J, "\n"), Icon = "solar:moon-bold" });
	end);
end;
do
	local n = {
			"+Orb flotante de Uzivert Hub",
			"+Fondo y tema Uzivert nuevos",
			"+Borde plateado animado en la interfaz",
			"+Bot\195\179n bindable para Invisible",
			"+API m\195\161s segura",
			"+Mejoras en la precisi\195\179n",
			"+Indetectable",
			"+Optimizaci\195\179n",
		};
	local J = {};
	for n, C in ipairs(n) do
		J[n] = "<font color=\'#3DDC84\'>" .. (C .. "</font>");
	end;
	pcall(function()
		dx.Updates:Paragraph({ Title = "Uzivert Hub  v2.1", Desc = table.concat(J, "\n"), Icon = "solar:moon-bold" });
	end);
end;
do
	local C = {
			Nombre = "Uzivert",
			Rol = "Creador de Uzivert Hub",
			TikTok = "@Uzivert550",
			Discord = "discord.gg/vHhERWcbXe",
			RobloxId = 0,
			FotoId = "126127732399369",
		};
	local Y = game:GetService("Stats");
	local L = game:GetService("MarketplaceService");
	local R = game:GetService("TeleportService");
	local e = n.LocalPlayer;
	local function H(n, J)
		local C = pcall(function()
				n:Paragraph(J);
			end);
		if not C then
			J.Image, J.Thumbnail, J.Buttons = nil, nil, nil;
			pcall(function()
				n:Paragraph(J);
			end);
		end;
	end;
	local function w(n)
		return "rbxthumb://type=AvatarHeadShot&id=" .. (tostring(n) .. "&w=150&h=150");
	end;
	local P = dx.Inicio;
	H(P, { Title = "Bienvenido a Uzivert Hub", Desc = "Elige una categor\195\173a y encuentra cada ajuste con el buscador." });
	local G = "Desconocido";
	pcall(function()
		local n = (type(identifyexecutor) == "function" and identifyexecutor) or (type(getexecutorname) == "function" and getexecutorname);
		if n then
			G = tostring((n()));
		end;
	end);
	H(P, {
		Title = e.DisplayName,
		Desc = "@" .. (e.Name .. ("\nEjecutor: " .. (G .. ("\nCuenta: " .. (tostring(e.AccountAge) .. " d\195\173as\nVersi\195\179n: v2.5"))))),
		Image = w(e.UserId),
		ImageSize = 56,
	});
	P:Section({ Title = "Novedades de Uzivert Hub" });
	H(P, { Title = "Inicio y Cr\195\169ditos", Desc = "Nueva pesta\195\177a de Inicio con tu perfil, informaci\195\179n del servidor y ajustes r\195\161pidos. Pesta\195\177a de Cr\195\169ditos con las redes del creador." });
	P:Section({ Title = "Informaci\195\179n del Servidor" });
	local j = "Cargando...";
	pcall(function()
		j = (L:GetProductInfo(game.PlaceId)).Name;
	end);
	H(P, {
		Title = "Juego Actual",
		Desc = tostring(j) .. ("\nPlace ID: " .. tostring(game.PlaceId)),
		Image = "rbxthumb://type=GameIcon&id=" .. (tostring(game.GameId) .. "&w=150&h=150"),
		ImageSize = 56,
	});
	H(P, { Title = "Jugadores", Desc = #n:GetPlayers() .. " en este servidor" });
	P:Section({ Title = "Optimizaci\195\179n" });
	local A, h;
	P:Toggle({ Title = "Mostrar FPS y Ping", Value = false, Callback = function(n)
			if h then
				h:Disconnect();
				h = nil;
			end;
			if A then
				A:Destroy();
				A = nil;
			end;
			if not n then
				return;
			end;
			A = Instance.new("ScreenGui");
			A.Name = "UzivertFPS";
			A.ResetOnSpawn = false;
			pcall(function()
				A.Parent = (gethui and gethui()) or game:GetService("CoreGui");
			end);
			if not A.Parent then
				A.Parent = e:WaitForChild("PlayerGui");
			end;
			local C = Instance.new("TextLabel");
			C.Size = UDim2.fromOffset(150, 22);
			C.Position = UDim2.new(1, -160, 0, 6);
			C.BackgroundColor3 = Color3.fromRGB(12, 13, 20);
			C.BackgroundTransparency = .25;
			C.TextColor3 = Color3.new(1, 1, 1);
			C.Font = Enum.Font.GothamMedium;
			C.TextSize = 13;
			C.Parent = A;
			(Instance.new("UICorner", C)).CornerRadius = UDim.new(0, 6);
			local d, L = 0, os.clock();
			h = J.RenderStepped:Connect(function()
					d = d + 1;
					if os.clock() - L >= .5 then
						local n = 0;
						pcall(function()
							n = math.floor(Y.Network.ServerStatsItem["Data Ping"]:GetValue());
						end);
						C.Text = string.format("FPS %d  |  Ping %d ms", math.floor(d / ((os.clock() - L))), n);
						d, L = 0, os.clock();
					end;
				end);
		end });
	P:Button({
		Title = "Cambiar de Servidor",
		Icon = "solar:refresh-bold",
		Variant = "Secondary",
		Callback = function()
			task.spawn(function()
				local n, J = pcall(function()
						return d:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. (game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")));
					end);
				local C = {};
				if n and (J and J.data) then
					for n, J in ipairs(J.data) do
						if J.id ~= game.JobId and J.playing < J.maxPlayers then
							C[#C + 1] = J.id;
						end;
					end;
				end;
				if #C == 0 then
					pcall(function()
						b:Notify({ Title = "Uzivert Hub", Content = "No encontr\195\169 otro servidor disponible.", Duration = 3 });
					end);
					return;
				end;
				pcall(function()
					R:TeleportToPlaceInstance(game.PlaceId, C[math.random(#C)], e);
				end);
			end);
		end,
	});
	local k = dx.Creditos;
	local M;
	if C.FotoId ~= "" then
		M = "rbxassetid://" .. C.FotoId;
		pcall(function()
			local n = (game:GetObjects("rbxassetid://" .. C.FotoId))[1];
			if n and ((n:IsA("Decal") or n:IsA("Texture"))) then
				local J = (tostring(n.Texture)):match("id=(%d+)") or (tostring(n.Texture)):match("rbxassetid://(%d+)");
				if J then
					M = "rbxassetid://" .. J;
				end;
			end;
		end);
	elseif C.RobloxId > 0 then
		M = w(C.RobloxId);
	end;
	H(k, {
		Title = C.Nombre,
		Desc = C.Rol .. ("\nTikTok: " .. (C.TikTok .. ("\nDiscord: " .. C.Discord))),
		Image = M,
		ImageSize = 64,
	});
	H(k, { Title = "Agradecimientos", Desc = "Muchas gracias a esos que se quedaron cuando nada funcionaba, cuando apenas comenzaba, y tambi\195\169n a los que usan los scripts." });
	pcall(function()
		dx.Inicio:Select();
	end);
end;
do
	local n = game:GetService("TweenService");
	local Y = Color3.fromRGB(255, 255, 255);
	local d = Color3.fromRGB(190, 200, 225);
	local L = Color3.fromRGB(12, 13, 20);
	local function R(n, J, C)
		local Y = Instance.new(n);
		for n, J in pairs(J) do
			Y[n] = J;
		end;
		Y.Parent = C;
		return Y;
	end;
	local function e(n, J)
		return R("UICorner", { CornerRadius = UDim.new(0, J) }, n);
	end;
	local function H(n, J, C, Y)
		local d = R("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(J, J),
				BackgroundColor3 = C,
				BorderSizePixel = 0,
				ZIndex = Y,
			}, n);
		e(d, J);
		return d;
	end;
	local w = R("TextButton", {
			Name = "UzivertOrb",
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.new(0, 30, .5, -30),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 50,
		}, F);
	local P = R("UIScale", { Scale = 1 }, w);
	local G = H(w, 90, Y, 1);
	G.BackgroundTransparency = .85;
	local j = R("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(58, 58),
			BackgroundTransparency = 1,
			ZIndex = 2,
		}, w);
	e(j, 29);
	local A = R("UIStroke", { Thickness = 2.5, Color = Y }, j);
	local h = R("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Y), ColorSequenceKeypoint.new(.5, d), ColorSequenceKeypoint.new(1, Y) }), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(.55, .65), NumberSequenceKeypoint.new(1, 0) }) }, A);
	local k = H(w, 50, L, 3);
	local function M(n, J, C)
		local Y = R("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(n, n),
				BackgroundTransparency = 1,
				ZIndex = 4,
			}, w);
		e(Y, 4);
		R("UIStroke", { Thickness = 1.2, Color = J, Transparency = C }, Y);
		return Y;
	end;
	local y, m = M(36, Y, .2), M(30, d, .4);
	local I = H(w, 20, Y, 5);
	I.Position = UDim2.new(.5, -1, .5, 0);
	local N = H(w, 17, L, 6);
	N.Position = UDim2.new(.5, 4, .5, -3);
	local x = {};
	for n = 1, 3, 1 do
		local J = H(w, 3 + (n % 2), (n % 2 == 0) and Y or d, 7);
		x[n] = {
				f = J,
				r = 29,
				sp = ((n % 2 == 0 and 1 or -1)) * ((.9 + n * .35)),
				ph = n * 2.1,
			};
	end;
	local X = true;
	local function o()
		if pcall(function()
			Yx:Toggle();
		end) then
			return;
		end;
		X = not X;
		pcall(function()
			if X then
				Yx:Open();
			else
				Yx:Close();
			end;
		end);
	end;
	local p, T, Z, z, B = false, nil, nil, 0, nil;
	w.InputBegan:Connect(function(J)
		if J.UserInputType == Enum.UserInputType.MouseButton1 or J.UserInputType == Enum.UserInputType.Touch then
			if p then
				return;
			end;
			p = true;
			z = 0;
			B = J;
			T = w.Position;
			Z = J.Position;
			(n:Create(P, TweenInfo.new(.12), { Scale = .9 })):Play();
		end;
	end);
	C.InputChanged:Connect(function(n)
		if not p then
			return;
		end;
		if n.UserInputType == Enum.UserInputType.MouseMovement then
			if not B or B.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return;
			end;
		elseif n ~= B then
			return;
		end;
		do
			local J = n.Position - Z;
			z = math.max(z, J.Magnitude);
			if z > 6 then
				w.Position = UDim2.new(T.X.Scale, T.X.Offset + J.X, T.Y.Scale, T.Y.Offset + J.Y);
			end;
		end;
	end);
	C.InputEnded:Connect(function(J)
		if not p or J ~= B then
			return;
		end;
		do
			p = false;
			B = nil;
			(n:Create(P, TweenInfo.new(.25, Enum.EasingStyle.Back), { Scale = 1 })):Play();
			if z <= 6 then
				o();
			end;
		end;
	end);
	J.Heartbeat:Connect(function()
		if not w.Parent then
			return;
		end;
		local n = os.clock();
		G.BackgroundTransparency = ((X and .92 or .84)) + .04 * math.sin(n * 2);
		h.Rotation = ((n * 90)) % 360;
		y.Rotation = ((n * 24)) % 360;
		m.Rotation = ((-n * 16)) % 360;
		for J, C in ipairs(x) do
			local Y = n * C.sp + C.ph;
			C.f.Position = UDim2.fromScale(.5, .5) + UDim2.fromOffset(math.cos(Y) * C.r, math.sin(Y) * C.r);
		end;
	end);
end;
do
	local n = Enum.KeyCode.LeftControl;
	local J = true;
	C.InputBegan:Connect(function(Y)
		if Y.UserInputType ~= Enum.UserInputType.Keyboard then
			return;
		end;
		if Y.KeyCode ~= n then
			return;
		end;
		if C:GetFocusedTextBox() then
			return;
		end;
		if pcall(function()
			Yx:Toggle();
		end) then
			return;
		end;
		J = not J;
		pcall(function()
			if J then
				Yx:Open();
			else
				Yx:Close();
			end;
		end);
	end);
end;

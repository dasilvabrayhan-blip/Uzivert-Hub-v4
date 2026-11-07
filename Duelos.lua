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
	local L = game:GetService("Players");
	local N = L.LocalPlayer;
	local function E()
		pcall(function()
			local L = "https://uzivert-api.onrender.com/registrar?user=" .. (N.Name .. "&game=duelos");
			game:HttpGet(L);
		end);
	end;
	E();
	while task.wait(120) do
		E();
	end;
end);
local L = game:GetService("Players");
local N = game:GetService("RunService");
local E = game:GetService("UserInputService");
local l = game:GetService("ReplicatedStorage");
local Z = game:GetService("HttpService");
local d = game:GetService("Workspace");
local c = game:GetService("SoundService");
local z = L.LocalPlayer;
while not z do
	task.wait();
	z = L.LocalPlayer;
end;
local H = d.CurrentCamera;
local w = false;
local m = 120;
local U = false;
local x = false;
local k = "Cabeza";
local A = false;
local p = false;
local s = "Cabeza";
local I = true;
local g = false;
local G = Color3.fromRGB(255, 255, 255);
local K = { Glow = true };
local f = false;
local v = false;
local a = false;
local M = 3.5;
local y = Color3.fromRGB(255, 0, 0);
local S = false;
local C = "Nombre falso";
local B = false;
local r = nil;
local q = nil;
local i = {};
local R;
local P;
local b;
local V;
local O;
local F;
local u;
local J;
local t;
local Y;
local W = false;
local X;
local o = Instance.new("ScreenGui");
o.Name = "UzivertHub_Overlays";
o.ResetOnSpawn = false;
o.IgnoreGuiInset = true;
o.DisplayOrder = 999;
o.Parent = z:WaitForChild("PlayerGui");
local Q = Instance.new("Folder");
Q.Name = "UzivertESPFolder";
Q.Parent = o;
local D;
local j = "1.6.66";
local h = "WindUI_Cache_v" .. (j .. ".txt");
local e = "WindUI_Cache_v" .. (j .. "_Time.txt");
local n, T = pcall(function()
		local L = false;
		if isfile and (isfile(e) and readfile) then
			local N = tonumber(readfile(e));
			if N and (os.time() - N) < 86400 then
				L = true;
			end;
		end;
		if L and (isfile and isfile(h)) then
			local L = readfile(h);
			local N = loadstring(L);
			if N then
				return N();
			else
				if delfile then
					pcall(delfile, h);
					pcall(delfile, e);
				end;
			end;
		end;
		local N = game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. (j .. "/main.lua"));
		if writefile then
			writefile(h, N);
			writefile(e, tostring(os.time()));
		end;
		return (loadstring(N))();
	end);
if n and (T and type(T) == "table") then
	D = T;
else
	warn("Error al cargar WindUI: " .. tostring(T));
	return;
end;
local LG = false;
do
	local function L(L)
		return pcall(function()
			local N, E = Color3.fromHex("#1c1e2c"), Color3.fromHex("#22253a");
			if L then
				N = D:Gradient({ ["0"] = { Color = Color3.fromHex("#252839"), Transparency = 0 }, ["100"] = { Color = Color3.fromHex("#14151f"), Transparency = 0 } }, { Rotation = 90 });
				E = D:Gradient({ ["0"] = { Color = Color3.fromHex("#0e0f18"), Transparency = 0 }, ["50"] = { Color = Color3.fromHex("#1d2033"), Transparency = 0 }, ["100"] = { Color = Color3.fromHex("#33384f"), Transparency = 0 } }, { Rotation = 35 });
			end;
			D:AddTheme({
				Name = "Uzivert",
				Accent = N,
				Background = E,
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
	LG = L(true) or L(false);
end;
local NG = "132390617819216";
local EG = "rbxassetid://" .. NG;
pcall(function()
	local L = (game:GetObjects("rbxassetid://" .. NG))[1];
	if L and ((L:IsA("Decal") or L:IsA("Texture"))) then
		local N = (tostring(L.Texture)):match("id=(%d+)") or (tostring(L.Texture)):match("rbxassetid://(%d+)");
		if N then
			EG = "rbxassetid://" .. N;
		end;
	end;
end);
local lG = D:CreateWindow({
		Title = "UZIVERT HUB | DUELS <font color=\'#FFD700\'>[v2.4] </font>",
		Author = "By Uzivert \240\159\135\181\240\159\135\190",
		Folder = "Uzivert_WindUI",
		Acrylic = false,
		Transparent = false,
		NewElements = true,
		HideSearchBar = false,
		ToggleKey = Enum.KeyCode.F15,
		Icon = "moon",
		Theme = LG and "Uzivert" or "Dark",
		Background = EG,
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
		local L;
		pcall(function()
			L = lG.UIElements and lG.UIElements.Main;
		end);
		if not ((L and L:IsA("GuiObject"))) then
			L = nil;
			local N = 0;
			local E = D.ScreenGui or (gethui and gethui()) or game:GetService("CoreGui");
			for E, l in ipairs(E:GetDescendants()) do
				if l:IsA("Frame") and (l:FindFirstChildOfClass("UICorner") and (l.AbsoluteSize.X > 400 and l.AbsoluteSize.Y > 300)) then
					local E = l.AbsoluteSize.X * l.AbsoluteSize.Y;
					if E > N then
						N, L = E, l;
					end;
				end;
			end;
		end;
		if not L then
			return;
		end;
		local E = Instance.new("UIStroke");
		E.Thickness = 2;
		E.Color = Color3.new(1, 1, 1);
		E.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		E.Parent = L;
		local l = Instance.new("UIGradient");
		l.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 118, 142)),
				ColorSequenceKeypoint.new(.25, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(.5, Color3.fromRGB(190, 200, 225)),
				ColorSequenceKeypoint.new(.75, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 118, 142)),
			});
		l.Parent = E;
		local Z;
		Z = N.Heartbeat:Connect(function()
				if not E.Parent then
					Z:Disconnect();
					return;
				end;
				l.Rotation = ((os.clock() * 120)) % 360;
			end);
	end);
end);
local ZG = lG:Section({ Title = "Combate principal", Opened = true });
local dG = lG:Section({ Title = "Zona de farmeo", Opened = true });
local cG = lG:Section({ Title = "Configuraciones", Opened = true });
local zG = lG:Section({ Title = "Informaci\195\179n", Opened = true });
local HG = {
		Graficos = lG:Tab({ Title = "Gr\195\161ficos", Icon = "solar:palette-bold" }),
		Aim = ZG:Tab({ Title = "Aimbot", Icon = "solar:target-bold" }),
		Vis = ZG:Tab({ Title = "Visual", Icon = "solar:eye-bold" }),
		KillAll = ZG:Tab({ Title = "Kill All", Icon = "solar:danger-triangle-bold" }),
		Invisible = ZG:Tab({ Title = "Invisible", Icon = "solar:ghost-bold" }),
		Tramposo = ZG:Tab({ Title = "Movimiento", Icon = "solar:bolt-bold" }),
		Farm = dG:Tab({ Title = "Farmear evento", Icon = "solar:gift-bold" }),
		RachaFarm = dG:Tab({ Title = "Farmear racha", Icon = "solar:flame-bold" }),
		Animaciones = cG:Tab({ Title = "Animaciones", Icon = "solar:smile-circle-bold" }),
		Sonidos = cG:Tab({ Title = "Sonidos", Icon = "solar:speaker-bold" }),
		Items = cG:Tab({ Title = "Apariencia", Icon = "solar:crown-star-bold" }),
		Guardado = cG:Tab({ Title = "Guardado", Icon = "solar:diskette-bold" }),
		Identidad = cG:Tab({ Title = "Identidad", Icon = "solar:user-id-bold" }),
		Updates = zG:Tab({ Title = "Updates", Icon = "solar:bell-bing-bold" }),
	};
local wG, mG, UG;
local xG, kG, AG, pG;
do
	local N = z:WaitForChild("PlayerGui");
	local E;
	local Z;
	local function c(L)
		if not L then
			return;
		end;
		for N = #L, 1, -1 do
			local E = L[N];
			L[N] = nil;
			if E and E.Connected then
				E:Disconnect();
			end;
		end;
	end;
	local H;
	local function w(L)
		local N = L;
		if typeof(L) == "Instance" and L:IsA("Player") then
			N = L.Character;
		end;
		local E = N and N:FindFirstChildOfClass("Humanoid");
		if not E or E.Health <= 0 then
			return false;
		end;
		if H and H() then
			return N:GetAttribute("InfectionDowned") ~= true;
		end;
		return E.Health >= 99;
	end;
	local function m()
		local L = z:FindFirstChild("PlayerGui");
		local N = L and L:FindFirstChild("Main");
		local E = N and N:FindFirstChild("MainGameFrame");
		return E and E:FindFirstChild("IngameScore") or nil;
	end;
	local k = {
			Snapshot = {},
			Scoreboard = nil,
			InGame = false,
			LocalGame = nil,
			LastRefresh = 0,
			RefreshInterval = 2,
			Dirty = true,
			WatchConnections = {},
		};
	local function s()
		k.Dirty = true;
	end;
	local function I(L)
		local N = k;
		if N.Scoreboard == L then
			return;
		end;
		c(N.WatchConnections);
		N.Scoreboard = L;
		if not L then
			return;
		end;
		local E;
		E = function()
				s();
				c(N.WatchConnections);
				N.WatchConnections[#N.WatchConnections + 1] = L.ChildAdded:Connect(E);
				N.WatchConnections[#N.WatchConnections + 1] = L.ChildRemoved:Connect(E);
				for E, l in ipairs({ "TeamRed", "TeamBlue" }) do
					local Z = L:FindFirstChild(l);
					if Z then
						N.WatchConnections[#N.WatchConnections + 1] = Z.ChildAdded:Connect(s);
						N.WatchConnections[#N.WatchConnections + 1] = Z.ChildRemoved:Connect(s);
					end;
				end;
			end;
		E();
	end;
	local function G(L)
		local N = k;
		local E = os.clock();
		local l = z:GetAttribute("Game");
		if not L and (not N.Dirty and (E - N.LastRefresh < N.RefreshInterval and (N.LocalGame == l and ((not N.Scoreboard or N.Scoreboard.Parent))))) then
			return N.Snapshot;
		end;
		N.LastRefresh = E;
		N.LocalGame = l;
		local Z = {};
		local d = m();
		if d ~= N.Scoreboard then
			I(d);
		end;
		for L, N in ipairs({ "TeamRed", "TeamBlue" }) do
			local E = d and d:FindFirstChild(N);
			if E then
				local L = N == "TeamRed" and "Red" or "Blue";
				for N, E in ipairs(E:GetChildren()) do
					if E:IsA("GuiObject") then
						Z[string.lower(E.Name)] = L;
					end;
				end;
			end;
		end;
		N.Snapshot = Z;
		N.Dirty = false;
		N.InGame = d ~= nil and Z[string.lower(z.Name)] ~= nil;
		return Z;
	end;
	local a = {
			"InfectionInfected",
			"IsInfected",
			"Infected",
			"IsZombie",
			"Zombie",
		};
	local M = { "GameMode", "MatchMode", "Mode" };
	local y = {
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
	local function S(L)
		if not L then
			return nil;
		end;
		if L:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local N = false;
		for E, l in ipairs(a) do
			local Z = L:GetAttribute(l);
			if typeof(Z) == "boolean" then
				if Z then
					return true;
				end;
				N = true;
			elseif typeof(Z) == "string" then
				local L = Z:lower();
				if L == "infected" or L == "infection" or L == "zombie" or L == "true" then
					return true;
				end;
				if L == "survivor" or L == "human" or L == "false" then
					N = true;
				end;
			end;
		end;
		if N then
			return false;
		end;
		return nil;
	end;
	local function C(L)
		if L:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local N = L.Character;
		if not N then
			return false;
		end;
		if N:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local E = N:FindFirstChildOfClass("Humanoid");
		return E ~= nil and E:GetAttribute("InfectionPatientZero") == true;
	end;
	local function B(L)
		if not L then
			return nil;
		end;
		local N = L.Character;
		local E = S(N);
		local l = S(L);
		local Z = N and N:FindFirstChildOfClass("Humanoid");
		local d = S(Z);
		if E == true or l == true or d == true then
			return true;
		end;
		if E == false or l == false or d == false then
			return false;
		end;
		return nil;
	end;
	local function r(E)
		local l = N:FindFirstChild("Main");
		l = l and l:FindFirstChild("MainGameFrame");
		if not l then
			return;
		end;
		local Z = l:FindFirstChild("PlayersFrame");
		local d = l:FindFirstChild("IngameScore");
		local c = {};
		local z = {};
		local H = {};
		for L, N in ipairs(L:GetPlayers()) do
			c[N.Name:lower()] = N;
			c[tostring(N.UserId)] = N;
			local E = N.DisplayName:lower();
			if z[E] then
				H[E] = true;
			end;
			z[E] = N;
		end;
		for L, N in pairs(z) do
			if not H[L] and not c[L] then
				c[L] = N;
			end;
		end;
		local function w(L, N)
			if not L then
				return;
			end;
			for L, l in ipairs(L:GetChildren()) do
				if l:IsA("GuiObject") then
					local L = c[(l.Name:lower()):gsub("^@", "")];
					if not L then
						local N = l:GetAttribute("UserId");
						if N then
							L = c[tostring(N)];
						end;
					end;
					if not L then
						for N, E in ipairs(l:GetDescendants()) do
							if E:IsA("TextLabel") and ((E.Name == "PlayerName" or E.Name == "TextLabel")) then
								L = c[(E.Text:lower()):gsub("^@", "")];
								if L then
									break;
								end;
							end;
						end;
					end;
					if L then
						E[L] = N;
					end;
				end;
			end;
		end;
		if d then
			w(d:FindFirstChild("TeamRed"), "Red");
			w(d:FindFirstChild("TeamBlue"), "Blue");
		end;
		if Z then
			w(Z:FindFirstChild("TeamRedFrame"), "Red");
			w(Z:FindFirstChild("TeamBlueFrame"), "Blue");
		end;
	end;
	local function q(L)
		local N = y;
		table.clear(N.Converted);
		table.clear(N.ConvertedAt);
		table.clear(N.Pending);
		table.clear(N.LateJoiners);
		table.clear(N.Inferred);
		table.clear(N.Targets);
		table.clear(N.RoleTeams);
		N.Active = false;
		N.RoundEnded = L == true;
		N.LastRefresh = -math.huge;
		if E then
			E();
		end;
	end;
	local function i(N)
		local l = y;
		local Z = os.clock();
		local c = z:GetAttribute("Game");
		local H = z:GetAttribute("MatchId");
		if l.HasMatchContext and ((c ~= l.LastLocalGame or H ~= l.LastMatchId)) then
			q(false);
		end;
		l.HasMatchContext = true;
		l.LastLocalGame = c;
		l.LastMatchId = H;
		if not N and Z - l.LastRefresh < l.RefreshInterval then
			return l;
		end;
		l.LastRefresh = Z;
		local w = G(false);
		local m = false;
		local U = z.Character;
		local x = U and U:FindFirstChild("HumanoidRootPart");
		local A = L:GetPlayers();
		for L, N in ipairs(A) do
			if C(N) then
				local L = N == z;
				if not L then
					L = true;
					local E = N:GetAttribute("Game");
					local l = N:GetAttribute("MatchId");
					if c ~= nil and (c ~= "" and (E ~= nil and (E ~= "" and c ~= E))) then
						L = false;
					end;
					if ((c == nil or c == "")) and (E ~= nil and E ~= "") then
						L = false;
					end;
					if H ~= nil and (H ~= "" and (l ~= nil and (l ~= "" and H ~= l))) then
						L = false;
					end;
					local Z = N.Character;
					local d = Z and Z:FindFirstChild("HumanoidRootPart");
					if x and (d and ((x.Position - d.Position)).Magnitude > 1200) then
						L = false;
					end;
				end;
				if L then
					m = true;
					break;
				end;
			end;
		end;
		local p;
		for L, N in ipairs(M) do
			local E = z:GetAttribute(N);
			if typeof(E) == "string" and E ~= "" then
				p = E:lower();
				break;
			end;
		end;
		if not p then
			for L, N in ipairs(M) do
				local E = d:GetAttribute(N);
				if typeof(E) == "string" and E ~= "" then
					p = E:lower();
					break;
				end;
			end;
		end;
		local s = not l.RoundEnded and ((p == "infection" or (not p and ((m or (l.Active and not k.InGame))))));
		if not s then
			if p and (p ~= "infection" and next(l.LateJoiners) ~= nil) then
				table.clear(l.LateJoiners);
			end;
			if l.Active or next(l.Targets) ~= nil then
				if p and p ~= "infection" then
					q(false);
				else
					l.Active = false;
					table.clear(l.Targets);
					table.clear(l.Inferred);
					table.clear(l.RoleTeams);
					if E then
						E();
					end;
				end;
			end;
			return l;
		end;
		l.Active = true;
		local I = {};
		r(I);
		l.RoleTeams = I;
		local g;
		local K = false;
		local f = {};
		for L, N in ipairs(A) do
			local E = B(N);
			f[N] = E;
			if E == true or l.Converted[N] == true then
				local L = I[N];
				if L then
					if g and g ~= L then
						K = true;
					end;
					g = L;
				end;
			end;
		end;
		local v = {};
		if g and not K then
			for L, N in pairs(I) do
				if N == g and f[L] ~= false then
					v[L] = true;
				end;
			end;
		end;
		l.Inferred = v;
		local function a()
			local L = {};
			for N, E in ipairs(A) do
				if f[E] == true or l.Converted[E] == true or (f[E] ~= false and v[E] == true) then
					L[E] = true;
				end;
			end;
			return L;
		end;
		local S = a();
		local i = {};
		for L in pairs(S) do
			local N = L.Character;
			local E = N and N:FindFirstChild("HumanoidRootPart");
			if E and E:IsA("BasePart") then
				i[#i + 1] = E;
			end;
		end;
		for L, N in ipairs(A) do
			if N ~= z and (l.LateJoiners[N] and (f[N] == nil and (not S[N] and N.Character))) then
				local L = I[N] or w[N.Name:lower()];
				local E = N:GetAttribute("Game");
				local Z = N:GetAttribute("MatchId");
				local d = c ~= nil and (c ~= "" and E == c);
				local z = H ~= nil and (H ~= "" and Z == H);
				local m = c ~= nil and (c ~= "" and (E ~= nil and (E ~= "" and E ~= c)));
				local U = H ~= nil and (H ~= "" and (Z ~= nil and (Z ~= "" and Z ~= H)));
				if not m and not U then
					local E = false;
					for L in pairs(S) do
						local Z = L.Team;
						if Z and (N.Team == Z and ((f[L] == true or l.Converted[L] == true or v[L] == true))) then
							E = true;
							break;
						end;
					end;
					local Z = false;
					if not L and (not d and (not z and not E)) then
						local L = N.Character:FindFirstChild("HumanoidRootPart");
						if L and L:IsA("BasePart") then
							local N = L.Position;
							for L, E in ipairs(i) do
								if ((E.Position - N)).Magnitude <= 300 then
									Z = true;
									break;
								end;
							end;
						end;
					end;
					local c = L ~= nil or d or z or E or Z;
					if c and ((not g or K or not L or L == g)) then
						S[N] = true;
					end;
				end;
			end;
		end;
		local R = l.Pending;
		local P = true;
		while P do
			P = false;
			for N = #R, 1, -1 do
				local E = R[N];
				if Z - E.Time > 10 or E.Killer.Parent ~= L or E.Victim.Parent ~= L then
					table.remove(R, N);
				elseif S[E.Killer] and (not S[E.Victim] and ((not l.ConvertedAt[E.Killer] or l.ConvertedAt[E.Killer] <= E.Time))) then
					l.Converted[E.Victim] = true;
					l.ConvertedAt[E.Victim] = E.Time;
					S[E.Victim] = true;
					table.remove(R, N);
					P = true;
				elseif S[E.Killer] then
					table.remove(R, N);
				end;
			end;
		end;
		local b = l.Targets;
		local V = false;
		for L in pairs(b) do
			if not S[L] then
				V = true;
				break;
			end;
		end;
		if not V then
			for L in pairs(S) do
				if not b[L] then
					V = true;
					break;
				end;
			end;
		end;
		l.Targets = S;
		if V and E then
			E();
		end;
		return l;
	end;
	H = function()
			return (i(false)).Active;
		end;
	local function R(L)
		if not L then
			return false;
		end;
		local N = i(false);
		return N.Active and N.Targets[L] == true;
	end;
	local function b(L, N)
		if not L or L == z or not L.Parent or (not N and not L.Character) then
			return false;
		end;
		local E = z:GetAttribute("Game");
		local l = L:GetAttribute("Game");
		if E ~= nil and (E ~= "" and (l ~= nil and (l ~= "" and E ~= l))) then
			return false;
		end;
		if ((E == nil or E == "")) and (l ~= nil and l ~= "") then
			return false;
		end;
		local Z = z:GetAttribute("MatchId");
		local d = L:GetAttribute("MatchId");
		if Z ~= nil and (Z ~= "" and (d ~= nil and (d ~= "" and Z ~= d))) then
			return false;
		end;
		local c = z.Character and z.Character:FindFirstChild("HumanoidRootPart");
		local H = L.Character and L.Character:FindFirstChild("HumanoidRootPart");
		if c and (H and ((c.Position - H.Position)).Magnitude > 1200) then
			return false;
		end;
		return true;
	end;
	local function V()
		y.LastRefresh = -math.huge;
	end;
	local function O(L, N)
		if typeof(L) ~= "Instance" or not L:IsA("Player") or typeof(N) ~= "Instance" or not N:IsA("Player") or L == N or not H() or (L ~= z and not b(L, true)) or (N ~= z and not b(N, true)) then
			return;
		end;
		local E = i(false);
		if E.Targets[N] then
			return;
		end;
		if E.Targets[L] then
			E.Converted[N] = true;
			E.ConvertedAt[N] = os.clock();
			E.LastRefresh = -math.huge;
			i(true);
		else
			if #E.Pending >= 96 then
				table.remove(E.Pending, 1);
			end;
			E.Pending[#E.Pending + 1] = { Killer = L, Victim = N, Time = os.clock() };
			E.LastRefresh = -math.huge;
		end;
	end;
	local F;
	F = function(L)
			if not L or L == z or not L.Parent then
				return false;
			end;
			if H() then
				return b(L) and R(L);
			end;
			local N = G(false);
			if not k.InGame or not N[string.lower(L.Name)] then
				return false;
			end;
			local E = z:GetAttribute("Game");
			local l = L:GetAttribute("Game");
			if E ~= nil and (E ~= "" and (l ~= nil and l ~= "")) then
				if E ~= l then
					return false;
				end;
			elseif ((E == nil or E == "")) and (l ~= nil and l ~= "") then
				return false;
			end;
			local Z = z:GetAttribute("MatchId");
			local d = L:GetAttribute("MatchId");
			if Z ~= nil and (Z ~= "" and (d ~= nil and (d ~= "" and Z ~= d))) then
				return false;
			end;
			return true;
		end;
	local function u(L)
		if not L then
			return nil;
		end;
		local N = G(false);
		local E = N[string.lower(L.Name)];
		if not E and L.DisplayName then
			E = N[string.lower(L.DisplayName)];
		end;
		if E then
			return E;
		end;
		local l = L:GetAttribute("Team") or L:GetAttribute("team");
		if l ~= nil and tostring(l) ~= "" then
			return tostring(l);
		end;
		if L.Team then
			return L.Team.Name;
		end;
		local Z = L.TeamColor;
		if Z and (Z.Name ~= "White" and Z.Name ~= "Medium stone grey") then
			return "Color:" .. Z.Name;
		end;
		return nil;
	end;
	local function J(L, N)
		if not L or not N or L == N then
			return false;
		end;
		if H() then
			return R(N);
		end;
		local E = u(L);
		local l = u(N);
		if E ~= nil and l ~= nil then
			return E ~= l;
		end;
		return true;
	end;
	local function t()
		s();
		if E then
			E();
		end;
	end;
	local function Y()
		s();
		V();
		if E then
			E();
		end;
	end;
	local X = {};
	local o = {};
	local function Q(L)
		c(o[L]);
		o[L] = nil;
		local N = X[L];
		if N then
			c(N);
			X[L] = nil;
		end;
	end;
	local function D(L, N)
		c(o[L]);
		o[L] = nil;
		if not N then
			return;
		end;
		local E = {};
		o[L] = E;
		local function l(L)
			if L == "InfectionPatientZero" or L == "InfectionInfected" or L == "IsInfected" or L == "Infected" or L == "IsZombie" or L == "Zombie" then
				V();
				Y();
			end;
		end;
		E[#E + 1] = N.AttributeChanged:Connect(l);
		local function Z(L)
			if L and L:IsA("Humanoid") then
				E[#E + 1] = L.AttributeChanged:Connect(l);
			end;
		end;
		Z(N:FindFirstChildOfClass("Humanoid"));
		E[#E + 1] = N.ChildAdded:Connect(function(L)
				if L:IsA("Humanoid") then
					Z(L);
					V();
				end;
			end);
	end;
	local function j(L)
		if not L or L == z or not L.Parent then
			return;
		end;
		Q(L);
		X[L] = {
				(L:GetPropertyChangedSignal("Team")):Connect(Y),
				(L:GetPropertyChangedSignal("TeamColor")):Connect(Y),
				(L:GetAttributeChangedSignal("Team")):Connect(Y),
				(L:GetAttributeChangedSignal("team")):Connect(Y),
				(L:GetAttributeChangedSignal("Game")):Connect(Y),
				(L:GetAttributeChangedSignal("MatchId")):Connect(Y),
				L.AttributeChanged:Connect(function(L)
					if L == "InfectionPatientZero" or L == "InfectionInfected" or L == "IsInfected" or L == "Infected" or L == "IsZombie" or L == "Zombie" then
						V();
						Y();
					end;
				end),
				L.CharacterAdded:Connect(function(N)
					D(L, N);
					V();
					Y();
				end),
				L.CharacterRemoving:Connect(function(N)
					D(L, nil);
					V();
					if Z then
						Z(N);
					end;
				end),
			};
		D(L, L.Character);
		Y();
	end;
	local h = {};
	local e = false;
	local n = 0;
	local function T(L)
		h[#h + 1] = L;
		return L;
	end;
	local function LG()
		if e then
			return;
		end;
		e = true;
		n = n + (1);
		local E = n;
		local function Z()
			t();
			V();
		end;
		for L, N in ipairs({ "Team", "TeamColor" }) do
			T((z:GetPropertyChangedSignal(N)):Connect(Z));
		end;
		for L, N in ipairs({
			"Team",
			"team",
			"Game",
			"MatchId",
			"GameMode",
			"MatchMode",
			"Mode",
		}) do
			T((z:GetAttributeChangedSignal(N)):Connect(Z));
		end;
		T(z.AttributeChanged:Connect(function(L)
			if L == "InfectionPatientZero" or L == "InfectionInfected" or L == "IsInfected" or L == "Infected" or L == "IsZombie" or L == "Zombie" then
				V();
			end;
		end));
		T(z.CharacterAdded:Connect(V));
		T(N.DescendantAdded:Connect(function(L)
			if L.Name == "IngameScore" or L.Name == "TeamRed" or L.Name == "TeamBlue" then
				s();
				V();
			end;
		end));
		T(N.DescendantRemoving:Connect(function(L)
			if L == k.Scoreboard or L.Name == "IngameScore" or L.Name == "TeamRed" or L.Name == "TeamBlue" then
				s();
				V();
			end;
		end));
		for L, N in ipairs(L:GetPlayers()) do
			if N ~= z then
				j(N);
			end;
		end;
		T(L.PlayerAdded:Connect(function(L)
			y.LateJoiners[L] = true;
			j(L);
			V();
		end));
		T(L.PlayerRemoving:Connect(function(L)
			Q(L);
			for N = #y.Pending, 1, -1 do
				local E = y.Pending[N];
				if E.Killer == L or E.Victim == L then
					table.remove(y.Pending, N);
				end;
			end;
			for N, E in ipairs({
				"Converted",
				"ConvertedAt",
				"LateJoiners",
				"Inferred",
				"Targets",
				"RoleTeams",
			}) do
				y[E][L] = nil;
			end;
			Y();
		end));
		s();
		V();
		task.spawn(function()
			local L = {};
			local N = {
					["RE/Combat/Killed"] = O,
					["RE/Match/PlayerRespawned"] = V,
					["RE/Match/StartRoundGui"] = function()
						q(false);
					end,
					["RE/Match/MatchResults"] = function()
						if y.Active then
							q(true);
						end;
					end,
				};
			while e and E == n do
				local E = l:FindFirstChild("Packages");
				local Z = E and E:FindFirstChild("Networking");
				local d = true;
				for N, E in pairs(N) do
					if not L[N] then
						local l = Z and Z:FindFirstChild(N);
						if l and l:IsA("RemoteEvent") then
							T(l.OnClientEvent:Connect(E));
							L[N] = true;
						else
							d = false;
						end;
					end;
				end;
				if d then
					break;
				end;
				task.wait(2);
			end;
		end);
	end;
	local function NG()
		if not e then
			return;
		end;
		e = false;
		n = n + (1);
		c(h);
		for L in pairs(X) do
			Q(L);
		end;
		c(k.WatchConnections);
		k.Scoreboard = nil;
		k.Snapshot = {};
		k.InGame = false;
		k.Dirty = true;
		q(false);
	end;
	P = function()
			if U or x or A or p or W or (g and K.Glow) or v or f then
				LG();
			else
				NG();
			end;
		end;
	wG = function(L)
			if not F(L) or not L.Character then
				return false;
			end;
			if not w(L) then
				return false;
			end;
			return J(z, L);
		end;
	xG = function(L)
			if not wG(L) then
				return false;
			end;
			local N = L.Character;
			return N ~= nil and (not N:FindFirstChildOfClass("ForceField") and w(L));
		end;
	local EG = { { Center = Vector3.new(-320.5, 280.82, 16), Radius = 500 }, { Center = Vector3.new(1564.14, -155.45, 40.04), Radius = 300 } };
	mG = function()
			local L = z.Character;
			if not L then
				return true;
			end;
			if L:FindFirstChildOfClass("ForceField") then
				return true;
			end;
			if z.Team then
				local L = z.Team.Name:lower();
				if L:find("lobby") or L:find("spectat") or L:find("espectador") or L:find("menu") or L:find("dead") then
					return true;
				end;
			end;
			local N = L:FindFirstChild("HumanoidRootPart");
			if N then
				for L, E in ipairs(EG) do
					if ((N.Position - E.Center)).Magnitude <= E.Radius then
						return true;
					end;
				end;
			end;
			return false;
		end;
	UG = function()
			if mG() then
				return false;
			end;
			G(false);
			return k.InGame or H();
		end;
	kG = function(L)
			if not L or not L:IsA("Tool") then
				return false;
			end;
			if L:FindFirstChild("Slash") or L:FindFirstChild("SlashStart") then
				return true;
			end;
			local N = L.Name:lower();
			return N:find("knife", 1, true) ~= nil or N:find("cuchillo", 1, true) ~= nil or N:find("dagger", 1, true) ~= nil;
		end;
	AG = function(L)
			if not L or not L:IsA("Tool") then
				return false;
			end;
			local N = L:FindFirstChild("showBeam");
			return N ~= nil and N:IsA("RemoteEvent");
		end;
	pG = function()
			local L = z.Character;
			if L then
				for L, N in ipairs(L:GetChildren()) do
					if AG(N) then
						return N;
					end;
				end;
			end;
			local N = z:FindFirstChildOfClass("Backpack");
			if N then
				for L, N in ipairs(N:GetChildren()) do
					if AG(N) then
						return N;
					end;
				end;
			end;
			return nil;
		end;
end;
local function sG(L)
	if not L or not L:IsA("Tool") then
		return false;
	end;
	for N, E in ipairs({
		"Reloading",
		"IsReloading",
		"reloading",
		"isReloading",
		"Reload",
		"reload",
	}) do
		local l = L:GetAttribute(E);
		if l == true or l == "true" then
			return true;
		end;
	end;
	for L, N in ipairs(L:GetChildren()) do
		if N:IsA("BoolValue") and N.Value == true then
			local L = string.lower(N.Name);
			if string.find(L, "reload") or string.find(L, "recarg") then
				return true;
			end;
		end;
	end;
	local N = z.Character;
	local E = N and N:FindFirstChildOfClass("Humanoid");
	if E then
		for L, N in ipairs(E:GetPlayingAnimationTracks()) do
			local E = N.Animation and N.Animation.AnimationId or "";
			if string.find(string.lower(E), "reload") then
				return true;
			end;
		end;
	end;
	for L, N in ipairs(L:GetDescendants()) do
		if N:IsA("Sound") and N.Playing then
			local L = string.lower(N.Name);
			if string.find(L, "reload") or string.find(L, "recarg") then
				return true;
			end;
		end;
	end;
	return false;
end;
local IG = {};
IG.__index = IG;
function IG.new()
	return setmetatable({ Items = {} }, IG);
end;
function IG.Add(N, L)
	N.Items[#N.Items + 1] = L;
	return L;
end;
function IG.Cleanup(L)
	for N = #L.Items, 1, -1 do
		local E = L.Items[N];
		L.Items[N] = nil;
		local l = typeof(E);
		if l == "RBXScriptConnection" then
			pcall(function()
				E:Disconnect();
			end);
		elseif l == "Instance" then
			pcall(function()
				E:Destroy();
			end);
		elseif l == "function" then
			pcall(E);
		end;
	end;
end;
local function gG()
	for L, N in ipairs(L:GetPlayers()) do
		local E = N.Character;
		if E then
			local L = E:FindFirstChild("GhostHitbox");
			if L then
				L:Destroy();
			end;
		end;
	end;
end;
do
	local N = false;
	J = function()
			if N or not v then
				return;
			end;
			N = true;
			task.spawn(function()
				while v do
					task.wait(.2);
					if not v then
						break;
					end;
					if not UG() then
						gG();
						continue;
					end;
					local N = Vector3.new(M, M, M);
					local E = a and 1 or .6;
					for L, l in ipairs(L:GetPlayers()) do
						if l ~= z and wG(l) then
							local L = l.Character;
							if L then
								local l = L:FindFirstChild("HumanoidRootPart");
								local Z = L:FindFirstChildOfClass("Humanoid");
								if l and (Z and Z.Health > 0) then
									local Z = L:FindFirstChild("GhostHitbox");
									if not Z then
										Z = Instance.new("Part");
										Z.Name = "GhostHitbox";
										Z.Size = N;
										Z.Transparency = E;
										Z.Color = y;
										Z.CanCollide = false;
										Z.Massless = true;
										Z.CanQuery = true;
										Z.CFrame = l.CFrame;
										Z.Parent = L;
										local d = Instance.new("WeldConstraint");
										d.Part0 = l;
										d.Part1 = Z;
										d.Parent = Z;
									else
										if Z.Size ~= N then
											Z.Size = N;
										end;
										if Z.Transparency ~= E then
											Z.Transparency = E;
										end;
										if Z.Color ~= y then
											Z.Color = y;
										end;
										if not Z.CanQuery then
											Z.CanQuery = true;
										end;
									end;
								else
									local N = L:FindFirstChild("GhostHitbox");
									if N then
										N:Destroy();
									end;
								end;
							end;
						else
							local L = l.Character;
							if L then
								local N = L:FindFirstChild("GhostHitbox");
								if N then
									N:Destroy();
								end;
							end;
						end;
					end;
				end;
				N = false;
				if not v then
					gG();
				end;
			end);
		end;
end;
local GG = { ["Right Platforms"] = {
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
		Connections = IG.new(),
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
function AutoTeleportMainAlt.GetActiveRole(L)
	if L.ActiveRole == "Main" then
		return "Main";
	end;
	if L.ActiveRole == "Alt" then
		return "Alt";
	end;
	return nil;
end;
function AutoTeleportMainAlt.GetRoot(L)
	local N = z.Character;
	if not N then
		return nil;
	end;
	local E = N:FindFirstChild("HumanoidRootPart");
	if E and E:IsA("BasePart") then
		return E;
	end;
	return nil;
end;
function AutoTeleportMainAlt.GetHumanoid(L)
	local N = z.Character;
	return N and N:FindFirstChildOfClass("Humanoid") or nil;
end;
function AutoTeleportMainAlt.Attr(N, L)
	local E = z:GetAttribute(L);
	if typeof(E) == "string" and E ~= "" then
		return E;
	end;
	return nil;
end;
function AutoTeleportMainAlt.Snapshot(L)
	local N = L:Attr("Game");
	local E = L:Attr("Map");
	local l = z.Character;
	local Z = l and l:FindFirstChildOfClass("Humanoid");
	local d = l and l:FindFirstChild("HumanoidRootPart");
	local c = Z ~= nil and (Z.Health > 0 and d ~= nil);
	return {
		Game = N,
		Map = E,
		InGame = N ~= nil,
		InMap = N ~= nil and E ~= nil,
		Alive = c,
	};
end;
function AutoTeleportMainAlt.IsOnMatch(L)
	local N = L:Snapshot();
	return N and (N.InGame == true and (N.InMap ~= true and N.Alive));
end;
function AutoTeleportMainAlt.ResolvePad(N, L)
	local E = GG[N.PlatformRow] or GG["Right Platforms"];
	local l = E[N.DuelType] or E["1v1"];
	local Z = d:FindFirstChild("PadZones");
	if not Z then
		return nil;
	end;
	local c = Z:FindFirstChild(l.ZoneName);
	if not c then
		return nil;
	end;
	local z = (L == "Alt") and l.AltPad or l.MainPad;
	local H = c:FindFirstChild(z);
	if not H then
		return nil;
	end;
	local w = H:FindFirstChild("Pad");
	if w and w:IsA("BasePart") then
		return w;
	end;
	return nil;
end;
function AutoTeleportMainAlt.IsOnPad(N, L)
	if not L then
		return false;
	end;
	local E = N:GetRoot();
	if not E then
		return false;
	end;
	local l = L.CFrame:PointToObjectSpace(E.Position);
	local Z = L.Size / 2;
	return math.abs(l.X) <= Z.X + .5 and (math.abs(l.Z) <= Z.Z + .5 and (l.Y >= -((Z.Y + 6)) and l.Y <= Z.Y + 14));
end;
function AutoTeleportMainAlt.MarkPad(E, L, N)
	if not L then
		E:UnmarkPad();
		return;
	end;
	if E.HighlightedPad == L then
		return;
	end;
	E:UnmarkPad();
	E.HighlightedPad = L;
	E.PadColors[L] = { Color = L.Color, Transparency = L.Transparency };
	pcall(function()
		L.Color = N and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(70, 145, 255);
		L.Transparency = .5;
	end);
end;
function AutoTeleportMainAlt.UnmarkPad(L)
	if L.HighlightedPad and L.PadColors[L.HighlightedPad] then
		local N = L.HighlightedPad;
		local E = L.PadColors[N];
		pcall(function()
			if N.Parent then
				N.Color = E.Color;
				N.Transparency = E.Transparency;
			end;
		end);
	end;
	L.HighlightedPad = nil;
end;
function AutoTeleportMainAlt.FindVoteRemote(L)
	local N = l:FindFirstChild("Packages");
	local E = N and N:FindFirstChild("Networking");
	local Z = E and E:FindFirstChild("RF/Voting/Vote");
	if Z and Z:IsA("RemoteFunction") then
		return Z;
	end;
	return nil;
end;
function AutoTeleportMainAlt.FindVisibleMapVote(L)
	local N = z:FindFirstChild("PlayerGui");
	local E = N and N:FindFirstChild("Main");
	local l = E and E:FindFirstChild("MapVoting");
	local Z = l and l:FindFirstChild("VotingHolder");
	if not Z then
		return nil;
	end;
	for L, N in ipairs(Z:GetChildren()) do
		if N:IsA("ImageButton") and (N.Visible and N.Name ~= "") then
			return N.Name;
		end;
	end;
	return nil;
end;
function AutoTeleportMainAlt.VoteMap(L)
	local N = L:Snapshot();
	if not L:IsOnMatch() then
		return;
	end;
	if L.VotedMap == N.Game then
		return;
	end;
	local E = os.clock();
	if E - ((L.LastVote or 0)) < L.VoteCooldown then
		return;
	end;
	L.LastVote = E;
	local l = L:FindVisibleMapVote();
	local Z = L:FindVoteRemote();
	if not ((l and Z)) then
		return;
	end;
	L.VotedMap = N.Game;
	pcall(function()
		Z:InvokeServer(l);
	end);
end;
function AutoTeleportMainAlt.FindSetStateRemote(L)
	local N = l:FindFirstChild("Packages");
	local E = N and N:FindFirstChild("Networking");
	local Z = E and E:FindFirstChild("RE/Match/SetStatePlr");
	if Z and Z:IsA("RemoteEvent") then
		return Z;
	end;
	return nil;
end;
function AutoTeleportMainAlt.CancelQueue(L)
	local N = os.clock();
	if N - ((L.LastCancel or 0)) < L.CancelCooldown then
		return;
	end;
	local E = L:FindSetStateRemote();
	if not E then
		return;
	end;
	L.LastCancel = N;
	pcall(function()
		E:FireServer("REMOVE");
	end);
end;
function AutoTeleportMainAlt.HideGameFrame(L)
	local N = z:FindFirstChild("PlayerGui");
	local E = N and N:FindFirstChild("Main");
	local l = E and E:FindFirstChild("MainGameFrame");
	if l and l:IsA("GuiObject") then
		pcall(function()
			l.Visible = false;
		end);
	end;
end;
function AutoTeleportMainAlt.HoldCenter(L)
	local N = L:GetHumanoid();
	local E = L:GetRoot();
	if N and E then
		pcall(function()
			N:MoveTo(E.Position);
		end);
	end;
end;
function AutoTeleportMainAlt.Teleport(N, L)
	if not L then
		return;
	end;
	local E = N:GetRoot();
	local l = N:GetHumanoid();
	if not ((E and l)) then
		return;
	end;
	pcall(function()
		E.AssemblyAngularVelocity = Vector3.zero;
		E.AssemblyLinearVelocity = Vector3.zero;
		N:CancelQueue();
		N:HideGameFrame();
		l:MoveTo(L.Position);
	end);
end;
function AutoTeleportMainAlt.Process(L)
	if not L.Running then
		return;
	end;
	local N = L:Snapshot();
	if N.InGame then
		L:UnmarkPad();
		L:HoldCenter();
		L:VoteMap();
		return;
	end;
	local E = L:GetActiveRole();
	if not E then
		L:UnmarkPad();
		return;
	end;
	local l = L:ResolvePad(E);
	L:MarkPad(l, E == "Alt");
	if not l then
		return;
	end;
	if L:IsOnPad(l) then
		return;
	end;
	local Z = os.clock();
	if Z - ((L.LastTeleport or 0)) < L.TeleportCooldown then
		return;
	end;
	L.LastTeleport = Z;
	L:Teleport(l);
end;
function AutoTeleportMainAlt.Kick(L)
	if L.Running then
		L:Process();
	end;
end;
function AutoTeleportMainAlt.Start(L)
	if L.Running then
		return;
	end;
	L.Running = true;
	L.Acc = 0;
	L.LastTeleport = 0;
	L.LastVote = 0;
	L.LastCancel = 0;
	L.Connections:Add((z:GetAttributeChangedSignal("Game")):Connect(function()
		task.defer(function()
			if L.Running then
				L:Process();
			end;
		end);
	end));
	L.Connections:Add((z:GetAttributeChangedSignal("Map")):Connect(function()
		task.defer(function()
			if L.Running then
				L:Process();
			end;
		end);
	end));
	L.Connections:Add((z:GetAttributeChangedSignal("Team")):Connect(function()
		task.defer(function()
			if L.Running then
				L:Process();
			end;
		end);
	end));
	L.Connections:Add(N.Heartbeat:Connect(function(N)
		if not L.Running then
			return;
		end;
		L.Acc = L.Acc + N;
		if L.Acc >= L.TickInterval then
			L.Acc = 0;
			L:Process();
		end;
	end));
	L:Process();
end;
function AutoTeleportMainAlt.Stop(L)
	if not L.Running then
		return;
	end;
	L.Running = false;
	L.Connections:Cleanup();
	L.Connections = IG.new();
	L:UnmarkPad();
	L.VotedMap = nil;
end;
AutoTeleportMainAltInstance = AutoTeleportMainAlt.new();
local function KG()
	local L = z:FindFirstChild("PlayerGui");
	if not L then
		return false;
	end;
	local N = L:FindFirstChild("Main") or L;
	local E = N:FindFirstChild("MainGameFrame");
	if not E or not E.Visible then
		return false;
	end;
	local l = E:FindFirstChild("IngameScore");
	local Z = l and l:FindFirstChild("Timer");
	if not Z then
		return false;
	end;
	if not ((Z:IsA("TextLabel") or Z:IsA("TextButton") or Z:IsA("TextBox"))) then
		return false;
	end;
	local d = (tostring(Z.Text or "")):gsub("%s", "");
	if d == "" then
		return false;
	end;
	if string.find(d, "-") then
		return false;
	end;
	if d == "0:00" or d == "00:00" or d == "0:0" then
		return false;
	end;
	return d:match("^%d+:%d%d$") ~= nil;
end;
do
	local E = 39.9;
	local l = 1.2;
	local Z = .6;
	local c = .5;
	local H = 3;
	local w = 2.5;
	local m = 20;
	local U = 15;
	local x = 1.5;
	local k = 1.2;
	local A = 90;
	local p = 2.5;
	local s = 6;
	local I = .5;
	local g = 7.5;
	local G = .3;
	local K = .08;
	local f = .16;
	local v = 25;
	local a = 6;
	local M = 1.5;
	local y = 6;
	local S = .6;
	local C = .25;
	local B = 1;
	local r = 3;
	local q = .06;
	local i = 40;
	local R = {};
	R.__index = R;
	function R.new()
		return setmetatable({
			running = false,
			connections = IG.new(),
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
		}, R);
	end;
	function R.DisableCollisions(L)
		local N = z.Character;
		if not N then
			return;
		end;
		for N, E in ipairs(N:GetDescendants()) do
			if E:IsA("BasePart") and E.CanCollide then
				if L.savedCollisions[E] == nil then
					L.savedCollisions[E] = E.CanCollide;
				end;
				E.CanCollide = false;
			end;
		end;
	end;
	function R.RestoreCollisions(L)
		for L, N in pairs(L.savedCollisions) do
			if L.Parent then
				pcall(function()
					L.CanCollide = N;
				end);
			end;
		end;
		table.clear(L.savedCollisions);
	end;
	function R.GetRoot(N, L)
		local E = L and L.Character;
		if not E then
			return nil;
		end;
		local l = E:FindFirstChild("HumanoidRootPart");
		if l and l:IsA("BasePart") then
			return l;
		end;
		return nil;
	end;
	function R.GetHumanoid(N, L)
		local E = L and L.Character;
		return E and E:FindFirstChildOfClass("Humanoid") or nil;
	end;
	function R.GetFloorY(N, L)
		local E = L.Parent and L.Parent:FindFirstChildOfClass("Humanoid");
		local l = E and tonumber(E.HipHeight) or 2;
		return (L.Position.Y - l) - L.Size.Y / 2;
	end;
	function R.GetPlatformFloorY(N, L)
		if not L then
			return nil;
		end;
		local E = os.clock();
		if N.lastFloorTarget == L and (N.targetFloorY and (E - ((N.floorCheckTime or 0))) < C) then
			return N.targetFloorY;
		end;
		local l = RaycastParams.new();
		l.FilterType = Enum.RaycastFilterType.Exclude;
		l.FilterDescendantsInstances = { z.Character, L.Parent };
		local Z = L.Position + Vector3.new(0, 3, 0);
		local c = d:Raycast(Z, Vector3.new(0, -500, 0), l);
		N.floorCheckTime = E;
		if c then
			N.targetFloorY = c.Position.Y;
			N.lastFloorTarget = L;
			return N.targetFloorY;
		end;
		N.targetFloorY = N:GetFloorY(L);
		N.lastFloorTarget = L;
		return N.targetFloorY;
	end;
	function R.IsInKnifeRange(E, L, N)
		if not L or not N then
			return false;
		end;
		local d = N.Position - L.Position;
		local c = (Vector3.new(d.X, 0, d.Z)).Magnitude;
		local z = math.abs(d.Y);
		return c <= (l + Z) and z <= g;
	end;
	function R.IsLockedTargetValid(L)
		local N = L.lockedTargetPlayer;
		if not N then
			return false;
		end;
		if not N.Parent then
			return false;
		end;
		if not xG(N) then
			return false;
		end;
		local E = N.Character;
		if not E then
			return false;
		end;
		local l = E:FindFirstChild("HumanoidRootPart");
		local Z = E:FindFirstChildOfClass("Humanoid");
		if not l or not Z then
			return false;
		end;
		if Z.Health <= 0 then
			return false;
		end;
		return l;
	end;
	function R.GetClosestEnemy(N)
		local E = N:GetRoot(z);
		if not E then
			return nil;
		end;
		local l = N:IsLockedTargetValid();
		if l then
			return l;
		end;
		N.lockedTargetPlayer = nil;
		N.currentTarget = nil;
		local Z, d, c = nil, nil, nil;
		for L, l in ipairs(L:GetPlayers()) do
			if l ~= z and xG(l) then
				local L = N:GetHumanoid(l);
				local z = N:GetRoot(l);
				if z and (L and L.Health > 0) then
					local L = ((z.Position - E.Position)).Magnitude;
					if not d or L < d then
						Z, d, c = z, L, l;
					end;
				end;
			end;
		end;
		if c then
			N.lockedTargetPlayer = c;
		end;
		return Z;
	end;
	function R.IsInMatch(L)
		return KG();
	end;
	function R.ResetState(L)
		L.sticking = false;
		L.stickingStartTime = 0;
		L.lastEnemyHealth = nil;
		L.lastHealthChangeTime = 0;
		L.targetFloor = nil;
		L.inKnifeRangeNow = false;
		L.forceDescent = false;
		L.jitterSide = 1;
		L.jitterCurrent = 0;
		L.jitterNextSwitch = 0;
		L.lastSetCFrame = nil;
		L.validFrames = 0;
		L.killActivated = false;
		L.triggerStart = nil;
		L:RestoreCollisions();
		local N = L:GetHumanoid(z);
		if N and N.PlatformStand then
			pcall(function()
				N.PlatformStand = false;
			end);
		end;
	end;
	function R.ReturnToSafePosition(N, L)
		if not N.safePosition or not L then
			return;
		end;
		local E = L.Position.Y;
		if E < (N.safePosition.Y - H) then
			pcall(function()
				L.CFrame = CFrame.new(N.safePosition);
				L.AssemblyLinearVelocity = Vector3.zero;
				L.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
	end;
	function R.ForceReturnToSafe(N, L)
		if not N.safePosition or not L then
			return;
		end;
		pcall(function()
			L.CFrame = CFrame.new(N.safePosition);
			L.AssemblyLinearVelocity = Vector3.zero;
			L.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function R.IsFallingIntoVoid(N, L)
		if not N.safePosition or not L then
			return false;
		end;
		local E = N.safePosition.Y - U;
		if N.targetFloorY and (N.lastFloorTarget and N.lastFloorTarget.Parent) then
			E = math.min(E, (N.targetFloorY - a) - U);
		end;
		return L.Position.Y < E;
	end;
	function R.HideBelowMap(L)
		local N = L:GetRoot(z);
		if not N then
			return;
		end;
		local E = L.safePosition and L.safePosition.Y or N.Position.Y;
		local l = E - s;
		local Z, d = N.Position.X, N.Position.Z;
		pcall(function()
			N.CFrame = CFrame.new(Z, l, d);
			N.AssemblyLinearVelocity = Vector3.zero;
			N.AssemblyAngularVelocity = Vector3.zero;
		end);
		L.hiding = true;
		L.hidingUntil = os.clock() + I;
	end;
	function R.IsKnife(N, L)
		if not ((L and L:IsA("Tool"))) then
			return false;
		end;
		if L:FindFirstChild("fire") or L:FindFirstChild("showBeam") then
			return false;
		end;
		return L:FindFirstChild("Slash") ~= nil or L:FindFirstChild("SlashStart") ~= nil;
	end;
	function R.FindKnife(L)
		local N = z.Character;
		if N then
			for N, E in ipairs(N:GetChildren()) do
				if L:IsKnife(E) then
					return E, true;
				end;
			end;
		end;
		local E = z:FindFirstChildOfClass("Backpack");
		if E then
			for N, E in ipairs(E:GetChildren()) do
				if L:IsKnife(E) then
					return E, false;
				end;
			end;
		end;
		return nil, false;
	end;
	function R.SwingKnife(N, L)
		N.swingAccumulator = N.swingAccumulator + L;
		if N.swingAccumulator < c then
			return;
		end;
		N.swingAccumulator = 0;
		local E, l = N:FindKnife();
		if not E then
			return;
		end;
		if not l then
			local L = N:GetHumanoid(z);
			if not L then
				return;
			end;
			pcall(function()
				L:EquipTool(E);
			end);
			if E.Parent ~= z.Character then
				return;
			end;
		end;
		pcall(function()
			E:Activate();
		end);
	end;
	function R.UpdateJitter(N, L)
		local E = os.clock();
		if E >= N.jitterNextSwitch then
			N.jitterSide = (math.random() < .5) and 1 or -1;
			N.jitterNextSwitch = (E + K) + math.random() * ((f - K));
		end;
		local l = N.jitterSide * G;
		N.jitterCurrent = N.jitterCurrent + ((l - N.jitterCurrent)) * math.clamp(L * v, 0, 1);
	end;
	function R.CheckServerValidation(N, L)
		if N.killActivated then
			return true;
		end;
		if not N.lastSetCFrame then
			return false;
		end;
		local E = N.lastSetCFrame.Position;
		local l = L.Position;
		local Z = ((l - E)).Magnitude;
		if Z <= B then
			N.validFrames = N.validFrames + 1;
			if N.validFrames >= r then
				N.killActivated = true;
				N.swingAccumulator = c;
				return true;
			end;
		else
			N.validFrames = 0;
		end;
		return false;
	end;
	function R.ForceUnderground(E, L, N)
		if not L or not N then
			return;
		end;
		local l = E:GetPlatformFloorY(N);
		if not l then
			return;
		end;
		local Z = l - a;
		if L.Position.Y > Z + M then
			pcall(function()
				L.CFrame = CFrame.new(L.Position.X, Z, L.Position.Z);
				L.AssemblyLinearVelocity = Vector3.zero;
				L.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
	end;
	function R.ApproachTarget(Z, L, N, l)
		l = l or 0;
		local d = L.Position;
		local z = N.Position;
		local H = Vector3.new(z.X - d.X, 0, z.Z - d.Z);
		local w = H.Magnitude;
		if w <= y then
			if not Z.sticking then
				local E = os.clock();
				if not Z.triggerStart then
					Z.triggerStart = E;
				end;
				local l = Vector3.new(z.X, d.Y, z.Z);
				local H = CFrame.lookAt(d, l);
				Z.lastSetCFrame = H;
				pcall(function()
					L.CFrame = H;
					L.AssemblyLinearVelocity = Vector3.zero;
					L.AssemblyAngularVelocity = Vector3.zero;
				end);
				local w = Z:CheckServerValidation(L);
				if w or (E - Z.triggerStart) >= S then
					Z.killActivated = true;
					Z.swingAccumulator = c;
					Z.triggerStart = nil;
					Z.sticking = true;
					Z.stickingStartTime = os.clock();
					Z.lastStickTarget = N;
					Z.targetFloor = nil;
					Z.forceDescent = true;
					local L = Z:GetHumanoid(N.Parent);
					Z.lastEnemyHealth = L and L.Health or nil;
					Z.lastHealthChangeTime = os.clock();
					Z.lastStickTargetHum = L;
					Z.jitterCurrent = 0;
				end;
			end;
			return;
		end;
		Z.lastSetCFrame = nil;
		Z.validFrames = 0;
		Z.triggerStart = nil;
		local m = H.Unit;
		local U = Vector3.new(-m.Z, 0, m.X);
		Z:UpdateJitter(l);
		local x = E * l;
		local k = math.min(x, math.max(0, w - y));
		local A = math.sqrt(math.max(0, k * ((2 * w - k)))) * .85;
		local p = math.clamp(((w - y)) / 8, 0, 1);
		local s = Z.jitterCurrent * p;
		local I = math.clamp(s, -A, A);
		local g = d.X + m.X * k;
		local G = d.Z + m.Z * k;
		local K = g + U.X * I;
		local f = G + U.Z * I;
		local v = Z:GetPlatformFloorY(N);
		local M;
		if v then
			M = v - a;
		else
			M = d.Y;
		end;
		local C = Vector3.new(K, M, f);
		local B = Vector3.new(z.X, C.Y, z.Z);
		local r = CFrame.lookAt(C, B);
		pcall(function()
			L.CFrame = r;
			L.AssemblyLinearVelocity = Vector3.zero;
			L.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function R.CanStickToTarget(l, N, E)
		if not E or not E.Parent then
			return false;
		end;
		local Z = L:GetPlayerFromCharacter(E.Parent);
		if not Z or not xG(Z) then
			return false;
		end;
		local d = E.Parent:FindFirstChildOfClass("Humanoid");
		if not d or d.Health <= 0 then
			return false;
		end;
		local c = ((Vector3.new(N.Position.X, 0, N.Position.Z) - Vector3.new(E.Position.X, 0, E.Position.Z))).Magnitude;
		if c > m then
			return false;
		end;
		return true;
	end;
	function R.StickToTarget(Z, L, N, E)
		E = E or .016;
		local d = N.Position;
		local c = N.Parent and N.Parent:FindFirstChildOfClass("Humanoid");
		local z = c and c.FloorMaterial ~= Enum.Material.Air;
		if N ~= Z.lastStickTarget then
			Z.lastStickTarget = N;
			Z.targetFloor = nil;
		end;
		if z or not Z.targetFloor then
			Z.targetFloor = Z:GetFloorY(N);
		end;
		local H = L.Position;
		local w = N.AssemblyLinearVelocity;
		local m = d.X + w.X * q;
		local U = d.Z + w.Z * q;
		local x = N.CFrame.LookVector;
		local k = Vector3.new(-x.X, 0, -x.Z);
		if k.Magnitude < .05 then
			k = Vector3.new(0, 0, 1);
		else
			k = k.Unit;
		end;
		local s = m + k.X * l;
		local I = U + k.Z * l;
		local g = Z:IsInKnifeRange(L, N);
		local G;
		if g and not Z.forceDescent then
			G = H.Y;
		else
			G = Z.targetFloor - p;
			if g then
				Z.forceDescent = false;
			end;
		end;
		local K = Z.targetFloor - p;
		if G > K then
			G = K;
		end;
		local f = math.clamp(E * i, 0, 1);
		local v = H:Lerp(Vector3.new(s, G, I), f);
		pcall(function()
			L.CFrame = CFrame.new(v) * CFrame.Angles(math.rad(A), 0, 0);
			L.AssemblyLinearVelocity = Vector3.zero;
			L.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function R.CheckEnemyHealth(N, L)
		local E = L.Parent and L.Parent:FindFirstChildOfClass("Humanoid");
		if not E then
			return false;
		end;
		local l = E.Health;
		if N.lastEnemyHealth == nil then
			N.lastEnemyHealth = l;
			N.lastHealthChangeTime = os.clock();
			return false;
		end;
		if l < N.lastEnemyHealth then
			N.lastEnemyHealth = l;
			N.lastHealthChangeTime = os.clock();
			return false;
		end;
		if (os.clock() - N.lastHealthChangeTime) >= x then
			return true;
		end;
		return false;
	end;
	function R.Update(N, L)
		if not N:IsInMatch() then
			N:ResetState();
			N.currentTarget = nil;
			N.lockedTargetPlayer = nil;
			N.lastStickTarget = nil;
			N.lastFloorTarget = nil;
			N.targetFloorY = nil;
			return;
		end;
		local E = N:GetRoot(z);
		if not E then
			N:ResetState();
			N.currentTarget = nil;
			N.lockedTargetPlayer = nil;
			return;
		end;
		if N.lastStickTargetHum then
			local L = N.lastStickTargetHum;
			if not L.Parent or L.Health <= 0 then
				N:HideBelowMap();
				N.inKnifeRangeNow = false;
				N.forceDescent = false;
				N.lastStickTargetHum = nil;
				N.lastStickTarget = nil;
				N.sticking = false;
				N.stickingStartTime = 0;
				N.lastEnemyHealth = nil;
				N.lastHealthChangeTime = 0;
				N.targetFloor = nil;
				N.killActivated = false;
				N.validFrames = 0;
				N.lastSetCFrame = nil;
				N.triggerStart = nil;
				return;
			end;
		end;
		if N.hiding then
			if os.clock() >= N.hidingUntil then
				N.hiding = false;
			else
				pcall(function()
					E.AssemblyLinearVelocity = Vector3.zero;
					E.AssemblyAngularVelocity = Vector3.zero;
				end);
				return;
			end;
		end;
		if N:IsFallingIntoVoid(E) then
			N:ForceReturnToSafe(E);
			N:ResetState();
			N.currentTarget = nil;
			N.lockedTargetPlayer = nil;
			N.lastStickTarget = nil;
			N.lastFloorTarget = nil;
			N.targetFloorY = nil;
			local L = N:GetHumanoid(z);
			if L then
				pcall(function()
					L.PlatformStand = false;
				end);
			end;
			return;
		end;
		local l = N:GetClosestEnemy();
		if l then
			N.currentTarget = l;
			N.lastTargetSeenTime = os.clock();
		end;
		if not l then
			local L = (os.clock() - ((N.lastTargetSeenTime or 0))) < k;
			local l = N.safePosition and E.Position.Y < (N.safePosition.Y - 2);
			if L and l then
				pcall(function()
					E.AssemblyLinearVelocity = Vector3.zero;
					E.AssemblyAngularVelocity = Vector3.zero;
				end);
				return;
			end;
			N:ReturnToSafePosition(E);
			N:ResetState();
			N.currentTarget = nil;
			N.lockedTargetPlayer = nil;
			N.lastStickTarget = nil;
			N.lastFloorTarget = nil;
			N.targetFloorY = nil;
			if N.safePosition then
				local L = N:GetHumanoid(z);
				if L then
					pcall(function()
						L.PlatformStand = false;
					end);
				end;
			end;
			return;
		end;
		N:DisableCollisions();
		if N.lastStickTarget then
			local L = N:IsInKnifeRange(E, N.lastStickTarget);
			if L and not N.inKnifeRangeNow then
				N.swingAccumulator = c;
				N.inKnifeRangeNow = true;
			elseif not L then
				N.inKnifeRangeNow = false;
			end;
		end;
		N:SwingKnife(L or 0);
		local Z = N:GetHumanoid(z);
		if Z and not Z.PlatformStand then
			pcall(function()
				Z.PlatformStand = true;
			end);
		end;
		if N.safePosition and E.Position.Y >= (N.safePosition.Y - H) then
			N.safePosition = Vector3.new(E.Position.X, N.safePosition.Y, E.Position.Z);
		end;
		if not N.sticking then
			N:ForceUnderground(E, l);
		end;
		if N.sticking then
			local Z = (l ~= N.lastStickTarget);
			local d = (os.clock() - N.stickingStartTime) > w;
			local c = not N:CanStickToTarget(E, l);
			local z = N:CheckEnemyHealth(l);
			if Z or d or c or z then
				N.sticking = false;
				N.stickingStartTime = 0;
				N.lastEnemyHealth = nil;
				N.lastHealthChangeTime = 0;
				N.targetFloor = nil;
				N.inKnifeRangeNow = false;
				N.forceDescent = false;
				N.killActivated = false;
				N.validFrames = 0;
				N.lastSetCFrame = nil;
				N.triggerStart = nil;
				if Z then
					N.lastStickTarget = nil;
				end;
			else
				N:StickToTarget(E, l, L or 0);
				return;
			end;
		end;
		N:ApproachTarget(E, l, L or 0);
	end;
	function R.Start(L)
		if L.running then
			return;
		end;
		L.running = true;
		L.swingAccumulator = 0;
		L.sticking = false;
		L.stickingStartTime = 0;
		L.lastEnemyHealth = nil;
		L.lastHealthChangeTime = 0;
		L.lastTargetSeenTime = 0;
		L.currentTarget = nil;
		L.lockedTargetPlayer = nil;
		L.lastStickTarget = nil;
		L.lastStickTargetHum = nil;
		L.hiding = false;
		L.hidingUntil = 0;
		L.targetFloor = nil;
		L.targetFloorY = nil;
		L.lastFloorTarget = nil;
		L.floorCheckTime = 0;
		L.triggerStart = nil;
		L.inKnifeRangeNow = false;
		L.forceDescent = false;
		L.jitterSide = 1;
		L.jitterCurrent = 0;
		L.jitterNextSwitch = 0;
		L.lastSetCFrame = nil;
		L.validFrames = 0;
		L.killActivated = false;
		local E = L:GetRoot(z);
		if E then
			local N = RaycastParams.new();
			N.FilterType = Enum.RaycastFilterType.Exclude;
			N.FilterDescendantsInstances = { z.Character };
			local l = E.Position + Vector3.new(0, 5, 0);
			local Z = d:Raycast(l, Vector3.new(0, -500, 0), N);
			if Z then
				L.safePosition = Vector3.new(E.Position.X, Z.Position.Y + 3, E.Position.Z);
			else
				L.safePosition = E.Position;
			end;
		else
			L.safePosition = nil;
		end;
		L.connections:Add(N.Heartbeat:Connect(function(N)
			if not L.running then
				return;
			end;
			L:Update(N);
		end));
		L.connections:Add(z.CharacterAdded:Connect(function()
			table.clear(L.savedCollisions);
			L.sticking = false;
			L.safePosition = nil;
			L.stickingStartTime = 0;
			L.lastEnemyHealth = nil;
			L.lastHealthChangeTime = 0;
			L.lastTargetSeenTime = 0;
			L.currentTarget = nil;
			L.lockedTargetPlayer = nil;
			L.lastStickTarget = nil;
			L.lastStickTargetHum = nil;
			L.hiding = false;
			L.hidingUntil = 0;
			L.targetFloor = nil;
			L.targetFloorY = nil;
			L.lastFloorTarget = nil;
			L.floorCheckTime = 0;
			L.triggerStart = nil;
			L.inKnifeRangeNow = false;
			L.forceDescent = false;
			L.jitterSide = 1;
			L.jitterCurrent = 0;
			L.jitterNextSwitch = 0;
			L.lastSetCFrame = nil;
			L.validFrames = 0;
			L.killActivated = false;
		end));
	end;
	function R.Stop(L)
		if not L.running then
			return;
		end;
		local N = L:GetRoot(z);
		if N and L.safePosition then
			pcall(function()
				N.CFrame = CFrame.new(L.safePosition);
				N.AssemblyLinearVelocity = Vector3.zero;
				N.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
		L.running = false;
		L.connections:Cleanup();
		L.connections = IG.new();
		L:ResetState();
		L.currentTarget = nil;
		L.lockedTargetPlayer = nil;
		L.lastStickTarget = nil;
		L.lastStickTargetHum = nil;
		L.hiding = false;
		L.hidingUntil = 0;
		L.inKnifeRangeNow = false;
		L.forceDescent = false;
		L.killActivated = false;
		L.targetFloorY = nil;
		L.lastFloorTarget = nil;
	end;
	KillAllInstance = R.new();
end;
task.wait();
HG.Aim:Section({ Title = "Auto Shoot", Icon = "solar:target-bold" });
i.TogAutoShoot = HG.Aim:Toggle({ Title = "Auto Shoot (Normal - Cabeza/Torso)", Callback = function(L)
			U = L;
			if not L and (not U and (not x and b)) then
				b("Auto", nil);
			end;
			if R then
				R();
			end;
		end });
i.TogAutoShootAgr = HG.Aim:Toggle({ Title = "Auto Shoot (Agresivo - Hitbox Completa)", Callback = function(L)
			x = L;
			if not L and (not U and (not x and b)) then
				b("Auto", nil);
			end;
			if R then
				R();
			end;
		end });
i.DropAutoShootPart = HG.Aim:Dropdown({
		Title = "Target: Parte del cuerpo",
		Values = { "Cabeza", "Torso", "Cuerpo Completo" },
		Value = "Cabeza",
		Callback = function(L)
			k = L;
		end,
	});
i.TogEquipGun = HG.Aim:Toggle({ Title = "Equipar pistola", Value = false, Callback = function(L)
			W = L;
			if R then
				R();
			end;
		end });
do
	local N = false;
	F = function()
			if N or not W then
				return;
			end;
			N = true;
			task.spawn(function()
				local E = RaycastParams.new();
				E.FilterType = Enum.RaycastFilterType.Exclude;
				while W do
					task.wait(.1);
					if not W then
						break;
					end;
					if not UG() then
						continue;
					end;
					local N = z.Character;
					local l = N and N:FindFirstChildOfClass("Humanoid");
					if not N or not l then
						continue;
					end;
					if l.Health <= 0 then
						continue;
					end;
					local Z = N:FindFirstChild("HumanoidRootPart");
					local c = N:FindFirstChild("Head");
					if not Z then
						continue;
					end;
					local H = c and c.Position or Z.Position;
					local w = false;
					for L, l in ipairs(L:GetPlayers()) do
						if l ~= z and xG(l) then
							local L = l.Character;
							if L then
								local l = L:FindFirstChild("Head") or L:FindFirstChild("UpperTorso") or L:FindFirstChild("Torso") or L:FindFirstChild("HumanoidRootPart");
								if l and l:IsA("BasePart") then
									E.FilterDescendantsInstances = { N, L };
									local Z = d:Raycast(H, l.Position - H, E);
									if not Z and UG() then
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
					local m = pG();
					if not m then
						continue;
					end;
					N = z.Character;
					l = N and N:FindFirstChildOfClass("Humanoid");
					if not N or not l then
						continue;
					end;
					m = pG();
					if not m then
						continue;
					end;
					if m.Parent ~= N then
						pcall(function()
							l:EquipTool(m);
						end);
					end;
					task.wait(.35);
					if not W then
						break;
					end;
					N = z.Character;
					l = N and N:FindFirstChildOfClass("Humanoid");
					if N and l then
						pcall(function()
							l:UnequipTools();
						end);
					end;
					task.wait(1.9);
				end;
				N = false;
			end);
		end;
end;
HG.Aim:Space();
HG.Aim:Divider();
HG.Aim:Space();
HG.Aim:Section({ Title = "Silent Aim + Fov", Icon = "solar:radar-bold" });
i.TogSilentAimManual = HG.Aim:Toggle({ Title = "Silent Aim", Callback = function(L)
			A = L;
			if not L and (not A and (not p and b)) then
				b("Silent", nil);
			end;
			if R then
				R();
			end;
		end });
i.DropSilentAimPart = HG.Aim:Dropdown({
		Title = "Target: Parte del cuerpo",
		Values = { "Cabeza", "Torso", "Cuerpo Completo" },
		Value = "Cabeza",
		Callback = function(L)
			s = L;
		end,
	});
i.TogSilentAimFOV = HG.Aim:Toggle({ Title = "Silent Aim (Con FOV)", Callback = function(L)
			p = L;
			if not L and (not A and (not p and b)) then
				b("Silent", nil);
			end;
			if R then
				R();
			end;
		end });
i.TogShowFOV = HG.Aim:Toggle({ Title = "Mostrar C\195\173rculo FOV", Callback = function(L)
			w = L;
			if Y then
				Y();
			end;
		end });
i.SliFOVSize = HG.Aim:Slider({
		Title = "Tama\195\177o del FOV",
		Step = 1,
		Value = { Min = 10, Max = 800, Default = 120 },
		Callback = function(L)
			m = L;
		end,
	});
do
	(getgenv()).NexvyrTargetPart = nil;
	local N = (getgenv()).__NexvyrDeferredNamecall;
	if N then
		N.Enabled = false;
	end;
	local E = z:GetMouse();
	local l = { Auto = nil, Silent = nil };
	local Z = 0;
	local c = (getgenv()).__NexvyrDmvsAimCleanup;
	if type(c) == "function" then
		pcall(c);
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
		local L = type(getexecutorname) == "function" and getexecutorname or identifyexecutor;
		if type(L) == "function" then
			local N, E = pcall(L);
			w = N and ((tostring(E)):lower()):find("madium", 1, true) ~= nil or false;
		end;
	end;
	local I = {};
	pcall(function()
		I.Raycast = d.Raycast;
	end);
	pcall(function()
		I.FindPartOnRay = d.FindPartOnRay;
	end);
	pcall(function()
		I.FindPartOnRayWithIgnoreList = d.FindPartOnRayWithIgnoreList;
	end);
	pcall(function()
		I.FindPartOnRayWithWhitelist = d.FindPartOnRayWithWhitelist;
	end);
	local function g()
		return U or x or A or p;
	end;
	local function G(L)
		if typeof(L) ~= "Instance" or not L:IsA("BasePart") or not L.Parent then
			return false;
		end;
		local N = L:FindFirstAncestorOfClass("Model");
		local E = N and N:FindFirstChildOfClass("Humanoid");
		return E ~= nil and E.Health > 0;
	end;
	local function K()
		local L = os.clock();
		local N = U or x;
		if N and (L <= Z and G(l.Auto)) then
			return l.Auto;
		end;
		if ((A or p)) and G(l.Silent) then
			return l.Silent;
		end;
		if N and G(l.Auto) then
			return l.Auto;
		end;
		return nil;
	end;
	b = function(L, N)
			if L ~= "Auto" and L ~= "Silent" then
				return;
			end;
			l[L] = G(N) and N or nil;
			(getgenv()).NexvyrTargetPart = K();
		end;
	local function f()
		if not H.Enabled or not g() or mG() then
			return nil;
		end;
		local L = z.Character;
		if not L then
			return nil;
		end;
		local N = L:FindFirstChildOfClass("Tool");
		if not ((AG(N) or (x and (N and not kG(N))))) then
			return nil;
		end;
		local E = K();
		if not E then
			return nil;
		end;
		return E.Position, E;
	end;
	local function v(L)
		if typeof(L) ~= "Vector3" then
			return false;
		end;
		local N = d.CurrentCamera;
		if N and ((L - N.CFrame.Position)).Magnitude <= 3 then
			return true;
		end;
		local E = z.Character;
		if not E then
			return false;
		end;
		local l = E:FindFirstChildOfClass("Tool");
		local Z = l and l:FindFirstChild("Handle");
		if Z and (Z:IsA("BasePart") and ((L - Z.Position)).Magnitude <= 18) then
			return true;
		end;
		local c = E:FindFirstChild("Head");
		return c and ((L - c.Position)).Magnitude <= 8 or false;
	end;
	local function a()
		local L = d.CurrentCamera;
		local N = L and L.CFrame.Position;
		local E = z.Character;
		local l = E and E:FindFirstChild("Head");
		if N and (l and ((N - l.Position)).Magnitude <= 1.75) then
			return N;
		end;
		local Z = E and E:FindFirstChildOfClass("Tool");
		local c = Z and Z:FindFirstChild("Handle");
		if c and c:IsA("BasePart") then
			return c.Position;
		end;
		if l then
			return l.Position;
		end;
		return N;
	end;
	local function M()
		H.Enabled = false;
		local L = H.Metatable;
		if not L or type(setreadonly) ~= "function" then
			return;
		end;
		local N = pcall(setreadonly, L, false);
		if not N then
			return;
		end;
		pcall(function()
			if L.__index == H.IndexHook then
				L.__index = H.OriginalIndex;
			end;
			if H.NamecallHook and L.__namecall == H.NamecallHook then
				L.__namecall = H.OriginalNamecall;
			end;
		end);
		pcall(setreadonly, L, H.WasReadonly);
		if L.__index ~= H.IndexHook and ((not H.NamecallHook or L.__namecall ~= H.NamecallHook)) then
			H.Metatable = nil;
			H.IndexHook = nil;
			H.NamecallHook = nil;
		end;
	end;
	(getgenv()).__NexvyrDmvsAimCleanup = M;
	local function y()
		if H.Metatable then
			local L = H.Metatable;
			local N = L.__index == H.IndexHook;
			H.Enabled = N;
			return N;
		end;
		if type(getrawmetatable) ~= "function" or type(setreadonly) ~= "function" then
			warn("Nexvyr: este executor no permite instalar la redireccion del mouse.");
			return false;
		end;
		local L, N = pcall(getrawmetatable, w and game or E);
		if not L or not N then
			return false;
		end;
		local l, Z = N.__index, N.__namecall;
		if type(l) ~= "function" and type(l) ~= "table" then
			return false;
		end;
		local c = true;
		if type(isreadonly) == "function" then
			local L, E = pcall(isreadonly, N);
			if L and type(E) == "boolean" then
				c = E;
			end;
		end;
		local function z(L, N)
			if type(l) == "function" then
				return l(L, N);
			end;
			return l[N];
		end;
		local m = function(L, N)
				if H.Enabled and (L == E and (((N == "Hit" or N == "Target" or N == "UnitRay" or (w and N == "TargetSurface"))) and ((w or type(checkcaller) ~= "function" or not checkcaller())))) then
					local E, l, Z = pcall(f);
					if E and (l and Z) then
						if N == "Target" then
							return Z;
						end;
						if N == "TargetSurface" then
							return Enum.NormalId.Front;
						end;
						if N == "Hit" then
							if w then
								return CFrame.new(l);
							end;
							local L = a();
							local N = L and l - L;
							if N and N.Magnitude > .001 then
								return CFrame.lookAt(l, l + N.Unit);
							end;
							return CFrame.new(l);
						end;
						local E = z(L, N);
						local c = typeof(E) == "Ray" and E.Origin or nil;
						if not c then
							local L = d.CurrentCamera;
							c = L and L.CFrame.Position or a();
						end;
						local H = c and l - c;
						if H and H.Magnitude > .001 then
							return Ray.new(c, H.Unit);
						end;
					end;
				end;
				return z(L, N);
			end;
		local U;
		if not w and (type(Z) == "function" and (type(getnamecallmethod) == "function" and type(checkcaller) == "function")) then
			U = function(L, ...)
					if not H.Enabled or checkcaller() then
						return Z(L, ...);
					end;
					if L == d and not H.ResolvingRay then
						local N = getnamecallmethod();
						local E = N and I[N];
						if E then
							local l = table.pack(...);
							local Z, d;
							if N == "Raycast" then
								if typeof(l[1]) == "Vector3" and typeof(l[2]) == "Vector3" then
									Z, d = l[1], l[2].Magnitude;
								end;
							elseif typeof(l[1]) == "Ray" then
								Z, d = l[1].Origin, l[1].Direction.Magnitude;
							end;
							if Z and (d and (d >= 50 and v(Z))) then
								H.ResolvingRay = true;
								local L, E = pcall(f);
								H.ResolvingRay = false;
								if L and E then
									local L = E - Z;
									if L.Magnitude > .001 then
										if N == "Raycast" then
											l[2] = L.Unit * d;
										else
											l[1] = Ray.new(Z, L.Unit * d);
										end;
									end;
								end;
							end;
							return E(L, table.unpack(l, 1, l.n));
						end;
					end;
					return Z(L, ...);
				end;
		end;
		if not pcall(setreadonly, N, false) then
			return false;
		end;
		local x = pcall(function()
				N.__index = m;
				if U then
					N.__namecall = U;
				end;
			end);
		if not x then
			pcall(function()
				if N.__index == m then
					N.__index = l;
				end;
				if U and N.__namecall == U then
					N.__namecall = Z;
				end;
			end);
			pcall(setreadonly, N, c);
			return false;
		end;
		pcall(setreadonly, N, c);
		H.Metatable = N;
		H.OriginalIndex = l;
		H.OriginalNamecall = Z;
		H.IndexHook = m;
		H.NamecallHook = U;
		H.WasReadonly = c;
		H.Enabled = true;
		return true;
	end;
	local function S()
		if g() then
			y();
		else
			l.Auto = nil;
			l.Silent = nil;
			Z = 0;
			(getgenv()).NexvyrTargetPart = nil;
			M();
		end;
	end;
	local C;
	R = function()
			P();
			S();
			if C then
				C();
			end;
		end;
	local B = false;
	V = function()
			if B or not ((U or x)) then
				return;
			end;
			B = true;
			task.spawn(function()
				local N = RaycastParams.new();
				N.FilterType = Enum.RaycastFilterType.Exclude;
				while U or x do
					task.wait(.1);
					if not ((U or x)) then
						break;
					end;
					if not H.Enabled then
						continue;
					end;
					if not mG() then
						local E = z.Character;
						if not E or not E:FindFirstChild("HumanoidRootPart") then
							continue;
						end;
						local l = E:FindFirstChildOfClass("Tool");
						if not l or not l:FindFirstChild("Handle") then
							b("Auto", nil);
							continue;
						end;
						if x then
							if kG(l) then
								b("Auto", nil);
								continue;
							end;
						elseif not AG(l) then
							b("Auto", nil);
							continue;
						end;
						local c = nil;
						local H = math.huge;
						local w = E.HumanoidRootPart.Position;
						local m = E:FindFirstChild("Head");
						local U = m and m.Position or w;
						if x then
							for L, l in pairs(L:GetPlayers()) do
								if l ~= z and (wG(l) and l.Character) then
									local L = l.Character:FindFirstChild("Humanoid");
									if L and L.Health > 0 then
										N.FilterDescendantsInstances = { E, l.Character };
										local function L(L)
											local E = ((L.Position - w)).Magnitude;
											if E < H then
												local l = L.Size;
												local Z = { Vector3.new(0, 0, 0), Vector3.new(0, l.Y / 2.1, 0), Vector3.new(0, -l.Y / 2.1, 0) };
												local z = false;
												for E, l in ipairs(Z) do
													if not d:Raycast(U, (L.CFrame * l) - U, N) then
														z = true;
														break;
													end;
												end;
												if z then
													H = E;
													c = L;
												end;
											end;
										end;
										for N, E in ipairs(l.Character:GetChildren()) do
											if E:IsA("BasePart") and E.Name ~= "HumanoidRootPart" then
												L(E);
											end;
										end;
									end;
								end;
							end;
						else
							local l = {};
							for L, N in ipairs(L:GetPlayers()) do
								if N ~= z and (wG(N) and N.Character) then
									local L = N.Character;
									local E = L:FindFirstChildOfClass("Humanoid");
									if E and E.Health > 0 then
										local N = L:FindFirstChild("HumanoidRootPart");
										l[#l + 1] = { Character = L, Distance = N and ((N.Position - w)).Magnitude or math.huge };
									end;
								end;
							end;
							table.sort(l, function(L, N)
								return L.Distance < N.Distance;
							end);
							local Z = 192;
							local function m(L)
								if not L or not L:IsA("BasePart") then
									return;
								end;
								local E = ((L.Position - w)).Magnitude;
								if E >= H then
									return;
								end;
								local l = L.Size.Y / 2.1;
								local z = L.CFrame;
								local function m(L)
									if Z <= 0 then
										return false;
									end;
									Z = Z - (1);
									return not d:Raycast(U, L - U, N);
								end;
								if m(L.Position) or m(z * Vector3.new(0, l, 0)) or m(z * Vector3.new(0, -l, 0)) then
									H = E;
									c = L;
								end;
							end;
							for L, l in ipairs(l) do
								if Z <= 0 then
									break;
								end;
								local d = l.Character;
								if d.Parent then
									N.FilterDescendantsInstances = { E, d };
									if k == "Cuerpo Completo" then
										for L, N in ipairs(d:GetChildren()) do
											if Z <= 0 then
												break;
											end;
											if N:IsA("BasePart") and N.Name ~= "HumanoidRootPart" then
												m(N);
											end;
										end;
									elseif k == "Cabeza" then
										m(d:FindFirstChild("Head"));
									elseif k == "Torso" then
										for L, N in ipairs({ "UpperTorso", "Torso", "HumanoidRootPart" }) do
											if Z <= 0 then
												break;
											end;
											m(d:FindFirstChild(N));
										end;
									end;
								end;
							end;
						end;
						if c then
							Z = os.clock() + .35;
							b("Auto", c);
							pcall(function()
								l:Activate();
								task.delay(.05, function()
									if l.Parent == E then
										l:Deactivate();
									end;
								end);
							end);
							task.wait(.2);
						else
							b("Auto", nil);
						end;
					end;
				end;
				b("Auto", nil);
				B = false;
			end);
		end;
	local r = false;
	O = function()
			if r or not ((A or p)) then
				return;
			end;
			r = true;
			task.spawn(function()
				local N = RaycastParams.new();
				N.FilterType = Enum.RaycastFilterType.Exclude;
				while A or p do
					task.wait(.1);
					if not ((A or p)) then
						break;
					end;
					if not mG() then
						local E = z.Character;
						if not E or not E:FindFirstChild("HumanoidRootPart") then
							continue;
						end;
						local l = nil;
						local Z = math.huge;
						local c = math.huge;
						local H = E.HumanoidRootPart.Position;
						local w = E:FindFirstChild("Head") and E.Head.Position or H;
						for L, U in pairs(L:GetPlayers()) do
							if U ~= z and (wG(U) and U.Character) then
								local L = U.Character:FindFirstChild("Humanoid");
								if L and L.Health > 0 then
									local L = {};
									if s == "Cabeza" then
										local N = U.Character:FindFirstChild("Head");
										if N then
											table.insert(L, N);
										end;
									elseif s == "Torso" then
										local N = { "UpperTorso", "Torso", "HumanoidRootPart" };
										for N, E in ipairs(N) do
											local l = U.Character:FindFirstChild(E);
											if l and l:IsA("BasePart") then
												table.insert(L, l);
											end;
										end;
									elseif s == "Cuerpo Completo" then
										for N, E in ipairs(U.Character:GetChildren()) do
											if E:IsA("BasePart") and E.Name ~= "HumanoidRootPart" then
												table.insert(L, E);
											end;
										end;
									end;
									N.FilterDescendantsInstances = { E, U.Character };
									for L, E in ipairs(L) do
										local z = ((E.Position - H)).Magnitude;
										local U = d.CurrentCamera;
										if not U then
											continue;
										end;
										local x, k = U:WorldToViewportPoint(E.Position);
										local s = ((Vector2.new(x.X, x.Y) - U.ViewportSize / 2)).Magnitude;
										local I = false;
										if p then
											if k and (s <= m and s < Z) then
												I = true;
											end;
										elseif A then
											if z < c then
												I = true;
											end;
										end;
										if I then
											local L = d:Raycast(w, E.Position - w, N);
											if not L then
												if p then
													Z = s;
													l = E;
												else
													c = z;
													l = E;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
						if l then
							b("Silent", l);
						else
							b("Silent", nil);
						end;
					end;
				end;
				b("Silent", nil);
				r = false;
			end);
		end;
	C = function()
			if U or x then
				V();
			end;
			if A or p then
				O();
			end;
			if W then
				F();
			end;
		end;
end;
HG.KillAll:Section({ Title = "Kill All", Icon = "solar:danger-triangle-bold" });
i.TogKillAll = HG.KillAll:Toggle({ Title = "Kill All", Value = false, Callback = function(L)
			f = L;
			if P then
				P();
			end;
			if L then
				KillAllInstance:Start();
			else
				KillAllInstance:Stop();
			end;
		end });
HG.KillAll:Space();
HG.KillAll:Divider();
HG.KillAll:Space();
HG.KillAll:Section({ Title = "Hitbox Expander", Icon = "solar:box-bold" });
i.TogHitbox = HG.KillAll:Toggle({ Title = "Activar Hitbox", Value = false, Callback = function(L)
			v = L;
			if P then
				P();
			end;
			if L then
				J();
			else
				gG();
			end;
		end });
i.TogHitboxInvisible = HG.KillAll:Toggle({ Title = "Hitbox Invisible", Value = false, Callback = function(L)
			a = L;
		end });
i.SliHitboxSize = HG.KillAll:Slider({
		Title = "Tama\195\177o de la Hitbox",
		Step = .5,
		Value = { Min = 1, Max = 28, Default = 3.5 },
		Callback = function(L)
			M = L;
		end,
	});
i.ColHitbox = HG.KillAll:Colorpicker({ Title = "Color de la Hitbox", Default = Color3.fromRGB(255, 0, 0), Callback = function(L)
			y = L;
		end });
HG.Invisible:Section({ Title = "Invisible", Icon = "solar:ghost-bold" });
local function fG(L)
	if z.Character then
		for N, E in pairs(z.Character:GetDescendants()) do
			if E:IsA("BasePart") then
				if L and E.Transparency == 0 then
					E:SetAttribute("NexvyrOrigTrans", 0);
					E.Transparency = .5;
				elseif not L and E:GetAttribute("NexvyrOrigTrans") ~= nil then
					E.Transparency = E:GetAttribute("NexvyrOrigTrans");
					E:SetAttribute("NexvyrOrigTrans", nil);
				end;
			end;
		end;
	end;
end;
i.TogInvisible = HG.Invisible:Toggle({ Title = "Invisible", Value = false, Callback = function(L)
			B = L;
			fG(L);
			if X then
				X(L);
			end;
		end });
do
	local L = game:GetService("TweenService");
	local l = true;
	local Z = Instance.new("TextButton");
	Z.Name = "UzivertInvisibleBind";
	Z.Size = UDim2.fromOffset(104, 38);
	Z.Position = UDim2.new(1, -124, .5, 40);
	Z.BackgroundColor3 = Color3.fromRGB(14, 15, 24);
	Z.BackgroundTransparency = .1;
	Z.AutoButtonColor = false;
	Z.Text = "";
	Z.ZIndex = 60;
	Z.Parent = o;
	(Instance.new("UICorner", Z)).CornerRadius = UDim.new(0, 10);
	local d = Instance.new("UIScale", Z);
	local c = Instance.new("UIStroke", Z);
	c.Thickness = 1.6;
	c.Color = Color3.fromRGB(190, 200, 225);
	local z = Instance.new("Frame", Z);
	z.AnchorPoint = Vector2.new(0, .5);
	z.Position = UDim2.new(0, 12, .5, 0);
	z.Size = UDim2.fromOffset(10, 10);
	z.BackgroundColor3 = Color3.fromRGB(110, 116, 140);
	z.BorderSizePixel = 0;
	z.ZIndex = 61;
	(Instance.new("UICorner", z)).CornerRadius = UDim.new(1, 0);
	local H = Instance.new("TextLabel", Z);
	H.Position = UDim2.fromOffset(30, 0);
	H.Size = UDim2.new(1, -36, 1, 0);
	H.BackgroundTransparency = 1;
	H.Text = "Invisible";
	H.TextColor3 = Color3.new(1, 1, 1);
	H.Font = Enum.Font.GothamBold;
	H.TextSize = 13;
	H.TextXAlignment = Enum.TextXAlignment.Left;
	H.ZIndex = 61;
	local function w(L)
		pcall(function()
			i.TogInvisible:Set(L);
		end);
		if B ~= L then
			B = L;
			fG(L);
			if X then
				X(L);
			end;
		end;
	end;
	local m, U, x, k, A = false, false, nil, nil, nil;
	Z.InputBegan:Connect(function(N)
		if N.UserInputType == Enum.UserInputType.MouseButton1 or N.UserInputType == Enum.UserInputType.Touch then
			if m then
				return;
			end;
			m, U = true, false;
			A = N;
			x, k = Z.Position, N.Position;
			(L:Create(d, TweenInfo.new(.1), { Scale = .94 })):Play();
		end;
	end);
	E.InputChanged:Connect(function(L)
		if not m then
			return;
		end;
		if L.UserInputType == Enum.UserInputType.MouseMovement then
			if not A or A.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return;
			end;
		elseif L ~= A then
			return;
		end;
		do
			local N = L.Position - k;
			if U or N.Magnitude > 8 then
				U = true;
				Z.Position = UDim2.new(x.X.Scale, x.X.Offset + N.X, x.Y.Scale, x.Y.Offset + N.Y);
			end;
		end;
	end);
	E.InputEnded:Connect(function(N)
		if not m or N ~= A then
			return;
		end;
		do
			m = false;
			A = nil;
			(L:Create(d, TweenInfo.new(.2, Enum.EasingStyle.Back), { Scale = 1 })):Play();
			if not U then
				w(not B);
			end;
		end;
	end);
	N.Heartbeat:Connect(function()
		if not Z.Parent then
			return;
		end;
		local L = B;
		z.BackgroundColor3 = z.BackgroundColor3:Lerp(L and Color3.fromRGB(61, 220, 132) or Color3.fromRGB(110, 116, 140), .25);
		c.Color = c.Color:Lerp(L and Color3.fromRGB(61, 220, 132) or Color3.fromRGB(190, 200, 225), .25);
	end);
	HG.Invisible:Toggle({ Title = "Mostrar bot\195\179n bindable", Value = true, Callback = function(L)
			l = L;
			Z.Visible = L;
		end });
end;
do
	local L;
	X = function(E)
			if L then
				L:Disconnect();
				L = nil;
			end;
			if not E then
				return;
			end;
			L = N.Heartbeat:Connect(function()
					if not B then
						return;
					end;
					local L = z.Character;
					if L then
						local E = L:FindFirstChild("HumanoidRootPart");
						local l = L:FindFirstChildOfClass("Humanoid");
						if E and (l and l.Health > 0) then
							if E.Position.Y > 200 then
								return;
							end;
							local L = E.CFrame;
							local Z = l.CameraOffset;
							local d = L * CFrame.new(0, -40, 0);
							E.CFrame = d;
							l.CameraOffset = (d:ToObjectSpace(CFrame.new(L.Position))).Position;
							N.RenderStepped:Wait();
							if E.Parent and l.Parent then
								E.CFrame = L;
								l.CameraOffset = Z;
							end;
						end;
					end;
				end);
		end;
end;
z.CharacterAdded:Connect(function(L)
	if B then
		task.wait(.5);
		fG(true);
	end;
end);
HG.Tramposo:Section({ Title = "Movimiento", Icon = "solar:bolt-bold" });
local vG = 28.7;
local aG = 45;
do
	local Z = l:WaitForChild("MovementState", 3);
	local function c(L, N)
		if Z then
			Z:FireServer(L, N);
		end;
	end;
	local H = 14;
	local w, m, U;
	local x = Vector3.zero;
	local k = false;
	local A = 0;
	local function p()
		local L = z.Character;
		if not L then
			return;
		end;
		return L:FindFirstChildOfClass("Humanoid"), L:FindFirstChild("HumanoidRootPart");
	end;
	local function s(L)
		if w then
			w:Disconnect();
			w = nil;
		end;
		x = Vector3.zero;
		if not L then
			return;
		end;
		w = N.Stepped:Connect(function(L, N)
				local E, l = p();
				if not E or not l or E.Health <= 0 then
					return;
				end;
				local Z = 1 - math.exp(-H * N);
				x = x:Lerp(E.MoveDirection, Z);
				if x.Magnitude > .01 then
					local L = math.max(vG - E.WalkSpeed, 0);
					l.CFrame = l.CFrame + (x * L) * N;
				end;
			end);
	end;
	local function I(L)
		if m then
			m:Disconnect();
			m = nil;
		end;
		if U then
			U:Disconnect();
			U = nil;
		end;
		k = false;
		A = 0;
		if not L then
			return;
		end;
		U = E.JumpRequest:Connect(function()
				k = true;
			end);
		m = N.Stepped:Connect(function(L, N)
				local l, Z = p();
				if not l or not Z or l.Health <= 0 then
					return;
				end;
				local d = E:IsKeyDown(Enum.KeyCode.Space) or l.Jump;
				if k and not d then
					k = false;
				end;
				local c = k and aG or 0;
				A = A + ((c - A)) * ((1 - math.exp(-H * N)));
				if A > .5 then
					Z.CFrame = Z.CFrame + Vector3.new(0, A * N, 0);
					local L = Z.AssemblyLinearVelocity;
					if L.Y < 0 then
						Z.AssemblyLinearVelocity = Vector3.new(L.X, 0, L.Z);
					end;
				end;
			end);
	end;
	i.TogSpeed = HG.Tramposo:Toggle({ Title = "Speed", Value = false, Callback = function(L)
				s(L);
				c("Speed", L);
			end });
	i.SliSpeed = HG.Tramposo:Slider({
			Title = "Ajuste Speed",
			Step = 1,
			Value = { Min = 1, Max = 100, Default = 29 },
			Callback = function(L)
				vG = L;
			end,
		});
	i.TogInfJump = HG.Tramposo:Toggle({ Title = "Salto Inf", Value = false, Callback = function(L)
				I(L);
				c("Jump", L);
			end });
	i.SliJumpPower = HG.Tramposo:Slider({
			Title = "Ajuste Salto",
			Step = 1,
			Value = { Min = 1, Max = 100, Default = 45 },
			Callback = function(L)
				aG = L;
			end,
		});
	HG.Tramposo:Section({ Title = "Cheats", Icon = "solar:bolt-bold" });
	local g = false;
	local G = false;
	local K = {};
	local function f()
		g = false;
		G = false;
		for L, N in ipairs(K) do
			if N then
				pcall(function()
					N:Destroy();
				end);
			end;
		end;
		K = {};
	end;
	local function v()
		if G then
			return;
		end;
		G = true;
		task.spawn(function()
			while g do
				task.wait(.05);
				local L = z.Character;
				local N = L and L:FindFirstChild("HumanoidRootPart");
				local E = L and L:FindFirstChildOfClass("Humanoid");
				if N and (E and E.Health > 0) then
					if E.MoveDirection.Magnitude > 0 or N.AssemblyLinearVelocity.Y ~= 0 then
						local L = Instance.new("Part");
						L.Size = Vector3.new(6, .6, 6);
						L.Anchored = true;
						L.CanCollide = true;
						L.Color = Color3.fromRGB(5, 5, 5);
						L.Material = Enum.Material.Neon;
						L.CFrame = N.CFrame * CFrame.new(0, -3.3, 0);
						L.Parent = d;
						table.insert(K, L);
						if #K > 3 then
							local L = table.remove(K, 1);
							if L then
								pcall(function()
									L:Destroy();
								end);
							end;
						end;
					end;
				end;
			end;
			G = false;
		end);
	end;
	i.TogFixedPlatform = HG.Tramposo:Toggle({ Title = "Fixed Platform", Value = false, Callback = function(L)
				if L then
					g = true;
					v();
				else
					f();
				end;
			end });
	local a = false;
	local M = {};
	local function y()
		for L, N in pairs(M) do
			if N and N.Parent then
				N.Anchored = false;
			end;
			M[L] = nil;
		end;
	end;
	task.spawn(function()
		while task.wait(.1) do
			if a then
				for L, N in ipairs(L:GetPlayers()) do
					if N ~= z and N.Character then
						local L = N.Character:FindFirstChild("HumanoidRootPart");
						local E = N.Character:FindFirstChildOfClass("Humanoid");
						if L and (E and (E.Health > 0 and not L.Anchored)) then
							L.Anchored = true;
							M[N] = L;
						end;
					end;
				end;
			elseif next(M) ~= nil then
				y();
			end;
		end;
	end);
	i.TogFakeLag = HG.Tramposo:Toggle({ Title = "Fake Lag", Value = false, Callback = function(L)
				a = L;
				if not L then
					y();
				end;
			end });
end;
HG.RachaFarm:Section({ Title = "Auto Teleport Main/Alt", Icon = "solar:map-arrow-square-bold" });
local MG, yG;
MG = HG.RachaFarm:Toggle({ Title = "Auto Teleport (Main)", Value = false, Callback = function(L)
			if L then
				AutoTeleportMainAltInstance.ActiveRole = "Main";
				if yG then
					pcall(function()
						yG:Set(false);
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
yG = HG.RachaFarm:Toggle({ Title = "Auto Teleport (Alt)", Value = false, Callback = function(L)
			if L then
				AutoTeleportMainAltInstance.ActiveRole = "Alt";
				if MG then
					pcall(function()
						MG:Set(false);
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
HG.RachaFarm:Dropdown({
	Title = "Tipo de Duelo",
	Values = {
		"1v1",
		"2v2",
		"3v3",
		"4v4",
	},
	Value = "1v1",
	Callback = function(L)
		if GG["Right Platforms"][L] then
			AutoTeleportMainAltInstance.DuelType = L;
		else
			AutoTeleportMainAltInstance.DuelType = "1v1";
		end;
		AutoTeleportMainAltInstance:Kick();
	end,
});
HG.RachaFarm:Dropdown({
	Title = "Fila de Plataformas",
	Values = { "Right Platforms", "Left Platforms" },
	Value = "Right Platforms",
	Callback = function(L)
		if GG[L] then
			AutoTeleportMainAltInstance.PlatformRow = L;
		else
			AutoTeleportMainAltInstance.PlatformRow = "Right Platforms";
		end;
		AutoTeleportMainAltInstance:Kick();
	end,
});
do
	HG.Vis:Section({ Title = "Configuraci\195\179n de ESP", Icon = "solar:eye-bold" });
	local E = {};
	local Z = 1500;
	local function c(L)
		local N = E[L];
		if not N then
			return;
		end;
		if N.Highlight then
			N.Highlight:Destroy();
		end;
		E[L] = nil;
	end;
	local function H()
		for L in pairs(E) do
			c(L);
		end;
	end;
	i.TogEsp = HG.Vis:Toggle({ Title = "ESP Jugadores", Callback = function(L)
				g = L;
				if P then
					P();
				end;
				if g and K.Glow then
					u();
				else
					H();
				end;
			end });
	i.ColEsp = HG.Vis:Colorpicker({ Title = "Color del ESP", Default = Color3.fromRGB(255, 255, 255), Callback = function(L)
				G = L;
			end });
	HG.Vis:Space();
	HG.Vis:Divider();
	HG.Vis:Space();
	HG.Vis:Section({ Title = "Filtros de ESP", Icon = "solar:filter-bold" });
	i.TogEspGl = HG.Vis:Toggle({ Title = "Mostrar Resplandor", Value = true, Callback = function(L)
				K.Glow = L;
				if P then
					P();
				end;
				if L and g then
					u();
				else
					H();
				end;
			end });
	local U = false;
	u = function()
			if U or not g or not K.Glow then
				return;
			end;
			U = true;
			task.spawn(function()
				local N = L.PlayerRemoving:Connect(c);
				while g and K.Glow do
					task.wait(.2);
					if not g or not K.Glow then
						break;
					end;
					if UG() then
						local N = z.Character;
						local l = N and N:FindFirstChild("Head");
						local d = l and l.Position;
						for L, N in ipairs(L:GetPlayers()) do
							if N ~= z then
								local L = N.Character;
								local l = L and L:FindFirstChild("Head");
								if l and (wG(N) and ((not d or ((l.Position - d)).Magnitude <= Z))) then
									local l = E[N];
									if l and ((l.Char ~= L or not l.Highlight or l.Highlight.Parent ~= Q)) then
										c(N);
									end;
									if not E[N] then
										local l = Instance.new("Highlight");
										l.Name = N.Name .. "_Glow";
										l.FillTransparency = 1;
										l.OutlineTransparency = 0;
										l.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
										l.Adornee = L;
										l.Parent = Q;
										E[N] = { Highlight = l, Char = L };
									end;
									local Z = E[N].Highlight;
									if Z.Enabled ~= K.Glow then
										Z.Enabled = K.Glow;
									end;
									if Z.OutlineColor ~= G then
										Z.OutlineColor = G;
									end;
								else
									c(N);
								end;
							end;
						end;
					else
						H();
					end;
				end;
				N:Disconnect();
				H();
				U = false;
			end);
		end;
	local x;
	local k;
	local A = {
			Color3.fromRGB(110, 118, 142),
			Color3.fromRGB(255, 255, 255),
			Color3.fromRGB(190, 200, 225),
			Color3.fromRGB(255, 255, 255),
			Color3.fromRGB(110, 118, 142),
		};
	local function p()
		local L = (((((os.clock() * 120)) % 360)) / 360) * 4;
		local N = math.floor(L);
		local E = A[N + 1];
		local l = A[math.min(N + 2, 5)];
		return E:Lerp(l, L - N);
	end;
	Y = function()
			if not w then
				if k then
					k:Disconnect();
					k = nil;
				end;
				if x then
					x.Visible = false;
				end;
				return;
			end;
			if not x and Drawing then
				x = Drawing.new("Circle");
				x.Filled = false;
				x.Thickness = 1;
				x.Visible = false;
			end;
			if not x or k then
				return;
			end;
			k = N.RenderStepped:Connect(function()
					if not w then
						return;
					end;
					local L = d.CurrentCamera;
					if not L then
						return;
					end;
					x.Position = L.ViewportSize / 2;
					x.Radius = m;
					x.Color = p();
					x.Visible = true;
				end);
		end;
	HG.Farm:Section({ Title = "Farmeo de Evento", Icon = "solar:gift-bold" });
	(getgenv()).AutoEventFarm = false;
	local s = 0;
	local I = l:FindFirstChild("Packages") and l.Packages:FindFirstChild("Networking");
	local f = I and I:FindFirstChild("RE/Events/CollectEventSpawnable");
	HG.Farm:Toggle({ Title = "Auto Farmear Evento", Callback = function(L)
			(getgenv()).AutoEventFarm = L;
			s = s + (1);
			local N = s;
			if L then
				task.spawn(function()
					while (getgenv()).AutoEventFarm and N == s do
						pcall(function()
							if f then
								f:FireServer();
							else
								I = l:FindFirstChild("Packages") and l.Packages:FindFirstChild("Networking");
								f = I and I:FindFirstChild("RE/Events/CollectEventSpawnable");
							end;
						end);
						local L = z.Character;
						local E = L and L:FindFirstChild("HumanoidRootPart");
						if E then
							local L = d:FindFirstChild("SpawnablesClient");
							if L then
								for L, l in ipairs(L:GetChildren()) do
									if not (getgenv()).AutoEventFarm or N ~= s then
										break;
									end;
									local Z = l:FindFirstChild("Touch");
									if Z then
										pcall(function()
											firetouchinterest(E, Z, 0);
											firetouchinterest(E, Z, 1);
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
	local L = {
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
	local function N()
		local L = z.Character;
		if not L then
			return;
		end;
		local N = L:FindFirstChildOfClass("Humanoid");
		if not N then
			return;
		end;
		for L, N in pairs(N:GetPlayingAnimationTracks()) do
			N:Stop(0);
			N:Destroy();
		end;
		local E = N:FindFirstChildOfClass("Animator");
		if E then
			for L, N in pairs(E:GetPlayingAnimationTracks()) do
				N:Stop(0);
				N:Destroy();
			end;
		end;
		task.wait(.1);
	end;
	local function E(L)
		if not L then
			return;
		end;
		local E = z.Character;
		if not E then
			return;
		end;
		N();
		local l = E:FindFirstChild("Animate");
		if not l then
			return;
		end;
		if not q then
			local function L(L, N)
				local E = l:FindFirstChild(L);
				if E then
					local L = E:FindFirstChild(N);
					if L and L:IsA("Animation") then
						local N = L.AnimationId:match("%d+");
						if N then
							return tonumber(N);
						end;
					end;
				end;
				return nil;
			end;
			q = {
					Idle = L("idle", "Animation1") or 507766666,
					Idle2 = L("idle", "Animation2") or 507766951,
					Walk = L("walk", "WalkAnim") or 507777826,
					Run = L("run", "RunAnim") or 507767714,
					Jump = L("jump", "JumpAnim") or 507765000,
					Climb = L("climb", "ClimbAnim") or 507765644,
					Fall = L("fall", "FallAnim") or 507767968,
					Swim = L("swim", "Swim") or 507784897,
					SwimIdle = L("swimidle", "SwimIdle") or 507785072,
				};
		end;
		l.Disabled = true;
		task.wait(.1);
		local function Z(L, N, E)
			if not E then
				return;
			end;
			local Z = l:FindFirstChild(L);
			if Z then
				local L = Z:FindFirstChild(N);
				if L and L:IsA("Animation") then
					L.AnimationId = "rbxassetid://" .. tostring(E);
				end;
			end;
		end;
		Z("idle", "Animation1", L.Idle);
		Z("idle", "Animation2", L.Idle2 or L.Idle);
		Z("walk", "WalkAnim", L.Walk);
		Z("run", "RunAnim", L.Run);
		Z("jump", "JumpAnim", L.Jump);
		Z("climb", "ClimbAnim", L.Climb);
		Z("fall", "FallAnim", L.Fall);
		Z("swim", "Swim", L.Swim);
		Z("swimidle", "SwimIdle", L.SwimIdle or L.Swim);
		task.wait(.1);
		l.Disabled = false;
		local d = E:FindFirstChildOfClass("Humanoid");
		if d then
			d:ChangeState(Enum.HumanoidStateType.Landed);
			task.wait(.05);
			d:ChangeState(Enum.HumanoidStateType.Running);
		end;
	end;
	local l = false;
	t = function()
			if l or not r then
				return;
			end;
			l = true;
			task.spawn(function()
				while r do
					task.wait(.2);
					if not r then
						break;
					end;
					local L = z.Character;
					if not L then
						continue;
					end;
					local N = L:FindFirstChildOfClass("Humanoid");
					if not N then
						continue;
					end;
					if N.Health <= 0 then
						continue;
					end;
					if N.MoveDirection.Magnitude >= .1 then
						continue;
					end;
					local E = L:FindFirstChild("Animate");
					if not E then
						continue;
					end;
					local l = {};
					local Z = E:FindFirstChild("walk");
					local d = E:FindFirstChild("run");
					if Z then
						for L, N in ipairs(Z:GetChildren()) do
							if N:IsA("Animation") then
								table.insert(l, N.AnimationId);
							end;
						end;
					end;
					if d then
						for L, N in ipairs(d:GetChildren()) do
							if N:IsA("Animation") then
								table.insert(l, N.AnimationId);
							end;
						end;
					end;
					if #l == 0 then
						continue;
					end;
					local c = N:FindFirstChildOfClass("Animator");
					if c then
						for L, N in ipairs(c:GetPlayingAnimationTracks()) do
							if N.Animation and table.find(l, N.Animation.AnimationId) then
								N:Stop(0);
							end;
						end;
					end;
				end;
				l = false;
			end);
		end;
	z.CharacterAdded:Connect(function()
		if r then
			task.spawn(function()
				task.wait(.8);
				E(r);
			end);
		end;
	end);
	local Z = { "Ninguno" };
	for L, N in pairs(L) do
		table.insert(Z, L);
	end;
	table.sort(Z);
	HG.Animaciones:Section({ Title = "Paquetes Completos", Icon = "solar:folder-with-files-bold" });
	local d = "Ninguno";
	HG.Animaciones:Dropdown({
		Title = "Elegir Paquete",
		Values = Z,
		Value = "Ninguno",
		Callback = function(L)
			d = L;
		end,
	});
	HG.Animaciones:Button({ Title = "Aplicar Paquete Completo", Callback = function()
			if d == "Ninguno" then
				return;
			end;
			task.spawn(function()
				r = L[d];
				t();
				E(r);
			end);
		end });
	HG.Animaciones:Button({ Title = "Restaurar Default", Callback = function()
			task.spawn(function()
				local L = q or {
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
				r = nil;
				E(L);
			end);
		end });
	HG.Animaciones:Space();
	HG.Animaciones:Divider();
	HG.Animaciones:Space();
	HG.Animaciones:Section({ Title = "Mezclador de Animaciones", Icon = "solar:layers-bold" });
	local c = {
			Idle = "Ninguno",
			Walk = "Ninguno",
			Run = "Ninguno",
			Jump = "Ninguno",
			Fall = "Ninguno",
			Climb = "Ninguno",
		};
	HG.Animaciones:Dropdown({
		Title = "Reposo",
		Values = Z,
		Value = "Ninguno",
		Callback = function(L)
			c.Idle = L;
		end,
	});
	HG.Animaciones:Dropdown({
		Title = "Caminar",
		Values = Z,
		Value = "Ninguno",
		Callback = function(L)
			c.Walk = L;
		end,
	});
	HG.Animaciones:Dropdown({
		Title = "Correr",
		Values = Z,
		Value = "Ninguno",
		Callback = function(L)
			c.Run = L;
		end,
	});
	HG.Animaciones:Dropdown({
		Title = "Saltar",
		Values = Z,
		Value = "Ninguno",
		Callback = function(L)
			c.Jump = L;
		end,
	});
	HG.Animaciones:Dropdown({
		Title = "Caer",
		Values = Z,
		Value = "Ninguno",
		Callback = function(L)
			c.Fall = L;
		end,
	});
	HG.Animaciones:Dropdown({
		Title = "Escalar",
		Values = Z,
		Value = "Ninguno",
		Callback = function(L)
			c.Climb = L;
		end,
	});
	HG.Animaciones:Button({ Title = "Combinar y Aplicar", Callback = function()
			task.spawn(function()
				local N = {};
				if c.Idle ~= "Ninguno" then
					N.Idle = L[c.Idle].Idle;
					N.Idle2 = L[c.Idle].Idle2;
				end;
				if c.Walk ~= "Ninguno" then
					N.Walk = L[c.Walk].Walk;
				end;
				if c.Run ~= "Ninguno" then
					N.Run = L[c.Run].Run;
				end;
				if c.Jump ~= "Ninguno" then
					N.Jump = L[c.Jump].Jump;
				end;
				if c.Fall ~= "Ninguno" then
					N.Fall = L[c.Fall].Fall;
				end;
				if c.Climb ~= "Ninguno" then
					N.Climb = L[c.Climb].Climb;
				end;
				local l = false;
				for L, N in pairs(N) do
					if N then
						l = true;
						break;
					end;
				end;
				if l then
					r = N;
					t();
					E(r);
				end;
			end);
		end });
end;
local SG = 1;
local CG = Instance.new("Sound");
CG.Name = "NexvyrKillSound";
CG.Volume = 1;
CG.Looped = false;
CG.Parent = c;
local BG = Instance.new("Sound");
BG.Name = "NexvyrShootSound";
BG.Volume = 1;
BG.Looped = false;
BG.Parent = c;
local rG = Instance.new("Sound");
rG.Name = "NexvyrReloadSound";
rG.Volume = 1;
rG.Looped = false;
rG.Parent = c;
do
	local N = game:GetService("ContentProvider");
	local function E(L)
		if not L then
			return;
		end;
		for N = #L, 1, -1 do
			local E = L[N];
			L[N] = nil;
			if E and E.Connected then
				E:Disconnect();
			end;
		end;
	end;
	local Z = false;
	local d = false;
	local c = "Onichaaan";
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
	local m = "Revolver + Recarga";
	local U = 1.5;
	local x = 0;
	local k = 0;
	local A = .05;
	local function p()
		if not d then
			return;
		end;
		local L = w[m];
		if not L or not L.Shoot then
			return;
		end;
		local N = tick();
		if N - k < A then
			return;
		end;
		k = N;
		x = x + 1;
		local E = x;
		BG:Stop();
		BG.SoundId = "rbxassetid://" .. L.Shoot;
		BG.Volume = SG;
		BG:Play();
		task.delay(U, function()
			if x == E and BG.Playing then
				BG:Stop();
			end;
		end);
	end;
	local function s()
		if not d then
			return;
		end;
		local L = w[m];
		if not L or not L.Reload then
			return;
		end;
		rG:Stop();
		rG.SoundId = "rbxassetid://" .. L.Reload;
		rG.Volume = SG;
		rG:Play();
	end;
	local I = {};
	local g = setmetatable({}, { __mode = "k" });
	local G = setmetatable({}, { __mode = "k" });
	local K = setmetatable({}, { __mode = "k" });
	local function f(L)
		I[#I + 1] = L;
		return L;
	end;
	local function v()
		E(I);
		table.clear(g);
		table.clear(G);
		table.clear(K);
	end;
	local a;
	local M = {
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
	local function y(L)
		if not L:IsA("Sound") then
			return false;
		end;
		local N = string.lower(L.Name);
		for L, E in ipairs(M) do
			if string.find(N, E, 1, true) then
				return true;
			end;
		end;
		return false;
	end;
	local function S(L)
		if not L:IsA("Sound") then
			return;
		end;
		if not y(L) then
			return;
		end;
		if not d or g[L] then
			return;
		end;
		g[L] = true;
		f(L.Played:Connect(function()
			if not d then
				return;
			end;
			local N = z.Character;
			if not N then
				return;
			end;
			if L:IsDescendantOf(N) or L:IsDescendantOf(z:FindFirstChildOfClass("Backpack") or N) then
				p();
			end;
		end));
	end;
	local function C(L)
		if not L or not L:IsA("Tool") then
			return;
		end;
		for L, N in ipairs(L:GetDescendants()) do
			S(N);
		end;
		if not G[L] and d then
			G[L] = true;
			f(L.DescendantAdded:Connect(S));
		end;
	end;
	local function B(L)
		if not L then
			return;
		end;
		for L, N in ipairs(L:GetChildren()) do
			if N:IsA("Tool") then
				C(N);
			end;
		end;
		f(L.ChildAdded:Connect(function(L)
			if L:IsA("Tool") then
				C(L);
			end;
		end));
	end;
	local r = false;
	a = function()
			if r or not d then
				return;
			end;
			r = true;
			task.spawn(function()
				local L = false;
				while d do
					task.wait(.05);
					if not d then
						break;
					end;
					local N = z.Character;
					if not N then
						L = false;
						continue;
					end;
					local E = N:FindFirstChildOfClass("Tool");
					if not E or kG(E) then
						L = false;
						continue;
					end;
					local l = sG(E);
					if l and not L then
						s();
					end;
					L = l;
				end;
				r = false;
			end);
		end;
	local function q(L)
		for N, E in ipairs(H) do
			if E.Name == L then
				return E.Id;
			end;
		end;
		return H[1].Id;
	end;
	local function R()
		task.spawn(function()
			pcall(function()
				local L = "rbxassetid://" .. q(c);
				if CG.SoundId ~= L then
					CG.SoundId = L;
				end;
				N:PreloadAsync({ CG });
			end);
		end);
	end;
	local function P()
		if not Z then
			return;
		end;
		local L = "rbxassetid://" .. q(c);
		CG:Stop();
		if CG.SoundId ~= L then
			CG.SoundId = L;
		end;
		CG.Volume = SG;
		CG.TimePosition = 0;
		CG:Play();
	end;
	local b = 0;
	local V = 0;
	local O = .08;
	local F = .3;
	local u = 4;
	local function J(L)
		if not Z then
			return;
		end;
		local N = tick();
		if L then
			if N - b < F then
				return;
			end;
			V = N;
		else
			if N - b < O then
				return;
			end;
			if N - V < u then
				return;
			end;
		end;
		b = N;
		P();
	end;
	local t = {};
	local Y = setmetatable({}, { __mode = "k" });
	local W = setmetatable({}, { __mode = "k" });
	local X = setmetatable({}, { __mode = "k" });
	local o = setmetatable({}, { __mode = "k" });
	local Q = 0;
	local function D(L)
		t[#t + 1] = L;
		return L;
	end;
	local j = {
			kos = true,
			kills = true,
			kill = true,
			ko = true,
			killed = true,
			eliminations = true,
			kills_count = true,
		};
	local function h(L)
		if not L then
			return;
		end;
		if not ((L:IsA("IntValue") or L:IsA("NumberValue"))) then
			return;
		end;
		if not j[string.lower(L.Name)] then
			return;
		end;
		if not Z or Y[L] then
			return;
		end;
		Y[L] = true;
		local N = L.Value;
		D((L:GetPropertyChangedSignal("Value")):Connect(function()
			if L.Value > N then
				J();
			end;
			N = L.Value;
		end));
	end;
	local function e(L)
		if not L or not Z or o[L] then
			return;
		end;
		o[L] = true;
		for L, N in ipairs(L:GetChildren()) do
			h(N);
		end;
		D(L.ChildAdded:Connect(h));
	end;
	local n = {
			"KOs",
			"Kills",
			"kos",
			"kills",
			"KO",
			"killed",
			"Eliminations",
		};
	local function T()
		for L, N in ipairs(n) do
			local E = tonumber(z:GetAttribute(N));
			D((z:GetAttributeChangedSignal(N)):Connect(function()
				local L = tonumber(z:GetAttribute(N));
				if L ~= nil and (E ~= nil and L > E) then
					J();
				end;
				E = L;
			end));
		end;
		for L, N in ipairs({
			"leaderstats",
			"Stats",
			"stats",
			"PlayerStats",
		}) do
			e(z:FindFirstChild(N));
		end;
		D(z.ChildAdded:Connect(function(L)
			if L.Name == "leaderstats" or L.Name == "Stats" or L.Name == "stats" or L.Name == "PlayerStats" then
				e(L);
			end;
		end));
	end;
	local function LG(L, N)
		if not Z or W[N] then
			return;
		end;
		W[N] = true;
		local E;
		local function l(L)
			if not Z or not L or not L:IsA("Humanoid") then
				return;
			end;
			if E then
				E:Disconnect();
				E = nil;
			end;
			D(L.Died:Connect(function()
				if not Z then
					return;
				end;
				local N = L:FindFirstChild("creator");
				if N and N.Value == z then
					J();
				end;
			end));
		end;
		local d = N:FindFirstChildOfClass("Humanoid");
		if d then
			l(d);
		else
			E = D(N.ChildAdded:Connect(l));
		end;
	end;
	local function NG(L)
		if L == z or not Z or X[L] then
			return;
		end;
		X[L] = true;
		if L.Character then
			LG(L, L.Character);
		end;
		D(L.CharacterAdded:Connect(function(N)
			LG(L, N);
		end));
	end;
	local function EG()
		Q = Q + (1);
		local L = Q;
		task.spawn(function()
			local N = 0;
			while Z and (L == Q and N < 30) do
				local L = l:FindFirstChild("Packages");
				local E = L and L:FindFirstChild("Networking");
				local Z = E and E:FindFirstChild("RE/Combat/Killed");
				if Z and Z:IsA("RemoteEvent") then
					D(Z.OnClientEvent:Connect(function(L)
						if L == z then
							J(true);
						end;
					end));
					return;
				end;
				N = N + (1);
				task.wait(1);
			end;
		end);
	end;
	local function lG()
		if not Z then
			return;
		end;
		EG();
		T();
		for L, N in ipairs(L:GetPlayers()) do
			NG(N);
		end;
		D(L.PlayerAdded:Connect(NG));
	end;
	local function ZG()
		Q = Q + (1);
		E(t);
		table.clear(Y);
		table.clear(W);
		table.clear(X);
		table.clear(o);
	end;
	local dG = {};
	local cG = setmetatable({}, { __mode = "k" });
	local function zG(L)
		if not d or not L:IsA("Sound") then
			return;
		end;
		if L.Name == "NexvyrKillSound" or L.Name == "WindUI_MusicPlayer" or L.Name == "NexvyrShootSound" or L.Name == "NexvyrReloadSound" then
			return;
		end;
		if dG[L] == nil and L.Volume > 0 then
			dG[L] = L.Volume;
		end;
		if d then
			L.Volume = 0;
		end;
		if not cG[L] then
			cG[L] = true;
			f((L:GetPropertyChangedSignal("Volume")):Connect(function()
				if d and L.Volume ~= 0 then
					dG[L] = L.Volume;
					L.Volume = 0;
				end;
			end));
			f(L.Played:Connect(function()
				if d then
					L.Volume = 0;
				end;
			end));
		end;
	end;
	local function wG(L)
		if not L then
			return;
		end;
		for L, N in ipairs(L:GetDescendants()) do
			zG(N);
		end;
		f(L.DescendantAdded:Connect(zG));
	end;
	local function mG(L)
		if L then
			for L in pairs(dG) do
				if L.Parent then
					L.Volume = 0;
				end;
			end;
			if z.Character then
				for L, N in ipairs(z.Character:GetDescendants()) do
					zG(N);
				end;
			end;
			local L = z:FindFirstChildOfClass("Backpack");
			if L then
				for L, N in ipairs(L:GetDescendants()) do
					zG(N);
				end;
			end;
		else
			for L, N in pairs(dG) do
				if L.Parent then
					L.Volume = N;
				end;
			end;
		end;
	end;
	local function UG()
		if not d then
			return;
		end;
		local function L(L)
			if not L or not d or K[L] then
				return;
			end;
			K[L] = true;
			wG(L);
			B(L);
		end;
		L(z.Character);
		L(z:FindFirstChildOfClass("Backpack"));
		f(z.CharacterAdded:Connect(function(N)
			if not d then
				return;
			end;
			L(N);
			local E = z:FindFirstChildOfClass("Backpack");
			if E then
				L(E);
			end;
		end));
		f(z.ChildAdded:Connect(function(N)
			if N:IsA("Backpack") then
				L(N);
			end;
		end));
		a();
	end;
	HG.Sonidos:Section({ Title = "Sonido de Muerte", Icon = "solar:speaker-bold" });
	HG.Sonidos:Toggle({ Title = "Sonido de Kill", Value = false, Callback = function(L)
			if Z == L then
				return;
			end;
			Z = L;
			if L then
				R();
				lG();
			else
				ZG();
				CG:Stop();
			end;
		end });
	local xG = {};
	for L, N in ipairs(H) do
		table.insert(xG, N.Name);
	end;
	HG.Sonidos:Dropdown({
		Title = "Sonido de muerte",
		Values = xG,
		Value = "Onichaaan",
		Callback = function(L)
			c = L;
			if Z then
				R();
			end;
		end,
	});
	HG.Sonidos:Section({ Title = "Disparo y Recarga", Icon = "solar:target-bold" });
	HG.Sonidos:Toggle({ Title = "Recarga + disparo", Value = false, Callback = function(L)
			if d == L then
				return;
			end;
			d = L;
			if L then
				UG();
				mG(true);
			else
				v();
				BG:Stop();
				rG:Stop();
				mG(false);
				table.clear(dG);
				table.clear(cG);
			end;
		end });
	HG.Sonidos:Dropdown({
		Title = "Sonido de disparo",
		Values = { "Revolver + Recarga", "Magia de Anime", "L\195\161ser + Recarga l\195\161ser" },
		Value = "Revolver + Recarga",
		Callback = function(L)
			m = L;
		end,
	});
	i.SliKillSoundVolume = HG.Sonidos:Slider({
			Title = "Volumen",
			Step = .1,
			Value = { Min = 1, Max = 3, Default = 1 },
			Callback = function(L)
				SG = L;
				CG.Volume = L;
				BG.Volume = L;
				rG.Volume = L;
			end,
		});
end;
local qG = false;
local iG = false;
local RG, PG, bG;
do
	local L = { ["Right Leg"] = {
				id = "rbxassetid://139607718",
				targetBodyPart = "RightUpperLeg",
				partsToHide = { "RightUpperLeg", "RightLowerLeg", "RightFoot" },
				scale = Vector3.new(1, 1, 1),
				audio = "rbxassetid://135315310485417",
				offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
			} };
	local N = {};
	local function E(L, E)
		local l = z.Character;
		if not l then
			return false;
		end;
		local Z = l:WaitForChild(E.targetBodyPart, 2);
		if not Z then
			return false;
		end;
		local d = l:FindFirstChild("Korblox_" .. L:gsub("%s+", ""));
		if d then
			d:Destroy();
		end;
		for L, E in ipairs(E.partsToHide) do
			local Z = l:FindFirstChild(E);
			if Z and Z:IsA("BasePart") then
				if N[E] == nil then
					N[E] = Z.Transparency;
				end;
				Z.Transparency = 1;
			end;
		end;
		local c, H = pcall(function()
				return game:GetObjects(E.id);
			end);
		if not c or not H or #H == 0 then
			return false;
		end;
		local w = H[1];
		w.Name = "Korblox_" .. L:gsub("%s+", "");
		local m = w:IsA("BasePart") and w or w:FindFirstChildWhichIsA("BasePart", true);
		if not m then
			return false;
		end;
		m.Size = m.Size * E.scale;
		m.CanCollide = false;
		m.CFrame = Z.CFrame * E.offset;
		local U = Instance.new("WeldConstraint");
		U.Part0 = Z;
		U.Part1 = m;
		U.Parent = m;
		w.Parent = l;
		if E.audio then
			local L = Instance.new("Sound");
			L.SoundId = E.audio;
			L.Volume = .5;
			L.Parent = m;
			L:Play();
			(game:GetService("Debris")):AddItem(L, 3);
		end;
		return true;
	end;
	function RG()
		if not qG then
			return;
		end;
		local N = L["Right Leg"];
		local l = E("Right Leg", N);
		if not l then
			task.wait(.2);
			E("Right Leg", N);
		end;
	end;
	function PG()
		local L = z.Character;
		if not L then
			return;
		end;
		local E = "Korblox_RightLeg";
		local l = L:FindFirstChild(E);
		if l then
			pcall(function()
				l:Destroy();
			end);
		end;
		for N, E in pairs(N) do
			local l = L:FindFirstChild(N);
			if l and l:IsA("BasePart") then
				pcall(function()
					l.Transparency = E;
				end);
			end;
		end;
		N = {};
	end;
	local l = 134082579;
	local Z = nil;
	local function d(L)
		local N = z.Character;
		if not N then
			return;
		end;
		local E = N:FindFirstChild("Head");
		if E then
			E.Transparency = L and 1 or 0;
			local N = E:FindFirstChildOfClass("Decal");
			if N then
				N.Transparency = L and 1 or 0;
			end;
		end;
	end;
	function bG(L)
		local N = z.Character;
		if not N then
			return;
		end;
		if L then
			N:WaitForChild("Head", 2);
			d(true);
			if Z and Z.Parent ~= N then
				Z = nil;
			end;
			if Z then
				return;
			end;
			local L, E = pcall(function()
					return game:GetObjects("rbxassetid://" .. tostring(l));
				end);
			if L and (E and #E > 0) then
				local L = E[1];
				local l = nil;
				if L:IsA("Accessory") then
					l = L;
				else
					for L, N in ipairs(L:GetDescendants()) do
						if N:IsA("Accessory") then
							l = N;
							break;
						end;
					end;
					l = l or (L:IsA("Model") and L or nil);
				end;
				if l then
					if l:IsA("Accessory") then
						local L = N:FindFirstChildOfClass("Humanoid");
						local E = L and pcall(function()
								L:AddAccessory(l);
							end);
						if not E then
							l.Parent = N;
						end;
					else
						l.Parent = N;
					end;
					Z = l;
				end;
			else
				warn("[Headless] Failed to load headless asset: " .. tostring(E));
			end;
		else
			d(false);
			if Z then
				Z:Destroy();
				Z = nil;
			end;
		end;
	end;
	z.CharacterAdded:Connect(function(L)
		N = {};
		Z = nil;
		if qG then
			task.spawn(function()
				task.wait(.1);
				RG();
			end);
		end;
		if iG then
			task.spawn(function()
				task.wait(.1);
				bG(true);
			end);
		end;
	end);
	HG.Items:Section({ Title = "Apariencia", Icon = "solar:crown-star-bold" });
	i.TogHeadless = HG.Items:Toggle({ Title = "Aplicar Headless", Value = false, Callback = function(L)
				iG = L;
				if L then
					bG(true);
				else
					bG(false);
				end;
			end });
	i.TogKorblox = HG.Items:Toggle({ Title = "Aplicar Korblox", Value = false, Callback = function(L)
				qG = L;
				if L then
					RG();
				else
					PG();
				end;
			end });
	HG.Items:Section({ Title = "Headless real", Icon = "solar:ghost-bold" });
	do
		local L = { { id = "78837807518622", on = false, name = "Headless V1" }, { id = "117080641351340", on = false, name = "Headless V2" }, { id = "136055001302601", on = false, name = "Headless V3" } };
		local function N(L)
			if L.stopped then
				L.stopped:Disconnect();
				L.stopped = nil;
			end;
			if L.track then
				pcall(function()
					L.track:Stop();
					L.track:Destroy();
				end);
				L.track = nil;
			end;
		end;
		local function E(L, l)
			if not l or not l.Parent then
				return;
			end;
			local Z = l:FindFirstChildOfClass("Animator");
			if not Z then
				return;
			end;
			N(L);
			local d = Instance.new("Animation");
			d.AnimationId = "rbxassetid://" .. L.id;
			L.track = Z:LoadAnimation(d);
			L.track.Priority = Enum.AnimationPriority.Action;
			L.track.Looped = true;
			L.track:Play();
			L.stopped = L.track.Stopped:Connect(function()
					if L.on and l.Parent then
						task.wait(.1);
						E(L, l);
					end;
				end);
		end;
		local function l(L)
			local N = z.Character;
			local l = N and N:FindFirstChildOfClass("Humanoid");
			if not l then
				return;
			end;
			if L.freeze then
				L.freeze:Disconnect();
			end;
			L.freeze = l.StateChanged:Connect(function()
					if L.on and (l.Parent and ((not L.track or not L.track.IsPlaying))) then
						task.wait(.05);
						if L.on and l.Parent then
							E(L, l);
						end;
					end;
				end);
			E(L, l);
		end;
		local function Z(L)
			N(L);
			if L.freeze then
				L.freeze:Disconnect();
				L.freeze = nil;
			end;
		end;
		z.CharacterRemoving:Connect(function()
			for L, E in ipairs(L) do
				N(E);
				if E.freeze then
					E.freeze:Disconnect();
					E.freeze = nil;
				end;
			end;
		end);
		z.CharacterAdded:Connect(function()
			task.wait(.5);
			for L, N in ipairs(L) do
				if N.on then
					l(N);
				end;
			end;
		end);
		for L, N in ipairs(L) do
			i["TogFEHL_" .. N.name:gsub(" ", "")] = HG.Items:Toggle({ Title = N.name, Value = false, Callback = function(L)
						N.on = L;
						if L then
							l(N);
						else
							Z(N);
						end;
					end });
		end;
	end;
end;
HG.Identidad:Section({ Title = "identidad falsa", Icon = "solar:user-id-bold" });
local VG;
do
	local function N(L, N, E)
		local l = N:gsub("[%-%^%$%(%)%%%.%[%]%*%+%?]", "%%%1");
		return (L:gsub(l, E));
	end;
	local E = {};
	local l = {};
	local Z = setmetatable({}, { __mode = "k" });
	local d = false;
	local function c(L, l, Z)
		local d = L:FindFirstAncestorWhichIsA("ScreenGui");
		if d and ((string.find(d.Name, "WindUI") or string.find(d.Name, "Nexvyr"))) then
			return;
		end;
		if L:IsA("TextLabel") or L:IsA("TextBox") or L:IsA("TextButton") then
			local d = L.Text;
			local c = false;
			if d and d ~= "" then
				if string.find(d, l, 1, true) or string.find(d, Z, 1, true) then
					c = true;
				end;
			end;
			if c and not E[L] then
				E[L] = {
						Text = d,
						Color = L.TextColor3,
						TextTransp = L.TextTransparency,
						StrokeTransp = L.TextStrokeTransparency,
						Strokes = {},
					};
				for N, l in pairs(L:GetChildren()) do
					if l:IsA("UIStroke") then
						E[L].Strokes[l] = { Enabled = l.Enabled, Transp = l.Transparency, Thickness = l.Thickness };
					end;
				end;
			end;
			if E[L] then
				if S then
					local d = E[L].Text;
					d = N(d, l, C);
					d = N(d, Z, C);
					L.Text = d;
					L.TextTransparency = E[L].TextTransp;
					L.TextStrokeTransparency = E[L].StrokeTransp;
					L.TextColor3 = E[L].Color;
					for N, l in pairs(L:GetChildren()) do
						if l:IsA("UIStroke") and E[L].Strokes[l] then
							l.Enabled = E[L].Strokes[l].Enabled;
						end;
					end;
				else
					L.Text = E[L].Text;
					L.TextColor3 = E[L].Color;
					L.TextTransparency = E[L].TextTransp;
					L.TextStrokeTransparency = E[L].StrokeTransp;
					for N, l in pairs(L:GetChildren()) do
						if l:IsA("UIStroke") and E[L].Strokes[l] then
							l.Enabled = E[L].Strokes[l].Enabled;
							l.Transparency = E[L].Strokes[l].Transp;
							l.Thickness = E[L].Strokes[l].Thickness;
						end;
					end;
				end;
			end;
		end;
	end;
	function VG()
		local N = z.Name;
		local H = z.DisplayName;
		task.spawn(function()
			for L, E in pairs(L:GetPlayers()) do
				if E.Character then
					for L, E in pairs(E.Character:GetDescendants()) do
						if E:IsA("TextLabel") or E:IsA("TextBox") or E:IsA("TextButton") then
							c(E, N, H);
						end;
					end;
				end;
			end;
			local E = z:FindFirstChild("PlayerGui");
			if E then
				for L, E in pairs(E:GetDescendants()) do
					if E:IsA("TextLabel") or E:IsA("TextBox") or E:IsA("TextButton") then
						c(E, N, H);
					end;
				end;
			end;
		end);
		if S then
			if not d then
				d = true;
				local function L(L)
					local z = L:FindFirstAncestorWhichIsA("ScreenGui");
					if z and ((string.find(z.Name, "WindUI") or string.find(z.Name, "Nexvyr"))) then
						return;
					end;
					if L:IsA("TextLabel") or L:IsA("TextBox") or L:IsA("TextButton") then
						c(L, N, H);
						if not Z[L] then
							Z[L] = true;
							table.insert(l, (L:GetPropertyChangedSignal("Text")):Connect(function()
								if d and (L.Text ~= C and not string.find(L.Text, C)) then
									E[L] = nil;
									c(L, N, H);
								end;
							end));
						end;
					end;
				end;
				local w = z:FindFirstChild("PlayerGui");
				if w then
					table.insert(l, w.DescendantAdded:Connect(function(N)
						if d and ((N:IsA("TextLabel") or N:IsA("TextBox") or N:IsA("TextButton"))) then
							task.spawn(function()
								L(N);
							end);
						end;
					end));
				end;
				local m, U = pcall(function()
						return game:GetService("CoreGui");
					end);
				if m and U then
					table.insert(l, U.DescendantAdded:Connect(function(N)
						if d and ((N:IsA("TextLabel") or N:IsA("TextBox") or N:IsA("TextButton"))) then
							task.spawn(function()
								L(N);
							end);
						end;
					end));
				end;
			end;
		else
			d = false;
			for L, N in ipairs(l) do
				N:Disconnect();
			end;
			l = {};
			table.clear(Z);
			for L, N in pairs(E) do
				if L and L.Parent then
					L.Text = N.Text;
					L.TextColor3 = N.Color;
					L.TextTransparency = N.TextTransp;
					L.TextStrokeTransparency = N.StrokeTransp;
					for L, N in pairs(N.Strokes) do
						if L and L.Parent then
							L.Enabled = N.Enabled;
							L.Transparency = N.Transp;
							L.Thickness = N.Thickness;
						end;
					end;
				end;
			end;
			E = {};
		end;
	end;
	i.TogFakeName = HG.Identidad:Toggle({ Title = "Activar Nombre Falso", Value = false, Callback = function(L)
				S = L;
				VG();
			end });
	i.InpFakeName = HG.Identidad:Input({ Title = "Nuevo Nombre", Placeholder = "Escribe tu nombre falso...", Callback = function(L)
				if L ~= "" then
					C = L;
					if S then
						VG();
					end;
				end;
			end });
	z.CharacterAdded:Connect(function()
		if S then
			task.wait(1);
			VG();
		end;
	end);
end;
do
	local L = "UzivertHub_Configs_WindUI";
	if isfolder and not isfolder(L) then
		pcall(function()
			makefolder(L);
		end);
	end;
	local N = { "Ninguna" };
	local E = "Ninguna";
	local l = "";
	HG.Guardado:Section({ Title = "Gestor de Configs", Icon = "solar:diskette-bold" });
	local d = HG.Guardado:Dropdown({
			Title = "Seleccionar Configuraci\195\179n",
			Values = N,
			Value = "Ninguna",
			Callback = function(L)
				E = L;
			end,
		});
	local function c()
		local N = {};
		if listfiles then
			pcall(function()
				for L, E in ipairs(listfiles(L)) do
					if E:match("%.json$") then
						local L = E:match("([^/\\]+)%.json$");
						if L then
							table.insert(N, L);
						end;
					end;
				end;
			end);
		end;
		if #N == 0 then
			table.insert(N, "Ninguna");
		end;
		pcall(function()
			d:Refresh(N);
			if E == "Ninguna" or not table.find(N, E) then
				d:Select(N[1]);
				E = N[1];
			end;
		end);
	end;
	HG.Guardado:Button({
		Title = "Actualizar Lista",
		Icon = "solar:refresh-bold",
		Variant = "Secondary",
		Callback = function()
			c();
		end,
	});
	HG.Guardado:Input({
		Title = "Nombre para Guardar",
		Placeholder = "Ej: Config 1, Config 2...",
		Icon = "solar:text-field-bold",
		Callback = function(L)
			l = L;
		end,
	});
	local z = false;
	local H = 0;
	HG.Guardado:Button({
		Title = "Eliminar todos los guardados",
		Icon = "solar:trash-bin-trash-bold",
		Variant = "Danger",
		Callback = function()
			local N = os.clock();
			if z and (N - H) < 4 then
				z = false;
				if listfiles then
					pcall(function()
						for L, N in ipairs(listfiles(L)) do
							if N:match("%.json$") then
								pcall(function()
									delfile(N);
								end);
							end;
						end;
					end);
				end;
				c();
			else
				z = true;
				H = N;
			end;
		end,
	});
	local function k(L, N)
		if not L or N == nil then
			return;
		end;
		pcall(function()
			L:Set(N);
		end);
	end;
	HG.Guardado:Button({
		Title = "Guardar Configuraci\195\179n",
		Icon = "solar:diskette-bold",
		Variant = "Primary",
		Callback = function()
			local N = l:gsub("[^%w%s%-]", "");
			if N == "" then
				N = E;
			end;
			if N == "" or N == "Ninguna" then
				return;
			end;
			local z = L .. ("/" .. (N .. ".json"));
			local H = {
					ConfigName = N,
					Toggles = {
						["Auto Shoot"] = U,
						["Auto Shoot Agresivo"] = x,
						["Equipar pistola"] = W,
						["Silent Aim (Manual)"] = A,
						["Silent Aim (FOV)"] = p,
						["Mostrar C\195\173rculo FOV"] = w,
						["Team Check"] = I,
						["ESP Jugadores"] = g,
						["ESP Glow"] = K.Glow,
						["Kill All"] = f,
						["Hitbox Activar"] = v,
						["Hitbox Invisible"] = a,
						Headless = iG,
						Korblox = qG,
						["Nombre Falso"] = S,
						Invisible = B,
					},
					Sliders = {
						["Tama\195\177o del FOV"] = m,
						["Tama\195\177o de Hitbox"] = M,
						["Volumen Kill Sound"] = SG,
						["Ajuste Speed"] = vG,
						["Ajuste Salto"] = aG,
					},
					Colors = { ["Color de Hitbox"] = { R = y.R, G = y.G, B = y.B }, ["Color del ESP"] = { R = G.R, G = G.G, B = G.B } },
					Extras = { ["Parte Silent Aim"] = s, ["Nombre Falso Texto"] = C },
				};
			if writefile then
				local L, E = pcall(function()
						return Z:JSONEncode(H);
					end);
				if L then
					pcall(function()
						writefile(z, E);
					end);
					c();
					pcall(function()
						d:Select(N);
					end);
				end;
			end;
		end,
	});
	HG.Guardado:Button({
		Title = "Cargar Configuraci\195\179n",
		Icon = "solar:folder-open-bold",
		Variant = "Primary",
		Callback = function()
			if E == "Ninguna" or E == "" then
				return;
			end;
			local N = L .. ("/" .. (E .. ".json"));
			if isfile and isfile(N) then
				local L, E = pcall(function()
						return Z:JSONDecode(readfile(N));
					end);
				if L and type(E) == "table" then
					if E.Toggles then
						if E.Toggles["Auto Shoot"] ~= nil then
							U = E.Toggles["Auto Shoot"];
							k(i.TogAutoShoot, U);
						end;
						if E.Toggles["Auto Shoot Agresivo"] ~= nil then
							x = E.Toggles["Auto Shoot Agresivo"];
							k(i.TogAutoShootAgr, x);
						end;
						if E.Toggles["Equipar pistola"] ~= nil then
							W = E.Toggles["Equipar pistola"];
							k(i.TogEquipGun, W);
						end;
						if E.Toggles["Silent Aim (Manual)"] ~= nil then
							A = E.Toggles["Silent Aim (Manual)"];
							k(i.TogSilentAimManual, A);
						end;
						if E.Toggles["Silent Aim (FOV)"] ~= nil then
							p = E.Toggles["Silent Aim (FOV)"];
							k(i.TogSilentAimFOV, p);
						end;
						if E.Toggles["Mostrar C\195\173rculo FOV"] ~= nil then
							w = E.Toggles["Mostrar C\195\173rculo FOV"];
							k(i.TogShowFOV, w);
						end;
						if E.Toggles["Team Check"] ~= nil then
							I = E.Toggles["Team Check"];
						end;
						if E.Toggles["ESP Jugadores"] ~= nil then
							g = E.Toggles["ESP Jugadores"];
							k(i.TogEsp, g);
						end;
						if E.Toggles["ESP Glow"] ~= nil then
							K.Glow = E.Toggles["ESP Glow"];
							k(i.TogEspGl, K.Glow);
						end;
						if E.Toggles["Kill All"] ~= nil then
							f = E.Toggles["Kill All"];
							k(i.TogKillAll, f);
							if f then
								KillAllInstance:Start();
							else
								KillAllInstance:Stop();
							end;
						end;
						if E.Toggles["Hitbox Activar"] ~= nil then
							v = E.Toggles["Hitbox Activar"];
							k(i.TogHitbox, v);
							if v then
								J();
							else
								gG();
							end;
						end;
						if E.Toggles["Hitbox Invisible"] ~= nil then
							a = E.Toggles["Hitbox Invisible"];
							k(i.TogHitboxInvisible, a);
						end;
						if E.Toggles.Headless ~= nil then
							iG = E.Toggles.Headless;
							k(i.TogHeadless, iG);
							if iG then
								bG(true);
							else
								bG(false);
							end;
						end;
						if E.Toggles.Korblox ~= nil then
							qG = E.Toggles.Korblox;
							k(i.TogKorblox, qG);
							if qG then
								RG();
							else
								PG();
							end;
						end;
						if E.Toggles["Nombre Falso"] ~= nil then
							S = E.Toggles["Nombre Falso"];
							k(i.TogFakeName, S);
							VG();
						end;
						if E.Toggles.Invisible ~= nil then
							B = E.Toggles.Invisible;
							k(i.TogInvisible, B);
							fG(B);
							if X then
								X(B);
							end;
						end;
					end;
					if E.Sliders then
						if E.Sliders["Tama\195\177o del FOV"] ~= nil then
							m = E.Sliders["Tama\195\177o del FOV"];
							k(i.SliFOVSize, m);
						end;
						if E.Sliders["Tama\195\177o de Hitbox"] ~= nil then
							M = E.Sliders["Tama\195\177o de Hitbox"];
							k(i.SliHitboxSize, M);
						end;
						if E.Sliders["Volumen Kill Sound"] ~= nil then
							SG = E.Sliders["Volumen Kill Sound"];
							CG.Volume = SG;
							BG.Volume = SG;
							rG.Volume = SG;
							k(i.SliKillSoundVolume, SG);
						end;
						if E.Sliders["Ajuste Speed"] ~= nil then
							vG = E.Sliders["Ajuste Speed"];
							k(i.SliSpeed, vG);
						end;
						if E.Sliders["Ajuste Salto"] ~= nil then
							aG = E.Sliders["Ajuste Salto"];
							k(i.SliJumpPower, aG);
						end;
					end;
					if E.Colors then
						if E.Colors["Color de Hitbox"] then
							y = Color3.new(E.Colors["Color de Hitbox"].R, E.Colors["Color de Hitbox"].G, E.Colors["Color de Hitbox"].B);
							if i.ColHitbox then
								pcall(function()
									i.ColHitbox:Update(y);
								end);
							end;
						end;
						if E.Colors["Color del ESP"] then
							local L = Color3.new(E.Colors["Color del ESP"].R, E.Colors["Color del ESP"].G, E.Colors["Color del ESP"].B);
							G = L;
							if i.ColEsp then
								pcall(function()
									i.ColEsp:Update(L);
								end);
							end;
						end;
					end;
					if E.Extras then
						if E.Extras["Parte Silent Aim"] then
							s = E.Extras["Parte Silent Aim"];
							if i.DropSilentAimPart then
								pcall(function()
									i.DropSilentAimPart:Select(s);
								end);
							end;
						end;
						if E.Extras["Nombre Falso Texto"] then
							C = E.Extras["Nombre Falso Texto"];
							k(i.InpFakeName, C);
							if S then
								VG();
							end;
						end;
					end;
					if R then
						R();
					end;
					if Y then
						Y();
					end;
				end;
			end;
		end,
	});
	task.spawn(function()
		task.wait(1);
		c();
	end);
end;
do
	HG.Graficos:Section({ Title = "Presets de Iluminaci\195\179n", Icon = "solar:palette-bold" });
	local L = {};
	local N = {};
	local E = {};
	local l = nil;
	local function Z(L)
		local N = game:GetService("Lighting");
		if N:GetAttribute("OrigSaved_" .. L) then
			return;
		end;
		N:SetAttribute("Orig_Ambient_" .. L, N.Ambient);
		N:SetAttribute("Orig_OutdoorAmbient_" .. L, N.OutdoorAmbient);
		N:SetAttribute("Orig_Brightness_" .. L, N.Brightness);
		N:SetAttribute("Orig_ClockTime_" .. L, N.ClockTime);
		N:SetAttribute("Orig_FogColor_" .. L, N.FogColor);
		N:SetAttribute("Orig_FogEnd_" .. L, N.FogEnd);
		N:SetAttribute("Orig_FogStart_" .. L, N.FogStart);
		N:SetAttribute("Orig_ColorShift_Top_" .. L, N.ColorShift_Top);
		N:SetAttribute("Orig_ColorShift_Bottom_" .. L, N.ColorShift_Bottom);
		N:SetAttribute("Orig_ExposureCompensation_" .. L, N.ExposureCompensation);
		N:SetAttribute("Orig_GlobalShadows_" .. L, N.GlobalShadows);
		N:SetAttribute("Orig_EnvironmentDiffuseScale_" .. L, N.EnvironmentDiffuseScale);
		N:SetAttribute("Orig_EnvironmentSpecularScale_" .. L, N.EnvironmentSpecularScale);
		N:SetAttribute("OrigSaved_" .. L, true);
	end;
	local function c(L)
		local N = game:GetService("Lighting");
		if not N:GetAttribute("OrigSaved_" .. L) then
			return;
		end;
		N.Ambient = N:GetAttribute("Orig_Ambient_" .. L);
		N.OutdoorAmbient = N:GetAttribute("Orig_OutdoorAmbient_" .. L);
		N.Brightness = N:GetAttribute("Orig_Brightness_" .. L);
		N.ClockTime = N:GetAttribute("Orig_ClockTime_" .. L);
		N.FogColor = N:GetAttribute("Orig_FogColor_" .. L);
		N.FogEnd = N:GetAttribute("Orig_FogEnd_" .. L);
		N.FogStart = N:GetAttribute("Orig_FogStart_" .. L);
		N.ColorShift_Top = N:GetAttribute("Orig_ColorShift_Top_" .. L);
		N.ColorShift_Bottom = N:GetAttribute("Orig_ColorShift_Bottom_" .. L);
		N.ExposureCompensation = N:GetAttribute("Orig_ExposureCompensation_" .. L);
		N.GlobalShadows = N:GetAttribute("Orig_GlobalShadows_" .. L);
		N.EnvironmentDiffuseScale = N:GetAttribute("Orig_EnvironmentDiffuseScale_" .. L);
		N.EnvironmentSpecularScale = N:GetAttribute("Orig_EnvironmentSpecularScale_" .. L);
		N:SetAttribute("OrigSaved_" .. L, nil);
	end;
	local function z(L)
		for L, N in ipairs(L) do
			pcall(function()
				N:Destroy();
			end);
		end;
		table.clear(L);
	end;
	local function H(N)
		local E = game:GetService("Lighting");
		if N then
			Z("NS");
			z(L);
			if l then
				l:Destroy();
			end;
			l = Instance.new("Folder");
			l.Name = "NS_SkyX";
			l.Parent = d;
			local function N(N)
				local E = Instance.new("Part");
				E.Anchored = true;
				E.CanCollide = false;
				E.CanQuery = false;
				E.Material = Enum.Material.Neon;
				E.Color = Color3.fromRGB(255, 55, 55);
				E.Transparency = .1;
				E.Size = Vector3.new(2600, 26, 26);
				E.CFrame = CFrame.new(0, 3200, -2200) * CFrame.Angles(0, 0, math.rad(N));
				E.Parent = l;
				table.insert(L, E);
			end;
			N(45);
			N(-45);
			local c = Instance.new("Part");
			c.Anchored = true;
			c.CanCollide = false;
			c.CanQuery = false;
			c.Material = Enum.Material.Neon;
			c.Color = Color3.fromRGB(255, 110, 110);
			c.Transparency = .65;
			c.Shape = Enum.PartType.Ball;
			c.Size = Vector3.new(420, 420, 420);
			c.CFrame = CFrame.new(0, 3200, -2200);
			c.Parent = l;
			table.insert(L, c);
			local H = Instance.new("PointLight");
			H.Color = Color3.fromRGB(255, 80, 80);
			H.Range = 300;
			H.Brightness = 3;
			H.Parent = c;
			table.insert(L, H);
			local w = Instance.new("Sky");
			w.Name = "NS_Sky";
			w.StarCount = 9000;
			w.MoonAngularSize = 30;
			w.SunAngularSize = 0;
			w.CelestialBodiesShown = true;
			w.Parent = E;
			table.insert(L, w);
			local m = Instance.new("ColorCorrectionEffect");
			m.Name = "NS_CC";
			m.Brightness = .05;
			m.Contrast = .32;
			m.Saturation = -0.15;
			m.TintColor = Color3.fromRGB(255, 130, 130);
			m.Parent = E;
			table.insert(L, m);
			local U = Instance.new("BloomEffect");
			U.Name = "NS_Bloom";
			U.Intensity = 1;
			U.Size = 90;
			U.Threshold = .45;
			U.Parent = E;
			table.insert(L, U);
			local x = Instance.new("BlurEffect");
			x.Name = "NS_Blur";
			x.Size = 3;
			x.Parent = E;
			table.insert(L, x);
			local k = Instance.new("Atmosphere");
			k.Name = "NS_Atmo";
			k.Density = .42;
			k.Offset = 0;
			k.Color = Color3.fromRGB(60, 12, 12);
			k.Decay = Color3.fromRGB(80, 20, 20);
			k.Glare = .5;
			k.Haze = 1.6;
			k.Parent = E;
			table.insert(L, k);
			E.ClockTime = 0;
			E.Brightness = 1.2;
			E.Ambient = Color3.fromRGB(130, 110, 110);
			E.OutdoorAmbient = Color3.fromRGB(180, 140, 140);
			E.FogColor = Color3.fromRGB(22, 5, 5);
			E.FogEnd = 1200;
			E.FogStart = 150;
			E.ColorShift_Top = Color3.fromRGB(125, 25, 25);
			E.ColorShift_Bottom = Color3.fromRGB(65, 8, 8);
			E.ExposureCompensation = -0.2;
			E.GlobalShadows = true;
			E.EnvironmentDiffuseScale = .5;
			E.EnvironmentSpecularScale = .5;
		else
			z(L);
			if l then
				l:Destroy();
				l = nil;
			end;
			c("NS");
		end;
	end;
	local function w(L)
		local E = game:GetService("Lighting");
		if L then
			Z("AF");
			z(N);
			local L = Instance.new("ColorCorrectionEffect");
			L.Name = "AF_CC";
			L.Brightness = .05;
			L.Contrast = .14;
			L.Saturation = .22;
			L.TintColor = Color3.fromRGB(255, 205, 165);
			L.Parent = E;
			table.insert(N, L);
			local l = Instance.new("BloomEffect");
			l.Name = "AF_Bloom";
			l.Intensity = .32;
			l.Size = 40;
			l.Threshold = .92;
			l.Parent = E;
			table.insert(N, l);
			local d = Instance.new("SunRaysEffect");
			d.Name = "AF_Rays";
			d.Intensity = .15;
			d.Spread = .9;
			d.Parent = E;
			table.insert(N, d);
			local c = Instance.new("Sky");
			c.Name = "AF_Sky";
			c.SunAngularSize = 18;
			c.MoonAngularSize = 0;
			c.StarCount = 2000;
			c.Parent = E;
			table.insert(N, c);
			local H = Instance.new("Atmosphere");
			H.Name = "AF_Atmo";
			H.Density = .36;
			H.Offset = .1;
			H.Color = Color3.fromRGB(255, 185, 135);
			H.Decay = Color3.fromRGB(255, 125, 85);
			H.Glare = .2;
			H.Haze = 1.2;
			H.Parent = E;
			table.insert(N, H);
			E.ClockTime = 6.3;
			E.Brightness = 2.4;
			E.Ambient = Color3.fromRGB(85, 62, 55);
			E.OutdoorAmbient = Color3.fromRGB(125, 92, 80);
			E.FogColor = Color3.fromRGB(240, 185, 145);
			E.FogEnd = 2500;
			E.FogStart = 200;
			E.ColorShift_Top = Color3.fromRGB(255, 185, 105);
			E.ColorShift_Bottom = Color3.fromRGB(205, 105, 85);
			E.ExposureCompensation = .08;
			E.GlobalShadows = true;
			E.EnvironmentDiffuseScale = .8;
			E.EnvironmentSpecularScale = .6;
		else
			z(N);
			c("AF");
		end;
	end;
	local function m(L)
		local N = game:GetService("Lighting");
		if L then
			Z("SV");
			z(E);
			local L = Instance.new("ColorCorrectionEffect");
			L.Name = "SV_CC";
			L.Brightness = .05;
			L.Contrast = .22;
			L.Saturation = -1;
			L.TintColor = Color3.fromRGB(222, 226, 232);
			L.Parent = N;
			table.insert(E, L);
			local l = Instance.new("BloomEffect");
			l.Name = "SV_Bloom";
			l.Intensity = 1.25;
			l.Size = 75;
			l.Threshold = .38;
			l.Parent = N;
			table.insert(E, l);
			local d = Instance.new("Sky");
			d.Name = "SV_Sky";
			d.StarCount = 0;
			d.SunAngularSize = 0;
			d.MoonAngularSize = 0;
			d.CelestialBodiesShown = false;
			d.Parent = N;
			table.insert(E, d);
			local c = Instance.new("Atmosphere");
			c.Name = "SV_Atmo";
			c.Density = .3;
			c.Offset = .1;
			c.Color = Color3.fromRGB(180, 185, 190);
			c.Decay = Color3.fromRGB(140, 145, 150);
			c.Glare = 0;
			c.Haze = 1;
			c.Parent = N;
			table.insert(E, c);
			N.ClockTime = 14;
			N.Brightness = 2.2;
			N.Ambient = Color3.fromRGB(92, 96, 100);
			N.OutdoorAmbient = Color3.fromRGB(132, 136, 140);
			N.FogColor = Color3.fromRGB(172, 176, 180);
			N.FogEnd = 3000;
			N.FogStart = 200;
			N.ColorShift_Top = Color3.fromRGB(152, 156, 160);
			N.ColorShift_Bottom = Color3.fromRGB(122, 126, 130);
			N.ExposureCompensation = 0;
			N.GlobalShadows = true;
			N.EnvironmentDiffuseScale = .6;
			N.EnvironmentSpecularScale = .3;
		else
			z(E);
			c("SV");
		end;
	end;
	local U, x, k;
	U = HG.Graficos:Toggle({ Title = "Noche Sangrienta", Value = false, Callback = function(L)
				if L then
					if x then
						pcall(function()
							x:Set(false);
						end);
					end;
					if k then
						pcall(function()
							k:Set(false);
						end);
					end;
				end;
				H(L);
			end });
	x = HG.Graficos:Toggle({ Title = "Atardecer Fant\195\161stico", Value = false, Callback = function(L)
				if L then
					if U then
						pcall(function()
							U:Set(false);
						end);
					end;
					if k then
						pcall(function()
							k:Set(false);
						end);
					end;
				end;
				w(L);
			end });
	k = HG.Graficos:Toggle({ Title = "Sin Vida", Value = false, Callback = function(L)
				if L then
					if U then
						pcall(function()
							U:Set(false);
						end);
					end;
					if x then
						pcall(function()
							x:Set(false);
						end);
					end;
				end;
				m(L);
			end });
end;
do
	HG.Updates:Section({ Title = "Nuevas cosas agregadas" });
	local L = {
			"+Fixed Platform (Movimiento)",
			"+Fake Lag (Movimiento)",
			"+Nuevas animaciones del Hub de MMV",
			"+Secci\195\179n Headless real (V1, V2, V3) en Apariencia",
			"-Se quit\195\179 la pesta\195\177a de M\195\186sica",
		};
	local N = {};
	for L, E in ipairs(L) do
		local l = (string.sub(E, 1, 1) == "-") and "#FF4D4D" or "#3DDC84";
		N[L] = "<font color=\'" .. (l .. ("\'>" .. (E .. "</font>")));
	end;
	pcall(function()
		HG.Updates:Paragraph({ Title = "Uzivert Hub  v2.4", Desc = table.concat(N, "\n"), Icon = "solar:moon-bold" });
	end);
end;
do
	local L = {
			"+Orb flotante de Uzivert Hub",
			"+Fondo y tema Uzivert nuevos",
			"+Borde plateado animado en la interfaz",
			"+Bot\195\179n bindable para Invisible",
			"+API m\195\161s segura",
			"+Mejoras en la precisi\195\179n",
			"+Indetectable",
			"+Optimizaci\195\179n",
		};
	local N = {};
	for L, E in ipairs(L) do
		N[L] = "<font color=\'#3DDC84\'>" .. (E .. "</font>");
	end;
	pcall(function()
		HG.Updates:Paragraph({ Title = "Uzivert Hub  v2.1", Desc = table.concat(N, "\n"), Icon = "solar:moon-bold" });
	end);
end;
do
	local L = game:GetService("TweenService");
	local l = Color3.fromRGB(255, 255, 255);
	local Z = Color3.fromRGB(190, 200, 225);
	local d = Color3.fromRGB(12, 13, 20);
	local function c(L, N, E)
		local l = Instance.new(L);
		for L, N in pairs(N) do
			l[L] = N;
		end;
		l.Parent = E;
		return l;
	end;
	local function z(L, N)
		return c("UICorner", { CornerRadius = UDim.new(0, N) }, L);
	end;
	local function H(L, N, E, l)
		local Z = c("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(N, N),
				BackgroundColor3 = E,
				BorderSizePixel = 0,
				ZIndex = l,
			}, L);
		z(Z, N);
		return Z;
	end;
	local w = c("TextButton", {
			Name = "UzivertOrb",
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.new(0, 30, .5, -30),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 50,
		}, o);
	local m = c("UIScale", { Scale = 1 }, w);
	local U = H(w, 90, l, 1);
	U.BackgroundTransparency = .85;
	local x = c("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(58, 58),
			BackgroundTransparency = 1,
			ZIndex = 2,
		}, w);
	z(x, 29);
	local k = c("UIStroke", { Thickness = 2.5, Color = l }, x);
	local A = c("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, l), ColorSequenceKeypoint.new(.5, Z), ColorSequenceKeypoint.new(1, l) }), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(.55, .65), NumberSequenceKeypoint.new(1, 0) }) }, k);
	local p = H(w, 50, d, 3);
	local function s(L, N, E)
		local l = c("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(L, L),
				BackgroundTransparency = 1,
				ZIndex = 4,
			}, w);
		z(l, 4);
		c("UIStroke", { Thickness = 1.2, Color = N, Transparency = E }, l);
		return l;
	end;
	local I, g = s(36, l, .2), s(30, Z, .4);
	local G = H(w, 20, l, 5);
	G.Position = UDim2.new(.5, -1, .5, 0);
	local K = H(w, 17, d, 6);
	K.Position = UDim2.new(.5, 4, .5, -3);
	local f = {};
	for L = 1, 3, 1 do
		local N = H(w, 3 + (L % 2), (L % 2 == 0) and l or Z, 7);
		f[L] = {
				f = N,
				r = 29,
				sp = ((L % 2 == 0 and 1 or -1)) * ((.9 + L * .35)),
				ph = L * 2.1,
			};
	end;
	local v = true;
	local function a()
		if pcall(function()
			lG:Toggle();
		end) then
			return;
		end;
		v = not v;
		pcall(function()
			if v then
				lG:Open();
			else
				lG:Close();
			end;
		end);
	end;
	local M, y, S, C, B = false, nil, nil, 0, nil;
	w.InputBegan:Connect(function(N)
		if N.UserInputType == Enum.UserInputType.MouseButton1 or N.UserInputType == Enum.UserInputType.Touch then
			if M then
				return;
			end;
			M = true;
			C = 0;
			B = N;
			y = w.Position;
			S = N.Position;
			(L:Create(m, TweenInfo.new(.12), { Scale = .9 })):Play();
		end;
	end);
	E.InputChanged:Connect(function(L)
		if not M then
			return;
		end;
		if L.UserInputType == Enum.UserInputType.MouseMovement then
			if not B or B.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return;
			end;
		elseif L ~= B then
			return;
		end;
		do
			local N = L.Position - S;
			C = math.max(C, N.Magnitude);
			if C > 6 then
				w.Position = UDim2.new(y.X.Scale, y.X.Offset + N.X, y.Y.Scale, y.Y.Offset + N.Y);
			end;
		end;
	end);
	E.InputEnded:Connect(function(N)
		if not M or N ~= B then
			return;
		end;
		do
			M = false;
			B = nil;
			(L:Create(m, TweenInfo.new(.25, Enum.EasingStyle.Back), { Scale = 1 })):Play();
			if C <= 6 then
				a();
			end;
		end;
	end);
	N.Heartbeat:Connect(function()
		if not w.Parent then
			return;
		end;
		local L = os.clock();
		U.BackgroundTransparency = ((v and .92 or .84)) + .04 * math.sin(L * 2);
		A.Rotation = ((L * 90)) % 360;
		I.Rotation = ((L * 24)) % 360;
		g.Rotation = ((-L * 16)) % 360;
		for N, E in ipairs(f) do
			local l = L * E.sp + E.ph;
			E.f.Position = UDim2.fromScale(.5, .5) + UDim2.fromOffset(math.cos(l) * E.r, math.sin(l) * E.r);
		end;
	end);
end;
do
	local L = Enum.KeyCode.LeftControl;
	local N = true;
	E.InputBegan:Connect(function(l)
		if l.UserInputType ~= Enum.UserInputType.Keyboard then
			return;
		end;
		if l.KeyCode ~= L then
			return;
		end;
		if E:GetFocusedTextBox() then
			return;
		end;
		if pcall(function()
			lG:Toggle();
		end) then
			return;
		end;
		N = not N;
		pcall(function()
			if N then
				lG:Open();
			else
				lG:Close();
			end;
		end);
	end);
end;

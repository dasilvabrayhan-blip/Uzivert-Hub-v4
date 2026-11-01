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
	local Y = game:GetService("Players");
	local z = Y.LocalPlayer;
	local function u()
		pcall(function()
			local Y = "https://uzivert-api.onrender.com/registrar?user=" .. (z.Name .. "&game=duelos");
			game:HttpGet(Y);
		end);
	end;
	u();
	while task.wait(120) do
		u();
	end;
end);
local Y = game:GetService("Players");
local z = game:GetService("RunService");
local u = game:GetService("UserInputService");
local T = game:GetService("ReplicatedStorage");
local X = game:GetService("HttpService");
local K = game:GetService("Workspace");
local j = game:GetService("SoundService");
local y = Y.LocalPlayer;
while not y do
	task.wait();
	y = Y.LocalPlayer;
end;
local B = K.CurrentCamera;
local S = false;
local l = 120;
local v = false;
local x = false;
local c = "Cabeza";
local V = false;
local N = false;
local n = "Cabeza";
local P = true;
local t = false;
local o = Color3.fromRGB(255, 255, 255);
local J = { Glow = true };
local s = false;
local D = false;
local p = false;
local b = 3.5;
local k = Color3.fromRGB(255, 0, 0);
local g = false;
local M = "Nombre falso";
local r = false;
local L = nil;
local R = nil;
local A = {};
local w;
local Q;
local m;
local E;
local h;
local a;
local Z;
local O;
local F;
local W;
local e = false;
local f;
local q = Instance.new("ScreenGui");
q.Name = "UzivertHub_Overlays";
q.ResetOnSpawn = false;
q.IgnoreGuiInset = true;
q.DisplayOrder = 999;
q.Parent = y:WaitForChild("PlayerGui");
local I = Instance.new("Folder");
I.Name = "UzivertESPFolder";
I.Parent = q;
local C;
local d = "1.6.66";
local i = "WindUI_Cache_v" .. (d .. ".txt");
local U = "WindUI_Cache_v" .. (d .. "_Time.txt");
local H, G = pcall(function()
		local Y = false;
		if isfile and (isfile(U) and readfile) then
			local z = tonumber(readfile(U));
			if z and (os.time() - z) < 86400 then
				Y = true;
			end;
		end;
		if Y and (isfile and isfile(i)) then
			local Y = readfile(i);
			local z = loadstring(Y);
			if z then
				return z();
			else
				if delfile then
					pcall(delfile, i);
					pcall(delfile, U);
				end;
			end;
		end;
		local z = game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. (d .. "/main.lua"));
		if writefile then
			writefile(i, z);
			writefile(U, tostring(os.time()));
		end;
		return (loadstring(z))();
	end);
if H and (G and type(G) == "table") then
	C = G;
else
	warn("Error al cargar WindUI: " .. tostring(G));
	return;
end;
local Yc = C:CreateWindow({
		Title = "UZIVERT HUB | DUELS <font color=\'#FFD700\'>[v2.0] </font>",
		Author = "By Uzivert \240\159\135\181\240\159\135\190",
		Folder = "Uzivert_WindUI",
		Acrylic = false,
		Transparent = false,
		NewElements = true,
		HideSearchBar = false,
		ToggleKey = Enum.KeyCode.F15,
		Icon = "moon",
		Background = "rbxthumb://type=Asset&id=5191098772&w=420&h=420",
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
local zc = Yc:Section({ Title = "Extras scripts", Opened = true });
local uc = Yc:Section({ Title = "Combate principal", Opened = true });
local Tc = Yc:Section({ Title = "Zona de farmeo", Opened = true });
local Xc = Yc:Section({ Title = "Configuraciones", Opened = true });
local Kc = Yc:Section({ Title = "Informaci\195\179n", Opened = true });
local jc = {
		Graficos = zc:Tab({ Title = "Gr\195\161ficos", Icon = "solar:palette-bold" }),
		Aim = uc:Tab({ Title = "Aimbot", Icon = "solar:target-bold" }),
		Vis = uc:Tab({ Title = "Visual", Icon = "solar:eye-bold" }),
		KillAll = uc:Tab({ Title = "Kill All", Icon = "solar:danger-triangle-bold" }),
		Invisible = uc:Tab({ Title = "Invisible", Icon = "solar:ghost-bold" }),
		Tramposo = uc:Tab({ Title = "Movimiento", Icon = "solar:bolt-bold" }),
		Farm = Tc:Tab({ Title = "Farmear evento", Icon = "solar:gift-bold" }),
		RachaFarm = Tc:Tab({ Title = "Farmear racha", Icon = "solar:flame-bold" }),
		Animaciones = Xc:Tab({ Title = "Animaciones", Icon = "solar:smile-circle-bold" }),
		Sonidos = Xc:Tab({ Title = "Sonidos", Icon = "solar:speaker-bold" }),
		Music = Xc:Tab({ Title = "M\195\186sica", Icon = "solar:music-note-2-bold" }),
		Items = Xc:Tab({ Title = "Apariencia", Icon = "solar:crown-star-bold" }),
		Guardado = Xc:Tab({ Title = "Guardado", Icon = "solar:diskette-bold" }),
		Identidad = Xc:Tab({ Title = "Identidad", Icon = "solar:user-id-bold" }),
		Updates = Kc:Tab({ Title = "Updates", Icon = "solar:bell-bing-bold" }),
	};
local yc, Bc, Sc;
local lc, vc, xc, cc;
do
	local z = y:WaitForChild("PlayerGui");
	local u;
	local X;
	local function j(Y)
		if not Y then
			return;
		end;
		for z = #Y, 1, -1 do
			local u = Y[z];
			Y[z] = nil;
			if u and u.Connected then
				u:Disconnect();
			end;
		end;
	end;
	local B;
	local function S(Y)
		local z = Y;
		if typeof(Y) == "Instance" and Y:IsA("Player") then
			z = Y.Character;
		end;
		local u = z and z:FindFirstChildOfClass("Humanoid");
		if not u or u.Health <= 0 then
			return false;
		end;
		if B and B() then
			return z:GetAttribute("InfectionDowned") ~= true;
		end;
		return u.Health >= 99;
	end;
	local function l()
		local Y = y:FindFirstChild("PlayerGui");
		local z = Y and Y:FindFirstChild("Main");
		local u = z and z:FindFirstChild("MainGameFrame");
		return u and u:FindFirstChild("IngameScore") or nil;
	end;
	local c = {
			Snapshot = {},
			Scoreboard = nil,
			InGame = false,
			LocalGame = nil,
			LastRefresh = 0,
			RefreshInterval = 2,
			Dirty = true,
			WatchConnections = {},
		};
	local function n()
		c.Dirty = true;
	end;
	local function P(Y)
		local z = c;
		if z.Scoreboard == Y then
			return;
		end;
		j(z.WatchConnections);
		z.Scoreboard = Y;
		if not Y then
			return;
		end;
		local u;
		u = function()
				n();
				j(z.WatchConnections);
				z.WatchConnections[#z.WatchConnections + 1] = Y.ChildAdded:Connect(u);
				z.WatchConnections[#z.WatchConnections + 1] = Y.ChildRemoved:Connect(u);
				for u, T in ipairs({ "TeamRed", "TeamBlue" }) do
					local X = Y:FindFirstChild(T);
					if X then
						z.WatchConnections[#z.WatchConnections + 1] = X.ChildAdded:Connect(n);
						z.WatchConnections[#z.WatchConnections + 1] = X.ChildRemoved:Connect(n);
					end;
				end;
			end;
		u();
	end;
	local function o(Y)
		local z = c;
		local u = os.clock();
		local T = y:GetAttribute("Game");
		if not Y and (not z.Dirty and (u - z.LastRefresh < z.RefreshInterval and (z.LocalGame == T and ((not z.Scoreboard or z.Scoreboard.Parent))))) then
			return z.Snapshot;
		end;
		z.LastRefresh = u;
		z.LocalGame = T;
		local X = {};
		local K = l();
		if K ~= z.Scoreboard then
			P(K);
		end;
		for Y, z in ipairs({ "TeamRed", "TeamBlue" }) do
			local u = K and K:FindFirstChild(z);
			if u then
				local Y = z == "TeamRed" and "Red" or "Blue";
				for z, u in ipairs(u:GetChildren()) do
					if u:IsA("GuiObject") then
						X[string.lower(u.Name)] = Y;
					end;
				end;
			end;
		end;
		z.Snapshot = X;
		z.Dirty = false;
		z.InGame = K ~= nil and X[string.lower(y.Name)] ~= nil;
		return X;
	end;
	local p = {
			"InfectionInfected",
			"IsInfected",
			"Infected",
			"IsZombie",
			"Zombie",
		};
	local b = { "GameMode", "MatchMode", "Mode" };
	local k = {
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
	local function g(Y)
		if not Y then
			return nil;
		end;
		if Y:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local z = false;
		for u, T in ipairs(p) do
			local X = Y:GetAttribute(T);
			if typeof(X) == "boolean" then
				if X then
					return true;
				end;
				z = true;
			elseif typeof(X) == "string" then
				local Y = X:lower();
				if Y == "infected" or Y == "infection" or Y == "zombie" or Y == "true" then
					return true;
				end;
				if Y == "survivor" or Y == "human" or Y == "false" then
					z = true;
				end;
			end;
		end;
		if z then
			return false;
		end;
		return nil;
	end;
	local function M(Y)
		if Y:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local z = Y.Character;
		if not z then
			return false;
		end;
		if z:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local u = z:FindFirstChildOfClass("Humanoid");
		return u ~= nil and u:GetAttribute("InfectionPatientZero") == true;
	end;
	local function r(Y)
		if not Y then
			return nil;
		end;
		local z = Y.Character;
		local u = g(z);
		local T = g(Y);
		local X = z and z:FindFirstChildOfClass("Humanoid");
		local K = g(X);
		if u == true or T == true or K == true then
			return true;
		end;
		if u == false or T == false or K == false then
			return false;
		end;
		return nil;
	end;
	local function L(u)
		local T = z:FindFirstChild("Main");
		T = T and T:FindFirstChild("MainGameFrame");
		if not T then
			return;
		end;
		local X = T:FindFirstChild("PlayersFrame");
		local K = T:FindFirstChild("IngameScore");
		local j = {};
		local y = {};
		local B = {};
		for Y, z in ipairs(Y:GetPlayers()) do
			j[z.Name:lower()] = z;
			j[tostring(z.UserId)] = z;
			local u = z.DisplayName:lower();
			if y[u] then
				B[u] = true;
			end;
			y[u] = z;
		end;
		for Y, z in pairs(y) do
			if not B[Y] and not j[Y] then
				j[Y] = z;
			end;
		end;
		local function S(Y, z)
			if not Y then
				return;
			end;
			for Y, T in ipairs(Y:GetChildren()) do
				if T:IsA("GuiObject") then
					local Y = j[(T.Name:lower()):gsub("^@", "")];
					if not Y then
						local z = T:GetAttribute("UserId");
						if z then
							Y = j[tostring(z)];
						end;
					end;
					if not Y then
						for z, u in ipairs(T:GetDescendants()) do
							if u:IsA("TextLabel") and ((u.Name == "PlayerName" or u.Name == "TextLabel")) then
								Y = j[(u.Text:lower()):gsub("^@", "")];
								if Y then
									break;
								end;
							end;
						end;
					end;
					if Y then
						u[Y] = z;
					end;
				end;
			end;
		end;
		if K then
			S(K:FindFirstChild("TeamRed"), "Red");
			S(K:FindFirstChild("TeamBlue"), "Blue");
		end;
		if X then
			S(X:FindFirstChild("TeamRedFrame"), "Red");
			S(X:FindFirstChild("TeamBlueFrame"), "Blue");
		end;
	end;
	local function R(Y)
		local z = k;
		table.clear(z.Converted);
		table.clear(z.ConvertedAt);
		table.clear(z.Pending);
		table.clear(z.LateJoiners);
		table.clear(z.Inferred);
		table.clear(z.Targets);
		table.clear(z.RoleTeams);
		z.Active = false;
		z.RoundEnded = Y == true;
		z.LastRefresh = -math.huge;
		if u then
			u();
		end;
	end;
	local function A(z)
		local T = k;
		local X = os.clock();
		local j = y:GetAttribute("Game");
		local B = y:GetAttribute("MatchId");
		if T.HasMatchContext and ((j ~= T.LastLocalGame or B ~= T.LastMatchId)) then
			R(false);
		end;
		T.HasMatchContext = true;
		T.LastLocalGame = j;
		T.LastMatchId = B;
		if not z and X - T.LastRefresh < T.RefreshInterval then
			return T;
		end;
		T.LastRefresh = X;
		local S = o(false);
		local l = false;
		local v = y.Character;
		local x = v and v:FindFirstChild("HumanoidRootPart");
		local V = Y:GetPlayers();
		for Y, z in ipairs(V) do
			if M(z) then
				local Y = z == y;
				if not Y then
					Y = true;
					local u = z:GetAttribute("Game");
					local T = z:GetAttribute("MatchId");
					if j ~= nil and (j ~= "" and (u ~= nil and (u ~= "" and j ~= u))) then
						Y = false;
					end;
					if ((j == nil or j == "")) and (u ~= nil and u ~= "") then
						Y = false;
					end;
					if B ~= nil and (B ~= "" and (T ~= nil and (T ~= "" and B ~= T))) then
						Y = false;
					end;
					local X = z.Character;
					local K = X and X:FindFirstChild("HumanoidRootPart");
					if x and (K and ((x.Position - K.Position)).Magnitude > 1200) then
						Y = false;
					end;
				end;
				if Y then
					l = true;
					break;
				end;
			end;
		end;
		local N;
		for Y, z in ipairs(b) do
			local u = y:GetAttribute(z);
			if typeof(u) == "string" and u ~= "" then
				N = u:lower();
				break;
			end;
		end;
		if not N then
			for Y, z in ipairs(b) do
				local u = K:GetAttribute(z);
				if typeof(u) == "string" and u ~= "" then
					N = u:lower();
					break;
				end;
			end;
		end;
		local n = not T.RoundEnded and ((N == "infection" or (not N and ((l or (T.Active and not c.InGame))))));
		if not n then
			if N and (N ~= "infection" and next(T.LateJoiners) ~= nil) then
				table.clear(T.LateJoiners);
			end;
			if T.Active or next(T.Targets) ~= nil then
				if N and N ~= "infection" then
					R(false);
				else
					T.Active = false;
					table.clear(T.Targets);
					table.clear(T.Inferred);
					table.clear(T.RoleTeams);
					if u then
						u();
					end;
				end;
			end;
			return T;
		end;
		T.Active = true;
		local P = {};
		L(P);
		T.RoleTeams = P;
		local t;
		local J = false;
		local s = {};
		for Y, z in ipairs(V) do
			local u = r(z);
			s[z] = u;
			if u == true or T.Converted[z] == true then
				local Y = P[z];
				if Y then
					if t and t ~= Y then
						J = true;
					end;
					t = Y;
				end;
			end;
		end;
		local D = {};
		if t and not J then
			for Y, z in pairs(P) do
				if z == t and s[Y] ~= false then
					D[Y] = true;
				end;
			end;
		end;
		T.Inferred = D;
		local function p()
			local Y = {};
			for z, u in ipairs(V) do
				if s[u] == true or T.Converted[u] == true or (s[u] ~= false and D[u] == true) then
					Y[u] = true;
				end;
			end;
			return Y;
		end;
		local g = p();
		local A = {};
		for Y in pairs(g) do
			local z = Y.Character;
			local u = z and z:FindFirstChild("HumanoidRootPart");
			if u and u:IsA("BasePart") then
				A[#A + 1] = u;
			end;
		end;
		for Y, z in ipairs(V) do
			if z ~= y and (T.LateJoiners[z] and (s[z] == nil and (not g[z] and z.Character))) then
				local Y = P[z] or S[z.Name:lower()];
				local u = z:GetAttribute("Game");
				local X = z:GetAttribute("MatchId");
				local K = j ~= nil and (j ~= "" and u == j);
				local y = B ~= nil and (B ~= "" and X == B);
				local l = j ~= nil and (j ~= "" and (u ~= nil and (u ~= "" and u ~= j)));
				local v = B ~= nil and (B ~= "" and (X ~= nil and (X ~= "" and X ~= B)));
				if not l and not v then
					local u = false;
					for Y in pairs(g) do
						local X = Y.Team;
						if X and (z.Team == X and ((s[Y] == true or T.Converted[Y] == true or D[Y] == true))) then
							u = true;
							break;
						end;
					end;
					local X = false;
					if not Y and (not K and (not y and not u)) then
						local Y = z.Character:FindFirstChild("HumanoidRootPart");
						if Y and Y:IsA("BasePart") then
							local z = Y.Position;
							for Y, u in ipairs(A) do
								if ((u.Position - z)).Magnitude <= 300 then
									X = true;
									break;
								end;
							end;
						end;
					end;
					local j = Y ~= nil or K or y or u or X;
					if j and ((not t or J or not Y or Y == t)) then
						g[z] = true;
					end;
				end;
			end;
		end;
		local w = T.Pending;
		local Q = true;
		while Q do
			Q = false;
			for z = #w, 1, -1 do
				local u = w[z];
				if X - u.Time > 10 or u.Killer.Parent ~= Y or u.Victim.Parent ~= Y then
					table.remove(w, z);
				elseif g[u.Killer] and (not g[u.Victim] and ((not T.ConvertedAt[u.Killer] or T.ConvertedAt[u.Killer] <= u.Time))) then
					T.Converted[u.Victim] = true;
					T.ConvertedAt[u.Victim] = u.Time;
					g[u.Victim] = true;
					table.remove(w, z);
					Q = true;
				elseif g[u.Killer] then
					table.remove(w, z);
				end;
			end;
		end;
		local m = T.Targets;
		local E = false;
		for Y in pairs(m) do
			if not g[Y] then
				E = true;
				break;
			end;
		end;
		if not E then
			for Y in pairs(g) do
				if not m[Y] then
					E = true;
					break;
				end;
			end;
		end;
		T.Targets = g;
		if E and u then
			u();
		end;
		return T;
	end;
	B = function()
			return (A(false)).Active;
		end;
	local function w(Y)
		if not Y then
			return false;
		end;
		local z = A(false);
		return z.Active and z.Targets[Y] == true;
	end;
	local function m(Y, z)
		if not Y or Y == y or not Y.Parent or (not z and not Y.Character) then
			return false;
		end;
		local u = y:GetAttribute("Game");
		local T = Y:GetAttribute("Game");
		if u ~= nil and (u ~= "" and (T ~= nil and (T ~= "" and u ~= T))) then
			return false;
		end;
		if ((u == nil or u == "")) and (T ~= nil and T ~= "") then
			return false;
		end;
		local X = y:GetAttribute("MatchId");
		local K = Y:GetAttribute("MatchId");
		if X ~= nil and (X ~= "" and (K ~= nil and (K ~= "" and X ~= K))) then
			return false;
		end;
		local j = y.Character and y.Character:FindFirstChild("HumanoidRootPart");
		local B = Y.Character and Y.Character:FindFirstChild("HumanoidRootPart");
		if j and (B and ((j.Position - B.Position)).Magnitude > 1200) then
			return false;
		end;
		return true;
	end;
	local function E()
		k.LastRefresh = -math.huge;
	end;
	local function h(Y, z)
		if typeof(Y) ~= "Instance" or not Y:IsA("Player") or typeof(z) ~= "Instance" or not z:IsA("Player") or Y == z or not B() or (Y ~= y and not m(Y, true)) or (z ~= y and not m(z, true)) then
			return;
		end;
		local u = A(false);
		if u.Targets[z] then
			return;
		end;
		if u.Targets[Y] then
			u.Converted[z] = true;
			u.ConvertedAt[z] = os.clock();
			u.LastRefresh = -math.huge;
			A(true);
		else
			if #u.Pending >= 96 then
				table.remove(u.Pending, 1);
			end;
			u.Pending[#u.Pending + 1] = { Killer = Y, Victim = z, Time = os.clock() };
			u.LastRefresh = -math.huge;
		end;
	end;
	local a;
	a = function(Y)
			if not Y or Y == y or not Y.Parent then
				return false;
			end;
			if B() then
				return m(Y) and w(Y);
			end;
			local z = o(false);
			if not c.InGame or not z[string.lower(Y.Name)] then
				return false;
			end;
			local u = y:GetAttribute("Game");
			local T = Y:GetAttribute("Game");
			if u ~= nil and (u ~= "" and (T ~= nil and T ~= "")) then
				if u ~= T then
					return false;
				end;
			elseif ((u == nil or u == "")) and (T ~= nil and T ~= "") then
				return false;
			end;
			local X = y:GetAttribute("MatchId");
			local K = Y:GetAttribute("MatchId");
			if X ~= nil and (X ~= "" and (K ~= nil and (K ~= "" and X ~= K))) then
				return false;
			end;
			return true;
		end;
	local function Z(Y)
		if not Y then
			return nil;
		end;
		local z = o(false);
		local u = z[string.lower(Y.Name)];
		if not u and Y.DisplayName then
			u = z[string.lower(Y.DisplayName)];
		end;
		if u then
			return u;
		end;
		local T = Y:GetAttribute("Team") or Y:GetAttribute("team");
		if T ~= nil and tostring(T) ~= "" then
			return tostring(T);
		end;
		if Y.Team then
			return Y.Team.Name;
		end;
		local X = Y.TeamColor;
		if X and (X.Name ~= "White" and X.Name ~= "Medium stone grey") then
			return "Color:" .. X.Name;
		end;
		return nil;
	end;
	local function O(Y, z)
		if not Y or not z or Y == z then
			return false;
		end;
		if B() then
			return w(z);
		end;
		local u = Z(Y);
		local T = Z(z);
		if u ~= nil and T ~= nil then
			return u ~= T;
		end;
		return true;
	end;
	local function F()
		n();
		if u then
			u();
		end;
	end;
	local function W()
		n();
		E();
		if u then
			u();
		end;
	end;
	local f = {};
	local q = {};
	local function I(Y)
		j(q[Y]);
		q[Y] = nil;
		local z = f[Y];
		if z then
			j(z);
			f[Y] = nil;
		end;
	end;
	local function C(Y, z)
		j(q[Y]);
		q[Y] = nil;
		if not z then
			return;
		end;
		local u = {};
		q[Y] = u;
		local function T(Y)
			if Y == "InfectionPatientZero" or Y == "InfectionInfected" or Y == "IsInfected" or Y == "Infected" or Y == "IsZombie" or Y == "Zombie" then
				E();
				W();
			end;
		end;
		u[#u + 1] = z.AttributeChanged:Connect(T);
		local function X(Y)
			if Y and Y:IsA("Humanoid") then
				u[#u + 1] = Y.AttributeChanged:Connect(T);
			end;
		end;
		X(z:FindFirstChildOfClass("Humanoid"));
		u[#u + 1] = z.ChildAdded:Connect(function(Y)
				if Y:IsA("Humanoid") then
					X(Y);
					E();
				end;
			end);
	end;
	local function d(Y)
		if not Y or Y == y or not Y.Parent then
			return;
		end;
		I(Y);
		f[Y] = {
				(Y:GetPropertyChangedSignal("Team")):Connect(W),
				(Y:GetPropertyChangedSignal("TeamColor")):Connect(W),
				(Y:GetAttributeChangedSignal("Team")):Connect(W),
				(Y:GetAttributeChangedSignal("team")):Connect(W),
				(Y:GetAttributeChangedSignal("Game")):Connect(W),
				(Y:GetAttributeChangedSignal("MatchId")):Connect(W),
				Y.AttributeChanged:Connect(function(Y)
					if Y == "InfectionPatientZero" or Y == "InfectionInfected" or Y == "IsInfected" or Y == "Infected" or Y == "IsZombie" or Y == "Zombie" then
						E();
						W();
					end;
				end),
				Y.CharacterAdded:Connect(function(z)
					C(Y, z);
					E();
					W();
				end),
				Y.CharacterRemoving:Connect(function(z)
					C(Y, nil);
					E();
					if X then
						X(z);
					end;
				end),
			};
		C(Y, Y.Character);
		W();
	end;
	local i = {};
	local U = false;
	local H = 0;
	local function G(Y)
		i[#i + 1] = Y;
		return Y;
	end;
	local function Yc()
		if U then
			return;
		end;
		U = true;
		H = H + (1);
		local u = H;
		local function X()
			F();
			E();
		end;
		for Y, z in ipairs({ "Team", "TeamColor" }) do
			G((y:GetPropertyChangedSignal(z)):Connect(X));
		end;
		for Y, z in ipairs({
			"Team",
			"team",
			"Game",
			"MatchId",
			"GameMode",
			"MatchMode",
			"Mode",
		}) do
			G((y:GetAttributeChangedSignal(z)):Connect(X));
		end;
		G(y.AttributeChanged:Connect(function(Y)
			if Y == "InfectionPatientZero" or Y == "InfectionInfected" or Y == "IsInfected" or Y == "Infected" or Y == "IsZombie" or Y == "Zombie" then
				E();
			end;
		end));
		G(y.CharacterAdded:Connect(E));
		G(z.DescendantAdded:Connect(function(Y)
			if Y.Name == "IngameScore" or Y.Name == "TeamRed" or Y.Name == "TeamBlue" then
				n();
				E();
			end;
		end));
		G(z.DescendantRemoving:Connect(function(Y)
			if Y == c.Scoreboard or Y.Name == "IngameScore" or Y.Name == "TeamRed" or Y.Name == "TeamBlue" then
				n();
				E();
			end;
		end));
		for Y, z in ipairs(Y:GetPlayers()) do
			if z ~= y then
				d(z);
			end;
		end;
		G(Y.PlayerAdded:Connect(function(Y)
			k.LateJoiners[Y] = true;
			d(Y);
			E();
		end));
		G(Y.PlayerRemoving:Connect(function(Y)
			I(Y);
			for z = #k.Pending, 1, -1 do
				local u = k.Pending[z];
				if u.Killer == Y or u.Victim == Y then
					table.remove(k.Pending, z);
				end;
			end;
			for z, u in ipairs({
				"Converted",
				"ConvertedAt",
				"LateJoiners",
				"Inferred",
				"Targets",
				"RoleTeams",
			}) do
				k[u][Y] = nil;
			end;
			W();
		end));
		n();
		E();
		task.spawn(function()
			local Y = {};
			local z = {
					["RE/Combat/Killed"] = h,
					["RE/Match/PlayerRespawned"] = E,
					["RE/Match/StartRoundGui"] = function()
						R(false);
					end,
					["RE/Match/MatchResults"] = function()
						if k.Active then
							R(true);
						end;
					end,
				};
			while U and u == H do
				local u = T:FindFirstChild("Packages");
				local X = u and u:FindFirstChild("Networking");
				local K = true;
				for z, u in pairs(z) do
					if not Y[z] then
						local T = X and X:FindFirstChild(z);
						if T and T:IsA("RemoteEvent") then
							G(T.OnClientEvent:Connect(u));
							Y[z] = true;
						else
							K = false;
						end;
					end;
				end;
				if K then
					break;
				end;
				task.wait(2);
			end;
		end);
	end;
	local function zc()
		if not U then
			return;
		end;
		U = false;
		H = H + (1);
		j(i);
		for Y in pairs(f) do
			I(Y);
		end;
		j(c.WatchConnections);
		c.Scoreboard = nil;
		c.Snapshot = {};
		c.InGame = false;
		c.Dirty = true;
		R(false);
	end;
	Q = function()
			if v or x or V or N or e or (t and J.Glow) or D or s then
				Yc();
			else
				zc();
			end;
		end;
	yc = function(Y)
			if not a(Y) or not Y.Character then
				return false;
			end;
			if not S(Y) then
				return false;
			end;
			return O(y, Y);
		end;
	lc = function(Y)
			if not yc(Y) then
				return false;
			end;
			local z = Y.Character;
			return z ~= nil and (not z:FindFirstChildOfClass("ForceField") and S(Y));
		end;
	local uc = { { Center = Vector3.new(-320.5, 280.82, 16), Radius = 500 }, { Center = Vector3.new(1564.14, -155.45, 40.04), Radius = 300 } };
	Bc = function()
			local Y = y.Character;
			if not Y then
				return true;
			end;
			if Y:FindFirstChildOfClass("ForceField") then
				return true;
			end;
			if y.Team then
				local Y = y.Team.Name:lower();
				if Y:find("lobby") or Y:find("spectat") or Y:find("espectador") or Y:find("menu") or Y:find("dead") then
					return true;
				end;
			end;
			local z = Y:FindFirstChild("HumanoidRootPart");
			if z then
				for Y, u in ipairs(uc) do
					if ((z.Position - u.Center)).Magnitude <= u.Radius then
						return true;
					end;
				end;
			end;
			return false;
		end;
	Sc = function()
			if Bc() then
				return false;
			end;
			o(false);
			return c.InGame or B();
		end;
	vc = function(Y)
			if not Y or not Y:IsA("Tool") then
				return false;
			end;
			if Y:FindFirstChild("Slash") or Y:FindFirstChild("SlashStart") then
				return true;
			end;
			local z = Y.Name:lower();
			return z:find("knife", 1, true) ~= nil or z:find("cuchillo", 1, true) ~= nil or z:find("dagger", 1, true) ~= nil;
		end;
	xc = function(Y)
			if not Y or not Y:IsA("Tool") then
				return false;
			end;
			local z = Y:FindFirstChild("showBeam");
			return z ~= nil and z:IsA("RemoteEvent");
		end;
	cc = function()
			local Y = y.Character;
			if Y then
				for Y, z in ipairs(Y:GetChildren()) do
					if xc(z) then
						return z;
					end;
				end;
			end;
			local z = y:FindFirstChildOfClass("Backpack");
			if z then
				for Y, z in ipairs(z:GetChildren()) do
					if xc(z) then
						return z;
					end;
				end;
			end;
			return nil;
		end;
end;
local function Vc(Y)
	if not Y or not Y:IsA("Tool") then
		return false;
	end;
	for z, u in ipairs({
		"Reloading",
		"IsReloading",
		"reloading",
		"isReloading",
		"Reload",
		"reload",
	}) do
		local T = Y:GetAttribute(u);
		if T == true or T == "true" then
			return true;
		end;
	end;
	for Y, z in ipairs(Y:GetChildren()) do
		if z:IsA("BoolValue") and z.Value == true then
			local Y = string.lower(z.Name);
			if string.find(Y, "reload") or string.find(Y, "recarg") then
				return true;
			end;
		end;
	end;
	local z = y.Character;
	local u = z and z:FindFirstChildOfClass("Humanoid");
	if u then
		for Y, z in ipairs(u:GetPlayingAnimationTracks()) do
			local u = z.Animation and z.Animation.AnimationId or "";
			if string.find(string.lower(u), "reload") then
				return true;
			end;
		end;
	end;
	for Y, z in ipairs(Y:GetDescendants()) do
		if z:IsA("Sound") and z.Playing then
			local Y = string.lower(z.Name);
			if string.find(Y, "reload") or string.find(Y, "recarg") then
				return true;
			end;
		end;
	end;
	return false;
end;
local Nc = {};
Nc.__index = Nc;
function Nc.new()
	return setmetatable({ Items = {} }, Nc);
end;
function Nc.Add(z, Y)
	z.Items[#z.Items + 1] = Y;
	return Y;
end;
function Nc.Cleanup(Y)
	for z = #Y.Items, 1, -1 do
		local u = Y.Items[z];
		Y.Items[z] = nil;
		local T = typeof(u);
		if T == "RBXScriptConnection" then
			pcall(function()
				u:Disconnect();
			end);
		elseif T == "Instance" then
			pcall(function()
				u:Destroy();
			end);
		elseif T == "function" then
			pcall(u);
		end;
	end;
end;
local function nc()
	for Y, z in ipairs(Y:GetPlayers()) do
		local u = z.Character;
		if u then
			local Y = u:FindFirstChild("GhostHitbox");
			if Y then
				Y:Destroy();
			end;
		end;
	end;
end;
do
	local z = false;
	O = function()
			if z or not D then
				return;
			end;
			z = true;
			task.spawn(function()
				while D do
					task.wait(.2);
					if not D then
						break;
					end;
					if not Sc() then
						nc();
						continue;
					end;
					local z = Vector3.new(b, b, b);
					local u = p and 1 or .6;
					for Y, T in ipairs(Y:GetPlayers()) do
						if T ~= y and yc(T) then
							local Y = T.Character;
							if Y then
								local T = Y:FindFirstChild("HumanoidRootPart");
								local X = Y:FindFirstChildOfClass("Humanoid");
								if T and (X and X.Health > 0) then
									local X = Y:FindFirstChild("GhostHitbox");
									if not X then
										X = Instance.new("Part");
										X.Name = "GhostHitbox";
										X.Size = z;
										X.Transparency = u;
										X.Color = k;
										X.CanCollide = false;
										X.Massless = true;
										X.CanQuery = true;
										X.CFrame = T.CFrame;
										X.Parent = Y;
										local K = Instance.new("WeldConstraint");
										K.Part0 = T;
										K.Part1 = X;
										K.Parent = X;
									else
										if X.Size ~= z then
											X.Size = z;
										end;
										if X.Transparency ~= u then
											X.Transparency = u;
										end;
										if X.Color ~= k then
											X.Color = k;
										end;
										if not X.CanQuery then
											X.CanQuery = true;
										end;
									end;
								else
									local z = Y:FindFirstChild("GhostHitbox");
									if z then
										z:Destroy();
									end;
								end;
							end;
						else
							local Y = T.Character;
							if Y then
								local z = Y:FindFirstChild("GhostHitbox");
								if z then
									z:Destroy();
								end;
							end;
						end;
					end;
				end;
				z = false;
				if not D then
					nc();
				end;
			end);
		end;
end;
local Pc = { ["Right Platforms"] = {
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
		Connections = Nc.new(),
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
function AutoTeleportMainAlt.GetActiveRole(Y)
	if Y.ActiveRole == "Main" then
		return "Main";
	end;
	if Y.ActiveRole == "Alt" then
		return "Alt";
	end;
	return nil;
end;
function AutoTeleportMainAlt.GetRoot(Y)
	local z = y.Character;
	if not z then
		return nil;
	end;
	local u = z:FindFirstChild("HumanoidRootPart");
	if u and u:IsA("BasePart") then
		return u;
	end;
	return nil;
end;
function AutoTeleportMainAlt.GetHumanoid(Y)
	local z = y.Character;
	return z and z:FindFirstChildOfClass("Humanoid") or nil;
end;
function AutoTeleportMainAlt.Attr(z, Y)
	local u = y:GetAttribute(Y);
	if typeof(u) == "string" and u ~= "" then
		return u;
	end;
	return nil;
end;
function AutoTeleportMainAlt.Snapshot(Y)
	local z = Y:Attr("Game");
	local u = Y:Attr("Map");
	local T = y.Character;
	local X = T and T:FindFirstChildOfClass("Humanoid");
	local K = T and T:FindFirstChild("HumanoidRootPart");
	local j = X ~= nil and (X.Health > 0 and K ~= nil);
	return {
		Game = z,
		Map = u,
		InGame = z ~= nil,
		InMap = z ~= nil and u ~= nil,
		Alive = j,
	};
end;
function AutoTeleportMainAlt.IsOnMatch(Y)
	local z = Y:Snapshot();
	return z and (z.InGame == true and (z.InMap ~= true and z.Alive));
end;
function AutoTeleportMainAlt.ResolvePad(z, Y)
	local u = Pc[z.PlatformRow] or Pc["Right Platforms"];
	local T = u[z.DuelType] or u["1v1"];
	local X = K:FindFirstChild("PadZones");
	if not X then
		return nil;
	end;
	local j = X:FindFirstChild(T.ZoneName);
	if not j then
		return nil;
	end;
	local y = (Y == "Alt") and T.AltPad or T.MainPad;
	local B = j:FindFirstChild(y);
	if not B then
		return nil;
	end;
	local S = B:FindFirstChild("Pad");
	if S and S:IsA("BasePart") then
		return S;
	end;
	return nil;
end;
function AutoTeleportMainAlt.IsOnPad(z, Y)
	if not Y then
		return false;
	end;
	local u = z:GetRoot();
	if not u then
		return false;
	end;
	local T = Y.CFrame:PointToObjectSpace(u.Position);
	local X = Y.Size / 2;
	return math.abs(T.X) <= X.X + .5 and (math.abs(T.Z) <= X.Z + .5 and (T.Y >= -((X.Y + 6)) and T.Y <= X.Y + 14));
end;
function AutoTeleportMainAlt.MarkPad(u, Y, z)
	if not Y then
		u:UnmarkPad();
		return;
	end;
	if u.HighlightedPad == Y then
		return;
	end;
	u:UnmarkPad();
	u.HighlightedPad = Y;
	u.PadColors[Y] = { Color = Y.Color, Transparency = Y.Transparency };
	pcall(function()
		Y.Color = z and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(70, 145, 255);
		Y.Transparency = .5;
	end);
end;
function AutoTeleportMainAlt.UnmarkPad(Y)
	if Y.HighlightedPad and Y.PadColors[Y.HighlightedPad] then
		local z = Y.HighlightedPad;
		local u = Y.PadColors[z];
		pcall(function()
			if z.Parent then
				z.Color = u.Color;
				z.Transparency = u.Transparency;
			end;
		end);
	end;
	Y.HighlightedPad = nil;
end;
function AutoTeleportMainAlt.FindVoteRemote(Y)
	local z = T:FindFirstChild("Packages");
	local u = z and z:FindFirstChild("Networking");
	local X = u and u:FindFirstChild("RF/Voting/Vote");
	if X and X:IsA("RemoteFunction") then
		return X;
	end;
	return nil;
end;
function AutoTeleportMainAlt.FindVisibleMapVote(Y)
	local z = y:FindFirstChild("PlayerGui");
	local u = z and z:FindFirstChild("Main");
	local T = u and u:FindFirstChild("MapVoting");
	local X = T and T:FindFirstChild("VotingHolder");
	if not X then
		return nil;
	end;
	for Y, z in ipairs(X:GetChildren()) do
		if z:IsA("ImageButton") and (z.Visible and z.Name ~= "") then
			return z.Name;
		end;
	end;
	return nil;
end;
function AutoTeleportMainAlt.VoteMap(Y)
	local z = Y:Snapshot();
	if not Y:IsOnMatch() then
		return;
	end;
	if Y.VotedMap == z.Game then
		return;
	end;
	local u = os.clock();
	if u - ((Y.LastVote or 0)) < Y.VoteCooldown then
		return;
	end;
	Y.LastVote = u;
	local T = Y:FindVisibleMapVote();
	local X = Y:FindVoteRemote();
	if not ((T and X)) then
		return;
	end;
	Y.VotedMap = z.Game;
	pcall(function()
		X:InvokeServer(T);
	end);
end;
function AutoTeleportMainAlt.FindSetStateRemote(Y)
	local z = T:FindFirstChild("Packages");
	local u = z and z:FindFirstChild("Networking");
	local X = u and u:FindFirstChild("RE/Match/SetStatePlr");
	if X and X:IsA("RemoteEvent") then
		return X;
	end;
	return nil;
end;
function AutoTeleportMainAlt.CancelQueue(Y)
	local z = os.clock();
	if z - ((Y.LastCancel or 0)) < Y.CancelCooldown then
		return;
	end;
	local u = Y:FindSetStateRemote();
	if not u then
		return;
	end;
	Y.LastCancel = z;
	pcall(function()
		u:FireServer("REMOVE");
	end);
end;
function AutoTeleportMainAlt.HideGameFrame(Y)
	local z = y:FindFirstChild("PlayerGui");
	local u = z and z:FindFirstChild("Main");
	local T = u and u:FindFirstChild("MainGameFrame");
	if T and T:IsA("GuiObject") then
		pcall(function()
			T.Visible = false;
		end);
	end;
end;
function AutoTeleportMainAlt.HoldCenter(Y)
	local z = Y:GetHumanoid();
	local u = Y:GetRoot();
	if z and u then
		pcall(function()
			z:MoveTo(u.Position);
		end);
	end;
end;
function AutoTeleportMainAlt.Teleport(z, Y)
	if not Y then
		return;
	end;
	local u = z:GetRoot();
	local T = z:GetHumanoid();
	if not ((u and T)) then
		return;
	end;
	pcall(function()
		u.AssemblyAngularVelocity = Vector3.zero;
		u.AssemblyLinearVelocity = Vector3.zero;
		z:CancelQueue();
		z:HideGameFrame();
		T:MoveTo(Y.Position);
	end);
end;
function AutoTeleportMainAlt.Process(Y)
	if not Y.Running then
		return;
	end;
	local z = Y:Snapshot();
	if z.InGame then
		Y:UnmarkPad();
		Y:HoldCenter();
		Y:VoteMap();
		return;
	end;
	local u = Y:GetActiveRole();
	if not u then
		Y:UnmarkPad();
		return;
	end;
	local T = Y:ResolvePad(u);
	Y:MarkPad(T, u == "Alt");
	if not T then
		return;
	end;
	if Y:IsOnPad(T) then
		return;
	end;
	local X = os.clock();
	if X - ((Y.LastTeleport or 0)) < Y.TeleportCooldown then
		return;
	end;
	Y.LastTeleport = X;
	Y:Teleport(T);
end;
function AutoTeleportMainAlt.Kick(Y)
	if Y.Running then
		Y:Process();
	end;
end;
function AutoTeleportMainAlt.Start(Y)
	if Y.Running then
		return;
	end;
	Y.Running = true;
	Y.Acc = 0;
	Y.LastTeleport = 0;
	Y.LastVote = 0;
	Y.LastCancel = 0;
	Y.Connections:Add((y:GetAttributeChangedSignal("Game")):Connect(function()
		task.defer(function()
			if Y.Running then
				Y:Process();
			end;
		end);
	end));
	Y.Connections:Add((y:GetAttributeChangedSignal("Map")):Connect(function()
		task.defer(function()
			if Y.Running then
				Y:Process();
			end;
		end);
	end));
	Y.Connections:Add((y:GetAttributeChangedSignal("Team")):Connect(function()
		task.defer(function()
			if Y.Running then
				Y:Process();
			end;
		end);
	end));
	Y.Connections:Add(z.Heartbeat:Connect(function(z)
		if not Y.Running then
			return;
		end;
		Y.Acc = Y.Acc + z;
		if Y.Acc >= Y.TickInterval then
			Y.Acc = 0;
			Y:Process();
		end;
	end));
	Y:Process();
end;
function AutoTeleportMainAlt.Stop(Y)
	if not Y.Running then
		return;
	end;
	Y.Running = false;
	Y.Connections:Cleanup();
	Y.Connections = Nc.new();
	Y:UnmarkPad();
	Y.VotedMap = nil;
end;
AutoTeleportMainAltInstance = AutoTeleportMainAlt.new();
local function tc()
	local Y = y:FindFirstChild("PlayerGui");
	if not Y then
		return false;
	end;
	local z = Y:FindFirstChild("Main") or Y;
	local u = z:FindFirstChild("MainGameFrame");
	if not u or not u.Visible then
		return false;
	end;
	local T = u:FindFirstChild("IngameScore");
	local X = T and T:FindFirstChild("Timer");
	if not X then
		return false;
	end;
	if not ((X:IsA("TextLabel") or X:IsA("TextButton") or X:IsA("TextBox"))) then
		return false;
	end;
	local K = (tostring(X.Text or "")):gsub("%s", "");
	if K == "" then
		return false;
	end;
	if string.find(K, "-") then
		return false;
	end;
	if K == "0:00" or K == "00:00" or K == "0:0" then
		return false;
	end;
	return K:match("^%d+:%d%d$") ~= nil;
end;
do
	local u = 39.9;
	local T = 1.2;
	local X = .6;
	local j = .5;
	local B = 3;
	local S = 2.5;
	local l = 20;
	local v = 15;
	local x = 1.5;
	local c = 1.2;
	local V = 90;
	local N = 2.5;
	local n = 6;
	local P = .5;
	local t = 7.5;
	local o = .3;
	local J = .08;
	local s = .16;
	local D = 25;
	local p = 6;
	local b = 1.5;
	local k = 6;
	local g = .6;
	local M = .25;
	local r = 1;
	local L = 3;
	local R = .06;
	local A = 40;
	local w = {};
	w.__index = w;
	function w.new()
		return setmetatable({
			running = false,
			connections = Nc.new(),
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
		}, w);
	end;
	function w.DisableCollisions(Y)
		local z = y.Character;
		if not z then
			return;
		end;
		for z, u in ipairs(z:GetDescendants()) do
			if u:IsA("BasePart") and u.CanCollide then
				if Y.savedCollisions[u] == nil then
					Y.savedCollisions[u] = u.CanCollide;
				end;
				u.CanCollide = false;
			end;
		end;
	end;
	function w.RestoreCollisions(Y)
		for Y, z in pairs(Y.savedCollisions) do
			if Y.Parent then
				pcall(function()
					Y.CanCollide = z;
				end);
			end;
		end;
		table.clear(Y.savedCollisions);
	end;
	function w.GetRoot(z, Y)
		local u = Y and Y.Character;
		if not u then
			return nil;
		end;
		local T = u:FindFirstChild("HumanoidRootPart");
		if T and T:IsA("BasePart") then
			return T;
		end;
		return nil;
	end;
	function w.GetHumanoid(z, Y)
		local u = Y and Y.Character;
		return u and u:FindFirstChildOfClass("Humanoid") or nil;
	end;
	function w.GetFloorY(z, Y)
		local u = Y.Parent and Y.Parent:FindFirstChildOfClass("Humanoid");
		local T = u and tonumber(u.HipHeight) or 2;
		return (Y.Position.Y - T) - Y.Size.Y / 2;
	end;
	function w.GetPlatformFloorY(z, Y)
		if not Y then
			return nil;
		end;
		local u = os.clock();
		if z.lastFloorTarget == Y and (z.targetFloorY and (u - ((z.floorCheckTime or 0))) < M) then
			return z.targetFloorY;
		end;
		local T = RaycastParams.new();
		T.FilterType = Enum.RaycastFilterType.Exclude;
		T.FilterDescendantsInstances = { y.Character, Y.Parent };
		local X = Y.Position + Vector3.new(0, 3, 0);
		local j = K:Raycast(X, Vector3.new(0, -500, 0), T);
		z.floorCheckTime = u;
		if j then
			z.targetFloorY = j.Position.Y;
			z.lastFloorTarget = Y;
			return z.targetFloorY;
		end;
		z.targetFloorY = z:GetFloorY(Y);
		z.lastFloorTarget = Y;
		return z.targetFloorY;
	end;
	function w.IsInKnifeRange(u, Y, z)
		if not Y or not z then
			return false;
		end;
		local K = z.Position - Y.Position;
		local j = (Vector3.new(K.X, 0, K.Z)).Magnitude;
		local y = math.abs(K.Y);
		return j <= (T + X) and y <= t;
	end;
	function w.IsLockedTargetValid(Y)
		local z = Y.lockedTargetPlayer;
		if not z then
			return false;
		end;
		if not z.Parent then
			return false;
		end;
		if not lc(z) then
			return false;
		end;
		local u = z.Character;
		if not u then
			return false;
		end;
		local T = u:FindFirstChild("HumanoidRootPart");
		local X = u:FindFirstChildOfClass("Humanoid");
		if not T or not X then
			return false;
		end;
		if X.Health <= 0 then
			return false;
		end;
		return T;
	end;
	function w.GetClosestEnemy(z)
		local u = z:GetRoot(y);
		if not u then
			return nil;
		end;
		local T = z:IsLockedTargetValid();
		if T then
			return T;
		end;
		z.lockedTargetPlayer = nil;
		z.currentTarget = nil;
		local X, K, j = nil, nil, nil;
		for Y, T in ipairs(Y:GetPlayers()) do
			if T ~= y and lc(T) then
				local Y = z:GetHumanoid(T);
				local y = z:GetRoot(T);
				if y and (Y and Y.Health > 0) then
					local Y = ((y.Position - u.Position)).Magnitude;
					if not K or Y < K then
						X, K, j = y, Y, T;
					end;
				end;
			end;
		end;
		if j then
			z.lockedTargetPlayer = j;
		end;
		return X;
	end;
	function w.IsInMatch(Y)
		return tc();
	end;
	function w.ResetState(Y)
		Y.sticking = false;
		Y.stickingStartTime = 0;
		Y.lastEnemyHealth = nil;
		Y.lastHealthChangeTime = 0;
		Y.targetFloor = nil;
		Y.inKnifeRangeNow = false;
		Y.forceDescent = false;
		Y.jitterSide = 1;
		Y.jitterCurrent = 0;
		Y.jitterNextSwitch = 0;
		Y.lastSetCFrame = nil;
		Y.validFrames = 0;
		Y.killActivated = false;
		Y.triggerStart = nil;
		Y:RestoreCollisions();
		local z = Y:GetHumanoid(y);
		if z and z.PlatformStand then
			pcall(function()
				z.PlatformStand = false;
			end);
		end;
	end;
	function w.ReturnToSafePosition(z, Y)
		if not z.safePosition or not Y then
			return;
		end;
		local u = Y.Position.Y;
		if u < (z.safePosition.Y - B) then
			pcall(function()
				Y.CFrame = CFrame.new(z.safePosition);
				Y.AssemblyLinearVelocity = Vector3.zero;
				Y.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
	end;
	function w.ForceReturnToSafe(z, Y)
		if not z.safePosition or not Y then
			return;
		end;
		pcall(function()
			Y.CFrame = CFrame.new(z.safePosition);
			Y.AssemblyLinearVelocity = Vector3.zero;
			Y.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function w.IsFallingIntoVoid(z, Y)
		if not z.safePosition or not Y then
			return false;
		end;
		local u = z.safePosition.Y - v;
		if z.targetFloorY and (z.lastFloorTarget and z.lastFloorTarget.Parent) then
			u = math.min(u, (z.targetFloorY - p) - v);
		end;
		return Y.Position.Y < u;
	end;
	function w.HideBelowMap(Y)
		local z = Y:GetRoot(y);
		if not z then
			return;
		end;
		local u = Y.safePosition and Y.safePosition.Y or z.Position.Y;
		local T = u - n;
		local X, K = z.Position.X, z.Position.Z;
		pcall(function()
			z.CFrame = CFrame.new(X, T, K);
			z.AssemblyLinearVelocity = Vector3.zero;
			z.AssemblyAngularVelocity = Vector3.zero;
		end);
		Y.hiding = true;
		Y.hidingUntil = os.clock() + P;
	end;
	function w.IsKnife(z, Y)
		if not ((Y and Y:IsA("Tool"))) then
			return false;
		end;
		if Y:FindFirstChild("fire") or Y:FindFirstChild("showBeam") then
			return false;
		end;
		return Y:FindFirstChild("Slash") ~= nil or Y:FindFirstChild("SlashStart") ~= nil;
	end;
	function w.FindKnife(Y)
		local z = y.Character;
		if z then
			for z, u in ipairs(z:GetChildren()) do
				if Y:IsKnife(u) then
					return u, true;
				end;
			end;
		end;
		local u = y:FindFirstChildOfClass("Backpack");
		if u then
			for z, u in ipairs(u:GetChildren()) do
				if Y:IsKnife(u) then
					return u, false;
				end;
			end;
		end;
		return nil, false;
	end;
	function w.SwingKnife(z, Y)
		z.swingAccumulator = z.swingAccumulator + Y;
		if z.swingAccumulator < j then
			return;
		end;
		z.swingAccumulator = 0;
		local u, T = z:FindKnife();
		if not u then
			return;
		end;
		if not T then
			local Y = z:GetHumanoid(y);
			if not Y then
				return;
			end;
			pcall(function()
				Y:EquipTool(u);
			end);
			if u.Parent ~= y.Character then
				return;
			end;
		end;
		pcall(function()
			u:Activate();
		end);
	end;
	function w.UpdateJitter(z, Y)
		local u = os.clock();
		if u >= z.jitterNextSwitch then
			z.jitterSide = (math.random() < .5) and 1 or -1;
			z.jitterNextSwitch = (u + J) + math.random() * ((s - J));
		end;
		local T = z.jitterSide * o;
		z.jitterCurrent = z.jitterCurrent + ((T - z.jitterCurrent)) * math.clamp(Y * D, 0, 1);
	end;
	function w.CheckServerValidation(z, Y)
		if z.killActivated then
			return true;
		end;
		if not z.lastSetCFrame then
			return false;
		end;
		local u = z.lastSetCFrame.Position;
		local T = Y.Position;
		local X = ((T - u)).Magnitude;
		if X <= r then
			z.validFrames = z.validFrames + 1;
			if z.validFrames >= L then
				z.killActivated = true;
				z.swingAccumulator = j;
				return true;
			end;
		else
			z.validFrames = 0;
		end;
		return false;
	end;
	function w.ForceUnderground(u, Y, z)
		if not Y or not z then
			return;
		end;
		local T = u:GetPlatformFloorY(z);
		if not T then
			return;
		end;
		local X = T - p;
		if Y.Position.Y > X + b then
			pcall(function()
				Y.CFrame = CFrame.new(Y.Position.X, X, Y.Position.Z);
				Y.AssemblyLinearVelocity = Vector3.zero;
				Y.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
	end;
	function w.ApproachTarget(X, Y, z, T)
		T = T or 0;
		local K = Y.Position;
		local y = z.Position;
		local B = Vector3.new(y.X - K.X, 0, y.Z - K.Z);
		local S = B.Magnitude;
		if S <= k then
			if not X.sticking then
				local u = os.clock();
				if not X.triggerStart then
					X.triggerStart = u;
				end;
				local T = Vector3.new(y.X, K.Y, y.Z);
				local B = CFrame.lookAt(K, T);
				X.lastSetCFrame = B;
				pcall(function()
					Y.CFrame = B;
					Y.AssemblyLinearVelocity = Vector3.zero;
					Y.AssemblyAngularVelocity = Vector3.zero;
				end);
				local S = X:CheckServerValidation(Y);
				if S or (u - X.triggerStart) >= g then
					X.killActivated = true;
					X.swingAccumulator = j;
					X.triggerStart = nil;
					X.sticking = true;
					X.stickingStartTime = os.clock();
					X.lastStickTarget = z;
					X.targetFloor = nil;
					X.forceDescent = true;
					local Y = X:GetHumanoid(z.Parent);
					X.lastEnemyHealth = Y and Y.Health or nil;
					X.lastHealthChangeTime = os.clock();
					X.lastStickTargetHum = Y;
					X.jitterCurrent = 0;
				end;
			end;
			return;
		end;
		X.lastSetCFrame = nil;
		X.validFrames = 0;
		X.triggerStart = nil;
		local l = B.Unit;
		local v = Vector3.new(-l.Z, 0, l.X);
		X:UpdateJitter(T);
		local x = u * T;
		local c = math.min(x, math.max(0, S - k));
		local V = math.sqrt(math.max(0, c * ((2 * S - c)))) * .85;
		local N = math.clamp(((S - k)) / 8, 0, 1);
		local n = X.jitterCurrent * N;
		local P = math.clamp(n, -V, V);
		local t = K.X + l.X * c;
		local o = K.Z + l.Z * c;
		local J = t + v.X * P;
		local s = o + v.Z * P;
		local D = X:GetPlatformFloorY(z);
		local b;
		if D then
			b = D - p;
		else
			b = K.Y;
		end;
		local M = Vector3.new(J, b, s);
		local r = Vector3.new(y.X, M.Y, y.Z);
		local L = CFrame.lookAt(M, r);
		pcall(function()
			Y.CFrame = L;
			Y.AssemblyLinearVelocity = Vector3.zero;
			Y.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function w.CanStickToTarget(T, z, u)
		if not u or not u.Parent then
			return false;
		end;
		local X = Y:GetPlayerFromCharacter(u.Parent);
		if not X or not lc(X) then
			return false;
		end;
		local K = u.Parent:FindFirstChildOfClass("Humanoid");
		if not K or K.Health <= 0 then
			return false;
		end;
		local j = ((Vector3.new(z.Position.X, 0, z.Position.Z) - Vector3.new(u.Position.X, 0, u.Position.Z))).Magnitude;
		if j > l then
			return false;
		end;
		return true;
	end;
	function w.StickToTarget(X, Y, z, u)
		u = u or .016;
		local K = z.Position;
		local j = z.Parent and z.Parent:FindFirstChildOfClass("Humanoid");
		local y = j and j.FloorMaterial ~= Enum.Material.Air;
		if z ~= X.lastStickTarget then
			X.lastStickTarget = z;
			X.targetFloor = nil;
		end;
		if y or not X.targetFloor then
			X.targetFloor = X:GetFloorY(z);
		end;
		local B = Y.Position;
		local S = z.AssemblyLinearVelocity;
		local l = K.X + S.X * R;
		local v = K.Z + S.Z * R;
		local x = z.CFrame.LookVector;
		local c = Vector3.new(-x.X, 0, -x.Z);
		if c.Magnitude < .05 then
			c = Vector3.new(0, 0, 1);
		else
			c = c.Unit;
		end;
		local n = l + c.X * T;
		local P = v + c.Z * T;
		local t = X:IsInKnifeRange(Y, z);
		local o;
		if t and not X.forceDescent then
			o = B.Y;
		else
			o = X.targetFloor - N;
			if t then
				X.forceDescent = false;
			end;
		end;
		local J = X.targetFloor - N;
		if o > J then
			o = J;
		end;
		local s = math.clamp(u * A, 0, 1);
		local D = B:Lerp(Vector3.new(n, o, P), s);
		pcall(function()
			Y.CFrame = CFrame.new(D) * CFrame.Angles(math.rad(V), 0, 0);
			Y.AssemblyLinearVelocity = Vector3.zero;
			Y.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function w.CheckEnemyHealth(z, Y)
		local u = Y.Parent and Y.Parent:FindFirstChildOfClass("Humanoid");
		if not u then
			return false;
		end;
		local T = u.Health;
		if z.lastEnemyHealth == nil then
			z.lastEnemyHealth = T;
			z.lastHealthChangeTime = os.clock();
			return false;
		end;
		if T < z.lastEnemyHealth then
			z.lastEnemyHealth = T;
			z.lastHealthChangeTime = os.clock();
			return false;
		end;
		if (os.clock() - z.lastHealthChangeTime) >= x then
			return true;
		end;
		return false;
	end;
	function w.Update(z, Y)
		if not z:IsInMatch() then
			z:ResetState();
			z.currentTarget = nil;
			z.lockedTargetPlayer = nil;
			z.lastStickTarget = nil;
			z.lastFloorTarget = nil;
			z.targetFloorY = nil;
			return;
		end;
		local u = z:GetRoot(y);
		if not u then
			z:ResetState();
			z.currentTarget = nil;
			z.lockedTargetPlayer = nil;
			return;
		end;
		if z.lastStickTargetHum then
			local Y = z.lastStickTargetHum;
			if not Y.Parent or Y.Health <= 0 then
				z:HideBelowMap();
				z.inKnifeRangeNow = false;
				z.forceDescent = false;
				z.lastStickTargetHum = nil;
				z.lastStickTarget = nil;
				z.sticking = false;
				z.stickingStartTime = 0;
				z.lastEnemyHealth = nil;
				z.lastHealthChangeTime = 0;
				z.targetFloor = nil;
				z.killActivated = false;
				z.validFrames = 0;
				z.lastSetCFrame = nil;
				z.triggerStart = nil;
				return;
			end;
		end;
		if z.hiding then
			if os.clock() >= z.hidingUntil then
				z.hiding = false;
			else
				pcall(function()
					u.AssemblyLinearVelocity = Vector3.zero;
					u.AssemblyAngularVelocity = Vector3.zero;
				end);
				return;
			end;
		end;
		if z:IsFallingIntoVoid(u) then
			z:ForceReturnToSafe(u);
			z:ResetState();
			z.currentTarget = nil;
			z.lockedTargetPlayer = nil;
			z.lastStickTarget = nil;
			z.lastFloorTarget = nil;
			z.targetFloorY = nil;
			local Y = z:GetHumanoid(y);
			if Y then
				pcall(function()
					Y.PlatformStand = false;
				end);
			end;
			return;
		end;
		local T = z:GetClosestEnemy();
		if T then
			z.currentTarget = T;
			z.lastTargetSeenTime = os.clock();
		end;
		if not T then
			local Y = (os.clock() - ((z.lastTargetSeenTime or 0))) < c;
			local T = z.safePosition and u.Position.Y < (z.safePosition.Y - 2);
			if Y and T then
				pcall(function()
					u.AssemblyLinearVelocity = Vector3.zero;
					u.AssemblyAngularVelocity = Vector3.zero;
				end);
				return;
			end;
			z:ReturnToSafePosition(u);
			z:ResetState();
			z.currentTarget = nil;
			z.lockedTargetPlayer = nil;
			z.lastStickTarget = nil;
			z.lastFloorTarget = nil;
			z.targetFloorY = nil;
			if z.safePosition then
				local Y = z:GetHumanoid(y);
				if Y then
					pcall(function()
						Y.PlatformStand = false;
					end);
				end;
			end;
			return;
		end;
		z:DisableCollisions();
		if z.lastStickTarget then
			local Y = z:IsInKnifeRange(u, z.lastStickTarget);
			if Y and not z.inKnifeRangeNow then
				z.swingAccumulator = j;
				z.inKnifeRangeNow = true;
			elseif not Y then
				z.inKnifeRangeNow = false;
			end;
		end;
		z:SwingKnife(Y or 0);
		local X = z:GetHumanoid(y);
		if X and not X.PlatformStand then
			pcall(function()
				X.PlatformStand = true;
			end);
		end;
		if z.safePosition and u.Position.Y >= (z.safePosition.Y - B) then
			z.safePosition = Vector3.new(u.Position.X, z.safePosition.Y, u.Position.Z);
		end;
		if not z.sticking then
			z:ForceUnderground(u, T);
		end;
		if z.sticking then
			local X = (T ~= z.lastStickTarget);
			local K = (os.clock() - z.stickingStartTime) > S;
			local j = not z:CanStickToTarget(u, T);
			local y = z:CheckEnemyHealth(T);
			if X or K or j or y then
				z.sticking = false;
				z.stickingStartTime = 0;
				z.lastEnemyHealth = nil;
				z.lastHealthChangeTime = 0;
				z.targetFloor = nil;
				z.inKnifeRangeNow = false;
				z.forceDescent = false;
				z.killActivated = false;
				z.validFrames = 0;
				z.lastSetCFrame = nil;
				z.triggerStart = nil;
				if X then
					z.lastStickTarget = nil;
				end;
			else
				z:StickToTarget(u, T, Y or 0);
				return;
			end;
		end;
		z:ApproachTarget(u, T, Y or 0);
	end;
	function w.Start(Y)
		if Y.running then
			return;
		end;
		Y.running = true;
		Y.swingAccumulator = 0;
		Y.sticking = false;
		Y.stickingStartTime = 0;
		Y.lastEnemyHealth = nil;
		Y.lastHealthChangeTime = 0;
		Y.lastTargetSeenTime = 0;
		Y.currentTarget = nil;
		Y.lockedTargetPlayer = nil;
		Y.lastStickTarget = nil;
		Y.lastStickTargetHum = nil;
		Y.hiding = false;
		Y.hidingUntil = 0;
		Y.targetFloor = nil;
		Y.targetFloorY = nil;
		Y.lastFloorTarget = nil;
		Y.floorCheckTime = 0;
		Y.triggerStart = nil;
		Y.inKnifeRangeNow = false;
		Y.forceDescent = false;
		Y.jitterSide = 1;
		Y.jitterCurrent = 0;
		Y.jitterNextSwitch = 0;
		Y.lastSetCFrame = nil;
		Y.validFrames = 0;
		Y.killActivated = false;
		local u = Y:GetRoot(y);
		if u then
			local z = RaycastParams.new();
			z.FilterType = Enum.RaycastFilterType.Exclude;
			z.FilterDescendantsInstances = { y.Character };
			local T = u.Position + Vector3.new(0, 5, 0);
			local X = K:Raycast(T, Vector3.new(0, -500, 0), z);
			if X then
				Y.safePosition = Vector3.new(u.Position.X, X.Position.Y + 3, u.Position.Z);
			else
				Y.safePosition = u.Position;
			end;
		else
			Y.safePosition = nil;
		end;
		Y.connections:Add(z.Heartbeat:Connect(function(z)
			if not Y.running then
				return;
			end;
			Y:Update(z);
		end));
		Y.connections:Add(y.CharacterAdded:Connect(function()
			table.clear(Y.savedCollisions);
			Y.sticking = false;
			Y.safePosition = nil;
			Y.stickingStartTime = 0;
			Y.lastEnemyHealth = nil;
			Y.lastHealthChangeTime = 0;
			Y.lastTargetSeenTime = 0;
			Y.currentTarget = nil;
			Y.lockedTargetPlayer = nil;
			Y.lastStickTarget = nil;
			Y.lastStickTargetHum = nil;
			Y.hiding = false;
			Y.hidingUntil = 0;
			Y.targetFloor = nil;
			Y.targetFloorY = nil;
			Y.lastFloorTarget = nil;
			Y.floorCheckTime = 0;
			Y.triggerStart = nil;
			Y.inKnifeRangeNow = false;
			Y.forceDescent = false;
			Y.jitterSide = 1;
			Y.jitterCurrent = 0;
			Y.jitterNextSwitch = 0;
			Y.lastSetCFrame = nil;
			Y.validFrames = 0;
			Y.killActivated = false;
		end));
	end;
	function w.Stop(Y)
		if not Y.running then
			return;
		end;
		local z = Y:GetRoot(y);
		if z and Y.safePosition then
			pcall(function()
				z.CFrame = CFrame.new(Y.safePosition);
				z.AssemblyLinearVelocity = Vector3.zero;
				z.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
		Y.running = false;
		Y.connections:Cleanup();
		Y.connections = Nc.new();
		Y:ResetState();
		Y.currentTarget = nil;
		Y.lockedTargetPlayer = nil;
		Y.lastStickTarget = nil;
		Y.lastStickTargetHum = nil;
		Y.hiding = false;
		Y.hidingUntil = 0;
		Y.inKnifeRangeNow = false;
		Y.forceDescent = false;
		Y.killActivated = false;
		Y.targetFloorY = nil;
		Y.lastFloorTarget = nil;
	end;
	KillAllInstance = w.new();
end;
task.wait();
jc.Aim:Section({ Title = "Auto Shoot", Icon = "solar:target-bold" });
A.TogAutoShoot = jc.Aim:Toggle({ Title = "Auto Shoot (Normal - Cabeza/Torso)", Callback = function(Y)
			v = Y;
			if not Y and (not v and (not x and m)) then
				m("Auto", nil);
			end;
			if w then
				w();
			end;
		end });
A.TogAutoShootAgr = jc.Aim:Toggle({ Title = "Auto Shoot (Agresivo - Hitbox Completa)", Callback = function(Y)
			x = Y;
			if not Y and (not v and (not x and m)) then
				m("Auto", nil);
			end;
			if w then
				w();
			end;
		end });
A.DropAutoShootPart = jc.Aim:Dropdown({
		Title = "Target: Parte del cuerpo",
		Values = { "Cabeza", "Torso", "Cuerpo Completo" },
		Value = "Cabeza",
		Callback = function(Y)
			c = Y;
		end,
	});
A.TogEquipGun = jc.Aim:Toggle({ Title = "Equipar pistola", Value = false, Callback = function(Y)
			e = Y;
			if w then
				w();
			end;
		end });
do
	local z = false;
	a = function()
			if z or not e then
				return;
			end;
			z = true;
			task.spawn(function()
				local u = RaycastParams.new();
				u.FilterType = Enum.RaycastFilterType.Exclude;
				while e do
					task.wait(.1);
					if not e then
						break;
					end;
					if not Sc() then
						continue;
					end;
					local z = y.Character;
					local T = z and z:FindFirstChildOfClass("Humanoid");
					if not z or not T then
						continue;
					end;
					if T.Health <= 0 then
						continue;
					end;
					local X = z:FindFirstChild("HumanoidRootPart");
					local j = z:FindFirstChild("Head");
					if not X then
						continue;
					end;
					local B = j and j.Position or X.Position;
					local S = false;
					for Y, T in ipairs(Y:GetPlayers()) do
						if T ~= y and lc(T) then
							local Y = T.Character;
							if Y then
								local T = Y:FindFirstChild("Head") or Y:FindFirstChild("UpperTorso") or Y:FindFirstChild("Torso") or Y:FindFirstChild("HumanoidRootPart");
								if T and T:IsA("BasePart") then
									u.FilterDescendantsInstances = { z, Y };
									local X = K:Raycast(B, T.Position - B, u);
									if not X and Sc() then
										S = true;
										break;
									end;
								end;
							end;
						end;
					end;
					if not S then
						continue;
					end;
					local l = cc();
					if not l then
						continue;
					end;
					z = y.Character;
					T = z and z:FindFirstChildOfClass("Humanoid");
					if not z or not T then
						continue;
					end;
					l = cc();
					if not l then
						continue;
					end;
					if l.Parent ~= z then
						pcall(function()
							T:EquipTool(l);
						end);
					end;
					task.wait(.35);
					if not e then
						break;
					end;
					z = y.Character;
					T = z and z:FindFirstChildOfClass("Humanoid");
					if z and T then
						pcall(function()
							T:UnequipTools();
						end);
					end;
					task.wait(1.9);
				end;
				z = false;
			end);
		end;
end;
jc.Aim:Space();
jc.Aim:Divider();
jc.Aim:Space();
jc.Aim:Section({ Title = "Silent Aim + Fov", Icon = "solar:radar-bold" });
A.TogSilentAimManual = jc.Aim:Toggle({ Title = "Silent Aim", Callback = function(Y)
			V = Y;
			if not Y and (not V and (not N and m)) then
				m("Silent", nil);
			end;
			if w then
				w();
			end;
		end });
A.DropSilentAimPart = jc.Aim:Dropdown({
		Title = "Target: Parte del cuerpo",
		Values = { "Cabeza", "Torso", "Cuerpo Completo" },
		Value = "Cabeza",
		Callback = function(Y)
			n = Y;
		end,
	});
A.TogSilentAimFOV = jc.Aim:Toggle({ Title = "Silent Aim (Con FOV)", Callback = function(Y)
			N = Y;
			if not Y and (not V and (not N and m)) then
				m("Silent", nil);
			end;
			if w then
				w();
			end;
		end });
A.TogShowFOV = jc.Aim:Toggle({ Title = "Mostrar C\195\173rculo FOV", Callback = function(Y)
			S = Y;
			if W then
				W();
			end;
		end });
A.SliFOVSize = jc.Aim:Slider({
		Title = "Tama\195\177o del FOV",
		Step = 1,
		Value = { Min = 10, Max = 800, Default = 120 },
		Callback = function(Y)
			l = Y;
		end,
	});
do
	(getgenv()).NexvyrTargetPart = nil;
	local z = (getgenv()).__NexvyrDeferredNamecall;
	if z then
		z.Enabled = false;
	end;
	local u = y:GetMouse();
	local T = { Auto = nil, Silent = nil };
	local X = 0;
	local j = (getgenv()).__NexvyrDmvsAimCleanup;
	if type(j) == "function" then
		pcall(j);
	end;
	(getgenv()).__NexvyrDmvsAimCleanup = nil;
	local B = {
			Enabled = false,
			Metatable = nil,
			IndexHook = nil,
			NamecallHook = nil,
		};
	local S = false;
	do
		local Y = type(getexecutorname) == "function" and getexecutorname or identifyexecutor;
		if type(Y) == "function" then
			local z, u = pcall(Y);
			S = z and ((tostring(u)):lower()):find("madium", 1, true) ~= nil or false;
		end;
	end;
	local P = {};
	pcall(function()
		P.Raycast = K.Raycast;
	end);
	pcall(function()
		P.FindPartOnRay = K.FindPartOnRay;
	end);
	pcall(function()
		P.FindPartOnRayWithIgnoreList = K.FindPartOnRayWithIgnoreList;
	end);
	pcall(function()
		P.FindPartOnRayWithWhitelist = K.FindPartOnRayWithWhitelist;
	end);
	local function t()
		return v or x or V or N;
	end;
	local function o(Y)
		if typeof(Y) ~= "Instance" or not Y:IsA("BasePart") or not Y.Parent then
			return false;
		end;
		local z = Y:FindFirstAncestorOfClass("Model");
		local u = z and z:FindFirstChildOfClass("Humanoid");
		return u ~= nil and u.Health > 0;
	end;
	local function J()
		local Y = os.clock();
		local z = v or x;
		if z and (Y <= X and o(T.Auto)) then
			return T.Auto;
		end;
		if ((V or N)) and o(T.Silent) then
			return T.Silent;
		end;
		if z and o(T.Auto) then
			return T.Auto;
		end;
		return nil;
	end;
	m = function(Y, z)
			if Y ~= "Auto" and Y ~= "Silent" then
				return;
			end;
			T[Y] = o(z) and z or nil;
			(getgenv()).NexvyrTargetPart = J();
		end;
	local function s()
		if not B.Enabled or not t() or Bc() then
			return nil;
		end;
		local Y = y.Character;
		if not Y then
			return nil;
		end;
		local z = Y:FindFirstChildOfClass("Tool");
		if not ((xc(z) or (x and (z and not vc(z))))) then
			return nil;
		end;
		local u = J();
		if not u then
			return nil;
		end;
		return u.Position, u;
	end;
	local function D(Y)
		if typeof(Y) ~= "Vector3" then
			return false;
		end;
		local z = K.CurrentCamera;
		if z and ((Y - z.CFrame.Position)).Magnitude <= 3 then
			return true;
		end;
		local u = y.Character;
		if not u then
			return false;
		end;
		local T = u:FindFirstChildOfClass("Tool");
		local X = T and T:FindFirstChild("Handle");
		if X and (X:IsA("BasePart") and ((Y - X.Position)).Magnitude <= 18) then
			return true;
		end;
		local j = u:FindFirstChild("Head");
		return j and ((Y - j.Position)).Magnitude <= 8 or false;
	end;
	local function p()
		local Y = K.CurrentCamera;
		local z = Y and Y.CFrame.Position;
		local u = y.Character;
		local T = u and u:FindFirstChild("Head");
		if z and (T and ((z - T.Position)).Magnitude <= 1.75) then
			return z;
		end;
		local X = u and u:FindFirstChildOfClass("Tool");
		local j = X and X:FindFirstChild("Handle");
		if j and j:IsA("BasePart") then
			return j.Position;
		end;
		if T then
			return T.Position;
		end;
		return z;
	end;
	local function b()
		B.Enabled = false;
		local Y = B.Metatable;
		if not Y or type(setreadonly) ~= "function" then
			return;
		end;
		local z = pcall(setreadonly, Y, false);
		if not z then
			return;
		end;
		pcall(function()
			if Y.__index == B.IndexHook then
				Y.__index = B.OriginalIndex;
			end;
			if B.NamecallHook and Y.__namecall == B.NamecallHook then
				Y.__namecall = B.OriginalNamecall;
			end;
		end);
		pcall(setreadonly, Y, B.WasReadonly);
		if Y.__index ~= B.IndexHook and ((not B.NamecallHook or Y.__namecall ~= B.NamecallHook)) then
			B.Metatable = nil;
			B.IndexHook = nil;
			B.NamecallHook = nil;
		end;
	end;
	(getgenv()).__NexvyrDmvsAimCleanup = b;
	local function k()
		if B.Metatable then
			local Y = B.Metatable;
			local z = Y.__index == B.IndexHook;
			B.Enabled = z;
			return z;
		end;
		if type(getrawmetatable) ~= "function" or type(setreadonly) ~= "function" then
			warn("Nexvyr: este executor no permite instalar la redireccion del mouse.");
			return false;
		end;
		local Y, z = pcall(getrawmetatable, S and game or u);
		if not Y or not z then
			return false;
		end;
		local T, X = z.__index, z.__namecall;
		if type(T) ~= "function" and type(T) ~= "table" then
			return false;
		end;
		local j = true;
		if type(isreadonly) == "function" then
			local Y, u = pcall(isreadonly, z);
			if Y and type(u) == "boolean" then
				j = u;
			end;
		end;
		local function y(Y, z)
			if type(T) == "function" then
				return T(Y, z);
			end;
			return T[z];
		end;
		local l = function(Y, z)
				if B.Enabled and (Y == u and (((z == "Hit" or z == "Target" or z == "UnitRay" or (S and z == "TargetSurface"))) and ((S or type(checkcaller) ~= "function" or not checkcaller())))) then
					local u, T, X = pcall(s);
					if u and (T and X) then
						if z == "Target" then
							return X;
						end;
						if z == "TargetSurface" then
							return Enum.NormalId.Front;
						end;
						if z == "Hit" then
							if S then
								return CFrame.new(T);
							end;
							local Y = p();
							local z = Y and T - Y;
							if z and z.Magnitude > .001 then
								return CFrame.lookAt(T, T + z.Unit);
							end;
							return CFrame.new(T);
						end;
						local u = y(Y, z);
						local j = typeof(u) == "Ray" and u.Origin or nil;
						if not j then
							local Y = K.CurrentCamera;
							j = Y and Y.CFrame.Position or p();
						end;
						local B = j and T - j;
						if B and B.Magnitude > .001 then
							return Ray.new(j, B.Unit);
						end;
					end;
				end;
				return y(Y, z);
			end;
		local v;
		if not S and (type(X) == "function" and (type(getnamecallmethod) == "function" and type(checkcaller) == "function")) then
			v = function(Y, ...)
					if not B.Enabled or checkcaller() then
						return X(Y, ...);
					end;
					if Y == K and not B.ResolvingRay then
						local z = getnamecallmethod();
						local u = z and P[z];
						if u then
							local T = table.pack(...);
							local X, K;
							if z == "Raycast" then
								if typeof(T[1]) == "Vector3" and typeof(T[2]) == "Vector3" then
									X, K = T[1], T[2].Magnitude;
								end;
							elseif typeof(T[1]) == "Ray" then
								X, K = T[1].Origin, T[1].Direction.Magnitude;
							end;
							if X and (K and (K >= 50 and D(X))) then
								B.ResolvingRay = true;
								local Y, u = pcall(s);
								B.ResolvingRay = false;
								if Y and u then
									local Y = u - X;
									if Y.Magnitude > .001 then
										if z == "Raycast" then
											T[2] = Y.Unit * K;
										else
											T[1] = Ray.new(X, Y.Unit * K);
										end;
									end;
								end;
							end;
							return u(Y, table.unpack(T, 1, T.n));
						end;
					end;
					return X(Y, ...);
				end;
		end;
		if not pcall(setreadonly, z, false) then
			return false;
		end;
		local x = pcall(function()
				z.__index = l;
				if v then
					z.__namecall = v;
				end;
			end);
		if not x then
			pcall(function()
				if z.__index == l then
					z.__index = T;
				end;
				if v and z.__namecall == v then
					z.__namecall = X;
				end;
			end);
			pcall(setreadonly, z, j);
			return false;
		end;
		pcall(setreadonly, z, j);
		B.Metatable = z;
		B.OriginalIndex = T;
		B.OriginalNamecall = X;
		B.IndexHook = l;
		B.NamecallHook = v;
		B.WasReadonly = j;
		B.Enabled = true;
		return true;
	end;
	local function g()
		if t() then
			k();
		else
			T.Auto = nil;
			T.Silent = nil;
			X = 0;
			(getgenv()).NexvyrTargetPart = nil;
			b();
		end;
	end;
	local M;
	w = function()
			Q();
			g();
			if M then
				M();
			end;
		end;
	local r = false;
	E = function()
			if r or not ((v or x)) then
				return;
			end;
			r = true;
			task.spawn(function()
				local z = RaycastParams.new();
				z.FilterType = Enum.RaycastFilterType.Exclude;
				while v or x do
					task.wait(.1);
					if not ((v or x)) then
						break;
					end;
					if not B.Enabled then
						continue;
					end;
					if not Bc() then
						local u = y.Character;
						if not u or not u:FindFirstChild("HumanoidRootPart") then
							continue;
						end;
						local T = u:FindFirstChildOfClass("Tool");
						if not T or not T:FindFirstChild("Handle") then
							m("Auto", nil);
							continue;
						end;
						if x then
							if vc(T) then
								m("Auto", nil);
								continue;
							end;
						elseif not xc(T) then
							m("Auto", nil);
							continue;
						end;
						local j = nil;
						local B = math.huge;
						local S = u.HumanoidRootPart.Position;
						local l = u:FindFirstChild("Head");
						local v = l and l.Position or S;
						if x then
							for Y, T in pairs(Y:GetPlayers()) do
								if T ~= y and (yc(T) and T.Character) then
									local Y = T.Character:FindFirstChild("Humanoid");
									if Y and Y.Health > 0 then
										z.FilterDescendantsInstances = { u, T.Character };
										local function Y(Y)
											local u = ((Y.Position - S)).Magnitude;
											if u < B then
												local T = Y.Size;
												local X = { Vector3.new(0, 0, 0), Vector3.new(0, T.Y / 2.1, 0), Vector3.new(0, -T.Y / 2.1, 0) };
												local y = false;
												for u, T in ipairs(X) do
													if not K:Raycast(v, (Y.CFrame * T) - v, z) then
														y = true;
														break;
													end;
												end;
												if y then
													B = u;
													j = Y;
												end;
											end;
										end;
										for z, u in ipairs(T.Character:GetChildren()) do
											if u:IsA("BasePart") and u.Name ~= "HumanoidRootPart" then
												Y(u);
											end;
										end;
									end;
								end;
							end;
						else
							local T = {};
							for Y, z in ipairs(Y:GetPlayers()) do
								if z ~= y and (yc(z) and z.Character) then
									local Y = z.Character;
									local u = Y:FindFirstChildOfClass("Humanoid");
									if u and u.Health > 0 then
										local z = Y:FindFirstChild("HumanoidRootPart");
										T[#T + 1] = { Character = Y, Distance = z and ((z.Position - S)).Magnitude or math.huge };
									end;
								end;
							end;
							table.sort(T, function(Y, z)
								return Y.Distance < z.Distance;
							end);
							local X = 192;
							local function l(Y)
								if not Y or not Y:IsA("BasePart") then
									return;
								end;
								local u = ((Y.Position - S)).Magnitude;
								if u >= B then
									return;
								end;
								local T = Y.Size.Y / 2.1;
								local y = Y.CFrame;
								local function l(Y)
									if X <= 0 then
										return false;
									end;
									X = X - (1);
									return not K:Raycast(v, Y - v, z);
								end;
								if l(Y.Position) or l(y * Vector3.new(0, T, 0)) or l(y * Vector3.new(0, -T, 0)) then
									B = u;
									j = Y;
								end;
							end;
							for Y, T in ipairs(T) do
								if X <= 0 then
									break;
								end;
								local K = T.Character;
								if K.Parent then
									z.FilterDescendantsInstances = { u, K };
									if c == "Cuerpo Completo" then
										for Y, z in ipairs(K:GetChildren()) do
											if X <= 0 then
												break;
											end;
											if z:IsA("BasePart") and z.Name ~= "HumanoidRootPart" then
												l(z);
											end;
										end;
									elseif c == "Cabeza" then
										l(K:FindFirstChild("Head"));
									elseif c == "Torso" then
										for Y, z in ipairs({ "UpperTorso", "Torso", "HumanoidRootPart" }) do
											if X <= 0 then
												break;
											end;
											l(K:FindFirstChild(z));
										end;
									end;
								end;
							end;
						end;
						if j then
							X = os.clock() + .35;
							m("Auto", j);
							pcall(function()
								T:Activate();
								task.delay(.05, function()
									if T.Parent == u then
										T:Deactivate();
									end;
								end);
							end);
							task.wait(.2);
						else
							m("Auto", nil);
						end;
					end;
				end;
				m("Auto", nil);
				r = false;
			end);
		end;
	local L = false;
	h = function()
			if L or not ((V or N)) then
				return;
			end;
			L = true;
			task.spawn(function()
				local z = RaycastParams.new();
				z.FilterType = Enum.RaycastFilterType.Exclude;
				while V or N do
					task.wait(.1);
					if not ((V or N)) then
						break;
					end;
					if not Bc() then
						local u = y.Character;
						if not u or not u:FindFirstChild("HumanoidRootPart") then
							continue;
						end;
						local T = nil;
						local X = math.huge;
						local j = math.huge;
						local B = u.HumanoidRootPart.Position;
						local S = u:FindFirstChild("Head") and u.Head.Position or B;
						for Y, v in pairs(Y:GetPlayers()) do
							if v ~= y and (yc(v) and v.Character) then
								local Y = v.Character:FindFirstChild("Humanoid");
								if Y and Y.Health > 0 then
									local Y = {};
									if n == "Cabeza" then
										local z = v.Character:FindFirstChild("Head");
										if z then
											table.insert(Y, z);
										end;
									elseif n == "Torso" then
										local z = { "UpperTorso", "Torso", "HumanoidRootPart" };
										for z, u in ipairs(z) do
											local T = v.Character:FindFirstChild(u);
											if T and T:IsA("BasePart") then
												table.insert(Y, T);
											end;
										end;
									elseif n == "Cuerpo Completo" then
										for z, u in ipairs(v.Character:GetChildren()) do
											if u:IsA("BasePart") and u.Name ~= "HumanoidRootPart" then
												table.insert(Y, u);
											end;
										end;
									end;
									z.FilterDescendantsInstances = { u, v.Character };
									for Y, u in ipairs(Y) do
										local y = ((u.Position - B)).Magnitude;
										local v = K.CurrentCamera;
										if not v then
											continue;
										end;
										local x, c = v:WorldToViewportPoint(u.Position);
										local n = ((Vector2.new(x.X, x.Y) - v.ViewportSize / 2)).Magnitude;
										local P = false;
										if N then
											if c and (n <= l and n < X) then
												P = true;
											end;
										elseif V then
											if y < j then
												P = true;
											end;
										end;
										if P then
											local Y = K:Raycast(S, u.Position - S, z);
											if not Y then
												if N then
													X = n;
													T = u;
												else
													j = y;
													T = u;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
						if T then
							m("Silent", T);
						else
							m("Silent", nil);
						end;
					end;
				end;
				m("Silent", nil);
				L = false;
			end);
		end;
	M = function()
			if v or x then
				E();
			end;
			if V or N then
				h();
			end;
			if e then
				a();
			end;
		end;
end;
jc.KillAll:Section({ Title = "Kill All", Icon = "solar:danger-triangle-bold" });
A.TogKillAll = jc.KillAll:Toggle({ Title = "Kill All", Value = false, Callback = function(Y)
			s = Y;
			if Q then
				Q();
			end;
			if Y then
				KillAllInstance:Start();
			else
				KillAllInstance:Stop();
			end;
		end });
jc.KillAll:Space();
jc.KillAll:Divider();
jc.KillAll:Space();
jc.KillAll:Section({ Title = "Hitbox Expander", Icon = "solar:box-bold" });
A.TogHitbox = jc.KillAll:Toggle({ Title = "Activar Hitbox", Value = false, Callback = function(Y)
			D = Y;
			if Q then
				Q();
			end;
			if Y then
				O();
			else
				nc();
			end;
		end });
A.TogHitboxInvisible = jc.KillAll:Toggle({ Title = "Hitbox Invisible", Value = false, Callback = function(Y)
			p = Y;
		end });
A.SliHitboxSize = jc.KillAll:Slider({
		Title = "Tama\195\177o de la Hitbox",
		Step = .5,
		Value = { Min = 1, Max = 28, Default = 3.5 },
		Callback = function(Y)
			b = Y;
		end,
	});
A.ColHitbox = jc.KillAll:Colorpicker({ Title = "Color de la Hitbox", Default = Color3.fromRGB(255, 0, 0), Callback = function(Y)
			k = Y;
		end });
jc.Invisible:Section({ Title = "Invisible", Icon = "solar:ghost-bold" });
local function oc(Y)
	if y.Character then
		for z, u in pairs(y.Character:GetDescendants()) do
			if u:IsA("BasePart") then
				if Y and u.Transparency == 0 then
					u:SetAttribute("NexvyrOrigTrans", 0);
					u.Transparency = .5;
				elseif not Y and u:GetAttribute("NexvyrOrigTrans") ~= nil then
					u.Transparency = u:GetAttribute("NexvyrOrigTrans");
					u:SetAttribute("NexvyrOrigTrans", nil);
				end;
			end;
		end;
	end;
end;
A.TogInvisible = jc.Invisible:Toggle({ Title = "Invisible", Value = false, Callback = function(Y)
			r = Y;
			oc(Y);
			if f then
				f(Y);
			end;
		end });
do
	local Y;
	f = function(u)
			if Y then
				Y:Disconnect();
				Y = nil;
			end;
			if not u then
				return;
			end;
			Y = z.Heartbeat:Connect(function()
					if not r then
						return;
					end;
					local Y = y.Character;
					if Y then
						local u = Y:FindFirstChild("HumanoidRootPart");
						local T = Y:FindFirstChildOfClass("Humanoid");
						if u and (T and T.Health > 0) then
							if u.Position.Y > 200 then
								return;
							end;
							local Y = u.CFrame;
							local X = T.CameraOffset;
							local K = Y * CFrame.new(0, -40, 0);
							u.CFrame = K;
							T.CameraOffset = (K:ToObjectSpace(CFrame.new(Y.Position))).Position;
							z.RenderStepped:Wait();
							if u.Parent and T.Parent then
								u.CFrame = Y;
								T.CameraOffset = X;
							end;
						end;
					end;
				end);
		end;
end;
y.CharacterAdded:Connect(function(Y)
	if r then
		task.wait(.5);
		oc(true);
	end;
end);
jc.Tramposo:Section({ Title = "Movimiento", Icon = "solar:bolt-bold" });
local Jc = 28.7;
local sc = 45;
do
	local Y = T:WaitForChild("MovementState", 3);
	local function X(z, u)
		if Y then
			Y:FireServer(z, u);
		end;
	end;
	local K = 14;
	local j, B, S;
	local l = Vector3.zero;
	local v = false;
	local x = 0;
	local function c()
		local Y = y.Character;
		if not Y then
			return;
		end;
		return Y:FindFirstChildOfClass("Humanoid"), Y:FindFirstChild("HumanoidRootPart");
	end;
	local function V(Y)
		if j then
			j:Disconnect();
			j = nil;
		end;
		l = Vector3.zero;
		if not Y then
			return;
		end;
		j = z.Stepped:Connect(function(Y, z)
				local u, T = c();
				if not u or not T or u.Health <= 0 then
					return;
				end;
				local X = 1 - math.exp(-K * z);
				l = l:Lerp(u.MoveDirection, X);
				if l.Magnitude > .01 then
					local Y = math.max(Jc - u.WalkSpeed, 0);
					T.CFrame = T.CFrame + (l * Y) * z;
				end;
			end);
	end;
	local function N(Y)
		if B then
			B:Disconnect();
			B = nil;
		end;
		if S then
			S:Disconnect();
			S = nil;
		end;
		v = false;
		x = 0;
		if not Y then
			return;
		end;
		S = u.JumpRequest:Connect(function()
				v = true;
			end);
		B = z.Stepped:Connect(function(Y, z)
				local T, X = c();
				if not T or not X or T.Health <= 0 then
					return;
				end;
				local j = u:IsKeyDown(Enum.KeyCode.Space) or T.Jump;
				if v and not j then
					v = false;
				end;
				local y = v and sc or 0;
				x = x + ((y - x)) * ((1 - math.exp(-K * z)));
				if x > .5 then
					X.CFrame = X.CFrame + Vector3.new(0, x * z, 0);
					local Y = X.AssemblyLinearVelocity;
					if Y.Y < 0 then
						X.AssemblyLinearVelocity = Vector3.new(Y.X, 0, Y.Z);
					end;
				end;
			end);
	end;
	A.TogSpeed = jc.Tramposo:Toggle({ Title = "Speed", Value = false, Callback = function(Y)
				V(Y);
				X("Speed", Y);
			end });
	A.SliSpeed = jc.Tramposo:Slider({
			Title = "Ajuste Speed",
			Step = 1,
			Value = { Min = 1, Max = 100, Default = 29 },
			Callback = function(Y)
				Jc = Y;
			end,
		});
	A.TogInfJump = jc.Tramposo:Toggle({ Title = "Salto Inf", Value = false, Callback = function(Y)
				N(Y);
				X("Jump", Y);
			end });
	A.SliJumpPower = jc.Tramposo:Slider({
			Title = "Ajuste Salto",
			Step = 1,
			Value = { Min = 1, Max = 100, Default = 45 },
			Callback = function(Y)
				sc = Y;
			end,
		});
end;
jc.RachaFarm:Section({ Title = "Auto Teleport Main/Alt", Icon = "solar:map-arrow-square-bold" });
local Dc, pc;
Dc = jc.RachaFarm:Toggle({ Title = "Auto Teleport (Main)", Value = false, Callback = function(Y)
			if Y then
				AutoTeleportMainAltInstance.ActiveRole = "Main";
				if pc then
					pcall(function()
						pc:Set(false);
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
pc = jc.RachaFarm:Toggle({ Title = "Auto Teleport (Alt)", Value = false, Callback = function(Y)
			if Y then
				AutoTeleportMainAltInstance.ActiveRole = "Alt";
				if Dc then
					pcall(function()
						Dc:Set(false);
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
jc.RachaFarm:Dropdown({
	Title = "Tipo de Duelo",
	Values = {
		"1v1",
		"2v2",
		"3v3",
		"4v4",
	},
	Value = "1v1",
	Callback = function(Y)
		if Pc["Right Platforms"][Y] then
			AutoTeleportMainAltInstance.DuelType = Y;
		else
			AutoTeleportMainAltInstance.DuelType = "1v1";
		end;
		AutoTeleportMainAltInstance:Kick();
	end,
});
jc.RachaFarm:Dropdown({
	Title = "Fila de Plataformas",
	Values = { "Right Platforms", "Left Platforms" },
	Value = "Right Platforms",
	Callback = function(Y)
		if Pc[Y] then
			AutoTeleportMainAltInstance.PlatformRow = Y;
		else
			AutoTeleportMainAltInstance.PlatformRow = "Right Platforms";
		end;
		AutoTeleportMainAltInstance:Kick();
	end,
});
do
	jc.Vis:Section({ Title = "Configuraci\195\179n de ESP", Icon = "solar:eye-bold" });
	local u = {};
	local X = 1500;
	local function j(Y)
		local z = u[Y];
		if not z then
			return;
		end;
		if z.Highlight then
			z.Highlight:Destroy();
		end;
		u[Y] = nil;
	end;
	local function B()
		for Y in pairs(u) do
			j(Y);
		end;
	end;
	A.TogEsp = jc.Vis:Toggle({ Title = "ESP Jugadores", Callback = function(Y)
				t = Y;
				if Q then
					Q();
				end;
				if t and J.Glow then
					Z();
				else
					B();
				end;
			end });
	A.ColEsp = jc.Vis:Colorpicker({ Title = "Color del ESP", Default = Color3.fromRGB(255, 255, 255), Callback = function(Y)
				o = Y;
			end });
	jc.Vis:Space();
	jc.Vis:Divider();
	jc.Vis:Space();
	jc.Vis:Section({ Title = "Filtros de ESP", Icon = "solar:filter-bold" });
	A.TogEspGl = jc.Vis:Toggle({ Title = "Mostrar Resplandor", Value = true, Callback = function(Y)
				J.Glow = Y;
				if Q then
					Q();
				end;
				if Y and t then
					Z();
				else
					B();
				end;
			end });
	local v = false;
	Z = function()
			if v or not t or not J.Glow then
				return;
			end;
			v = true;
			task.spawn(function()
				local z = Y.PlayerRemoving:Connect(j);
				while t and J.Glow do
					task.wait(.2);
					if not t or not J.Glow then
						break;
					end;
					if Sc() then
						local z = y.Character;
						local T = z and z:FindFirstChild("Head");
						local K = T and T.Position;
						for Y, z in ipairs(Y:GetPlayers()) do
							if z ~= y then
								local Y = z.Character;
								local T = Y and Y:FindFirstChild("Head");
								if T and (yc(z) and ((not K or ((T.Position - K)).Magnitude <= X))) then
									local T = u[z];
									if T and ((T.Char ~= Y or not T.Highlight or T.Highlight.Parent ~= I)) then
										j(z);
									end;
									if not u[z] then
										local T = Instance.new("Highlight");
										T.Name = z.Name .. "_Glow";
										T.FillTransparency = 1;
										T.OutlineTransparency = 0;
										T.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
										T.Adornee = Y;
										T.Parent = I;
										u[z] = { Highlight = T, Char = Y };
									end;
									local X = u[z].Highlight;
									if X.Enabled ~= J.Glow then
										X.Enabled = J.Glow;
									end;
									if X.OutlineColor ~= o then
										X.OutlineColor = o;
									end;
								else
									j(z);
								end;
							end;
						end;
					else
						B();
					end;
				end;
				z:Disconnect();
				B();
				v = false;
			end);
		end;
	local x;
	local c;
	W = function()
			if not S then
				if c then
					c:Disconnect();
					c = nil;
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
			if not x or c then
				return;
			end;
			c = z.RenderStepped:Connect(function()
					if not S then
						return;
					end;
					local Y = K.CurrentCamera;
					if not Y then
						return;
					end;
					x.Position = Y.ViewportSize / 2;
					x.Radius = l;
					x.Color = N and ((getgenv()).NexvyrTargetPart and Color3.fromRGB(0, 255, 0)) or Color3.fromRGB(255, 255, 255);
					x.Visible = true;
				end);
		end;
	jc.Farm:Section({ Title = "Farmeo de Evento", Icon = "solar:gift-bold" });
	(getgenv()).AutoEventFarm = false;
	local V = 0;
	local n = T:FindFirstChild("Packages") and T.Packages:FindFirstChild("Networking");
	local P = n and n:FindFirstChild("RE/Events/CollectEventSpawnable");
	jc.Farm:Toggle({ Title = "Auto Farmear Evento", Callback = function(Y)
			(getgenv()).AutoEventFarm = Y;
			V = V + (1);
			local z = V;
			if Y then
				task.spawn(function()
					while (getgenv()).AutoEventFarm and z == V do
						pcall(function()
							if P then
								P:FireServer();
							else
								n = T:FindFirstChild("Packages") and T.Packages:FindFirstChild("Networking");
								P = n and n:FindFirstChild("RE/Events/CollectEventSpawnable");
							end;
						end);
						local Y = y.Character;
						local u = Y and Y:FindFirstChild("HumanoidRootPart");
						if u then
							local Y = K:FindFirstChild("SpawnablesClient");
							if Y then
								for Y, T in ipairs(Y:GetChildren()) do
									if not (getgenv()).AutoEventFarm or z ~= V then
										break;
									end;
									local X = T:FindFirstChild("Touch");
									if X then
										pcall(function()
											firetouchinterest(u, X, 0);
											firetouchinterest(u, X, 1);
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
	local Y = {
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
		};
	local function z()
		local Y = y.Character;
		if not Y then
			return;
		end;
		local z = Y:FindFirstChildOfClass("Humanoid");
		if not z then
			return;
		end;
		for Y, z in pairs(z:GetPlayingAnimationTracks()) do
			z:Stop(0);
			z:Destroy();
		end;
		local u = z:FindFirstChildOfClass("Animator");
		if u then
			for Y, z in pairs(u:GetPlayingAnimationTracks()) do
				z:Stop(0);
				z:Destroy();
			end;
		end;
		task.wait(.1);
	end;
	local function u(Y)
		if not Y then
			return;
		end;
		local u = y.Character;
		if not u then
			return;
		end;
		z();
		local T = u:FindFirstChild("Animate");
		if not T then
			return;
		end;
		if not R then
			local function Y(Y, z)
				local u = T:FindFirstChild(Y);
				if u then
					local Y = u:FindFirstChild(z);
					if Y and Y:IsA("Animation") then
						local z = Y.AnimationId:match("%d+");
						if z then
							return tonumber(z);
						end;
					end;
				end;
				return nil;
			end;
			R = {
					Idle = Y("idle", "Animation1") or 507766666,
					Idle2 = Y("idle", "Animation2") or 507766951,
					Walk = Y("walk", "WalkAnim") or 507777826,
					Run = Y("run", "RunAnim") or 507767714,
					Jump = Y("jump", "JumpAnim") or 507765000,
					Climb = Y("climb", "ClimbAnim") or 507765644,
					Fall = Y("fall", "FallAnim") or 507767968,
					Swim = Y("swim", "Swim") or 507784897,
					SwimIdle = Y("swimidle", "SwimIdle") or 507785072,
				};
		end;
		T.Disabled = true;
		task.wait(.1);
		local function X(Y, z, u)
			if not u then
				return;
			end;
			local X = T:FindFirstChild(Y);
			if X then
				local Y = X:FindFirstChild(z);
				if Y and Y:IsA("Animation") then
					Y.AnimationId = "rbxassetid://" .. tostring(u);
				end;
			end;
		end;
		X("idle", "Animation1", Y.Idle);
		X("idle", "Animation2", Y.Idle2 or Y.Idle);
		X("walk", "WalkAnim", Y.Walk);
		X("run", "RunAnim", Y.Run);
		X("jump", "JumpAnim", Y.Jump);
		X("climb", "ClimbAnim", Y.Climb);
		X("fall", "FallAnim", Y.Fall);
		X("swim", "Swim", Y.Swim);
		X("swimidle", "SwimIdle", Y.SwimIdle or Y.Swim);
		task.wait(.1);
		T.Disabled = false;
		local K = u:FindFirstChildOfClass("Humanoid");
		if K then
			K:ChangeState(Enum.HumanoidStateType.Landed);
			task.wait(.05);
			K:ChangeState(Enum.HumanoidStateType.Running);
		end;
	end;
	local T = false;
	F = function()
			if T or not L then
				return;
			end;
			T = true;
			task.spawn(function()
				while L do
					task.wait(.2);
					if not L then
						break;
					end;
					local Y = y.Character;
					if not Y then
						continue;
					end;
					local z = Y:FindFirstChildOfClass("Humanoid");
					if not z then
						continue;
					end;
					if z.Health <= 0 then
						continue;
					end;
					if z.MoveDirection.Magnitude >= .1 then
						continue;
					end;
					local u = Y:FindFirstChild("Animate");
					if not u then
						continue;
					end;
					local T = {};
					local X = u:FindFirstChild("walk");
					local K = u:FindFirstChild("run");
					if X then
						for Y, z in ipairs(X:GetChildren()) do
							if z:IsA("Animation") then
								table.insert(T, z.AnimationId);
							end;
						end;
					end;
					if K then
						for Y, z in ipairs(K:GetChildren()) do
							if z:IsA("Animation") then
								table.insert(T, z.AnimationId);
							end;
						end;
					end;
					if #T == 0 then
						continue;
					end;
					local j = z:FindFirstChildOfClass("Animator");
					if j then
						for Y, z in ipairs(j:GetPlayingAnimationTracks()) do
							if z.Animation and table.find(T, z.Animation.AnimationId) then
								z:Stop(0);
							end;
						end;
					end;
				end;
				T = false;
			end);
		end;
	y.CharacterAdded:Connect(function()
		if L then
			task.spawn(function()
				task.wait(.8);
				u(L);
			end);
		end;
	end);
	local X = { "Ninguno" };
	for Y, z in pairs(Y) do
		table.insert(X, Y);
	end;
	table.sort(X);
	jc.Animaciones:Section({ Title = "Paquetes Completos", Icon = "solar:folder-with-files-bold" });
	local K = "Ninguno";
	jc.Animaciones:Dropdown({
		Title = "Elegir Paquete",
		Values = X,
		Value = "Ninguno",
		Callback = function(Y)
			K = Y;
		end,
	});
	jc.Animaciones:Button({ Title = "Aplicar Paquete Completo", Callback = function()
			if K == "Ninguno" then
				return;
			end;
			task.spawn(function()
				L = Y[K];
				F();
				u(L);
			end);
		end });
	jc.Animaciones:Button({ Title = "Restaurar Default", Callback = function()
			task.spawn(function()
				local Y = R or {
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
				L = nil;
				u(Y);
			end);
		end });
	jc.Animaciones:Space();
	jc.Animaciones:Divider();
	jc.Animaciones:Space();
	jc.Animaciones:Section({ Title = "Mezclador de Animaciones", Icon = "solar:layers-bold" });
	local j = {
			Idle = "Ninguno",
			Walk = "Ninguno",
			Run = "Ninguno",
			Jump = "Ninguno",
			Fall = "Ninguno",
			Climb = "Ninguno",
		};
	jc.Animaciones:Dropdown({
		Title = "Reposo",
		Values = X,
		Value = "Ninguno",
		Callback = function(Y)
			j.Idle = Y;
		end,
	});
	jc.Animaciones:Dropdown({
		Title = "Caminar",
		Values = X,
		Value = "Ninguno",
		Callback = function(Y)
			j.Walk = Y;
		end,
	});
	jc.Animaciones:Dropdown({
		Title = "Correr",
		Values = X,
		Value = "Ninguno",
		Callback = function(Y)
			j.Run = Y;
		end,
	});
	jc.Animaciones:Dropdown({
		Title = "Saltar",
		Values = X,
		Value = "Ninguno",
		Callback = function(Y)
			j.Jump = Y;
		end,
	});
	jc.Animaciones:Dropdown({
		Title = "Caer",
		Values = X,
		Value = "Ninguno",
		Callback = function(Y)
			j.Fall = Y;
		end,
	});
	jc.Animaciones:Dropdown({
		Title = "Escalar",
		Values = X,
		Value = "Ninguno",
		Callback = function(Y)
			j.Climb = Y;
		end,
	});
	jc.Animaciones:Button({ Title = "Combinar y Aplicar", Callback = function()
			task.spawn(function()
				local z = {};
				if j.Idle ~= "Ninguno" then
					z.Idle = Y[j.Idle].Idle;
					z.Idle2 = Y[j.Idle].Idle2;
				end;
				if j.Walk ~= "Ninguno" then
					z.Walk = Y[j.Walk].Walk;
				end;
				if j.Run ~= "Ninguno" then
					z.Run = Y[j.Run].Run;
				end;
				if j.Jump ~= "Ninguno" then
					z.Jump = Y[j.Jump].Jump;
				end;
				if j.Fall ~= "Ninguno" then
					z.Fall = Y[j.Fall].Fall;
				end;
				if j.Climb ~= "Ninguno" then
					z.Climb = Y[j.Climb].Climb;
				end;
				local T = false;
				for Y, z in pairs(z) do
					if z then
						T = true;
						break;
					end;
				end;
				if T then
					L = z;
					F();
					u(L);
				end;
			end);
		end });
end;
local bc = 1;
local kc = Instance.new("Sound");
kc.Name = "NexvyrKillSound";
kc.Volume = 1;
kc.Looped = false;
kc.Parent = j;
local gc = Instance.new("Sound");
gc.Name = "NexvyrShootSound";
gc.Volume = 1;
gc.Looped = false;
gc.Parent = j;
local Mc = Instance.new("Sound");
Mc.Name = "NexvyrReloadSound";
Mc.Volume = 1;
Mc.Looped = false;
Mc.Parent = j;
do
	local z = game:GetService("ContentProvider");
	local function u(Y)
		if not Y then
			return;
		end;
		for z = #Y, 1, -1 do
			local u = Y[z];
			Y[z] = nil;
			if u and u.Connected then
				u:Disconnect();
			end;
		end;
	end;
	local X = false;
	local K = false;
	local j = "Onichaaan";
	local B = {
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
	local S = { ["Revolver + Recarga"] = { Shoot = "680140087", Reload = "138084889" }, ["Magia de Anime"] = { Shoot = "109296938403067", Reload = nil }, ["L\195\161ser + Recarga l\195\161ser"] = { Shoot = "4400449399", Reload = "129456040607483" } };
	local l = "Revolver + Recarga";
	local v = 1.5;
	local x = 0;
	local c = 0;
	local V = .05;
	local function N()
		if not K then
			return;
		end;
		local Y = S[l];
		if not Y or not Y.Shoot then
			return;
		end;
		local z = tick();
		if z - c < V then
			return;
		end;
		c = z;
		x = x + 1;
		local u = x;
		gc:Stop();
		gc.SoundId = "rbxassetid://" .. Y.Shoot;
		gc.Volume = bc;
		gc:Play();
		task.delay(v, function()
			if x == u and gc.Playing then
				gc:Stop();
			end;
		end);
	end;
	local function n()
		if not K then
			return;
		end;
		local Y = S[l];
		if not Y or not Y.Reload then
			return;
		end;
		Mc:Stop();
		Mc.SoundId = "rbxassetid://" .. Y.Reload;
		Mc.Volume = bc;
		Mc:Play();
	end;
	local P = {};
	local t = setmetatable({}, { __mode = "k" });
	local o = setmetatable({}, { __mode = "k" });
	local J = setmetatable({}, { __mode = "k" });
	local function s(Y)
		P[#P + 1] = Y;
		return Y;
	end;
	local function D()
		u(P);
		table.clear(t);
		table.clear(o);
		table.clear(J);
	end;
	local p;
	local b = {
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
	local function k(Y)
		if not Y:IsA("Sound") then
			return false;
		end;
		local z = string.lower(Y.Name);
		for Y, u in ipairs(b) do
			if string.find(z, u, 1, true) then
				return true;
			end;
		end;
		return false;
	end;
	local function g(Y)
		if not Y:IsA("Sound") then
			return;
		end;
		if not k(Y) then
			return;
		end;
		if not K or t[Y] then
			return;
		end;
		t[Y] = true;
		s(Y.Played:Connect(function()
			if not K then
				return;
			end;
			local z = y.Character;
			if not z then
				return;
			end;
			if Y:IsDescendantOf(z) or Y:IsDescendantOf(y:FindFirstChildOfClass("Backpack") or z) then
				N();
			end;
		end));
	end;
	local function M(Y)
		if not Y or not Y:IsA("Tool") then
			return;
		end;
		for Y, z in ipairs(Y:GetDescendants()) do
			g(z);
		end;
		if not o[Y] and K then
			o[Y] = true;
			s(Y.DescendantAdded:Connect(g));
		end;
	end;
	local function r(Y)
		if not Y then
			return;
		end;
		for Y, z in ipairs(Y:GetChildren()) do
			if z:IsA("Tool") then
				M(z);
			end;
		end;
		s(Y.ChildAdded:Connect(function(Y)
			if Y:IsA("Tool") then
				M(Y);
			end;
		end));
	end;
	local L = false;
	p = function()
			if L or not K then
				return;
			end;
			L = true;
			task.spawn(function()
				local Y = false;
				while K do
					task.wait(.05);
					if not K then
						break;
					end;
					local z = y.Character;
					if not z then
						Y = false;
						continue;
					end;
					local u = z:FindFirstChildOfClass("Tool");
					if not u or vc(u) then
						Y = false;
						continue;
					end;
					local T = Vc(u);
					if T and not Y then
						n();
					end;
					Y = T;
				end;
				L = false;
			end);
		end;
	local function R(Y)
		for z, u in ipairs(B) do
			if u.Name == Y then
				return u.Id;
			end;
		end;
		return B[1].Id;
	end;
	local function w()
		task.spawn(function()
			pcall(function()
				local Y = "rbxassetid://" .. R(j);
				if kc.SoundId ~= Y then
					kc.SoundId = Y;
				end;
				z:PreloadAsync({ kc });
			end);
		end);
	end;
	local function Q()
		if not X then
			return;
		end;
		local Y = "rbxassetid://" .. R(j);
		kc:Stop();
		if kc.SoundId ~= Y then
			kc.SoundId = Y;
		end;
		kc.Volume = bc;
		kc.TimePosition = 0;
		kc:Play();
	end;
	local m = 0;
	local E = 0;
	local h = .08;
	local a = .3;
	local Z = 4;
	local function O(Y)
		if not X then
			return;
		end;
		local z = tick();
		if Y then
			if z - m < a then
				return;
			end;
			E = z;
		else
			if z - m < h then
				return;
			end;
			if z - E < Z then
				return;
			end;
		end;
		m = z;
		Q();
	end;
	local F = {};
	local W = setmetatable({}, { __mode = "k" });
	local e = setmetatable({}, { __mode = "k" });
	local f = setmetatable({}, { __mode = "k" });
	local q = setmetatable({}, { __mode = "k" });
	local I = 0;
	local function C(Y)
		F[#F + 1] = Y;
		return Y;
	end;
	local d = {
			kos = true,
			kills = true,
			kill = true,
			ko = true,
			killed = true,
			eliminations = true,
			kills_count = true,
		};
	local function i(Y)
		if not Y then
			return;
		end;
		if not ((Y:IsA("IntValue") or Y:IsA("NumberValue"))) then
			return;
		end;
		if not d[string.lower(Y.Name)] then
			return;
		end;
		if not X or W[Y] then
			return;
		end;
		W[Y] = true;
		local z = Y.Value;
		C((Y:GetPropertyChangedSignal("Value")):Connect(function()
			if Y.Value > z then
				O();
			end;
			z = Y.Value;
		end));
	end;
	local function U(Y)
		if not Y or not X or q[Y] then
			return;
		end;
		q[Y] = true;
		for Y, z in ipairs(Y:GetChildren()) do
			i(z);
		end;
		C(Y.ChildAdded:Connect(i));
	end;
	local H = {
			"KOs",
			"Kills",
			"kos",
			"kills",
			"KO",
			"killed",
			"Eliminations",
		};
	local function G()
		for Y, z in ipairs(H) do
			local u = tonumber(y:GetAttribute(z));
			C((y:GetAttributeChangedSignal(z)):Connect(function()
				local Y = tonumber(y:GetAttribute(z));
				if Y ~= nil and (u ~= nil and Y > u) then
					O();
				end;
				u = Y;
			end));
		end;
		for Y, z in ipairs({
			"leaderstats",
			"Stats",
			"stats",
			"PlayerStats",
		}) do
			U(y:FindFirstChild(z));
		end;
		C(y.ChildAdded:Connect(function(Y)
			if Y.Name == "leaderstats" or Y.Name == "Stats" or Y.Name == "stats" or Y.Name == "PlayerStats" then
				U(Y);
			end;
		end));
	end;
	local function Yc(Y, z)
		if not X or e[z] then
			return;
		end;
		e[z] = true;
		local u;
		local function T(Y)
			if not X or not Y or not Y:IsA("Humanoid") then
				return;
			end;
			if u then
				u:Disconnect();
				u = nil;
			end;
			C(Y.Died:Connect(function()
				if not X then
					return;
				end;
				local z = Y:FindFirstChild("creator");
				if z and z.Value == y then
					O();
				end;
			end));
		end;
		local K = z:FindFirstChildOfClass("Humanoid");
		if K then
			T(K);
		else
			u = C(z.ChildAdded:Connect(T));
		end;
	end;
	local function zc(Y)
		if Y == y or not X or f[Y] then
			return;
		end;
		f[Y] = true;
		if Y.Character then
			Yc(Y, Y.Character);
		end;
		C(Y.CharacterAdded:Connect(function(z)
			Yc(Y, z);
		end));
	end;
	local function uc()
		I = I + (1);
		local Y = I;
		task.spawn(function()
			local z = 0;
			while X and (Y == I and z < 30) do
				local Y = T:FindFirstChild("Packages");
				local u = Y and Y:FindFirstChild("Networking");
				local X = u and u:FindFirstChild("RE/Combat/Killed");
				if X and X:IsA("RemoteEvent") then
					C(X.OnClientEvent:Connect(function(Y)
						if Y == y then
							O(true);
						end;
					end));
					return;
				end;
				z = z + (1);
				task.wait(1);
			end;
		end);
	end;
	local function Tc()
		if not X then
			return;
		end;
		uc();
		G();
		for Y, z in ipairs(Y:GetPlayers()) do
			zc(z);
		end;
		C(Y.PlayerAdded:Connect(zc));
	end;
	local function Xc()
		I = I + (1);
		u(F);
		table.clear(W);
		table.clear(e);
		table.clear(f);
		table.clear(q);
	end;
	local Kc = {};
	local yc = setmetatable({}, { __mode = "k" });
	local function Bc(Y)
		if not K or not Y:IsA("Sound") then
			return;
		end;
		if Y.Name == "NexvyrKillSound" or Y.Name == "WindUI_MusicPlayer" or Y.Name == "NexvyrShootSound" or Y.Name == "NexvyrReloadSound" then
			return;
		end;
		if Kc[Y] == nil and Y.Volume > 0 then
			Kc[Y] = Y.Volume;
		end;
		if K then
			Y.Volume = 0;
		end;
		if not yc[Y] then
			yc[Y] = true;
			s((Y:GetPropertyChangedSignal("Volume")):Connect(function()
				if K and Y.Volume ~= 0 then
					Kc[Y] = Y.Volume;
					Y.Volume = 0;
				end;
			end));
			s(Y.Played:Connect(function()
				if K then
					Y.Volume = 0;
				end;
			end));
		end;
	end;
	local function Sc(Y)
		if not Y then
			return;
		end;
		for Y, z in ipairs(Y:GetDescendants()) do
			Bc(z);
		end;
		s(Y.DescendantAdded:Connect(Bc));
	end;
	local function lc(Y)
		if Y then
			for Y in pairs(Kc) do
				if Y.Parent then
					Y.Volume = 0;
				end;
			end;
			if y.Character then
				for Y, z in ipairs(y.Character:GetDescendants()) do
					Bc(z);
				end;
			end;
			local Y = y:FindFirstChildOfClass("Backpack");
			if Y then
				for Y, z in ipairs(Y:GetDescendants()) do
					Bc(z);
				end;
			end;
		else
			for Y, z in pairs(Kc) do
				if Y.Parent then
					Y.Volume = z;
				end;
			end;
		end;
	end;
	local function xc()
		if not K then
			return;
		end;
		local function Y(Y)
			if not Y or not K or J[Y] then
				return;
			end;
			J[Y] = true;
			Sc(Y);
			r(Y);
		end;
		Y(y.Character);
		Y(y:FindFirstChildOfClass("Backpack"));
		s(y.CharacterAdded:Connect(function(z)
			if not K then
				return;
			end;
			Y(z);
			local u = y:FindFirstChildOfClass("Backpack");
			if u then
				Y(u);
			end;
		end));
		s(y.ChildAdded:Connect(function(z)
			if z:IsA("Backpack") then
				Y(z);
			end;
		end));
		p();
	end;
	jc.Sonidos:Section({ Title = "Sonido de Muerte", Icon = "solar:speaker-bold" });
	jc.Sonidos:Toggle({ Title = "Sonido de Kill", Value = false, Callback = function(Y)
			if X == Y then
				return;
			end;
			X = Y;
			if Y then
				w();
				Tc();
			else
				Xc();
				kc:Stop();
			end;
		end });
	local cc = {};
	for Y, z in ipairs(B) do
		table.insert(cc, z.Name);
	end;
	jc.Sonidos:Dropdown({
		Title = "Sonido de muerte",
		Values = cc,
		Value = "Onichaaan",
		Callback = function(Y)
			j = Y;
			if X then
				w();
			end;
		end,
	});
	jc.Sonidos:Section({ Title = "Disparo y Recarga", Icon = "solar:target-bold" });
	jc.Sonidos:Toggle({ Title = "Recarga + disparo", Value = false, Callback = function(Y)
			if K == Y then
				return;
			end;
			K = Y;
			if Y then
				xc();
				lc(true);
			else
				D();
				gc:Stop();
				Mc:Stop();
				lc(false);
				table.clear(Kc);
				table.clear(yc);
			end;
		end });
	jc.Sonidos:Dropdown({
		Title = "Sonido de disparo",
		Values = { "Revolver + Recarga", "Magia de Anime", "L\195\161ser + Recarga l\195\161ser" },
		Value = "Revolver + Recarga",
		Callback = function(Y)
			l = Y;
		end,
	});
	A.SliKillSoundVolume = jc.Sonidos:Slider({
			Title = "Volumen",
			Step = .1,
			Value = { Min = 1, Max = 3, Default = 1 },
			Callback = function(Y)
				bc = Y;
				kc.Volume = Y;
				gc.Volume = Y;
				Mc.Volume = Y;
			end,
		});
end;
do
	local Y = Instance.new("Sound");
	Y.Name = "WindUI_MusicPlayer";
	Y.Looped = false;
	Y.Volume = .5;
	Y.Parent = j;
	local z = {
			{ Name = "Canci\195\179n 1", Id = "84944985070181" },
			{ Name = "Canci\195\179n 2", Id = "87570666848900" },
			{ Name = "Canci\195\179n 3", Id = "82746224492420" },
			{ Name = "Canci\195\179n 4", Id = "71393805905055" },
			{ Name = "Canci\195\179n 5", Id = "75688616622595" },
			{ Name = "Canci\195\179n 6", Id = "135609653444873" },
			{ Name = "Canci\195\179n 7", Id = "93699644879957" },
			{ Name = "Canci\195\179n 8", Id = "110398343528156" },
			{ Name = "Canci\195\179n 9", Id = "138863509657081" },
			{ Name = "Canci\195\179n 10", Id = "115440201770223" },
			{ Name = "Canci\195\179n 11", Id = "128048502331483" },
			{ Name = "Canci\195\179n 12", Id = "135321902579514" },
			{ Name = "Canci\195\179n 13", Id = "131465489873214" },
		};
	local u = 1;
	local T = false;
	local X;
	local function K()
		local T = z[u];
		if T and X then
			X:SetDesc((("%s \226\128\162 ID: %s \226\128\162 %s")):format(T.Name, T.Id, Y.Playing and "Reproduciendo" or "Pausado"));
		end;
	end;
	local function y(T)
		if not z[T] then
			return;
		end;
		u = T;
		Y:Stop();
		Y.SoundId = "rbxassetid://" .. z[T].Id;
		Y:Play();
		K();
	end;
	local function B()
		if Y.SoundId == "" then
			y(u);
		elseif not Y.Playing then
			Y:Resume();
		end;
		K();
	end;
	local function S()
		if Y.Playing then
			Y:Pause();
		end;
		K();
	end;
	local function l()
		Y:Stop();
		Y.SoundId = "";
		K();
	end;
	local function v()
		local Y;
		if T then
			Y = math.random(1, #z);
		else
			Y = u + 1;
			if Y > #z then
				Y = 1;
			end;
		end;
		y(Y);
	end;
	local function x()
		local Y;
		if T then
			Y = math.random(1, #z);
		else
			Y = u - 1;
			if Y < 1 then
				Y = #z;
			end;
		end;
		y(Y);
	end;
	Y.Ended:Connect(function()
		v();
	end);
	jc.Music:Section({ Title = "Ahora suena", Icon = "solar:music-note-bold" });
	X = jc.Music:Paragraph({ Title = "Sin canci\195\179n seleccionada", Icon = "solar:music-note-2-bold" });
	jc.Music:Section({ Title = "Controles", Icon = "solar:tuning-2-bold" });
	jc.Music:Button({
		Title = "Anterior",
		Icon = "solar:skip-previous-bold",
		Variant = "Secondary",
		Callback = function()
			x();
		end,
	});
	jc.Music:Button({
		Title = "Siguiente",
		Icon = "solar:skip-next-bold",
		Variant = "Secondary",
		Callback = function()
			v();
		end,
	});
	jc.Music:Button({
		Title = "Reproducir",
		Icon = "solar:play-circle-bold",
		Variant = "Primary",
		Callback = function()
			B();
		end,
	});
	jc.Music:Button({
		Title = "Pausar",
		Icon = "solar:pause-circle-bold",
		Variant = "Secondary",
		Callback = function()
			S();
		end,
	});
	jc.Music:Button({
		Title = "Detener",
		Icon = "solar:close-circle-bold",
		Variant = "Danger",
		Callback = function()
			l();
		end,
	});
end;
local rc = false;
local Lc = false;
local Rc, Ac, wc;
do
	local Y = { ["Right Leg"] = {
				id = "rbxassetid://139607718",
				targetBodyPart = "RightUpperLeg",
				partsToHide = { "RightUpperLeg", "RightLowerLeg", "RightFoot" },
				scale = Vector3.new(1, 1, 1),
				audio = "rbxassetid://135315310485417",
				offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
			} };
	local z = {};
	local function u(Y, u)
		local T = y.Character;
		if not T then
			return false;
		end;
		local X = T:WaitForChild(u.targetBodyPart, 2);
		if not X then
			return false;
		end;
		local K = T:FindFirstChild("Korblox_" .. Y:gsub("%s+", ""));
		if K then
			K:Destroy();
		end;
		for Y, u in ipairs(u.partsToHide) do
			local X = T:FindFirstChild(u);
			if X and X:IsA("BasePart") then
				if z[u] == nil then
					z[u] = X.Transparency;
				end;
				X.Transparency = 1;
			end;
		end;
		local j, B = pcall(function()
				return game:GetObjects(u.id);
			end);
		if not j or not B or #B == 0 then
			return false;
		end;
		local S = B[1];
		S.Name = "Korblox_" .. Y:gsub("%s+", "");
		local l = S:IsA("BasePart") and S or S:FindFirstChildWhichIsA("BasePart", true);
		if not l then
			return false;
		end;
		l.Size = l.Size * u.scale;
		l.CanCollide = false;
		l.CFrame = X.CFrame * u.offset;
		local v = Instance.new("WeldConstraint");
		v.Part0 = X;
		v.Part1 = l;
		v.Parent = l;
		S.Parent = T;
		if u.audio then
			local Y = Instance.new("Sound");
			Y.SoundId = u.audio;
			Y.Volume = .5;
			Y.Parent = l;
			Y:Play();
			(game:GetService("Debris")):AddItem(Y, 3);
		end;
		return true;
	end;
	function Rc()
		if not rc then
			return;
		end;
		local z = Y["Right Leg"];
		local T = u("Right Leg", z);
		if not T then
			task.wait(.2);
			u("Right Leg", z);
		end;
	end;
	function Ac()
		local Y = y.Character;
		if not Y then
			return;
		end;
		local u = "Korblox_RightLeg";
		local T = Y:FindFirstChild(u);
		if T then
			pcall(function()
				T:Destroy();
			end);
		end;
		for z, u in pairs(z) do
			local T = Y:FindFirstChild(z);
			if T and T:IsA("BasePart") then
				pcall(function()
					T.Transparency = u;
				end);
			end;
		end;
		z = {};
	end;
	local T = 134082579;
	local X = nil;
	local function K(Y)
		local z = y.Character;
		if not z then
			return;
		end;
		local u = z:FindFirstChild("Head");
		if u then
			u.Transparency = Y and 1 or 0;
			local z = u:FindFirstChildOfClass("Decal");
			if z then
				z.Transparency = Y and 1 or 0;
			end;
		end;
	end;
	function wc(Y)
		local z = y.Character;
		if not z then
			return;
		end;
		if Y then
			z:WaitForChild("Head", 2);
			K(true);
			if X and X.Parent ~= z then
				X = nil;
			end;
			if X then
				return;
			end;
			local Y, u = pcall(function()
					return game:GetObjects("rbxassetid://" .. tostring(T));
				end);
			if Y and (u and #u > 0) then
				local Y = u[1];
				local T = nil;
				if Y:IsA("Accessory") then
					T = Y;
				else
					for Y, z in ipairs(Y:GetDescendants()) do
						if z:IsA("Accessory") then
							T = z;
							break;
						end;
					end;
					T = T or (Y:IsA("Model") and Y or nil);
				end;
				if T then
					if T:IsA("Accessory") then
						local Y = z:FindFirstChildOfClass("Humanoid");
						local u = Y and pcall(function()
								Y:AddAccessory(T);
							end);
						if not u then
							T.Parent = z;
						end;
					else
						T.Parent = z;
					end;
					X = T;
				end;
			else
				warn("[Headless] Failed to load headless asset: " .. tostring(u));
			end;
		else
			K(false);
			if X then
				X:Destroy();
				X = nil;
			end;
		end;
	end;
	y.CharacterAdded:Connect(function(Y)
		z = {};
		X = nil;
		if rc then
			task.spawn(function()
				task.wait(.1);
				Rc();
			end);
		end;
		if Lc then
			task.spawn(function()
				task.wait(.1);
				wc(true);
			end);
		end;
	end);
	jc.Items:Section({ Title = "Apariencia", Icon = "solar:crown-star-bold" });
	A.TogHeadless = jc.Items:Toggle({ Title = "Aplicar Headless", Value = false, Callback = function(Y)
				Lc = Y;
				if Y then
					wc(true);
				else
					wc(false);
				end;
			end });
	A.TogKorblox = jc.Items:Toggle({ Title = "Aplicar Korblox", Value = false, Callback = function(Y)
				rc = Y;
				if Y then
					Rc();
				else
					Ac();
				end;
			end });
end;
jc.Identidad:Section({ Title = "identidad falsa", Icon = "solar:user-id-bold" });
local Qc;
do
	local function z(Y, z, u)
		local T = z:gsub("[%-%^%$%(%)%%%.%[%]%*%+%?]", "%%%1");
		return (Y:gsub(T, u));
	end;
	local u = {};
	local T = {};
	local X = setmetatable({}, { __mode = "k" });
	local K = false;
	local function j(Y, T, X)
		local K = Y:FindFirstAncestorWhichIsA("ScreenGui");
		if K and ((string.find(K.Name, "WindUI") or string.find(K.Name, "Nexvyr"))) then
			return;
		end;
		if Y:IsA("TextLabel") or Y:IsA("TextBox") or Y:IsA("TextButton") then
			local K = Y.Text;
			local j = false;
			if K and K ~= "" then
				if string.find(K, T, 1, true) or string.find(K, X, 1, true) then
					j = true;
				end;
			end;
			if j and not u[Y] then
				u[Y] = {
						Text = K,
						Color = Y.TextColor3,
						TextTransp = Y.TextTransparency,
						StrokeTransp = Y.TextStrokeTransparency,
						Strokes = {},
					};
				for z, T in pairs(Y:GetChildren()) do
					if T:IsA("UIStroke") then
						u[Y].Strokes[T] = { Enabled = T.Enabled, Transp = T.Transparency, Thickness = T.Thickness };
					end;
				end;
			end;
			if u[Y] then
				if g then
					local K = u[Y].Text;
					K = z(K, T, M);
					K = z(K, X, M);
					Y.Text = K;
					Y.TextTransparency = u[Y].TextTransp;
					Y.TextStrokeTransparency = u[Y].StrokeTransp;
					Y.TextColor3 = u[Y].Color;
					for z, T in pairs(Y:GetChildren()) do
						if T:IsA("UIStroke") and u[Y].Strokes[T] then
							T.Enabled = u[Y].Strokes[T].Enabled;
						end;
					end;
				else
					Y.Text = u[Y].Text;
					Y.TextColor3 = u[Y].Color;
					Y.TextTransparency = u[Y].TextTransp;
					Y.TextStrokeTransparency = u[Y].StrokeTransp;
					for z, T in pairs(Y:GetChildren()) do
						if T:IsA("UIStroke") and u[Y].Strokes[T] then
							T.Enabled = u[Y].Strokes[T].Enabled;
							T.Transparency = u[Y].Strokes[T].Transp;
							T.Thickness = u[Y].Strokes[T].Thickness;
						end;
					end;
				end;
			end;
		end;
	end;
	function Qc()
		local z = y.Name;
		local B = y.DisplayName;
		task.spawn(function()
			for Y, u in pairs(Y:GetPlayers()) do
				if u.Character then
					for Y, u in pairs(u.Character:GetDescendants()) do
						if u:IsA("TextLabel") or u:IsA("TextBox") or u:IsA("TextButton") then
							j(u, z, B);
						end;
					end;
				end;
			end;
			local u = y:FindFirstChild("PlayerGui");
			if u then
				for Y, u in pairs(u:GetDescendants()) do
					if u:IsA("TextLabel") or u:IsA("TextBox") or u:IsA("TextButton") then
						j(u, z, B);
					end;
				end;
			end;
		end);
		if g then
			if not K then
				K = true;
				local function Y(Y)
					local y = Y:FindFirstAncestorWhichIsA("ScreenGui");
					if y and ((string.find(y.Name, "WindUI") or string.find(y.Name, "Nexvyr"))) then
						return;
					end;
					if Y:IsA("TextLabel") or Y:IsA("TextBox") or Y:IsA("TextButton") then
						j(Y, z, B);
						if not X[Y] then
							X[Y] = true;
							table.insert(T, (Y:GetPropertyChangedSignal("Text")):Connect(function()
								if K and (Y.Text ~= M and not string.find(Y.Text, M)) then
									u[Y] = nil;
									j(Y, z, B);
								end;
							end));
						end;
					end;
				end;
				local S = y:FindFirstChild("PlayerGui");
				if S then
					table.insert(T, S.DescendantAdded:Connect(function(z)
						if K and ((z:IsA("TextLabel") or z:IsA("TextBox") or z:IsA("TextButton"))) then
							task.spawn(function()
								Y(z);
							end);
						end;
					end));
				end;
				local l, v = pcall(function()
						return game:GetService("CoreGui");
					end);
				if l and v then
					table.insert(T, v.DescendantAdded:Connect(function(z)
						if K and ((z:IsA("TextLabel") or z:IsA("TextBox") or z:IsA("TextButton"))) then
							task.spawn(function()
								Y(z);
							end);
						end;
					end));
				end;
			end;
		else
			K = false;
			for Y, z in ipairs(T) do
				z:Disconnect();
			end;
			T = {};
			table.clear(X);
			for Y, z in pairs(u) do
				if Y and Y.Parent then
					Y.Text = z.Text;
					Y.TextColor3 = z.Color;
					Y.TextTransparency = z.TextTransp;
					Y.TextStrokeTransparency = z.StrokeTransp;
					for Y, z in pairs(z.Strokes) do
						if Y and Y.Parent then
							Y.Enabled = z.Enabled;
							Y.Transparency = z.Transp;
							Y.Thickness = z.Thickness;
						end;
					end;
				end;
			end;
			u = {};
		end;
	end;
	A.TogFakeName = jc.Identidad:Toggle({ Title = "Activar Nombre Falso", Value = false, Callback = function(Y)
				g = Y;
				Qc();
			end });
	A.InpFakeName = jc.Identidad:Input({ Title = "Nuevo Nombre", Placeholder = "Escribe tu nombre falso...", Callback = function(Y)
				if Y ~= "" then
					M = Y;
					if g then
						Qc();
					end;
				end;
			end });
	y.CharacterAdded:Connect(function()
		if g then
			task.wait(1);
			Qc();
		end;
	end);
end;
do
	local Y = "UzivertHub_Configs_WindUI";
	if isfolder and not isfolder(Y) then
		pcall(function()
			makefolder(Y);
		end);
	end;
	local z = { "Ninguna" };
	local u = "Ninguna";
	local T = "";
	jc.Guardado:Section({ Title = "Gestor de Configs", Icon = "solar:diskette-bold" });
	local K = jc.Guardado:Dropdown({
			Title = "Seleccionar Configuraci\195\179n",
			Values = z,
			Value = "Ninguna",
			Callback = function(Y)
				u = Y;
			end,
		});
	local function j()
		local z = {};
		if listfiles then
			pcall(function()
				for Y, u in ipairs(listfiles(Y)) do
					if u:match("%.json$") then
						local Y = u:match("([^/\\]+)%.json$");
						if Y then
							table.insert(z, Y);
						end;
					end;
				end;
			end);
		end;
		if #z == 0 then
			table.insert(z, "Ninguna");
		end;
		pcall(function()
			K:Refresh(z);
			if u == "Ninguna" or not table.find(z, u) then
				K:Select(z[1]);
				u = z[1];
			end;
		end);
	end;
	jc.Guardado:Button({
		Title = "Actualizar Lista",
		Icon = "solar:refresh-bold",
		Variant = "Secondary",
		Callback = function()
			j();
		end,
	});
	jc.Guardado:Input({
		Title = "Nombre para Guardar",
		Placeholder = "Ej: Config 1, Config 2...",
		Icon = "solar:text-field-bold",
		Callback = function(Y)
			T = Y;
		end,
	});
	local y = false;
	local B = 0;
	jc.Guardado:Button({
		Title = "Eliminar todos los guardados",
		Icon = "solar:trash-bin-trash-bold",
		Variant = "Danger",
		Callback = function()
			local z = os.clock();
			if y and (z - B) < 4 then
				y = false;
				if listfiles then
					pcall(function()
						for Y, z in ipairs(listfiles(Y)) do
							if z:match("%.json$") then
								pcall(function()
									delfile(z);
								end);
							end;
						end;
					end);
				end;
				j();
			else
				y = true;
				B = z;
			end;
		end,
	});
	local function c(Y, z)
		if not Y or z == nil then
			return;
		end;
		pcall(function()
			Y:Set(z);
		end);
	end;
	jc.Guardado:Button({
		Title = "Guardar Configuraci\195\179n",
		Icon = "solar:diskette-bold",
		Variant = "Primary",
		Callback = function()
			local z = T:gsub("[^%w%s%-]", "");
			if z == "" then
				z = u;
			end;
			if z == "" or z == "Ninguna" then
				return;
			end;
			local y = Y .. ("/" .. (z .. ".json"));
			local B = {
					ConfigName = z,
					Toggles = {
						["Auto Shoot"] = v,
						["Auto Shoot Agresivo"] = x,
						["Equipar pistola"] = e,
						["Silent Aim (Manual)"] = V,
						["Silent Aim (FOV)"] = N,
						["Mostrar C\195\173rculo FOV"] = S,
						["Team Check"] = P,
						["ESP Jugadores"] = t,
						["ESP Glow"] = J.Glow,
						["Kill All"] = s,
						["Hitbox Activar"] = D,
						["Hitbox Invisible"] = p,
						Headless = Lc,
						Korblox = rc,
						["Nombre Falso"] = g,
						Invisible = r,
					},
					Sliders = {
						["Tama\195\177o del FOV"] = l,
						["Tama\195\177o de Hitbox"] = b,
						["Volumen Kill Sound"] = bc,
						["Ajuste Speed"] = Jc,
						["Ajuste Salto"] = sc,
					},
					Colors = { ["Color de Hitbox"] = { R = k.R, G = k.G, B = k.B }, ["Color del ESP"] = { R = o.R, G = o.G, B = o.B } },
					Extras = { ["Parte Silent Aim"] = n, ["Nombre Falso Texto"] = M },
				};
			if writefile then
				local Y, u = pcall(function()
						return X:JSONEncode(B);
					end);
				if Y then
					pcall(function()
						writefile(y, u);
					end);
					j();
					pcall(function()
						K:Select(z);
					end);
				end;
			end;
		end,
	});
	jc.Guardado:Button({
		Title = "Cargar Configuraci\195\179n",
		Icon = "solar:folder-open-bold",
		Variant = "Primary",
		Callback = function()
			if u == "Ninguna" or u == "" then
				return;
			end;
			local z = Y .. ("/" .. (u .. ".json"));
			if isfile and isfile(z) then
				local Y, u = pcall(function()
						return X:JSONDecode(readfile(z));
					end);
				if Y and type(u) == "table" then
					if u.Toggles then
						if u.Toggles["Auto Shoot"] ~= nil then
							v = u.Toggles["Auto Shoot"];
							c(A.TogAutoShoot, v);
						end;
						if u.Toggles["Auto Shoot Agresivo"] ~= nil then
							x = u.Toggles["Auto Shoot Agresivo"];
							c(A.TogAutoShootAgr, x);
						end;
						if u.Toggles["Equipar pistola"] ~= nil then
							e = u.Toggles["Equipar pistola"];
							c(A.TogEquipGun, e);
						end;
						if u.Toggles["Silent Aim (Manual)"] ~= nil then
							V = u.Toggles["Silent Aim (Manual)"];
							c(A.TogSilentAimManual, V);
						end;
						if u.Toggles["Silent Aim (FOV)"] ~= nil then
							N = u.Toggles["Silent Aim (FOV)"];
							c(A.TogSilentAimFOV, N);
						end;
						if u.Toggles["Mostrar C\195\173rculo FOV"] ~= nil then
							S = u.Toggles["Mostrar C\195\173rculo FOV"];
							c(A.TogShowFOV, S);
						end;
						if u.Toggles["Team Check"] ~= nil then
							P = u.Toggles["Team Check"];
						end;
						if u.Toggles["ESP Jugadores"] ~= nil then
							t = u.Toggles["ESP Jugadores"];
							c(A.TogEsp, t);
						end;
						if u.Toggles["ESP Glow"] ~= nil then
							J.Glow = u.Toggles["ESP Glow"];
							c(A.TogEspGl, J.Glow);
						end;
						if u.Toggles["Kill All"] ~= nil then
							s = u.Toggles["Kill All"];
							c(A.TogKillAll, s);
							if s then
								KillAllInstance:Start();
							else
								KillAllInstance:Stop();
							end;
						end;
						if u.Toggles["Hitbox Activar"] ~= nil then
							D = u.Toggles["Hitbox Activar"];
							c(A.TogHitbox, D);
							if D then
								O();
							else
								nc();
							end;
						end;
						if u.Toggles["Hitbox Invisible"] ~= nil then
							p = u.Toggles["Hitbox Invisible"];
							c(A.TogHitboxInvisible, p);
						end;
						if u.Toggles.Headless ~= nil then
							Lc = u.Toggles.Headless;
							c(A.TogHeadless, Lc);
							if Lc then
								wc(true);
							else
								wc(false);
							end;
						end;
						if u.Toggles.Korblox ~= nil then
							rc = u.Toggles.Korblox;
							c(A.TogKorblox, rc);
							if rc then
								Rc();
							else
								Ac();
							end;
						end;
						if u.Toggles["Nombre Falso"] ~= nil then
							g = u.Toggles["Nombre Falso"];
							c(A.TogFakeName, g);
							Qc();
						end;
						if u.Toggles.Invisible ~= nil then
							r = u.Toggles.Invisible;
							c(A.TogInvisible, r);
							oc(r);
							if f then
								f(r);
							end;
						end;
					end;
					if u.Sliders then
						if u.Sliders["Tama\195\177o del FOV"] ~= nil then
							l = u.Sliders["Tama\195\177o del FOV"];
							c(A.SliFOVSize, l);
						end;
						if u.Sliders["Tama\195\177o de Hitbox"] ~= nil then
							b = u.Sliders["Tama\195\177o de Hitbox"];
							c(A.SliHitboxSize, b);
						end;
						if u.Sliders["Volumen Kill Sound"] ~= nil then
							bc = u.Sliders["Volumen Kill Sound"];
							kc.Volume = bc;
							gc.Volume = bc;
							Mc.Volume = bc;
							c(A.SliKillSoundVolume, bc);
						end;
						if u.Sliders["Ajuste Speed"] ~= nil then
							Jc = u.Sliders["Ajuste Speed"];
							c(A.SliSpeed, Jc);
						end;
						if u.Sliders["Ajuste Salto"] ~= nil then
							sc = u.Sliders["Ajuste Salto"];
							c(A.SliJumpPower, sc);
						end;
					end;
					if u.Colors then
						if u.Colors["Color de Hitbox"] then
							k = Color3.new(u.Colors["Color de Hitbox"].R, u.Colors["Color de Hitbox"].G, u.Colors["Color de Hitbox"].B);
							if A.ColHitbox then
								pcall(function()
									A.ColHitbox:Update(k);
								end);
							end;
						end;
						if u.Colors["Color del ESP"] then
							local Y = Color3.new(u.Colors["Color del ESP"].R, u.Colors["Color del ESP"].G, u.Colors["Color del ESP"].B);
							o = Y;
							if A.ColEsp then
								pcall(function()
									A.ColEsp:Update(Y);
								end);
							end;
						end;
					end;
					if u.Extras then
						if u.Extras["Parte Silent Aim"] then
							n = u.Extras["Parte Silent Aim"];
							if A.DropSilentAimPart then
								pcall(function()
									A.DropSilentAimPart:Select(n);
								end);
							end;
						end;
						if u.Extras["Nombre Falso Texto"] then
							M = u.Extras["Nombre Falso Texto"];
							c(A.InpFakeName, M);
							if g then
								Qc();
							end;
						end;
					end;
					if w then
						w();
					end;
					if W then
						W();
					end;
				end;
			end;
		end,
	});
	task.spawn(function()
		task.wait(1);
		j();
	end);
end;
do
	jc.Graficos:Section({ Title = "Presets de Iluminaci\195\179n", Icon = "solar:palette-bold" });
	local Y = {};
	local z = {};
	local u = {};
	local T = nil;
	local function X(Y)
		local z = game:GetService("Lighting");
		if z:GetAttribute("OrigSaved_" .. Y) then
			return;
		end;
		z:SetAttribute("Orig_Ambient_" .. Y, z.Ambient);
		z:SetAttribute("Orig_OutdoorAmbient_" .. Y, z.OutdoorAmbient);
		z:SetAttribute("Orig_Brightness_" .. Y, z.Brightness);
		z:SetAttribute("Orig_ClockTime_" .. Y, z.ClockTime);
		z:SetAttribute("Orig_FogColor_" .. Y, z.FogColor);
		z:SetAttribute("Orig_FogEnd_" .. Y, z.FogEnd);
		z:SetAttribute("Orig_FogStart_" .. Y, z.FogStart);
		z:SetAttribute("Orig_ColorShift_Top_" .. Y, z.ColorShift_Top);
		z:SetAttribute("Orig_ColorShift_Bottom_" .. Y, z.ColorShift_Bottom);
		z:SetAttribute("Orig_ExposureCompensation_" .. Y, z.ExposureCompensation);
		z:SetAttribute("Orig_GlobalShadows_" .. Y, z.GlobalShadows);
		z:SetAttribute("Orig_EnvironmentDiffuseScale_" .. Y, z.EnvironmentDiffuseScale);
		z:SetAttribute("Orig_EnvironmentSpecularScale_" .. Y, z.EnvironmentSpecularScale);
		z:SetAttribute("OrigSaved_" .. Y, true);
	end;
	local function j(Y)
		local z = game:GetService("Lighting");
		if not z:GetAttribute("OrigSaved_" .. Y) then
			return;
		end;
		z.Ambient = z:GetAttribute("Orig_Ambient_" .. Y);
		z.OutdoorAmbient = z:GetAttribute("Orig_OutdoorAmbient_" .. Y);
		z.Brightness = z:GetAttribute("Orig_Brightness_" .. Y);
		z.ClockTime = z:GetAttribute("Orig_ClockTime_" .. Y);
		z.FogColor = z:GetAttribute("Orig_FogColor_" .. Y);
		z.FogEnd = z:GetAttribute("Orig_FogEnd_" .. Y);
		z.FogStart = z:GetAttribute("Orig_FogStart_" .. Y);
		z.ColorShift_Top = z:GetAttribute("Orig_ColorShift_Top_" .. Y);
		z.ColorShift_Bottom = z:GetAttribute("Orig_ColorShift_Bottom_" .. Y);
		z.ExposureCompensation = z:GetAttribute("Orig_ExposureCompensation_" .. Y);
		z.GlobalShadows = z:GetAttribute("Orig_GlobalShadows_" .. Y);
		z.EnvironmentDiffuseScale = z:GetAttribute("Orig_EnvironmentDiffuseScale_" .. Y);
		z.EnvironmentSpecularScale = z:GetAttribute("Orig_EnvironmentSpecularScale_" .. Y);
		z:SetAttribute("OrigSaved_" .. Y, nil);
	end;
	local function y(Y)
		for Y, z in ipairs(Y) do
			pcall(function()
				z:Destroy();
			end);
		end;
		table.clear(Y);
	end;
	local function B(z)
		local u = game:GetService("Lighting");
		if z then
			X("NS");
			y(Y);
			if T then
				T:Destroy();
			end;
			T = Instance.new("Folder");
			T.Name = "NS_SkyX";
			T.Parent = K;
			local function z(z)
				local u = Instance.new("Part");
				u.Anchored = true;
				u.CanCollide = false;
				u.CanQuery = false;
				u.Material = Enum.Material.Neon;
				u.Color = Color3.fromRGB(255, 55, 55);
				u.Transparency = .1;
				u.Size = Vector3.new(2600, 26, 26);
				u.CFrame = CFrame.new(0, 3200, -2200) * CFrame.Angles(0, 0, math.rad(z));
				u.Parent = T;
				table.insert(Y, u);
			end;
			z(45);
			z(-45);
			local j = Instance.new("Part");
			j.Anchored = true;
			j.CanCollide = false;
			j.CanQuery = false;
			j.Material = Enum.Material.Neon;
			j.Color = Color3.fromRGB(255, 110, 110);
			j.Transparency = .65;
			j.Shape = Enum.PartType.Ball;
			j.Size = Vector3.new(420, 420, 420);
			j.CFrame = CFrame.new(0, 3200, -2200);
			j.Parent = T;
			table.insert(Y, j);
			local B = Instance.new("PointLight");
			B.Color = Color3.fromRGB(255, 80, 80);
			B.Range = 300;
			B.Brightness = 3;
			B.Parent = j;
			table.insert(Y, B);
			local S = Instance.new("Sky");
			S.Name = "NS_Sky";
			S.StarCount = 9000;
			S.MoonAngularSize = 30;
			S.SunAngularSize = 0;
			S.CelestialBodiesShown = true;
			S.Parent = u;
			table.insert(Y, S);
			local l = Instance.new("ColorCorrectionEffect");
			l.Name = "NS_CC";
			l.Brightness = .05;
			l.Contrast = .32;
			l.Saturation = -0.15;
			l.TintColor = Color3.fromRGB(255, 130, 130);
			l.Parent = u;
			table.insert(Y, l);
			local v = Instance.new("BloomEffect");
			v.Name = "NS_Bloom";
			v.Intensity = 1;
			v.Size = 90;
			v.Threshold = .45;
			v.Parent = u;
			table.insert(Y, v);
			local x = Instance.new("BlurEffect");
			x.Name = "NS_Blur";
			x.Size = 3;
			x.Parent = u;
			table.insert(Y, x);
			local c = Instance.new("Atmosphere");
			c.Name = "NS_Atmo";
			c.Density = .42;
			c.Offset = 0;
			c.Color = Color3.fromRGB(60, 12, 12);
			c.Decay = Color3.fromRGB(80, 20, 20);
			c.Glare = .5;
			c.Haze = 1.6;
			c.Parent = u;
			table.insert(Y, c);
			u.ClockTime = 0;
			u.Brightness = 1.2;
			u.Ambient = Color3.fromRGB(130, 110, 110);
			u.OutdoorAmbient = Color3.fromRGB(180, 140, 140);
			u.FogColor = Color3.fromRGB(22, 5, 5);
			u.FogEnd = 1200;
			u.FogStart = 150;
			u.ColorShift_Top = Color3.fromRGB(125, 25, 25);
			u.ColorShift_Bottom = Color3.fromRGB(65, 8, 8);
			u.ExposureCompensation = -0.2;
			u.GlobalShadows = true;
			u.EnvironmentDiffuseScale = .5;
			u.EnvironmentSpecularScale = .5;
		else
			y(Y);
			if T then
				T:Destroy();
				T = nil;
			end;
			j("NS");
		end;
	end;
	local function S(Y)
		local u = game:GetService("Lighting");
		if Y then
			X("AF");
			y(z);
			local Y = Instance.new("ColorCorrectionEffect");
			Y.Name = "AF_CC";
			Y.Brightness = .05;
			Y.Contrast = .14;
			Y.Saturation = .22;
			Y.TintColor = Color3.fromRGB(255, 205, 165);
			Y.Parent = u;
			table.insert(z, Y);
			local T = Instance.new("BloomEffect");
			T.Name = "AF_Bloom";
			T.Intensity = .32;
			T.Size = 40;
			T.Threshold = .92;
			T.Parent = u;
			table.insert(z, T);
			local K = Instance.new("SunRaysEffect");
			K.Name = "AF_Rays";
			K.Intensity = .15;
			K.Spread = .9;
			K.Parent = u;
			table.insert(z, K);
			local j = Instance.new("Sky");
			j.Name = "AF_Sky";
			j.SunAngularSize = 18;
			j.MoonAngularSize = 0;
			j.StarCount = 2000;
			j.Parent = u;
			table.insert(z, j);
			local B = Instance.new("Atmosphere");
			B.Name = "AF_Atmo";
			B.Density = .36;
			B.Offset = .1;
			B.Color = Color3.fromRGB(255, 185, 135);
			B.Decay = Color3.fromRGB(255, 125, 85);
			B.Glare = .2;
			B.Haze = 1.2;
			B.Parent = u;
			table.insert(z, B);
			u.ClockTime = 6.3;
			u.Brightness = 2.4;
			u.Ambient = Color3.fromRGB(85, 62, 55);
			u.OutdoorAmbient = Color3.fromRGB(125, 92, 80);
			u.FogColor = Color3.fromRGB(240, 185, 145);
			u.FogEnd = 2500;
			u.FogStart = 200;
			u.ColorShift_Top = Color3.fromRGB(255, 185, 105);
			u.ColorShift_Bottom = Color3.fromRGB(205, 105, 85);
			u.ExposureCompensation = .08;
			u.GlobalShadows = true;
			u.EnvironmentDiffuseScale = .8;
			u.EnvironmentSpecularScale = .6;
		else
			y(z);
			j("AF");
		end;
	end;
	local function l(Y)
		local z = game:GetService("Lighting");
		if Y then
			X("SV");
			y(u);
			local Y = Instance.new("ColorCorrectionEffect");
			Y.Name = "SV_CC";
			Y.Brightness = .05;
			Y.Contrast = .22;
			Y.Saturation = -1;
			Y.TintColor = Color3.fromRGB(222, 226, 232);
			Y.Parent = z;
			table.insert(u, Y);
			local T = Instance.new("BloomEffect");
			T.Name = "SV_Bloom";
			T.Intensity = 1.25;
			T.Size = 75;
			T.Threshold = .38;
			T.Parent = z;
			table.insert(u, T);
			local K = Instance.new("Sky");
			K.Name = "SV_Sky";
			K.StarCount = 0;
			K.SunAngularSize = 0;
			K.MoonAngularSize = 0;
			K.CelestialBodiesShown = false;
			K.Parent = z;
			table.insert(u, K);
			local j = Instance.new("Atmosphere");
			j.Name = "SV_Atmo";
			j.Density = .3;
			j.Offset = .1;
			j.Color = Color3.fromRGB(180, 185, 190);
			j.Decay = Color3.fromRGB(140, 145, 150);
			j.Glare = 0;
			j.Haze = 1;
			j.Parent = z;
			table.insert(u, j);
			z.ClockTime = 14;
			z.Brightness = 2.2;
			z.Ambient = Color3.fromRGB(92, 96, 100);
			z.OutdoorAmbient = Color3.fromRGB(132, 136, 140);
			z.FogColor = Color3.fromRGB(172, 176, 180);
			z.FogEnd = 3000;
			z.FogStart = 200;
			z.ColorShift_Top = Color3.fromRGB(152, 156, 160);
			z.ColorShift_Bottom = Color3.fromRGB(122, 126, 130);
			z.ExposureCompensation = 0;
			z.GlobalShadows = true;
			z.EnvironmentDiffuseScale = .6;
			z.EnvironmentSpecularScale = .3;
		else
			y(u);
			j("SV");
		end;
	end;
	local v, x, c;
	v = jc.Graficos:Toggle({ Title = "Noche Sangrienta", Value = false, Callback = function(Y)
				if Y then
					if x then
						pcall(function()
							x:Set(false);
						end);
					end;
					if c then
						pcall(function()
							c:Set(false);
						end);
					end;
				end;
				B(Y);
			end });
	x = jc.Graficos:Toggle({ Title = "Atardecer Fant\195\161stico", Value = false, Callback = function(Y)
				if Y then
					if v then
						pcall(function()
							v:Set(false);
						end);
					end;
					if c then
						pcall(function()
							c:Set(false);
						end);
					end;
				end;
				S(Y);
			end });
	c = jc.Graficos:Toggle({ Title = "Sin Vida", Value = false, Callback = function(Y)
				if Y then
					if v then
						pcall(function()
							v:Set(false);
						end);
					end;
					if x then
						pcall(function()
							x:Set(false);
						end);
					end;
				end;
				l(Y);
			end });
end;
do
	jc.Updates:Section({ Title = "Uzivert Hub v2.0", Icon = "solar:moon-bold" });
	local Y = {
			{ "Nuevo", "Uzivert Hub Duelos v2.0 con nueva interfaz y p\195\161gina de Updates.", "solar:star-bold" },
			{ "API m\195\161s segura", "Conexi\195\179n protegida y datos mejor resguardados.", "solar:shield-check-bold" },
			{ "Mejoras en la precisi\195\179n", "Aimbot y detecci\195\179n m\195\161s exactos.", "solar:target-bold" },
			{ "Indetectable", "Protecciones reforzadas para jugar tranquilo.", "solar:ghost-bold" },
			{ "Optimizaci\195\179n", "Menos lag y mayor rendimiento.", "solar:bolt-bold" },
		};
	for Y, z in ipairs(Y) do
		pcall(function()
			jc.Updates:Paragraph({ Title = "<font color=\'#3DDC84\'>+ " .. (z[1] .. "</font>"), Desc = z[2], Icon = z[3] });
		end);
	end;
end;
do
	local Y = game:GetService("TweenService");
	local T = Color3.fromRGB(255, 255, 255);
	local X = Color3.fromRGB(190, 200, 225);
	local K = Color3.fromRGB(12, 13, 20);
	local function j(Y, z, u)
		local T = Instance.new(Y);
		for Y, z in pairs(z) do
			T[Y] = z;
		end;
		T.Parent = u;
		return T;
	end;
	local function y(Y, z)
		return j("UICorner", { CornerRadius = UDim.new(0, z) }, Y);
	end;
	local function B(Y, z, u, T)
		local X = j("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(z, z),
				BackgroundColor3 = u,
				BorderSizePixel = 0,
				ZIndex = T,
			}, Y);
		y(X, z);
		return X;
	end;
	local S = j("TextButton", {
			Name = "UzivertOrb",
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.new(0, 30, .5, -30),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 50,
		}, q);
	local l = j("UIScale", { Scale = 1 }, S);
	local v = B(S, 90, T, 1);
	v.BackgroundTransparency = .85;
	local x = j("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(58, 58),
			BackgroundTransparency = 1,
			ZIndex = 2,
		}, S);
	y(x, 29);
	local c = j("UIStroke", { Thickness = 2.5, Color = T }, x);
	local V = j("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, T), ColorSequenceKeypoint.new(.5, X), ColorSequenceKeypoint.new(1, T) }), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(.55, .65), NumberSequenceKeypoint.new(1, 0) }) }, c);
	local N = B(S, 50, K, 3);
	local function n(Y, z, u)
		local T = j("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(Y, Y),
				BackgroundTransparency = 1,
				ZIndex = 4,
			}, S);
		y(T, 4);
		j("UIStroke", { Thickness = 1.2, Color = z, Transparency = u }, T);
		return T;
	end;
	local P, t = n(36, T, .2), n(30, X, .4);
	local o = B(S, 20, T, 5);
	o.Position = UDim2.new(.5, -1, .5, 0);
	local J = B(S, 17, K, 6);
	J.Position = UDim2.new(.5, 4, .5, -3);
	local s = {};
	for Y = 1, 3, 1 do
		local z = B(S, 3 + (Y % 2), (Y % 2 == 0) and T or X, 7);
		s[Y] = {
				f = z,
				r = 29,
				sp = ((Y % 2 == 0 and 1 or -1)) * ((.9 + Y * .35)),
				ph = Y * 2.1,
			};
	end;
	local D = true;
	local function p()
		if pcall(function()
			Yc:Toggle();
		end) then
			return;
		end;
		D = not D;
		pcall(function()
			if D then
				Yc:Open();
			else
				Yc:Close();
			end;
		end);
	end;
	local b, k, g, M = false, nil, nil, 0;
	S.InputBegan:Connect(function(z)
		if z.UserInputType == Enum.UserInputType.MouseButton1 or z.UserInputType == Enum.UserInputType.Touch then
			b = true;
			M = 0;
			k = S.Position;
			g = z.Position;
			(Y:Create(l, TweenInfo.new(.12), { Scale = .9 })):Play();
		end;
	end);
	u.InputChanged:Connect(function(Y)
		if not b then
			return;
		end;
		if Y.UserInputType == Enum.UserInputType.MouseMovement or Y.UserInputType == Enum.UserInputType.Touch then
			local z = Y.Position - g;
			M = math.max(M, z.Magnitude);
			if M > 6 then
				S.Position = UDim2.new(k.X.Scale, k.X.Offset + z.X, k.Y.Scale, k.Y.Offset + z.Y);
			end;
		end;
	end);
	u.InputEnded:Connect(function(z)
		if not b then
			return;
		end;
		if z.UserInputType == Enum.UserInputType.MouseButton1 or z.UserInputType == Enum.UserInputType.Touch then
			b = false;
			(Y:Create(l, TweenInfo.new(.25, Enum.EasingStyle.Back), { Scale = 1 })):Play();
			if M <= 6 then
				p();
			end;
		end;
	end);
	z.Heartbeat:Connect(function()
		if not S.Parent then
			return;
		end;
		local Y = os.clock();
		v.BackgroundTransparency = ((D and .92 or .84)) + .04 * math.sin(Y * 2);
		V.Rotation = ((Y * 90)) % 360;
		P.Rotation = ((Y * 24)) % 360;
		t.Rotation = ((-Y * 16)) % 360;
		for z, u in ipairs(s) do
			local T = Y * u.sp + u.ph;
			u.f.Position = UDim2.fromScale(.5, .5) + UDim2.fromOffset(math.cos(T) * u.r, math.sin(T) * u.r);
		end;
	end);
end;
do
	local Y = Enum.KeyCode.LeftControl;
	local z = true;
	u.InputBegan:Connect(function(T)
		if T.UserInputType ~= Enum.UserInputType.Keyboard then
			return;
		end;
		if T.KeyCode ~= Y then
			return;
		end;
		if u:GetFocusedTextBox() then
			return;
		end;
		if pcall(function()
			Yc:Toggle();
		end) then
			return;
		end;
		z = not z;
		pcall(function()
			if z then
				Yc:Open();
			else
				Yc:Close();
			end;
		end);
	end);
end;

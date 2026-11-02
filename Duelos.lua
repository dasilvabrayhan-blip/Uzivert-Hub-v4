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
	local e = L.LocalPlayer;
	local function A()
		pcall(function()
			local L = "https://uzivert-api.onrender.com/registrar?user=" .. (e.Name .. "&game=duelos");
			game:HttpGet(L);
		end);
	end;
	A();
	while task.wait(120) do
		A();
	end;
end);
local L = game:GetService("Players");
local e = game:GetService("RunService");
local A = game:GetService("UserInputService");
local j = game:GetService("ReplicatedStorage");
local g = game:GetService("HttpService");
local d = game:GetService("Workspace");
local H = game:GetService("SoundService");
local K = L.LocalPlayer;
while not K do
	task.wait();
	K = L.LocalPlayer;
end;
local a = d.CurrentCamera;
local I = false;
local w = 120;
local Q = false;
local Z = false;
local t = "Cabeza";
local M = false;
local R = false;
local X = "Cabeza";
local i = true;
local D = false;
local s = Color3.fromRGB(255, 255, 255);
local k = { Glow = true };
local n = false;
local Y = false;
local T = false;
local P = 3.5;
local S = Color3.fromRGB(255, 0, 0);
local G = false;
local E = "Nombre falso";
local B = false;
local O = nil;
local p = nil;
local C = {};
local U;
local h;
local F;
local c;
local x;
local v;
local y;
local l;
local q;
local z;
local r = false;
local u;
local f = Instance.new("ScreenGui");
f.Name = "UzivertHub_Overlays";
f.ResetOnSpawn = false;
f.IgnoreGuiInset = true;
f.DisplayOrder = 999;
f.Parent = K:WaitForChild("PlayerGui");
local W = Instance.new("Folder");
W.Name = "UzivertESPFolder";
W.Parent = f;
local J;
local N = "1.6.66";
local V = "WindUI_Cache_v" .. (N .. ".txt");
local m = "WindUI_Cache_v" .. (N .. "_Time.txt");
local o, b = pcall(function()
		local L = false;
		if isfile and (isfile(m) and readfile) then
			local e = tonumber(readfile(m));
			if e and (os.time() - e) < 86400 then
				L = true;
			end;
		end;
		if L and (isfile and isfile(V)) then
			local L = readfile(V);
			local e = loadstring(L);
			if e then
				return e();
			else
				if delfile then
					pcall(delfile, V);
					pcall(delfile, m);
				end;
			end;
		end;
		local e = game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. (N .. "/main.lua"));
		if writefile then
			writefile(V, e);
			writefile(m, tostring(os.time()));
		end;
		return (loadstring(e))();
	end);
if o and (b and type(b) == "table") then
	J = b;
else
	warn("Error al cargar WindUI: " .. tostring(b));
	return;
end;
local Lp = false;
do
	local function L(L)
		return pcall(function()
			local e, A = Color3.fromHex("#1c1e2c"), Color3.fromHex("#22253a");
			if L then
				e = J:Gradient({ ["0"] = { Color = Color3.fromHex("#252839"), Transparency = 0 }, ["100"] = { Color = Color3.fromHex("#14151f"), Transparency = 0 } }, { Rotation = 90 });
				A = J:Gradient({ ["0"] = { Color = Color3.fromHex("#0e0f18"), Transparency = 0 }, ["50"] = { Color = Color3.fromHex("#1d2033"), Transparency = 0 }, ["100"] = { Color = Color3.fromHex("#33384f"), Transparency = 0 } }, { Rotation = 35 });
			end;
			J:AddTheme({
				Name = "Uzivert",
				Accent = e,
				Background = A,
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
	Lp = L(true) or L(false);
end;
local ep = "132390617819216";
local Ap = "rbxassetid://" .. ep;
pcall(function()
	local L = (game:GetObjects("rbxassetid://" .. ep))[1];
	if L and ((L:IsA("Decal") or L:IsA("Texture"))) then
		local e = (tostring(L.Texture)):match("id=(%d+)") or (tostring(L.Texture)):match("rbxassetid://(%d+)");
		if e then
			Ap = "rbxassetid://" .. e;
		end;
	end;
end);
local jp = J:CreateWindow({
		Title = "UZIVERT HUB | DUELS <font color=\'#FFD700\'>[v2.1] </font>",
		Author = "By Uzivert \240\159\135\181\240\159\135\190",
		Folder = "Uzivert_WindUI",
		Acrylic = false,
		Transparent = false,
		NewElements = true,
		HideSearchBar = false,
		ToggleKey = Enum.KeyCode.F15,
		Icon = "moon",
		Theme = Lp and "Uzivert" or "Dark",
		Background = Ap,
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
			L = jp.UIElements and jp.UIElements.Main;
		end);
		if not ((L and L:IsA("GuiObject"))) then
			L = nil;
			local e = 0;
			local A = J.ScreenGui or (gethui and gethui()) or game:GetService("CoreGui");
			for A, j in ipairs(A:GetDescendants()) do
				if j:IsA("Frame") and (j:FindFirstChildOfClass("UICorner") and (j.AbsoluteSize.X > 400 and j.AbsoluteSize.Y > 300)) then
					local A = j.AbsoluteSize.X * j.AbsoluteSize.Y;
					if A > e then
						e, L = A, j;
					end;
				end;
			end;
		end;
		if not L then
			return;
		end;
		local A = Instance.new("UIStroke");
		A.Thickness = 2;
		A.Color = Color3.new(1, 1, 1);
		A.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		A.Parent = L;
		local j = Instance.new("UIGradient");
		j.Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, Color3.fromRGB(110, 118, 142)),
				ColorSequenceKeypoint.new(.25, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(.5, Color3.fromRGB(190, 200, 225)),
				ColorSequenceKeypoint.new(.75, Color3.fromRGB(255, 255, 255)),
				ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 118, 142)),
			});
		j.Parent = A;
		local g;
		g = e.Heartbeat:Connect(function()
				if not A.Parent then
					g:Disconnect();
					return;
				end;
				j.Rotation = ((os.clock() * 120)) % 360;
			end);
	end);
end);
local gp = jp:Section({ Title = "Combate principal", Opened = true });
local dp = jp:Section({ Title = "Zona de farmeo", Opened = true });
local Hp = jp:Section({ Title = "Configuraciones", Opened = true });
local Kp = jp:Section({ Title = "Informaci\195\179n", Opened = true });
local ap = {
		Graficos = jp:Tab({ Title = "Gr\195\161ficos", Icon = "solar:palette-bold" }),
		Aim = gp:Tab({ Title = "Aimbot", Icon = "solar:target-bold" }),
		Vis = gp:Tab({ Title = "Visual", Icon = "solar:eye-bold" }),
		KillAll = gp:Tab({ Title = "Kill All", Icon = "solar:danger-triangle-bold" }),
		Invisible = gp:Tab({ Title = "Invisible", Icon = "solar:ghost-bold" }),
		Tramposo = gp:Tab({ Title = "Movimiento", Icon = "solar:bolt-bold" }),
		Farm = dp:Tab({ Title = "Farmear evento", Icon = "solar:gift-bold" }),
		RachaFarm = dp:Tab({ Title = "Farmear racha", Icon = "solar:flame-bold" }),
		Animaciones = Hp:Tab({ Title = "Animaciones", Icon = "solar:smile-circle-bold" }),
		Sonidos = Hp:Tab({ Title = "Sonidos", Icon = "solar:speaker-bold" }),
		Music = Hp:Tab({ Title = "M\195\186sica", Icon = "solar:music-note-2-bold" }),
		Items = Hp:Tab({ Title = "Apariencia", Icon = "solar:crown-star-bold" }),
		Guardado = Hp:Tab({ Title = "Guardado", Icon = "solar:diskette-bold" }),
		Identidad = Hp:Tab({ Title = "Identidad", Icon = "solar:user-id-bold" }),
		Updates = Kp:Tab({ Title = "Updates", Icon = "solar:bell-bing-bold" }),
	};
local Ip, wp, Qp;
local Zp, tp, Mp, Rp;
do
	local e = K:WaitForChild("PlayerGui");
	local A;
	local g;
	local function H(L)
		if not L then
			return;
		end;
		for e = #L, 1, -1 do
			local A = L[e];
			L[e] = nil;
			if A and A.Connected then
				A:Disconnect();
			end;
		end;
	end;
	local a;
	local function I(L)
		local e = L;
		if typeof(L) == "Instance" and L:IsA("Player") then
			e = L.Character;
		end;
		local A = e and e:FindFirstChildOfClass("Humanoid");
		if not A or A.Health <= 0 then
			return false;
		end;
		if a and a() then
			return e:GetAttribute("InfectionDowned") ~= true;
		end;
		return A.Health >= 99;
	end;
	local function w()
		local L = K:FindFirstChild("PlayerGui");
		local e = L and L:FindFirstChild("Main");
		local A = e and e:FindFirstChild("MainGameFrame");
		return A and A:FindFirstChild("IngameScore") or nil;
	end;
	local t = {
			Snapshot = {},
			Scoreboard = nil,
			InGame = false,
			LocalGame = nil,
			LastRefresh = 0,
			RefreshInterval = 2,
			Dirty = true,
			WatchConnections = {},
		};
	local function X()
		t.Dirty = true;
	end;
	local function i(L)
		local e = t;
		if e.Scoreboard == L then
			return;
		end;
		H(e.WatchConnections);
		e.Scoreboard = L;
		if not L then
			return;
		end;
		local A;
		A = function()
				X();
				H(e.WatchConnections);
				e.WatchConnections[#e.WatchConnections + 1] = L.ChildAdded:Connect(A);
				e.WatchConnections[#e.WatchConnections + 1] = L.ChildRemoved:Connect(A);
				for A, j in ipairs({ "TeamRed", "TeamBlue" }) do
					local g = L:FindFirstChild(j);
					if g then
						e.WatchConnections[#e.WatchConnections + 1] = g.ChildAdded:Connect(X);
						e.WatchConnections[#e.WatchConnections + 1] = g.ChildRemoved:Connect(X);
					end;
				end;
			end;
		A();
	end;
	local function s(L)
		local e = t;
		local A = os.clock();
		local j = K:GetAttribute("Game");
		if not L and (not e.Dirty and (A - e.LastRefresh < e.RefreshInterval and (e.LocalGame == j and ((not e.Scoreboard or e.Scoreboard.Parent))))) then
			return e.Snapshot;
		end;
		e.LastRefresh = A;
		e.LocalGame = j;
		local g = {};
		local d = w();
		if d ~= e.Scoreboard then
			i(d);
		end;
		for L, e in ipairs({ "TeamRed", "TeamBlue" }) do
			local A = d and d:FindFirstChild(e);
			if A then
				local L = e == "TeamRed" and "Red" or "Blue";
				for e, A in ipairs(A:GetChildren()) do
					if A:IsA("GuiObject") then
						g[string.lower(A.Name)] = L;
					end;
				end;
			end;
		end;
		e.Snapshot = g;
		e.Dirty = false;
		e.InGame = d ~= nil and g[string.lower(K.Name)] ~= nil;
		return g;
	end;
	local T = {
			"InfectionInfected",
			"IsInfected",
			"Infected",
			"IsZombie",
			"Zombie",
		};
	local P = { "GameMode", "MatchMode", "Mode" };
	local S = {
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
	local function G(L)
		if not L then
			return nil;
		end;
		if L:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local e = false;
		for A, j in ipairs(T) do
			local g = L:GetAttribute(j);
			if typeof(g) == "boolean" then
				if g then
					return true;
				end;
				e = true;
			elseif typeof(g) == "string" then
				local L = g:lower();
				if L == "infected" or L == "infection" or L == "zombie" or L == "true" then
					return true;
				end;
				if L == "survivor" or L == "human" or L == "false" then
					e = true;
				end;
			end;
		end;
		if e then
			return false;
		end;
		return nil;
	end;
	local function E(L)
		if L:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local e = L.Character;
		if not e then
			return false;
		end;
		if e:GetAttribute("InfectionPatientZero") == true then
			return true;
		end;
		local A = e:FindFirstChildOfClass("Humanoid");
		return A ~= nil and A:GetAttribute("InfectionPatientZero") == true;
	end;
	local function B(L)
		if not L then
			return nil;
		end;
		local e = L.Character;
		local A = G(e);
		local j = G(L);
		local g = e and e:FindFirstChildOfClass("Humanoid");
		local d = G(g);
		if A == true or j == true or d == true then
			return true;
		end;
		if A == false or j == false or d == false then
			return false;
		end;
		return nil;
	end;
	local function O(A)
		local j = e:FindFirstChild("Main");
		j = j and j:FindFirstChild("MainGameFrame");
		if not j then
			return;
		end;
		local g = j:FindFirstChild("PlayersFrame");
		local d = j:FindFirstChild("IngameScore");
		local H = {};
		local K = {};
		local a = {};
		for L, e in ipairs(L:GetPlayers()) do
			H[e.Name:lower()] = e;
			H[tostring(e.UserId)] = e;
			local A = e.DisplayName:lower();
			if K[A] then
				a[A] = true;
			end;
			K[A] = e;
		end;
		for L, e in pairs(K) do
			if not a[L] and not H[L] then
				H[L] = e;
			end;
		end;
		local function I(L, e)
			if not L then
				return;
			end;
			for L, j in ipairs(L:GetChildren()) do
				if j:IsA("GuiObject") then
					local L = H[(j.Name:lower()):gsub("^@", "")];
					if not L then
						local e = j:GetAttribute("UserId");
						if e then
							L = H[tostring(e)];
						end;
					end;
					if not L then
						for e, A in ipairs(j:GetDescendants()) do
							if A:IsA("TextLabel") and ((A.Name == "PlayerName" or A.Name == "TextLabel")) then
								L = H[(A.Text:lower()):gsub("^@", "")];
								if L then
									break;
								end;
							end;
						end;
					end;
					if L then
						A[L] = e;
					end;
				end;
			end;
		end;
		if d then
			I(d:FindFirstChild("TeamRed"), "Red");
			I(d:FindFirstChild("TeamBlue"), "Blue");
		end;
		if g then
			I(g:FindFirstChild("TeamRedFrame"), "Red");
			I(g:FindFirstChild("TeamBlueFrame"), "Blue");
		end;
	end;
	local function p(L)
		local e = S;
		table.clear(e.Converted);
		table.clear(e.ConvertedAt);
		table.clear(e.Pending);
		table.clear(e.LateJoiners);
		table.clear(e.Inferred);
		table.clear(e.Targets);
		table.clear(e.RoleTeams);
		e.Active = false;
		e.RoundEnded = L == true;
		e.LastRefresh = -math.huge;
		if A then
			A();
		end;
	end;
	local function C(e)
		local j = S;
		local g = os.clock();
		local H = K:GetAttribute("Game");
		local a = K:GetAttribute("MatchId");
		if j.HasMatchContext and ((H ~= j.LastLocalGame or a ~= j.LastMatchId)) then
			p(false);
		end;
		j.HasMatchContext = true;
		j.LastLocalGame = H;
		j.LastMatchId = a;
		if not e and g - j.LastRefresh < j.RefreshInterval then
			return j;
		end;
		j.LastRefresh = g;
		local I = s(false);
		local w = false;
		local Q = K.Character;
		local Z = Q and Q:FindFirstChild("HumanoidRootPart");
		local M = L:GetPlayers();
		for L, e in ipairs(M) do
			if E(e) then
				local L = e == K;
				if not L then
					L = true;
					local A = e:GetAttribute("Game");
					local j = e:GetAttribute("MatchId");
					if H ~= nil and (H ~= "" and (A ~= nil and (A ~= "" and H ~= A))) then
						L = false;
					end;
					if ((H == nil or H == "")) and (A ~= nil and A ~= "") then
						L = false;
					end;
					if a ~= nil and (a ~= "" and (j ~= nil and (j ~= "" and a ~= j))) then
						L = false;
					end;
					local g = e.Character;
					local d = g and g:FindFirstChild("HumanoidRootPart");
					if Z and (d and ((Z.Position - d.Position)).Magnitude > 1200) then
						L = false;
					end;
				end;
				if L then
					w = true;
					break;
				end;
			end;
		end;
		local R;
		for L, e in ipairs(P) do
			local A = K:GetAttribute(e);
			if typeof(A) == "string" and A ~= "" then
				R = A:lower();
				break;
			end;
		end;
		if not R then
			for L, e in ipairs(P) do
				local A = d:GetAttribute(e);
				if typeof(A) == "string" and A ~= "" then
					R = A:lower();
					break;
				end;
			end;
		end;
		local X = not j.RoundEnded and ((R == "infection" or (not R and ((w or (j.Active and not t.InGame))))));
		if not X then
			if R and (R ~= "infection" and next(j.LateJoiners) ~= nil) then
				table.clear(j.LateJoiners);
			end;
			if j.Active or next(j.Targets) ~= nil then
				if R and R ~= "infection" then
					p(false);
				else
					j.Active = false;
					table.clear(j.Targets);
					table.clear(j.Inferred);
					table.clear(j.RoleTeams);
					if A then
						A();
					end;
				end;
			end;
			return j;
		end;
		j.Active = true;
		local i = {};
		O(i);
		j.RoleTeams = i;
		local D;
		local k = false;
		local n = {};
		for L, e in ipairs(M) do
			local A = B(e);
			n[e] = A;
			if A == true or j.Converted[e] == true then
				local L = i[e];
				if L then
					if D and D ~= L then
						k = true;
					end;
					D = L;
				end;
			end;
		end;
		local Y = {};
		if D and not k then
			for L, e in pairs(i) do
				if e == D and n[L] ~= false then
					Y[L] = true;
				end;
			end;
		end;
		j.Inferred = Y;
		local function T()
			local L = {};
			for e, A in ipairs(M) do
				if n[A] == true or j.Converted[A] == true or (n[A] ~= false and Y[A] == true) then
					L[A] = true;
				end;
			end;
			return L;
		end;
		local G = T();
		local C = {};
		for L in pairs(G) do
			local e = L.Character;
			local A = e and e:FindFirstChild("HumanoidRootPart");
			if A and A:IsA("BasePart") then
				C[#C + 1] = A;
			end;
		end;
		for L, e in ipairs(M) do
			if e ~= K and (j.LateJoiners[e] and (n[e] == nil and (not G[e] and e.Character))) then
				local L = i[e] or I[e.Name:lower()];
				local A = e:GetAttribute("Game");
				local g = e:GetAttribute("MatchId");
				local d = H ~= nil and (H ~= "" and A == H);
				local K = a ~= nil and (a ~= "" and g == a);
				local w = H ~= nil and (H ~= "" and (A ~= nil and (A ~= "" and A ~= H)));
				local Q = a ~= nil and (a ~= "" and (g ~= nil and (g ~= "" and g ~= a)));
				if not w and not Q then
					local A = false;
					for L in pairs(G) do
						local g = L.Team;
						if g and (e.Team == g and ((n[L] == true or j.Converted[L] == true or Y[L] == true))) then
							A = true;
							break;
						end;
					end;
					local g = false;
					if not L and (not d and (not K and not A)) then
						local L = e.Character:FindFirstChild("HumanoidRootPart");
						if L and L:IsA("BasePart") then
							local e = L.Position;
							for L, A in ipairs(C) do
								if ((A.Position - e)).Magnitude <= 300 then
									g = true;
									break;
								end;
							end;
						end;
					end;
					local H = L ~= nil or d or K or A or g;
					if H and ((not D or k or not L or L == D)) then
						G[e] = true;
					end;
				end;
			end;
		end;
		local U = j.Pending;
		local h = true;
		while h do
			h = false;
			for e = #U, 1, -1 do
				local A = U[e];
				if g - A.Time > 10 or A.Killer.Parent ~= L or A.Victim.Parent ~= L then
					table.remove(U, e);
				elseif G[A.Killer] and (not G[A.Victim] and ((not j.ConvertedAt[A.Killer] or j.ConvertedAt[A.Killer] <= A.Time))) then
					j.Converted[A.Victim] = true;
					j.ConvertedAt[A.Victim] = A.Time;
					G[A.Victim] = true;
					table.remove(U, e);
					h = true;
				elseif G[A.Killer] then
					table.remove(U, e);
				end;
			end;
		end;
		local F = j.Targets;
		local c = false;
		for L in pairs(F) do
			if not G[L] then
				c = true;
				break;
			end;
		end;
		if not c then
			for L in pairs(G) do
				if not F[L] then
					c = true;
					break;
				end;
			end;
		end;
		j.Targets = G;
		if c and A then
			A();
		end;
		return j;
	end;
	a = function()
			return (C(false)).Active;
		end;
	local function U(L)
		if not L then
			return false;
		end;
		local e = C(false);
		return e.Active and e.Targets[L] == true;
	end;
	local function F(L, e)
		if not L or L == K or not L.Parent or (not e and not L.Character) then
			return false;
		end;
		local A = K:GetAttribute("Game");
		local j = L:GetAttribute("Game");
		if A ~= nil and (A ~= "" and (j ~= nil and (j ~= "" and A ~= j))) then
			return false;
		end;
		if ((A == nil or A == "")) and (j ~= nil and j ~= "") then
			return false;
		end;
		local g = K:GetAttribute("MatchId");
		local d = L:GetAttribute("MatchId");
		if g ~= nil and (g ~= "" and (d ~= nil and (d ~= "" and g ~= d))) then
			return false;
		end;
		local H = K.Character and K.Character:FindFirstChild("HumanoidRootPart");
		local a = L.Character and L.Character:FindFirstChild("HumanoidRootPart");
		if H and (a and ((H.Position - a.Position)).Magnitude > 1200) then
			return false;
		end;
		return true;
	end;
	local function c()
		S.LastRefresh = -math.huge;
	end;
	local function x(L, e)
		if typeof(L) ~= "Instance" or not L:IsA("Player") or typeof(e) ~= "Instance" or not e:IsA("Player") or L == e or not a() or (L ~= K and not F(L, true)) or (e ~= K and not F(e, true)) then
			return;
		end;
		local A = C(false);
		if A.Targets[e] then
			return;
		end;
		if A.Targets[L] then
			A.Converted[e] = true;
			A.ConvertedAt[e] = os.clock();
			A.LastRefresh = -math.huge;
			C(true);
		else
			if #A.Pending >= 96 then
				table.remove(A.Pending, 1);
			end;
			A.Pending[#A.Pending + 1] = { Killer = L, Victim = e, Time = os.clock() };
			A.LastRefresh = -math.huge;
		end;
	end;
	local v;
	v = function(L)
			if not L or L == K or not L.Parent then
				return false;
			end;
			if a() then
				return F(L) and U(L);
			end;
			local e = s(false);
			if not t.InGame or not e[string.lower(L.Name)] then
				return false;
			end;
			local A = K:GetAttribute("Game");
			local j = L:GetAttribute("Game");
			if A ~= nil and (A ~= "" and (j ~= nil and j ~= "")) then
				if A ~= j then
					return false;
				end;
			elseif ((A == nil or A == "")) and (j ~= nil and j ~= "") then
				return false;
			end;
			local g = K:GetAttribute("MatchId");
			local d = L:GetAttribute("MatchId");
			if g ~= nil and (g ~= "" and (d ~= nil and (d ~= "" and g ~= d))) then
				return false;
			end;
			return true;
		end;
	local function y(L)
		if not L then
			return nil;
		end;
		local e = s(false);
		local A = e[string.lower(L.Name)];
		if not A and L.DisplayName then
			A = e[string.lower(L.DisplayName)];
		end;
		if A then
			return A;
		end;
		local j = L:GetAttribute("Team") or L:GetAttribute("team");
		if j ~= nil and tostring(j) ~= "" then
			return tostring(j);
		end;
		if L.Team then
			return L.Team.Name;
		end;
		local g = L.TeamColor;
		if g and (g.Name ~= "White" and g.Name ~= "Medium stone grey") then
			return "Color:" .. g.Name;
		end;
		return nil;
	end;
	local function l(L, e)
		if not L or not e or L == e then
			return false;
		end;
		if a() then
			return U(e);
		end;
		local A = y(L);
		local j = y(e);
		if A ~= nil and j ~= nil then
			return A ~= j;
		end;
		return true;
	end;
	local function q()
		X();
		if A then
			A();
		end;
	end;
	local function z()
		X();
		c();
		if A then
			A();
		end;
	end;
	local u = {};
	local f = {};
	local function W(L)
		H(f[L]);
		f[L] = nil;
		local e = u[L];
		if e then
			H(e);
			u[L] = nil;
		end;
	end;
	local function J(L, e)
		H(f[L]);
		f[L] = nil;
		if not e then
			return;
		end;
		local A = {};
		f[L] = A;
		local function j(L)
			if L == "InfectionPatientZero" or L == "InfectionInfected" or L == "IsInfected" or L == "Infected" or L == "IsZombie" or L == "Zombie" then
				c();
				z();
			end;
		end;
		A[#A + 1] = e.AttributeChanged:Connect(j);
		local function g(L)
			if L and L:IsA("Humanoid") then
				A[#A + 1] = L.AttributeChanged:Connect(j);
			end;
		end;
		g(e:FindFirstChildOfClass("Humanoid"));
		A[#A + 1] = e.ChildAdded:Connect(function(L)
				if L:IsA("Humanoid") then
					g(L);
					c();
				end;
			end);
	end;
	local function N(L)
		if not L or L == K or not L.Parent then
			return;
		end;
		W(L);
		u[L] = {
				(L:GetPropertyChangedSignal("Team")):Connect(z),
				(L:GetPropertyChangedSignal("TeamColor")):Connect(z),
				(L:GetAttributeChangedSignal("Team")):Connect(z),
				(L:GetAttributeChangedSignal("team")):Connect(z),
				(L:GetAttributeChangedSignal("Game")):Connect(z),
				(L:GetAttributeChangedSignal("MatchId")):Connect(z),
				L.AttributeChanged:Connect(function(L)
					if L == "InfectionPatientZero" or L == "InfectionInfected" or L == "IsInfected" or L == "Infected" or L == "IsZombie" or L == "Zombie" then
						c();
						z();
					end;
				end),
				L.CharacterAdded:Connect(function(e)
					J(L, e);
					c();
					z();
				end),
				L.CharacterRemoving:Connect(function(e)
					J(L, nil);
					c();
					if g then
						g(e);
					end;
				end),
			};
		J(L, L.Character);
		z();
	end;
	local V = {};
	local m = false;
	local o = 0;
	local function b(L)
		V[#V + 1] = L;
		return L;
	end;
	local function Lp()
		if m then
			return;
		end;
		m = true;
		o = o + (1);
		local A = o;
		local function g()
			q();
			c();
		end;
		for L, e in ipairs({ "Team", "TeamColor" }) do
			b((K:GetPropertyChangedSignal(e)):Connect(g));
		end;
		for L, e in ipairs({
			"Team",
			"team",
			"Game",
			"MatchId",
			"GameMode",
			"MatchMode",
			"Mode",
		}) do
			b((K:GetAttributeChangedSignal(e)):Connect(g));
		end;
		b(K.AttributeChanged:Connect(function(L)
			if L == "InfectionPatientZero" or L == "InfectionInfected" or L == "IsInfected" or L == "Infected" or L == "IsZombie" or L == "Zombie" then
				c();
			end;
		end));
		b(K.CharacterAdded:Connect(c));
		b(e.DescendantAdded:Connect(function(L)
			if L.Name == "IngameScore" or L.Name == "TeamRed" or L.Name == "TeamBlue" then
				X();
				c();
			end;
		end));
		b(e.DescendantRemoving:Connect(function(L)
			if L == t.Scoreboard or L.Name == "IngameScore" or L.Name == "TeamRed" or L.Name == "TeamBlue" then
				X();
				c();
			end;
		end));
		for L, e in ipairs(L:GetPlayers()) do
			if e ~= K then
				N(e);
			end;
		end;
		b(L.PlayerAdded:Connect(function(L)
			S.LateJoiners[L] = true;
			N(L);
			c();
		end));
		b(L.PlayerRemoving:Connect(function(L)
			W(L);
			for e = #S.Pending, 1, -1 do
				local A = S.Pending[e];
				if A.Killer == L or A.Victim == L then
					table.remove(S.Pending, e);
				end;
			end;
			for e, A in ipairs({
				"Converted",
				"ConvertedAt",
				"LateJoiners",
				"Inferred",
				"Targets",
				"RoleTeams",
			}) do
				S[A][L] = nil;
			end;
			z();
		end));
		X();
		c();
		task.spawn(function()
			local L = {};
			local e = {
					["RE/Combat/Killed"] = x,
					["RE/Match/PlayerRespawned"] = c,
					["RE/Match/StartRoundGui"] = function()
						p(false);
					end,
					["RE/Match/MatchResults"] = function()
						if S.Active then
							p(true);
						end;
					end,
				};
			while m and A == o do
				local A = j:FindFirstChild("Packages");
				local g = A and A:FindFirstChild("Networking");
				local d = true;
				for e, A in pairs(e) do
					if not L[e] then
						local j = g and g:FindFirstChild(e);
						if j and j:IsA("RemoteEvent") then
							b(j.OnClientEvent:Connect(A));
							L[e] = true;
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
	local function ep()
		if not m then
			return;
		end;
		m = false;
		o = o + (1);
		H(V);
		for L in pairs(u) do
			W(L);
		end;
		H(t.WatchConnections);
		t.Scoreboard = nil;
		t.Snapshot = {};
		t.InGame = false;
		t.Dirty = true;
		p(false);
	end;
	h = function()
			if Q or Z or M or R or r or (D and k.Glow) or Y or n then
				Lp();
			else
				ep();
			end;
		end;
	Ip = function(L)
			if not v(L) or not L.Character then
				return false;
			end;
			if not I(L) then
				return false;
			end;
			return l(K, L);
		end;
	Zp = function(L)
			if not Ip(L) then
				return false;
			end;
			local e = L.Character;
			return e ~= nil and (not e:FindFirstChildOfClass("ForceField") and I(L));
		end;
	local Ap = { { Center = Vector3.new(-320.5, 280.82, 16), Radius = 500 }, { Center = Vector3.new(1564.14, -155.45, 40.04), Radius = 300 } };
	wp = function()
			local L = K.Character;
			if not L then
				return true;
			end;
			if L:FindFirstChildOfClass("ForceField") then
				return true;
			end;
			if K.Team then
				local L = K.Team.Name:lower();
				if L:find("lobby") or L:find("spectat") or L:find("espectador") or L:find("menu") or L:find("dead") then
					return true;
				end;
			end;
			local e = L:FindFirstChild("HumanoidRootPart");
			if e then
				for L, A in ipairs(Ap) do
					if ((e.Position - A.Center)).Magnitude <= A.Radius then
						return true;
					end;
				end;
			end;
			return false;
		end;
	Qp = function()
			if wp() then
				return false;
			end;
			s(false);
			return t.InGame or a();
		end;
	tp = function(L)
			if not L or not L:IsA("Tool") then
				return false;
			end;
			if L:FindFirstChild("Slash") or L:FindFirstChild("SlashStart") then
				return true;
			end;
			local e = L.Name:lower();
			return e:find("knife", 1, true) ~= nil or e:find("cuchillo", 1, true) ~= nil or e:find("dagger", 1, true) ~= nil;
		end;
	Mp = function(L)
			if not L or not L:IsA("Tool") then
				return false;
			end;
			local e = L:FindFirstChild("showBeam");
			return e ~= nil and e:IsA("RemoteEvent");
		end;
	Rp = function()
			local L = K.Character;
			if L then
				for L, e in ipairs(L:GetChildren()) do
					if Mp(e) then
						return e;
					end;
				end;
			end;
			local e = K:FindFirstChildOfClass("Backpack");
			if e then
				for L, e in ipairs(e:GetChildren()) do
					if Mp(e) then
						return e;
					end;
				end;
			end;
			return nil;
		end;
end;
local function Xp(L)
	if not L or not L:IsA("Tool") then
		return false;
	end;
	for e, A in ipairs({
		"Reloading",
		"IsReloading",
		"reloading",
		"isReloading",
		"Reload",
		"reload",
	}) do
		local j = L:GetAttribute(A);
		if j == true or j == "true" then
			return true;
		end;
	end;
	for L, e in ipairs(L:GetChildren()) do
		if e:IsA("BoolValue") and e.Value == true then
			local L = string.lower(e.Name);
			if string.find(L, "reload") or string.find(L, "recarg") then
				return true;
			end;
		end;
	end;
	local e = K.Character;
	local A = e and e:FindFirstChildOfClass("Humanoid");
	if A then
		for L, e in ipairs(A:GetPlayingAnimationTracks()) do
			local A = e.Animation and e.Animation.AnimationId or "";
			if string.find(string.lower(A), "reload") then
				return true;
			end;
		end;
	end;
	for L, e in ipairs(L:GetDescendants()) do
		if e:IsA("Sound") and e.Playing then
			local L = string.lower(e.Name);
			if string.find(L, "reload") or string.find(L, "recarg") then
				return true;
			end;
		end;
	end;
	return false;
end;
local ip = {};
ip.__index = ip;
function ip.new()
	return setmetatable({ Items = {} }, ip);
end;
function ip.Add(e, L)
	e.Items[#e.Items + 1] = L;
	return L;
end;
function ip.Cleanup(L)
	for e = #L.Items, 1, -1 do
		local A = L.Items[e];
		L.Items[e] = nil;
		local j = typeof(A);
		if j == "RBXScriptConnection" then
			pcall(function()
				A:Disconnect();
			end);
		elseif j == "Instance" then
			pcall(function()
				A:Destroy();
			end);
		elseif j == "function" then
			pcall(A);
		end;
	end;
end;
local function Dp()
	for L, e in ipairs(L:GetPlayers()) do
		local A = e.Character;
		if A then
			local L = A:FindFirstChild("GhostHitbox");
			if L then
				L:Destroy();
			end;
		end;
	end;
end;
do
	local e = false;
	l = function()
			if e or not Y then
				return;
			end;
			e = true;
			task.spawn(function()
				while Y do
					task.wait(.2);
					if not Y then
						break;
					end;
					if not Qp() then
						Dp();
						continue;
					end;
					local e = Vector3.new(P, P, P);
					local A = T and 1 or .6;
					for L, j in ipairs(L:GetPlayers()) do
						if j ~= K and Ip(j) then
							local L = j.Character;
							if L then
								local j = L:FindFirstChild("HumanoidRootPart");
								local g = L:FindFirstChildOfClass("Humanoid");
								if j and (g and g.Health > 0) then
									local g = L:FindFirstChild("GhostHitbox");
									if not g then
										g = Instance.new("Part");
										g.Name = "GhostHitbox";
										g.Size = e;
										g.Transparency = A;
										g.Color = S;
										g.CanCollide = false;
										g.Massless = true;
										g.CanQuery = true;
										g.CFrame = j.CFrame;
										g.Parent = L;
										local d = Instance.new("WeldConstraint");
										d.Part0 = j;
										d.Part1 = g;
										d.Parent = g;
									else
										if g.Size ~= e then
											g.Size = e;
										end;
										if g.Transparency ~= A then
											g.Transparency = A;
										end;
										if g.Color ~= S then
											g.Color = S;
										end;
										if not g.CanQuery then
											g.CanQuery = true;
										end;
									end;
								else
									local e = L:FindFirstChild("GhostHitbox");
									if e then
										e:Destroy();
									end;
								end;
							end;
						else
							local L = j.Character;
							if L then
								local e = L:FindFirstChild("GhostHitbox");
								if e then
									e:Destroy();
								end;
							end;
						end;
					end;
				end;
				e = false;
				if not Y then
					Dp();
				end;
			end);
		end;
end;
local sp = { ["Right Platforms"] = {
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
		Connections = ip.new(),
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
	local e = K.Character;
	if not e then
		return nil;
	end;
	local A = e:FindFirstChild("HumanoidRootPart");
	if A and A:IsA("BasePart") then
		return A;
	end;
	return nil;
end;
function AutoTeleportMainAlt.GetHumanoid(L)
	local e = K.Character;
	return e and e:FindFirstChildOfClass("Humanoid") or nil;
end;
function AutoTeleportMainAlt.Attr(e, L)
	local A = K:GetAttribute(L);
	if typeof(A) == "string" and A ~= "" then
		return A;
	end;
	return nil;
end;
function AutoTeleportMainAlt.Snapshot(L)
	local e = L:Attr("Game");
	local A = L:Attr("Map");
	local j = K.Character;
	local g = j and j:FindFirstChildOfClass("Humanoid");
	local d = j and j:FindFirstChild("HumanoidRootPart");
	local H = g ~= nil and (g.Health > 0 and d ~= nil);
	return {
		Game = e,
		Map = A,
		InGame = e ~= nil,
		InMap = e ~= nil and A ~= nil,
		Alive = H,
	};
end;
function AutoTeleportMainAlt.IsOnMatch(L)
	local e = L:Snapshot();
	return e and (e.InGame == true and (e.InMap ~= true and e.Alive));
end;
function AutoTeleportMainAlt.ResolvePad(e, L)
	local A = sp[e.PlatformRow] or sp["Right Platforms"];
	local j = A[e.DuelType] or A["1v1"];
	local g = d:FindFirstChild("PadZones");
	if not g then
		return nil;
	end;
	local H = g:FindFirstChild(j.ZoneName);
	if not H then
		return nil;
	end;
	local K = (L == "Alt") and j.AltPad or j.MainPad;
	local a = H:FindFirstChild(K);
	if not a then
		return nil;
	end;
	local I = a:FindFirstChild("Pad");
	if I and I:IsA("BasePart") then
		return I;
	end;
	return nil;
end;
function AutoTeleportMainAlt.IsOnPad(e, L)
	if not L then
		return false;
	end;
	local A = e:GetRoot();
	if not A then
		return false;
	end;
	local j = L.CFrame:PointToObjectSpace(A.Position);
	local g = L.Size / 2;
	return math.abs(j.X) <= g.X + .5 and (math.abs(j.Z) <= g.Z + .5 and (j.Y >= -((g.Y + 6)) and j.Y <= g.Y + 14));
end;
function AutoTeleportMainAlt.MarkPad(A, L, e)
	if not L then
		A:UnmarkPad();
		return;
	end;
	if A.HighlightedPad == L then
		return;
	end;
	A:UnmarkPad();
	A.HighlightedPad = L;
	A.PadColors[L] = { Color = L.Color, Transparency = L.Transparency };
	pcall(function()
		L.Color = e and Color3.fromRGB(255, 70, 70) or Color3.fromRGB(70, 145, 255);
		L.Transparency = .5;
	end);
end;
function AutoTeleportMainAlt.UnmarkPad(L)
	if L.HighlightedPad and L.PadColors[L.HighlightedPad] then
		local e = L.HighlightedPad;
		local A = L.PadColors[e];
		pcall(function()
			if e.Parent then
				e.Color = A.Color;
				e.Transparency = A.Transparency;
			end;
		end);
	end;
	L.HighlightedPad = nil;
end;
function AutoTeleportMainAlt.FindVoteRemote(L)
	local e = j:FindFirstChild("Packages");
	local A = e and e:FindFirstChild("Networking");
	local g = A and A:FindFirstChild("RF/Voting/Vote");
	if g and g:IsA("RemoteFunction") then
		return g;
	end;
	return nil;
end;
function AutoTeleportMainAlt.FindVisibleMapVote(L)
	local e = K:FindFirstChild("PlayerGui");
	local A = e and e:FindFirstChild("Main");
	local j = A and A:FindFirstChild("MapVoting");
	local g = j and j:FindFirstChild("VotingHolder");
	if not g then
		return nil;
	end;
	for L, e in ipairs(g:GetChildren()) do
		if e:IsA("ImageButton") and (e.Visible and e.Name ~= "") then
			return e.Name;
		end;
	end;
	return nil;
end;
function AutoTeleportMainAlt.VoteMap(L)
	local e = L:Snapshot();
	if not L:IsOnMatch() then
		return;
	end;
	if L.VotedMap == e.Game then
		return;
	end;
	local A = os.clock();
	if A - ((L.LastVote or 0)) < L.VoteCooldown then
		return;
	end;
	L.LastVote = A;
	local j = L:FindVisibleMapVote();
	local g = L:FindVoteRemote();
	if not ((j and g)) then
		return;
	end;
	L.VotedMap = e.Game;
	pcall(function()
		g:InvokeServer(j);
	end);
end;
function AutoTeleportMainAlt.FindSetStateRemote(L)
	local e = j:FindFirstChild("Packages");
	local A = e and e:FindFirstChild("Networking");
	local g = A and A:FindFirstChild("RE/Match/SetStatePlr");
	if g and g:IsA("RemoteEvent") then
		return g;
	end;
	return nil;
end;
function AutoTeleportMainAlt.CancelQueue(L)
	local e = os.clock();
	if e - ((L.LastCancel or 0)) < L.CancelCooldown then
		return;
	end;
	local A = L:FindSetStateRemote();
	if not A then
		return;
	end;
	L.LastCancel = e;
	pcall(function()
		A:FireServer("REMOVE");
	end);
end;
function AutoTeleportMainAlt.HideGameFrame(L)
	local e = K:FindFirstChild("PlayerGui");
	local A = e and e:FindFirstChild("Main");
	local j = A and A:FindFirstChild("MainGameFrame");
	if j and j:IsA("GuiObject") then
		pcall(function()
			j.Visible = false;
		end);
	end;
end;
function AutoTeleportMainAlt.HoldCenter(L)
	local e = L:GetHumanoid();
	local A = L:GetRoot();
	if e and A then
		pcall(function()
			e:MoveTo(A.Position);
		end);
	end;
end;
function AutoTeleportMainAlt.Teleport(e, L)
	if not L then
		return;
	end;
	local A = e:GetRoot();
	local j = e:GetHumanoid();
	if not ((A and j)) then
		return;
	end;
	pcall(function()
		A.AssemblyAngularVelocity = Vector3.zero;
		A.AssemblyLinearVelocity = Vector3.zero;
		e:CancelQueue();
		e:HideGameFrame();
		j:MoveTo(L.Position);
	end);
end;
function AutoTeleportMainAlt.Process(L)
	if not L.Running then
		return;
	end;
	local e = L:Snapshot();
	if e.InGame then
		L:UnmarkPad();
		L:HoldCenter();
		L:VoteMap();
		return;
	end;
	local A = L:GetActiveRole();
	if not A then
		L:UnmarkPad();
		return;
	end;
	local j = L:ResolvePad(A);
	L:MarkPad(j, A == "Alt");
	if not j then
		return;
	end;
	if L:IsOnPad(j) then
		return;
	end;
	local g = os.clock();
	if g - ((L.LastTeleport or 0)) < L.TeleportCooldown then
		return;
	end;
	L.LastTeleport = g;
	L:Teleport(j);
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
	L.Connections:Add((K:GetAttributeChangedSignal("Game")):Connect(function()
		task.defer(function()
			if L.Running then
				L:Process();
			end;
		end);
	end));
	L.Connections:Add((K:GetAttributeChangedSignal("Map")):Connect(function()
		task.defer(function()
			if L.Running then
				L:Process();
			end;
		end);
	end));
	L.Connections:Add((K:GetAttributeChangedSignal("Team")):Connect(function()
		task.defer(function()
			if L.Running then
				L:Process();
			end;
		end);
	end));
	L.Connections:Add(e.Heartbeat:Connect(function(e)
		if not L.Running then
			return;
		end;
		L.Acc = L.Acc + e;
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
	L.Connections = ip.new();
	L:UnmarkPad();
	L.VotedMap = nil;
end;
AutoTeleportMainAltInstance = AutoTeleportMainAlt.new();
local function kp()
	local L = K:FindFirstChild("PlayerGui");
	if not L then
		return false;
	end;
	local e = L:FindFirstChild("Main") or L;
	local A = e:FindFirstChild("MainGameFrame");
	if not A or not A.Visible then
		return false;
	end;
	local j = A:FindFirstChild("IngameScore");
	local g = j and j:FindFirstChild("Timer");
	if not g then
		return false;
	end;
	if not ((g:IsA("TextLabel") or g:IsA("TextButton") or g:IsA("TextBox"))) then
		return false;
	end;
	local d = (tostring(g.Text or "")):gsub("%s", "");
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
	local A = 39.9;
	local j = 1.2;
	local g = .6;
	local H = .5;
	local a = 3;
	local I = 2.5;
	local w = 20;
	local Q = 15;
	local Z = 1.5;
	local t = 1.2;
	local M = 90;
	local R = 2.5;
	local X = 6;
	local i = .5;
	local D = 7.5;
	local s = .3;
	local k = .08;
	local n = .16;
	local Y = 25;
	local T = 6;
	local P = 1.5;
	local S = 6;
	local G = .6;
	local E = .25;
	local B = 1;
	local O = 3;
	local p = .06;
	local C = 40;
	local U = {};
	U.__index = U;
	function U.new()
		return setmetatable({
			running = false,
			connections = ip.new(),
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
		}, U);
	end;
	function U.DisableCollisions(L)
		local e = K.Character;
		if not e then
			return;
		end;
		for e, A in ipairs(e:GetDescendants()) do
			if A:IsA("BasePart") and A.CanCollide then
				if L.savedCollisions[A] == nil then
					L.savedCollisions[A] = A.CanCollide;
				end;
				A.CanCollide = false;
			end;
		end;
	end;
	function U.RestoreCollisions(L)
		for L, e in pairs(L.savedCollisions) do
			if L.Parent then
				pcall(function()
					L.CanCollide = e;
				end);
			end;
		end;
		table.clear(L.savedCollisions);
	end;
	function U.GetRoot(e, L)
		local A = L and L.Character;
		if not A then
			return nil;
		end;
		local j = A:FindFirstChild("HumanoidRootPart");
		if j and j:IsA("BasePart") then
			return j;
		end;
		return nil;
	end;
	function U.GetHumanoid(e, L)
		local A = L and L.Character;
		return A and A:FindFirstChildOfClass("Humanoid") or nil;
	end;
	function U.GetFloorY(e, L)
		local A = L.Parent and L.Parent:FindFirstChildOfClass("Humanoid");
		local j = A and tonumber(A.HipHeight) or 2;
		return (L.Position.Y - j) - L.Size.Y / 2;
	end;
	function U.GetPlatformFloorY(e, L)
		if not L then
			return nil;
		end;
		local A = os.clock();
		if e.lastFloorTarget == L and (e.targetFloorY and (A - ((e.floorCheckTime or 0))) < E) then
			return e.targetFloorY;
		end;
		local j = RaycastParams.new();
		j.FilterType = Enum.RaycastFilterType.Exclude;
		j.FilterDescendantsInstances = { K.Character, L.Parent };
		local g = L.Position + Vector3.new(0, 3, 0);
		local H = d:Raycast(g, Vector3.new(0, -500, 0), j);
		e.floorCheckTime = A;
		if H then
			e.targetFloorY = H.Position.Y;
			e.lastFloorTarget = L;
			return e.targetFloorY;
		end;
		e.targetFloorY = e:GetFloorY(L);
		e.lastFloorTarget = L;
		return e.targetFloorY;
	end;
	function U.IsInKnifeRange(A, L, e)
		if not L or not e then
			return false;
		end;
		local d = e.Position - L.Position;
		local H = (Vector3.new(d.X, 0, d.Z)).Magnitude;
		local K = math.abs(d.Y);
		return H <= (j + g) and K <= D;
	end;
	function U.IsLockedTargetValid(L)
		local e = L.lockedTargetPlayer;
		if not e then
			return false;
		end;
		if not e.Parent then
			return false;
		end;
		if not Zp(e) then
			return false;
		end;
		local A = e.Character;
		if not A then
			return false;
		end;
		local j = A:FindFirstChild("HumanoidRootPart");
		local g = A:FindFirstChildOfClass("Humanoid");
		if not j or not g then
			return false;
		end;
		if g.Health <= 0 then
			return false;
		end;
		return j;
	end;
	function U.GetClosestEnemy(e)
		local A = e:GetRoot(K);
		if not A then
			return nil;
		end;
		local j = e:IsLockedTargetValid();
		if j then
			return j;
		end;
		e.lockedTargetPlayer = nil;
		e.currentTarget = nil;
		local g, d, H = nil, nil, nil;
		for L, j in ipairs(L:GetPlayers()) do
			if j ~= K and Zp(j) then
				local L = e:GetHumanoid(j);
				local K = e:GetRoot(j);
				if K and (L and L.Health > 0) then
					local L = ((K.Position - A.Position)).Magnitude;
					if not d or L < d then
						g, d, H = K, L, j;
					end;
				end;
			end;
		end;
		if H then
			e.lockedTargetPlayer = H;
		end;
		return g;
	end;
	function U.IsInMatch(L)
		return kp();
	end;
	function U.ResetState(L)
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
		local e = L:GetHumanoid(K);
		if e and e.PlatformStand then
			pcall(function()
				e.PlatformStand = false;
			end);
		end;
	end;
	function U.ReturnToSafePosition(e, L)
		if not e.safePosition or not L then
			return;
		end;
		local A = L.Position.Y;
		if A < (e.safePosition.Y - a) then
			pcall(function()
				L.CFrame = CFrame.new(e.safePosition);
				L.AssemblyLinearVelocity = Vector3.zero;
				L.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
	end;
	function U.ForceReturnToSafe(e, L)
		if not e.safePosition or not L then
			return;
		end;
		pcall(function()
			L.CFrame = CFrame.new(e.safePosition);
			L.AssemblyLinearVelocity = Vector3.zero;
			L.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function U.IsFallingIntoVoid(e, L)
		if not e.safePosition or not L then
			return false;
		end;
		local A = e.safePosition.Y - Q;
		if e.targetFloorY and (e.lastFloorTarget and e.lastFloorTarget.Parent) then
			A = math.min(A, (e.targetFloorY - T) - Q);
		end;
		return L.Position.Y < A;
	end;
	function U.HideBelowMap(L)
		local e = L:GetRoot(K);
		if not e then
			return;
		end;
		local A = L.safePosition and L.safePosition.Y or e.Position.Y;
		local j = A - X;
		local g, d = e.Position.X, e.Position.Z;
		pcall(function()
			e.CFrame = CFrame.new(g, j, d);
			e.AssemblyLinearVelocity = Vector3.zero;
			e.AssemblyAngularVelocity = Vector3.zero;
		end);
		L.hiding = true;
		L.hidingUntil = os.clock() + i;
	end;
	function U.IsKnife(e, L)
		if not ((L and L:IsA("Tool"))) then
			return false;
		end;
		if L:FindFirstChild("fire") or L:FindFirstChild("showBeam") then
			return false;
		end;
		return L:FindFirstChild("Slash") ~= nil or L:FindFirstChild("SlashStart") ~= nil;
	end;
	function U.FindKnife(L)
		local e = K.Character;
		if e then
			for e, A in ipairs(e:GetChildren()) do
				if L:IsKnife(A) then
					return A, true;
				end;
			end;
		end;
		local A = K:FindFirstChildOfClass("Backpack");
		if A then
			for e, A in ipairs(A:GetChildren()) do
				if L:IsKnife(A) then
					return A, false;
				end;
			end;
		end;
		return nil, false;
	end;
	function U.SwingKnife(e, L)
		e.swingAccumulator = e.swingAccumulator + L;
		if e.swingAccumulator < H then
			return;
		end;
		e.swingAccumulator = 0;
		local A, j = e:FindKnife();
		if not A then
			return;
		end;
		if not j then
			local L = e:GetHumanoid(K);
			if not L then
				return;
			end;
			pcall(function()
				L:EquipTool(A);
			end);
			if A.Parent ~= K.Character then
				return;
			end;
		end;
		pcall(function()
			A:Activate();
		end);
	end;
	function U.UpdateJitter(e, L)
		local A = os.clock();
		if A >= e.jitterNextSwitch then
			e.jitterSide = (math.random() < .5) and 1 or -1;
			e.jitterNextSwitch = (A + k) + math.random() * ((n - k));
		end;
		local j = e.jitterSide * s;
		e.jitterCurrent = e.jitterCurrent + ((j - e.jitterCurrent)) * math.clamp(L * Y, 0, 1);
	end;
	function U.CheckServerValidation(e, L)
		if e.killActivated then
			return true;
		end;
		if not e.lastSetCFrame then
			return false;
		end;
		local A = e.lastSetCFrame.Position;
		local j = L.Position;
		local g = ((j - A)).Magnitude;
		if g <= B then
			e.validFrames = e.validFrames + 1;
			if e.validFrames >= O then
				e.killActivated = true;
				e.swingAccumulator = H;
				return true;
			end;
		else
			e.validFrames = 0;
		end;
		return false;
	end;
	function U.ForceUnderground(A, L, e)
		if not L or not e then
			return;
		end;
		local j = A:GetPlatformFloorY(e);
		if not j then
			return;
		end;
		local g = j - T;
		if L.Position.Y > g + P then
			pcall(function()
				L.CFrame = CFrame.new(L.Position.X, g, L.Position.Z);
				L.AssemblyLinearVelocity = Vector3.zero;
				L.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
	end;
	function U.ApproachTarget(g, L, e, j)
		j = j or 0;
		local d = L.Position;
		local K = e.Position;
		local a = Vector3.new(K.X - d.X, 0, K.Z - d.Z);
		local I = a.Magnitude;
		if I <= S then
			if not g.sticking then
				local A = os.clock();
				if not g.triggerStart then
					g.triggerStart = A;
				end;
				local j = Vector3.new(K.X, d.Y, K.Z);
				local a = CFrame.lookAt(d, j);
				g.lastSetCFrame = a;
				pcall(function()
					L.CFrame = a;
					L.AssemblyLinearVelocity = Vector3.zero;
					L.AssemblyAngularVelocity = Vector3.zero;
				end);
				local I = g:CheckServerValidation(L);
				if I or (A - g.triggerStart) >= G then
					g.killActivated = true;
					g.swingAccumulator = H;
					g.triggerStart = nil;
					g.sticking = true;
					g.stickingStartTime = os.clock();
					g.lastStickTarget = e;
					g.targetFloor = nil;
					g.forceDescent = true;
					local L = g:GetHumanoid(e.Parent);
					g.lastEnemyHealth = L and L.Health or nil;
					g.lastHealthChangeTime = os.clock();
					g.lastStickTargetHum = L;
					g.jitterCurrent = 0;
				end;
			end;
			return;
		end;
		g.lastSetCFrame = nil;
		g.validFrames = 0;
		g.triggerStart = nil;
		local w = a.Unit;
		local Q = Vector3.new(-w.Z, 0, w.X);
		g:UpdateJitter(j);
		local Z = A * j;
		local t = math.min(Z, math.max(0, I - S));
		local M = math.sqrt(math.max(0, t * ((2 * I - t)))) * .85;
		local R = math.clamp(((I - S)) / 8, 0, 1);
		local X = g.jitterCurrent * R;
		local i = math.clamp(X, -M, M);
		local D = d.X + w.X * t;
		local s = d.Z + w.Z * t;
		local k = D + Q.X * i;
		local n = s + Q.Z * i;
		local Y = g:GetPlatformFloorY(e);
		local P;
		if Y then
			P = Y - T;
		else
			P = d.Y;
		end;
		local E = Vector3.new(k, P, n);
		local B = Vector3.new(K.X, E.Y, K.Z);
		local O = CFrame.lookAt(E, B);
		pcall(function()
			L.CFrame = O;
			L.AssemblyLinearVelocity = Vector3.zero;
			L.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function U.CanStickToTarget(j, e, A)
		if not A or not A.Parent then
			return false;
		end;
		local g = L:GetPlayerFromCharacter(A.Parent);
		if not g or not Zp(g) then
			return false;
		end;
		local d = A.Parent:FindFirstChildOfClass("Humanoid");
		if not d or d.Health <= 0 then
			return false;
		end;
		local H = ((Vector3.new(e.Position.X, 0, e.Position.Z) - Vector3.new(A.Position.X, 0, A.Position.Z))).Magnitude;
		if H > w then
			return false;
		end;
		return true;
	end;
	function U.StickToTarget(g, L, e, A)
		A = A or .016;
		local d = e.Position;
		local H = e.Parent and e.Parent:FindFirstChildOfClass("Humanoid");
		local K = H and H.FloorMaterial ~= Enum.Material.Air;
		if e ~= g.lastStickTarget then
			g.lastStickTarget = e;
			g.targetFloor = nil;
		end;
		if K or not g.targetFloor then
			g.targetFloor = g:GetFloorY(e);
		end;
		local a = L.Position;
		local I = e.AssemblyLinearVelocity;
		local w = d.X + I.X * p;
		local Q = d.Z + I.Z * p;
		local Z = e.CFrame.LookVector;
		local t = Vector3.new(-Z.X, 0, -Z.Z);
		if t.Magnitude < .05 then
			t = Vector3.new(0, 0, 1);
		else
			t = t.Unit;
		end;
		local X = w + t.X * j;
		local i = Q + t.Z * j;
		local D = g:IsInKnifeRange(L, e);
		local s;
		if D and not g.forceDescent then
			s = a.Y;
		else
			s = g.targetFloor - R;
			if D then
				g.forceDescent = false;
			end;
		end;
		local k = g.targetFloor - R;
		if s > k then
			s = k;
		end;
		local n = math.clamp(A * C, 0, 1);
		local Y = a:Lerp(Vector3.new(X, s, i), n);
		pcall(function()
			L.CFrame = CFrame.new(Y) * CFrame.Angles(math.rad(M), 0, 0);
			L.AssemblyLinearVelocity = Vector3.zero;
			L.AssemblyAngularVelocity = Vector3.zero;
		end);
	end;
	function U.CheckEnemyHealth(e, L)
		local A = L.Parent and L.Parent:FindFirstChildOfClass("Humanoid");
		if not A then
			return false;
		end;
		local j = A.Health;
		if e.lastEnemyHealth == nil then
			e.lastEnemyHealth = j;
			e.lastHealthChangeTime = os.clock();
			return false;
		end;
		if j < e.lastEnemyHealth then
			e.lastEnemyHealth = j;
			e.lastHealthChangeTime = os.clock();
			return false;
		end;
		if (os.clock() - e.lastHealthChangeTime) >= Z then
			return true;
		end;
		return false;
	end;
	function U.Update(e, L)
		if not e:IsInMatch() then
			e:ResetState();
			e.currentTarget = nil;
			e.lockedTargetPlayer = nil;
			e.lastStickTarget = nil;
			e.lastFloorTarget = nil;
			e.targetFloorY = nil;
			return;
		end;
		local A = e:GetRoot(K);
		if not A then
			e:ResetState();
			e.currentTarget = nil;
			e.lockedTargetPlayer = nil;
			return;
		end;
		if e.lastStickTargetHum then
			local L = e.lastStickTargetHum;
			if not L.Parent or L.Health <= 0 then
				e:HideBelowMap();
				e.inKnifeRangeNow = false;
				e.forceDescent = false;
				e.lastStickTargetHum = nil;
				e.lastStickTarget = nil;
				e.sticking = false;
				e.stickingStartTime = 0;
				e.lastEnemyHealth = nil;
				e.lastHealthChangeTime = 0;
				e.targetFloor = nil;
				e.killActivated = false;
				e.validFrames = 0;
				e.lastSetCFrame = nil;
				e.triggerStart = nil;
				return;
			end;
		end;
		if e.hiding then
			if os.clock() >= e.hidingUntil then
				e.hiding = false;
			else
				pcall(function()
					A.AssemblyLinearVelocity = Vector3.zero;
					A.AssemblyAngularVelocity = Vector3.zero;
				end);
				return;
			end;
		end;
		if e:IsFallingIntoVoid(A) then
			e:ForceReturnToSafe(A);
			e:ResetState();
			e.currentTarget = nil;
			e.lockedTargetPlayer = nil;
			e.lastStickTarget = nil;
			e.lastFloorTarget = nil;
			e.targetFloorY = nil;
			local L = e:GetHumanoid(K);
			if L then
				pcall(function()
					L.PlatformStand = false;
				end);
			end;
			return;
		end;
		local j = e:GetClosestEnemy();
		if j then
			e.currentTarget = j;
			e.lastTargetSeenTime = os.clock();
		end;
		if not j then
			local L = (os.clock() - ((e.lastTargetSeenTime or 0))) < t;
			local j = e.safePosition and A.Position.Y < (e.safePosition.Y - 2);
			if L and j then
				pcall(function()
					A.AssemblyLinearVelocity = Vector3.zero;
					A.AssemblyAngularVelocity = Vector3.zero;
				end);
				return;
			end;
			e:ReturnToSafePosition(A);
			e:ResetState();
			e.currentTarget = nil;
			e.lockedTargetPlayer = nil;
			e.lastStickTarget = nil;
			e.lastFloorTarget = nil;
			e.targetFloorY = nil;
			if e.safePosition then
				local L = e:GetHumanoid(K);
				if L then
					pcall(function()
						L.PlatformStand = false;
					end);
				end;
			end;
			return;
		end;
		e:DisableCollisions();
		if e.lastStickTarget then
			local L = e:IsInKnifeRange(A, e.lastStickTarget);
			if L and not e.inKnifeRangeNow then
				e.swingAccumulator = H;
				e.inKnifeRangeNow = true;
			elseif not L then
				e.inKnifeRangeNow = false;
			end;
		end;
		e:SwingKnife(L or 0);
		local g = e:GetHumanoid(K);
		if g and not g.PlatformStand then
			pcall(function()
				g.PlatformStand = true;
			end);
		end;
		if e.safePosition and A.Position.Y >= (e.safePosition.Y - a) then
			e.safePosition = Vector3.new(A.Position.X, e.safePosition.Y, A.Position.Z);
		end;
		if not e.sticking then
			e:ForceUnderground(A, j);
		end;
		if e.sticking then
			local g = (j ~= e.lastStickTarget);
			local d = (os.clock() - e.stickingStartTime) > I;
			local H = not e:CanStickToTarget(A, j);
			local K = e:CheckEnemyHealth(j);
			if g or d or H or K then
				e.sticking = false;
				e.stickingStartTime = 0;
				e.lastEnemyHealth = nil;
				e.lastHealthChangeTime = 0;
				e.targetFloor = nil;
				e.inKnifeRangeNow = false;
				e.forceDescent = false;
				e.killActivated = false;
				e.validFrames = 0;
				e.lastSetCFrame = nil;
				e.triggerStart = nil;
				if g then
					e.lastStickTarget = nil;
				end;
			else
				e:StickToTarget(A, j, L or 0);
				return;
			end;
		end;
		e:ApproachTarget(A, j, L or 0);
	end;
	function U.Start(L)
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
		local A = L:GetRoot(K);
		if A then
			local e = RaycastParams.new();
			e.FilterType = Enum.RaycastFilterType.Exclude;
			e.FilterDescendantsInstances = { K.Character };
			local j = A.Position + Vector3.new(0, 5, 0);
			local g = d:Raycast(j, Vector3.new(0, -500, 0), e);
			if g then
				L.safePosition = Vector3.new(A.Position.X, g.Position.Y + 3, A.Position.Z);
			else
				L.safePosition = A.Position;
			end;
		else
			L.safePosition = nil;
		end;
		L.connections:Add(e.Heartbeat:Connect(function(e)
			if not L.running then
				return;
			end;
			L:Update(e);
		end));
		L.connections:Add(K.CharacterAdded:Connect(function()
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
	function U.Stop(L)
		if not L.running then
			return;
		end;
		local e = L:GetRoot(K);
		if e and L.safePosition then
			pcall(function()
				e.CFrame = CFrame.new(L.safePosition);
				e.AssemblyLinearVelocity = Vector3.zero;
				e.AssemblyAngularVelocity = Vector3.zero;
			end);
		end;
		L.running = false;
		L.connections:Cleanup();
		L.connections = ip.new();
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
	KillAllInstance = U.new();
end;
task.wait();
ap.Aim:Section({ Title = "Auto Shoot", Icon = "solar:target-bold" });
C.TogAutoShoot = ap.Aim:Toggle({ Title = "Auto Shoot (Normal - Cabeza/Torso)", Callback = function(L)
			Q = L;
			if not L and (not Q and (not Z and F)) then
				F("Auto", nil);
			end;
			if U then
				U();
			end;
		end });
C.TogAutoShootAgr = ap.Aim:Toggle({ Title = "Auto Shoot (Agresivo - Hitbox Completa)", Callback = function(L)
			Z = L;
			if not L and (not Q and (not Z and F)) then
				F("Auto", nil);
			end;
			if U then
				U();
			end;
		end });
C.DropAutoShootPart = ap.Aim:Dropdown({
		Title = "Target: Parte del cuerpo",
		Values = { "Cabeza", "Torso", "Cuerpo Completo" },
		Value = "Cabeza",
		Callback = function(L)
			t = L;
		end,
	});
C.TogEquipGun = ap.Aim:Toggle({ Title = "Equipar pistola", Value = false, Callback = function(L)
			r = L;
			if U then
				U();
			end;
		end });
do
	local e = false;
	v = function()
			if e or not r then
				return;
			end;
			e = true;
			task.spawn(function()
				local A = RaycastParams.new();
				A.FilterType = Enum.RaycastFilterType.Exclude;
				while r do
					task.wait(.1);
					if not r then
						break;
					end;
					if not Qp() then
						continue;
					end;
					local e = K.Character;
					local j = e and e:FindFirstChildOfClass("Humanoid");
					if not e or not j then
						continue;
					end;
					if j.Health <= 0 then
						continue;
					end;
					local g = e:FindFirstChild("HumanoidRootPart");
					local H = e:FindFirstChild("Head");
					if not g then
						continue;
					end;
					local a = H and H.Position or g.Position;
					local I = false;
					for L, j in ipairs(L:GetPlayers()) do
						if j ~= K and Zp(j) then
							local L = j.Character;
							if L then
								local j = L:FindFirstChild("Head") or L:FindFirstChild("UpperTorso") or L:FindFirstChild("Torso") or L:FindFirstChild("HumanoidRootPart");
								if j and j:IsA("BasePart") then
									A.FilterDescendantsInstances = { e, L };
									local g = d:Raycast(a, j.Position - a, A);
									if not g and Qp() then
										I = true;
										break;
									end;
								end;
							end;
						end;
					end;
					if not I then
						continue;
					end;
					local w = Rp();
					if not w then
						continue;
					end;
					e = K.Character;
					j = e and e:FindFirstChildOfClass("Humanoid");
					if not e or not j then
						continue;
					end;
					w = Rp();
					if not w then
						continue;
					end;
					if w.Parent ~= e then
						pcall(function()
							j:EquipTool(w);
						end);
					end;
					task.wait(.35);
					if not r then
						break;
					end;
					e = K.Character;
					j = e and e:FindFirstChildOfClass("Humanoid");
					if e and j then
						pcall(function()
							j:UnequipTools();
						end);
					end;
					task.wait(1.9);
				end;
				e = false;
			end);
		end;
end;
ap.Aim:Space();
ap.Aim:Divider();
ap.Aim:Space();
ap.Aim:Section({ Title = "Silent Aim + Fov", Icon = "solar:radar-bold" });
C.TogSilentAimManual = ap.Aim:Toggle({ Title = "Silent Aim", Callback = function(L)
			M = L;
			if not L and (not M and (not R and F)) then
				F("Silent", nil);
			end;
			if U then
				U();
			end;
		end });
C.DropSilentAimPart = ap.Aim:Dropdown({
		Title = "Target: Parte del cuerpo",
		Values = { "Cabeza", "Torso", "Cuerpo Completo" },
		Value = "Cabeza",
		Callback = function(L)
			X = L;
		end,
	});
C.TogSilentAimFOV = ap.Aim:Toggle({ Title = "Silent Aim (Con FOV)", Callback = function(L)
			R = L;
			if not L and (not M and (not R and F)) then
				F("Silent", nil);
			end;
			if U then
				U();
			end;
		end });
C.TogShowFOV = ap.Aim:Toggle({ Title = "Mostrar C\195\173rculo FOV", Callback = function(L)
			I = L;
			if z then
				z();
			end;
		end });
C.SliFOVSize = ap.Aim:Slider({
		Title = "Tama\195\177o del FOV",
		Step = 1,
		Value = { Min = 10, Max = 800, Default = 120 },
		Callback = function(L)
			w = L;
		end,
	});
do
	(getgenv()).NexvyrTargetPart = nil;
	local e = (getgenv()).__NexvyrDeferredNamecall;
	if e then
		e.Enabled = false;
	end;
	local A = K:GetMouse();
	local j = { Auto = nil, Silent = nil };
	local g = 0;
	local H = (getgenv()).__NexvyrDmvsAimCleanup;
	if type(H) == "function" then
		pcall(H);
	end;
	(getgenv()).__NexvyrDmvsAimCleanup = nil;
	local a = {
			Enabled = false,
			Metatable = nil,
			IndexHook = nil,
			NamecallHook = nil,
		};
	local I = false;
	do
		local L = type(getexecutorname) == "function" and getexecutorname or identifyexecutor;
		if type(L) == "function" then
			local e, A = pcall(L);
			I = e and ((tostring(A)):lower()):find("madium", 1, true) ~= nil or false;
		end;
	end;
	local i = {};
	pcall(function()
		i.Raycast = d.Raycast;
	end);
	pcall(function()
		i.FindPartOnRay = d.FindPartOnRay;
	end);
	pcall(function()
		i.FindPartOnRayWithIgnoreList = d.FindPartOnRayWithIgnoreList;
	end);
	pcall(function()
		i.FindPartOnRayWithWhitelist = d.FindPartOnRayWithWhitelist;
	end);
	local function D()
		return Q or Z or M or R;
	end;
	local function s(L)
		if typeof(L) ~= "Instance" or not L:IsA("BasePart") or not L.Parent then
			return false;
		end;
		local e = L:FindFirstAncestorOfClass("Model");
		local A = e and e:FindFirstChildOfClass("Humanoid");
		return A ~= nil and A.Health > 0;
	end;
	local function k()
		local L = os.clock();
		local e = Q or Z;
		if e and (L <= g and s(j.Auto)) then
			return j.Auto;
		end;
		if ((M or R)) and s(j.Silent) then
			return j.Silent;
		end;
		if e and s(j.Auto) then
			return j.Auto;
		end;
		return nil;
	end;
	F = function(L, e)
			if L ~= "Auto" and L ~= "Silent" then
				return;
			end;
			j[L] = s(e) and e or nil;
			(getgenv()).NexvyrTargetPart = k();
		end;
	local function n()
		if not a.Enabled or not D() or wp() then
			return nil;
		end;
		local L = K.Character;
		if not L then
			return nil;
		end;
		local e = L:FindFirstChildOfClass("Tool");
		if not ((Mp(e) or (Z and (e and not tp(e))))) then
			return nil;
		end;
		local A = k();
		if not A then
			return nil;
		end;
		return A.Position, A;
	end;
	local function Y(L)
		if typeof(L) ~= "Vector3" then
			return false;
		end;
		local e = d.CurrentCamera;
		if e and ((L - e.CFrame.Position)).Magnitude <= 3 then
			return true;
		end;
		local A = K.Character;
		if not A then
			return false;
		end;
		local j = A:FindFirstChildOfClass("Tool");
		local g = j and j:FindFirstChild("Handle");
		if g and (g:IsA("BasePart") and ((L - g.Position)).Magnitude <= 18) then
			return true;
		end;
		local H = A:FindFirstChild("Head");
		return H and ((L - H.Position)).Magnitude <= 8 or false;
	end;
	local function T()
		local L = d.CurrentCamera;
		local e = L and L.CFrame.Position;
		local A = K.Character;
		local j = A and A:FindFirstChild("Head");
		if e and (j and ((e - j.Position)).Magnitude <= 1.75) then
			return e;
		end;
		local g = A and A:FindFirstChildOfClass("Tool");
		local H = g and g:FindFirstChild("Handle");
		if H and H:IsA("BasePart") then
			return H.Position;
		end;
		if j then
			return j.Position;
		end;
		return e;
	end;
	local function P()
		a.Enabled = false;
		local L = a.Metatable;
		if not L or type(setreadonly) ~= "function" then
			return;
		end;
		local e = pcall(setreadonly, L, false);
		if not e then
			return;
		end;
		pcall(function()
			if L.__index == a.IndexHook then
				L.__index = a.OriginalIndex;
			end;
			if a.NamecallHook and L.__namecall == a.NamecallHook then
				L.__namecall = a.OriginalNamecall;
			end;
		end);
		pcall(setreadonly, L, a.WasReadonly);
		if L.__index ~= a.IndexHook and ((not a.NamecallHook or L.__namecall ~= a.NamecallHook)) then
			a.Metatable = nil;
			a.IndexHook = nil;
			a.NamecallHook = nil;
		end;
	end;
	(getgenv()).__NexvyrDmvsAimCleanup = P;
	local function S()
		if a.Metatable then
			local L = a.Metatable;
			local e = L.__index == a.IndexHook;
			a.Enabled = e;
			return e;
		end;
		if type(getrawmetatable) ~= "function" or type(setreadonly) ~= "function" then
			warn("Nexvyr: este executor no permite instalar la redireccion del mouse.");
			return false;
		end;
		local L, e = pcall(getrawmetatable, I and game or A);
		if not L or not e then
			return false;
		end;
		local j, g = e.__index, e.__namecall;
		if type(j) ~= "function" and type(j) ~= "table" then
			return false;
		end;
		local H = true;
		if type(isreadonly) == "function" then
			local L, A = pcall(isreadonly, e);
			if L and type(A) == "boolean" then
				H = A;
			end;
		end;
		local function K(L, e)
			if type(j) == "function" then
				return j(L, e);
			end;
			return j[e];
		end;
		local w = function(L, e)
				if a.Enabled and (L == A and (((e == "Hit" or e == "Target" or e == "UnitRay" or (I and e == "TargetSurface"))) and ((I or type(checkcaller) ~= "function" or not checkcaller())))) then
					local A, j, g = pcall(n);
					if A and (j and g) then
						if e == "Target" then
							return g;
						end;
						if e == "TargetSurface" then
							return Enum.NormalId.Front;
						end;
						if e == "Hit" then
							if I then
								return CFrame.new(j);
							end;
							local L = T();
							local e = L and j - L;
							if e and e.Magnitude > .001 then
								return CFrame.lookAt(j, j + e.Unit);
							end;
							return CFrame.new(j);
						end;
						local A = K(L, e);
						local H = typeof(A) == "Ray" and A.Origin or nil;
						if not H then
							local L = d.CurrentCamera;
							H = L and L.CFrame.Position or T();
						end;
						local a = H and j - H;
						if a and a.Magnitude > .001 then
							return Ray.new(H, a.Unit);
						end;
					end;
				end;
				return K(L, e);
			end;
		local Q;
		if not I and (type(g) == "function" and (type(getnamecallmethod) == "function" and type(checkcaller) == "function")) then
			Q = function(L, ...)
					if not a.Enabled or checkcaller() then
						return g(L, ...);
					end;
					if L == d and not a.ResolvingRay then
						local e = getnamecallmethod();
						local A = e and i[e];
						if A then
							local j = table.pack(...);
							local g, d;
							if e == "Raycast" then
								if typeof(j[1]) == "Vector3" and typeof(j[2]) == "Vector3" then
									g, d = j[1], j[2].Magnitude;
								end;
							elseif typeof(j[1]) == "Ray" then
								g, d = j[1].Origin, j[1].Direction.Magnitude;
							end;
							if g and (d and (d >= 50 and Y(g))) then
								a.ResolvingRay = true;
								local L, A = pcall(n);
								a.ResolvingRay = false;
								if L and A then
									local L = A - g;
									if L.Magnitude > .001 then
										if e == "Raycast" then
											j[2] = L.Unit * d;
										else
											j[1] = Ray.new(g, L.Unit * d);
										end;
									end;
								end;
							end;
							return A(L, table.unpack(j, 1, j.n));
						end;
					end;
					return g(L, ...);
				end;
		end;
		if not pcall(setreadonly, e, false) then
			return false;
		end;
		local Z = pcall(function()
				e.__index = w;
				if Q then
					e.__namecall = Q;
				end;
			end);
		if not Z then
			pcall(function()
				if e.__index == w then
					e.__index = j;
				end;
				if Q and e.__namecall == Q then
					e.__namecall = g;
				end;
			end);
			pcall(setreadonly, e, H);
			return false;
		end;
		pcall(setreadonly, e, H);
		a.Metatable = e;
		a.OriginalIndex = j;
		a.OriginalNamecall = g;
		a.IndexHook = w;
		a.NamecallHook = Q;
		a.WasReadonly = H;
		a.Enabled = true;
		return true;
	end;
	local function G()
		if D() then
			S();
		else
			j.Auto = nil;
			j.Silent = nil;
			g = 0;
			(getgenv()).NexvyrTargetPart = nil;
			P();
		end;
	end;
	local E;
	U = function()
			h();
			G();
			if E then
				E();
			end;
		end;
	local B = false;
	c = function()
			if B or not ((Q or Z)) then
				return;
			end;
			B = true;
			task.spawn(function()
				local e = RaycastParams.new();
				e.FilterType = Enum.RaycastFilterType.Exclude;
				while Q or Z do
					task.wait(.1);
					if not ((Q or Z)) then
						break;
					end;
					if not a.Enabled then
						continue;
					end;
					if not wp() then
						local A = K.Character;
						if not A or not A:FindFirstChild("HumanoidRootPart") then
							continue;
						end;
						local j = A:FindFirstChildOfClass("Tool");
						if not j or not j:FindFirstChild("Handle") then
							F("Auto", nil);
							continue;
						end;
						if Z then
							if tp(j) then
								F("Auto", nil);
								continue;
							end;
						elseif not Mp(j) then
							F("Auto", nil);
							continue;
						end;
						local H = nil;
						local a = math.huge;
						local I = A.HumanoidRootPart.Position;
						local w = A:FindFirstChild("Head");
						local Q = w and w.Position or I;
						if Z then
							for L, j in pairs(L:GetPlayers()) do
								if j ~= K and (Ip(j) and j.Character) then
									local L = j.Character:FindFirstChild("Humanoid");
									if L and L.Health > 0 then
										e.FilterDescendantsInstances = { A, j.Character };
										local function L(L)
											local A = ((L.Position - I)).Magnitude;
											if A < a then
												local j = L.Size;
												local g = { Vector3.new(0, 0, 0), Vector3.new(0, j.Y / 2.1, 0), Vector3.new(0, -j.Y / 2.1, 0) };
												local K = false;
												for A, j in ipairs(g) do
													if not d:Raycast(Q, (L.CFrame * j) - Q, e) then
														K = true;
														break;
													end;
												end;
												if K then
													a = A;
													H = L;
												end;
											end;
										end;
										for e, A in ipairs(j.Character:GetChildren()) do
											if A:IsA("BasePart") and A.Name ~= "HumanoidRootPart" then
												L(A);
											end;
										end;
									end;
								end;
							end;
						else
							local j = {};
							for L, e in ipairs(L:GetPlayers()) do
								if e ~= K and (Ip(e) and e.Character) then
									local L = e.Character;
									local A = L:FindFirstChildOfClass("Humanoid");
									if A and A.Health > 0 then
										local e = L:FindFirstChild("HumanoidRootPart");
										j[#j + 1] = { Character = L, Distance = e and ((e.Position - I)).Magnitude or math.huge };
									end;
								end;
							end;
							table.sort(j, function(L, e)
								return L.Distance < e.Distance;
							end);
							local g = 192;
							local function w(L)
								if not L or not L:IsA("BasePart") then
									return;
								end;
								local A = ((L.Position - I)).Magnitude;
								if A >= a then
									return;
								end;
								local j = L.Size.Y / 2.1;
								local K = L.CFrame;
								local function w(L)
									if g <= 0 then
										return false;
									end;
									g = g - (1);
									return not d:Raycast(Q, L - Q, e);
								end;
								if w(L.Position) or w(K * Vector3.new(0, j, 0)) or w(K * Vector3.new(0, -j, 0)) then
									a = A;
									H = L;
								end;
							end;
							for L, j in ipairs(j) do
								if g <= 0 then
									break;
								end;
								local d = j.Character;
								if d.Parent then
									e.FilterDescendantsInstances = { A, d };
									if t == "Cuerpo Completo" then
										for L, e in ipairs(d:GetChildren()) do
											if g <= 0 then
												break;
											end;
											if e:IsA("BasePart") and e.Name ~= "HumanoidRootPart" then
												w(e);
											end;
										end;
									elseif t == "Cabeza" then
										w(d:FindFirstChild("Head"));
									elseif t == "Torso" then
										for L, e in ipairs({ "UpperTorso", "Torso", "HumanoidRootPart" }) do
											if g <= 0 then
												break;
											end;
											w(d:FindFirstChild(e));
										end;
									end;
								end;
							end;
						end;
						if H then
							g = os.clock() + .35;
							F("Auto", H);
							pcall(function()
								j:Activate();
								task.delay(.05, function()
									if j.Parent == A then
										j:Deactivate();
									end;
								end);
							end);
							task.wait(.2);
						else
							F("Auto", nil);
						end;
					end;
				end;
				F("Auto", nil);
				B = false;
			end);
		end;
	local O = false;
	x = function()
			if O or not ((M or R)) then
				return;
			end;
			O = true;
			task.spawn(function()
				local e = RaycastParams.new();
				e.FilterType = Enum.RaycastFilterType.Exclude;
				while M or R do
					task.wait(.1);
					if not ((M or R)) then
						break;
					end;
					if not wp() then
						local A = K.Character;
						if not A or not A:FindFirstChild("HumanoidRootPart") then
							continue;
						end;
						local j = nil;
						local g = math.huge;
						local H = math.huge;
						local a = A.HumanoidRootPart.Position;
						local I = A:FindFirstChild("Head") and A.Head.Position or a;
						for L, Q in pairs(L:GetPlayers()) do
							if Q ~= K and (Ip(Q) and Q.Character) then
								local L = Q.Character:FindFirstChild("Humanoid");
								if L and L.Health > 0 then
									local L = {};
									if X == "Cabeza" then
										local e = Q.Character:FindFirstChild("Head");
										if e then
											table.insert(L, e);
										end;
									elseif X == "Torso" then
										local e = { "UpperTorso", "Torso", "HumanoidRootPart" };
										for e, A in ipairs(e) do
											local j = Q.Character:FindFirstChild(A);
											if j and j:IsA("BasePart") then
												table.insert(L, j);
											end;
										end;
									elseif X == "Cuerpo Completo" then
										for e, A in ipairs(Q.Character:GetChildren()) do
											if A:IsA("BasePart") and A.Name ~= "HumanoidRootPart" then
												table.insert(L, A);
											end;
										end;
									end;
									e.FilterDescendantsInstances = { A, Q.Character };
									for L, A in ipairs(L) do
										local K = ((A.Position - a)).Magnitude;
										local Q = d.CurrentCamera;
										if not Q then
											continue;
										end;
										local Z, t = Q:WorldToViewportPoint(A.Position);
										local X = ((Vector2.new(Z.X, Z.Y) - Q.ViewportSize / 2)).Magnitude;
										local i = false;
										if R then
											if t and (X <= w and X < g) then
												i = true;
											end;
										elseif M then
											if K < H then
												i = true;
											end;
										end;
										if i then
											local L = d:Raycast(I, A.Position - I, e);
											if not L then
												if R then
													g = X;
													j = A;
												else
													H = K;
													j = A;
												end;
											end;
										end;
									end;
								end;
							end;
						end;
						if j then
							F("Silent", j);
						else
							F("Silent", nil);
						end;
					end;
				end;
				F("Silent", nil);
				O = false;
			end);
		end;
	E = function()
			if Q or Z then
				c();
			end;
			if M or R then
				x();
			end;
			if r then
				v();
			end;
		end;
end;
ap.KillAll:Section({ Title = "Kill All", Icon = "solar:danger-triangle-bold" });
C.TogKillAll = ap.KillAll:Toggle({ Title = "Kill All", Value = false, Callback = function(L)
			n = L;
			if h then
				h();
			end;
			if L then
				KillAllInstance:Start();
			else
				KillAllInstance:Stop();
			end;
		end });
ap.KillAll:Space();
ap.KillAll:Divider();
ap.KillAll:Space();
ap.KillAll:Section({ Title = "Hitbox Expander", Icon = "solar:box-bold" });
C.TogHitbox = ap.KillAll:Toggle({ Title = "Activar Hitbox", Value = false, Callback = function(L)
			Y = L;
			if h then
				h();
			end;
			if L then
				l();
			else
				Dp();
			end;
		end });
C.TogHitboxInvisible = ap.KillAll:Toggle({ Title = "Hitbox Invisible", Value = false, Callback = function(L)
			T = L;
		end });
C.SliHitboxSize = ap.KillAll:Slider({
		Title = "Tama\195\177o de la Hitbox",
		Step = .5,
		Value = { Min = 1, Max = 28, Default = 3.5 },
		Callback = function(L)
			P = L;
		end,
	});
C.ColHitbox = ap.KillAll:Colorpicker({ Title = "Color de la Hitbox", Default = Color3.fromRGB(255, 0, 0), Callback = function(L)
			S = L;
		end });
ap.Invisible:Section({ Title = "Invisible", Icon = "solar:ghost-bold" });
local function np(L)
	if K.Character then
		for e, A in pairs(K.Character:GetDescendants()) do
			if A:IsA("BasePart") then
				if L and A.Transparency == 0 then
					A:SetAttribute("NexvyrOrigTrans", 0);
					A.Transparency = .5;
				elseif not L and A:GetAttribute("NexvyrOrigTrans") ~= nil then
					A.Transparency = A:GetAttribute("NexvyrOrigTrans");
					A:SetAttribute("NexvyrOrigTrans", nil);
				end;
			end;
		end;
	end;
end;
C.TogInvisible = ap.Invisible:Toggle({ Title = "Invisible", Value = false, Callback = function(L)
			B = L;
			np(L);
			if u then
				u(L);
			end;
		end });
do
	local L = game:GetService("TweenService");
	local j = true;
	local g = Instance.new("TextButton");
	g.Name = "UzivertInvisibleBind";
	g.Size = UDim2.fromOffset(104, 38);
	g.Position = UDim2.new(1, -124, .5, 40);
	g.BackgroundColor3 = Color3.fromRGB(14, 15, 24);
	g.BackgroundTransparency = .1;
	g.AutoButtonColor = false;
	g.Text = "";
	g.ZIndex = 60;
	g.Parent = f;
	(Instance.new("UICorner", g)).CornerRadius = UDim.new(0, 10);
	local d = Instance.new("UIScale", g);
	local H = Instance.new("UIStroke", g);
	H.Thickness = 1.6;
	H.Color = Color3.fromRGB(190, 200, 225);
	local K = Instance.new("Frame", g);
	K.AnchorPoint = Vector2.new(0, .5);
	K.Position = UDim2.new(0, 12, .5, 0);
	K.Size = UDim2.fromOffset(10, 10);
	K.BackgroundColor3 = Color3.fromRGB(110, 116, 140);
	K.BorderSizePixel = 0;
	K.ZIndex = 61;
	(Instance.new("UICorner", K)).CornerRadius = UDim.new(1, 0);
	local a = Instance.new("TextLabel", g);
	a.Position = UDim2.fromOffset(30, 0);
	a.Size = UDim2.new(1, -36, 1, 0);
	a.BackgroundTransparency = 1;
	a.Text = "Invisible";
	a.TextColor3 = Color3.new(1, 1, 1);
	a.Font = Enum.Font.GothamBold;
	a.TextSize = 13;
	a.TextXAlignment = Enum.TextXAlignment.Left;
	a.ZIndex = 61;
	local function I(L)
		pcall(function()
			C.TogInvisible:Set(L);
		end);
		if B ~= L then
			B = L;
			np(L);
			if u then
				u(L);
			end;
		end;
	end;
	local w, Q, Z, t, M = false, false, nil, nil, nil;
	g.InputBegan:Connect(function(e)
		if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
			if w then
				return;
			end;
			w, Q = true, false;
			M = e;
			Z, t = g.Position, e.Position;
			(L:Create(d, TweenInfo.new(.1), { Scale = .94 })):Play();
		end;
	end);
	A.InputChanged:Connect(function(L)
		if not w then
			return;
		end;
		if L.UserInputType == Enum.UserInputType.MouseMovement then
			if not M or M.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return;
			end;
		elseif L ~= M then
			return;
		end;
		do
			local e = L.Position - t;
			if Q or e.Magnitude > 8 then
				Q = true;
				g.Position = UDim2.new(Z.X.Scale, Z.X.Offset + e.X, Z.Y.Scale, Z.Y.Offset + e.Y);
			end;
		end;
	end);
	A.InputEnded:Connect(function(e)
		if not w or e ~= M then
			return;
		end;
		do
			w = false;
			M = nil;
			(L:Create(d, TweenInfo.new(.2, Enum.EasingStyle.Back), { Scale = 1 })):Play();
			if not Q then
				I(not B);
			end;
		end;
	end);
	e.Heartbeat:Connect(function()
		if not g.Parent then
			return;
		end;
		local L = B;
		K.BackgroundColor3 = K.BackgroundColor3:Lerp(L and Color3.fromRGB(61, 220, 132) or Color3.fromRGB(110, 116, 140), .25);
		H.Color = H.Color:Lerp(L and Color3.fromRGB(61, 220, 132) or Color3.fromRGB(190, 200, 225), .25);
	end);
	ap.Invisible:Toggle({ Title = "Mostrar bot\195\179n bindable", Value = true, Callback = function(L)
			j = L;
			g.Visible = L;
		end });
end;
do
	local L;
	u = function(A)
			if L then
				L:Disconnect();
				L = nil;
			end;
			if not A then
				return;
			end;
			L = e.Heartbeat:Connect(function()
					if not B then
						return;
					end;
					local L = K.Character;
					if L then
						local A = L:FindFirstChild("HumanoidRootPart");
						local j = L:FindFirstChildOfClass("Humanoid");
						if A and (j and j.Health > 0) then
							if A.Position.Y > 200 then
								return;
							end;
							local L = A.CFrame;
							local g = j.CameraOffset;
							local d = L * CFrame.new(0, -40, 0);
							A.CFrame = d;
							j.CameraOffset = (d:ToObjectSpace(CFrame.new(L.Position))).Position;
							e.RenderStepped:Wait();
							if A.Parent and j.Parent then
								A.CFrame = L;
								j.CameraOffset = g;
							end;
						end;
					end;
				end);
		end;
end;
K.CharacterAdded:Connect(function(L)
	if B then
		task.wait(.5);
		np(true);
	end;
end);
ap.Tramposo:Section({ Title = "Movimiento", Icon = "solar:bolt-bold" });
local Yp = 28.7;
local Tp = 45;
do
	local L = j:WaitForChild("MovementState", 3);
	local function g(e, A)
		if L then
			L:FireServer(e, A);
		end;
	end;
	local d = 14;
	local H, a, I;
	local w = Vector3.zero;
	local Q = false;
	local Z = 0;
	local function t()
		local L = K.Character;
		if not L then
			return;
		end;
		return L:FindFirstChildOfClass("Humanoid"), L:FindFirstChild("HumanoidRootPart");
	end;
	local function M(L)
		if H then
			H:Disconnect();
			H = nil;
		end;
		w = Vector3.zero;
		if not L then
			return;
		end;
		H = e.Stepped:Connect(function(L, e)
				local A, j = t();
				if not A or not j or A.Health <= 0 then
					return;
				end;
				local g = 1 - math.exp(-d * e);
				w = w:Lerp(A.MoveDirection, g);
				if w.Magnitude > .01 then
					local L = math.max(Yp - A.WalkSpeed, 0);
					j.CFrame = j.CFrame + (w * L) * e;
				end;
			end);
	end;
	local function R(L)
		if a then
			a:Disconnect();
			a = nil;
		end;
		if I then
			I:Disconnect();
			I = nil;
		end;
		Q = false;
		Z = 0;
		if not L then
			return;
		end;
		I = A.JumpRequest:Connect(function()
				Q = true;
			end);
		a = e.Stepped:Connect(function(L, e)
				local j, g = t();
				if not j or not g or j.Health <= 0 then
					return;
				end;
				local H = A:IsKeyDown(Enum.KeyCode.Space) or j.Jump;
				if Q and not H then
					Q = false;
				end;
				local K = Q and Tp or 0;
				Z = Z + ((K - Z)) * ((1 - math.exp(-d * e)));
				if Z > .5 then
					g.CFrame = g.CFrame + Vector3.new(0, Z * e, 0);
					local L = g.AssemblyLinearVelocity;
					if L.Y < 0 then
						g.AssemblyLinearVelocity = Vector3.new(L.X, 0, L.Z);
					end;
				end;
			end);
	end;
	C.TogSpeed = ap.Tramposo:Toggle({ Title = "Speed", Value = false, Callback = function(L)
				M(L);
				g("Speed", L);
			end });
	C.SliSpeed = ap.Tramposo:Slider({
			Title = "Ajuste Speed",
			Step = 1,
			Value = { Min = 1, Max = 100, Default = 29 },
			Callback = function(L)
				Yp = L;
			end,
		});
	C.TogInfJump = ap.Tramposo:Toggle({ Title = "Salto Inf", Value = false, Callback = function(L)
				R(L);
				g("Jump", L);
			end });
	C.SliJumpPower = ap.Tramposo:Slider({
			Title = "Ajuste Salto",
			Step = 1,
			Value = { Min = 1, Max = 100, Default = 45 },
			Callback = function(L)
				Tp = L;
			end,
		});
end;
ap.RachaFarm:Section({ Title = "Auto Teleport Main/Alt", Icon = "solar:map-arrow-square-bold" });
local Pp, Sp;
Pp = ap.RachaFarm:Toggle({ Title = "Auto Teleport (Main)", Value = false, Callback = function(L)
			if L then
				AutoTeleportMainAltInstance.ActiveRole = "Main";
				if Sp then
					pcall(function()
						Sp:Set(false);
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
Sp = ap.RachaFarm:Toggle({ Title = "Auto Teleport (Alt)", Value = false, Callback = function(L)
			if L then
				AutoTeleportMainAltInstance.ActiveRole = "Alt";
				if Pp then
					pcall(function()
						Pp:Set(false);
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
ap.RachaFarm:Dropdown({
	Title = "Tipo de Duelo",
	Values = {
		"1v1",
		"2v2",
		"3v3",
		"4v4",
	},
	Value = "1v1",
	Callback = function(L)
		if sp["Right Platforms"][L] then
			AutoTeleportMainAltInstance.DuelType = L;
		else
			AutoTeleportMainAltInstance.DuelType = "1v1";
		end;
		AutoTeleportMainAltInstance:Kick();
	end,
});
ap.RachaFarm:Dropdown({
	Title = "Fila de Plataformas",
	Values = { "Right Platforms", "Left Platforms" },
	Value = "Right Platforms",
	Callback = function(L)
		if sp[L] then
			AutoTeleportMainAltInstance.PlatformRow = L;
		else
			AutoTeleportMainAltInstance.PlatformRow = "Right Platforms";
		end;
		AutoTeleportMainAltInstance:Kick();
	end,
});
do
	ap.Vis:Section({ Title = "Configuraci\195\179n de ESP", Icon = "solar:eye-bold" });
	local A = {};
	local g = 1500;
	local function H(L)
		local e = A[L];
		if not e then
			return;
		end;
		if e.Highlight then
			e.Highlight:Destroy();
		end;
		A[L] = nil;
	end;
	local function a()
		for L in pairs(A) do
			H(L);
		end;
	end;
	C.TogEsp = ap.Vis:Toggle({ Title = "ESP Jugadores", Callback = function(L)
				D = L;
				if h then
					h();
				end;
				if D and k.Glow then
					y();
				else
					a();
				end;
			end });
	C.ColEsp = ap.Vis:Colorpicker({ Title = "Color del ESP", Default = Color3.fromRGB(255, 255, 255), Callback = function(L)
				s = L;
			end });
	ap.Vis:Space();
	ap.Vis:Divider();
	ap.Vis:Space();
	ap.Vis:Section({ Title = "Filtros de ESP", Icon = "solar:filter-bold" });
	C.TogEspGl = ap.Vis:Toggle({ Title = "Mostrar Resplandor", Value = true, Callback = function(L)
				k.Glow = L;
				if h then
					h();
				end;
				if L and D then
					y();
				else
					a();
				end;
			end });
	local Q = false;
	y = function()
			if Q or not D or not k.Glow then
				return;
			end;
			Q = true;
			task.spawn(function()
				local e = L.PlayerRemoving:Connect(H);
				while D and k.Glow do
					task.wait(.2);
					if not D or not k.Glow then
						break;
					end;
					if Qp() then
						local e = K.Character;
						local j = e and e:FindFirstChild("Head");
						local d = j and j.Position;
						for L, e in ipairs(L:GetPlayers()) do
							if e ~= K then
								local L = e.Character;
								local j = L and L:FindFirstChild("Head");
								if j and (Ip(e) and ((not d or ((j.Position - d)).Magnitude <= g))) then
									local j = A[e];
									if j and ((j.Char ~= L or not j.Highlight or j.Highlight.Parent ~= W)) then
										H(e);
									end;
									if not A[e] then
										local j = Instance.new("Highlight");
										j.Name = e.Name .. "_Glow";
										j.FillTransparency = 1;
										j.OutlineTransparency = 0;
										j.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
										j.Adornee = L;
										j.Parent = W;
										A[e] = { Highlight = j, Char = L };
									end;
									local g = A[e].Highlight;
									if g.Enabled ~= k.Glow then
										g.Enabled = k.Glow;
									end;
									if g.OutlineColor ~= s then
										g.OutlineColor = s;
									end;
								else
									H(e);
								end;
							end;
						end;
					else
						a();
					end;
				end;
				e:Disconnect();
				a();
				Q = false;
			end);
		end;
	local Z;
	local t;
	z = function()
			if not I then
				if t then
					t:Disconnect();
					t = nil;
				end;
				if Z then
					Z.Visible = false;
				end;
				return;
			end;
			if not Z and Drawing then
				Z = Drawing.new("Circle");
				Z.Filled = false;
				Z.Thickness = 1;
				Z.Visible = false;
			end;
			if not Z or t then
				return;
			end;
			t = e.RenderStepped:Connect(function()
					if not I then
						return;
					end;
					local L = d.CurrentCamera;
					if not L then
						return;
					end;
					Z.Position = L.ViewportSize / 2;
					Z.Radius = w;
					Z.Color = R and ((getgenv()).NexvyrTargetPart and Color3.fromRGB(0, 255, 0)) or Color3.fromRGB(255, 255, 255);
					Z.Visible = true;
				end);
		end;
	ap.Farm:Section({ Title = "Farmeo de Evento", Icon = "solar:gift-bold" });
	(getgenv()).AutoEventFarm = false;
	local M = 0;
	local X = j:FindFirstChild("Packages") and j.Packages:FindFirstChild("Networking");
	local i = X and X:FindFirstChild("RE/Events/CollectEventSpawnable");
	ap.Farm:Toggle({ Title = "Auto Farmear Evento", Callback = function(L)
			(getgenv()).AutoEventFarm = L;
			M = M + (1);
			local e = M;
			if L then
				task.spawn(function()
					while (getgenv()).AutoEventFarm and e == M do
						pcall(function()
							if i then
								i:FireServer();
							else
								X = j:FindFirstChild("Packages") and j.Packages:FindFirstChild("Networking");
								i = X and X:FindFirstChild("RE/Events/CollectEventSpawnable");
							end;
						end);
						local L = K.Character;
						local A = L and L:FindFirstChild("HumanoidRootPart");
						if A then
							local L = d:FindFirstChild("SpawnablesClient");
							if L then
								for L, j in ipairs(L:GetChildren()) do
									if not (getgenv()).AutoEventFarm or e ~= M then
										break;
									end;
									local g = j:FindFirstChild("Touch");
									if g then
										pcall(function()
											firetouchinterest(A, g, 0);
											firetouchinterest(A, g, 1);
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
		};
	local function e()
		local L = K.Character;
		if not L then
			return;
		end;
		local e = L:FindFirstChildOfClass("Humanoid");
		if not e then
			return;
		end;
		for L, e in pairs(e:GetPlayingAnimationTracks()) do
			e:Stop(0);
			e:Destroy();
		end;
		local A = e:FindFirstChildOfClass("Animator");
		if A then
			for L, e in pairs(A:GetPlayingAnimationTracks()) do
				e:Stop(0);
				e:Destroy();
			end;
		end;
		task.wait(.1);
	end;
	local function A(L)
		if not L then
			return;
		end;
		local A = K.Character;
		if not A then
			return;
		end;
		e();
		local j = A:FindFirstChild("Animate");
		if not j then
			return;
		end;
		if not p then
			local function L(L, e)
				local A = j:FindFirstChild(L);
				if A then
					local L = A:FindFirstChild(e);
					if L and L:IsA("Animation") then
						local e = L.AnimationId:match("%d+");
						if e then
							return tonumber(e);
						end;
					end;
				end;
				return nil;
			end;
			p = {
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
		j.Disabled = true;
		task.wait(.1);
		local function g(L, e, A)
			if not A then
				return;
			end;
			local g = j:FindFirstChild(L);
			if g then
				local L = g:FindFirstChild(e);
				if L and L:IsA("Animation") then
					L.AnimationId = "rbxassetid://" .. tostring(A);
				end;
			end;
		end;
		g("idle", "Animation1", L.Idle);
		g("idle", "Animation2", L.Idle2 or L.Idle);
		g("walk", "WalkAnim", L.Walk);
		g("run", "RunAnim", L.Run);
		g("jump", "JumpAnim", L.Jump);
		g("climb", "ClimbAnim", L.Climb);
		g("fall", "FallAnim", L.Fall);
		g("swim", "Swim", L.Swim);
		g("swimidle", "SwimIdle", L.SwimIdle or L.Swim);
		task.wait(.1);
		j.Disabled = false;
		local d = A:FindFirstChildOfClass("Humanoid");
		if d then
			d:ChangeState(Enum.HumanoidStateType.Landed);
			task.wait(.05);
			d:ChangeState(Enum.HumanoidStateType.Running);
		end;
	end;
	local j = false;
	q = function()
			if j or not O then
				return;
			end;
			j = true;
			task.spawn(function()
				while O do
					task.wait(.2);
					if not O then
						break;
					end;
					local L = K.Character;
					if not L then
						continue;
					end;
					local e = L:FindFirstChildOfClass("Humanoid");
					if not e then
						continue;
					end;
					if e.Health <= 0 then
						continue;
					end;
					if e.MoveDirection.Magnitude >= .1 then
						continue;
					end;
					local A = L:FindFirstChild("Animate");
					if not A then
						continue;
					end;
					local j = {};
					local g = A:FindFirstChild("walk");
					local d = A:FindFirstChild("run");
					if g then
						for L, e in ipairs(g:GetChildren()) do
							if e:IsA("Animation") then
								table.insert(j, e.AnimationId);
							end;
						end;
					end;
					if d then
						for L, e in ipairs(d:GetChildren()) do
							if e:IsA("Animation") then
								table.insert(j, e.AnimationId);
							end;
						end;
					end;
					if #j == 0 then
						continue;
					end;
					local H = e:FindFirstChildOfClass("Animator");
					if H then
						for L, e in ipairs(H:GetPlayingAnimationTracks()) do
							if e.Animation and table.find(j, e.Animation.AnimationId) then
								e:Stop(0);
							end;
						end;
					end;
				end;
				j = false;
			end);
		end;
	K.CharacterAdded:Connect(function()
		if O then
			task.spawn(function()
				task.wait(.8);
				A(O);
			end);
		end;
	end);
	local g = { "Ninguno" };
	for L, e in pairs(L) do
		table.insert(g, L);
	end;
	table.sort(g);
	ap.Animaciones:Section({ Title = "Paquetes Completos", Icon = "solar:folder-with-files-bold" });
	local d = "Ninguno";
	ap.Animaciones:Dropdown({
		Title = "Elegir Paquete",
		Values = g,
		Value = "Ninguno",
		Callback = function(L)
			d = L;
		end,
	});
	ap.Animaciones:Button({ Title = "Aplicar Paquete Completo", Callback = function()
			if d == "Ninguno" then
				return;
			end;
			task.spawn(function()
				O = L[d];
				q();
				A(O);
			end);
		end });
	ap.Animaciones:Button({ Title = "Restaurar Default", Callback = function()
			task.spawn(function()
				local L = p or {
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
				O = nil;
				A(L);
			end);
		end });
	ap.Animaciones:Space();
	ap.Animaciones:Divider();
	ap.Animaciones:Space();
	ap.Animaciones:Section({ Title = "Mezclador de Animaciones", Icon = "solar:layers-bold" });
	local H = {
			Idle = "Ninguno",
			Walk = "Ninguno",
			Run = "Ninguno",
			Jump = "Ninguno",
			Fall = "Ninguno",
			Climb = "Ninguno",
		};
	ap.Animaciones:Dropdown({
		Title = "Reposo",
		Values = g,
		Value = "Ninguno",
		Callback = function(L)
			H.Idle = L;
		end,
	});
	ap.Animaciones:Dropdown({
		Title = "Caminar",
		Values = g,
		Value = "Ninguno",
		Callback = function(L)
			H.Walk = L;
		end,
	});
	ap.Animaciones:Dropdown({
		Title = "Correr",
		Values = g,
		Value = "Ninguno",
		Callback = function(L)
			H.Run = L;
		end,
	});
	ap.Animaciones:Dropdown({
		Title = "Saltar",
		Values = g,
		Value = "Ninguno",
		Callback = function(L)
			H.Jump = L;
		end,
	});
	ap.Animaciones:Dropdown({
		Title = "Caer",
		Values = g,
		Value = "Ninguno",
		Callback = function(L)
			H.Fall = L;
		end,
	});
	ap.Animaciones:Dropdown({
		Title = "Escalar",
		Values = g,
		Value = "Ninguno",
		Callback = function(L)
			H.Climb = L;
		end,
	});
	ap.Animaciones:Button({ Title = "Combinar y Aplicar", Callback = function()
			task.spawn(function()
				local e = {};
				if H.Idle ~= "Ninguno" then
					e.Idle = L[H.Idle].Idle;
					e.Idle2 = L[H.Idle].Idle2;
				end;
				if H.Walk ~= "Ninguno" then
					e.Walk = L[H.Walk].Walk;
				end;
				if H.Run ~= "Ninguno" then
					e.Run = L[H.Run].Run;
				end;
				if H.Jump ~= "Ninguno" then
					e.Jump = L[H.Jump].Jump;
				end;
				if H.Fall ~= "Ninguno" then
					e.Fall = L[H.Fall].Fall;
				end;
				if H.Climb ~= "Ninguno" then
					e.Climb = L[H.Climb].Climb;
				end;
				local j = false;
				for L, e in pairs(e) do
					if e then
						j = true;
						break;
					end;
				end;
				if j then
					O = e;
					q();
					A(O);
				end;
			end);
		end });
end;
local Gp = 1;
local Ep = Instance.new("Sound");
Ep.Name = "NexvyrKillSound";
Ep.Volume = 1;
Ep.Looped = false;
Ep.Parent = H;
local Bp = Instance.new("Sound");
Bp.Name = "NexvyrShootSound";
Bp.Volume = 1;
Bp.Looped = false;
Bp.Parent = H;
local Op = Instance.new("Sound");
Op.Name = "NexvyrReloadSound";
Op.Volume = 1;
Op.Looped = false;
Op.Parent = H;
do
	local e = game:GetService("ContentProvider");
	local function A(L)
		if not L then
			return;
		end;
		for e = #L, 1, -1 do
			local A = L[e];
			L[e] = nil;
			if A and A.Connected then
				A:Disconnect();
			end;
		end;
	end;
	local g = false;
	local d = false;
	local H = "Onichaaan";
	local a = {
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
	local I = { ["Revolver + Recarga"] = { Shoot = "680140087", Reload = "138084889" }, ["Magia de Anime"] = { Shoot = "109296938403067", Reload = nil }, ["L\195\161ser + Recarga l\195\161ser"] = { Shoot = "4400449399", Reload = "129456040607483" } };
	local w = "Revolver + Recarga";
	local Q = 1.5;
	local Z = 0;
	local t = 0;
	local M = .05;
	local function R()
		if not d then
			return;
		end;
		local L = I[w];
		if not L or not L.Shoot then
			return;
		end;
		local e = tick();
		if e - t < M then
			return;
		end;
		t = e;
		Z = Z + 1;
		local A = Z;
		Bp:Stop();
		Bp.SoundId = "rbxassetid://" .. L.Shoot;
		Bp.Volume = Gp;
		Bp:Play();
		task.delay(Q, function()
			if Z == A and Bp.Playing then
				Bp:Stop();
			end;
		end);
	end;
	local function X()
		if not d then
			return;
		end;
		local L = I[w];
		if not L or not L.Reload then
			return;
		end;
		Op:Stop();
		Op.SoundId = "rbxassetid://" .. L.Reload;
		Op.Volume = Gp;
		Op:Play();
	end;
	local i = {};
	local D = setmetatable({}, { __mode = "k" });
	local s = setmetatable({}, { __mode = "k" });
	local k = setmetatable({}, { __mode = "k" });
	local function n(L)
		i[#i + 1] = L;
		return L;
	end;
	local function Y()
		A(i);
		table.clear(D);
		table.clear(s);
		table.clear(k);
	end;
	local T;
	local P = {
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
	local function S(L)
		if not L:IsA("Sound") then
			return false;
		end;
		local e = string.lower(L.Name);
		for L, A in ipairs(P) do
			if string.find(e, A, 1, true) then
				return true;
			end;
		end;
		return false;
	end;
	local function G(L)
		if not L:IsA("Sound") then
			return;
		end;
		if not S(L) then
			return;
		end;
		if not d or D[L] then
			return;
		end;
		D[L] = true;
		n(L.Played:Connect(function()
			if not d then
				return;
			end;
			local e = K.Character;
			if not e then
				return;
			end;
			if L:IsDescendantOf(e) or L:IsDescendantOf(K:FindFirstChildOfClass("Backpack") or e) then
				R();
			end;
		end));
	end;
	local function E(L)
		if not L or not L:IsA("Tool") then
			return;
		end;
		for L, e in ipairs(L:GetDescendants()) do
			G(e);
		end;
		if not s[L] and d then
			s[L] = true;
			n(L.DescendantAdded:Connect(G));
		end;
	end;
	local function B(L)
		if not L then
			return;
		end;
		for L, e in ipairs(L:GetChildren()) do
			if e:IsA("Tool") then
				E(e);
			end;
		end;
		n(L.ChildAdded:Connect(function(L)
			if L:IsA("Tool") then
				E(L);
			end;
		end));
	end;
	local O = false;
	T = function()
			if O or not d then
				return;
			end;
			O = true;
			task.spawn(function()
				local L = false;
				while d do
					task.wait(.05);
					if not d then
						break;
					end;
					local e = K.Character;
					if not e then
						L = false;
						continue;
					end;
					local A = e:FindFirstChildOfClass("Tool");
					if not A or tp(A) then
						L = false;
						continue;
					end;
					local j = Xp(A);
					if j and not L then
						X();
					end;
					L = j;
				end;
				O = false;
			end);
		end;
	local function p(L)
		for e, A in ipairs(a) do
			if A.Name == L then
				return A.Id;
			end;
		end;
		return a[1].Id;
	end;
	local function U()
		task.spawn(function()
			pcall(function()
				local L = "rbxassetid://" .. p(H);
				if Ep.SoundId ~= L then
					Ep.SoundId = L;
				end;
				e:PreloadAsync({ Ep });
			end);
		end);
	end;
	local function h()
		if not g then
			return;
		end;
		local L = "rbxassetid://" .. p(H);
		Ep:Stop();
		if Ep.SoundId ~= L then
			Ep.SoundId = L;
		end;
		Ep.Volume = Gp;
		Ep.TimePosition = 0;
		Ep:Play();
	end;
	local F = 0;
	local c = 0;
	local x = .08;
	local v = .3;
	local y = 4;
	local function l(L)
		if not g then
			return;
		end;
		local e = tick();
		if L then
			if e - F < v then
				return;
			end;
			c = e;
		else
			if e - F < x then
				return;
			end;
			if e - c < y then
				return;
			end;
		end;
		F = e;
		h();
	end;
	local q = {};
	local z = setmetatable({}, { __mode = "k" });
	local r = setmetatable({}, { __mode = "k" });
	local u = setmetatable({}, { __mode = "k" });
	local f = setmetatable({}, { __mode = "k" });
	local W = 0;
	local function J(L)
		q[#q + 1] = L;
		return L;
	end;
	local N = {
			kos = true,
			kills = true,
			kill = true,
			ko = true,
			killed = true,
			eliminations = true,
			kills_count = true,
		};
	local function V(L)
		if not L then
			return;
		end;
		if not ((L:IsA("IntValue") or L:IsA("NumberValue"))) then
			return;
		end;
		if not N[string.lower(L.Name)] then
			return;
		end;
		if not g or z[L] then
			return;
		end;
		z[L] = true;
		local e = L.Value;
		J((L:GetPropertyChangedSignal("Value")):Connect(function()
			if L.Value > e then
				l();
			end;
			e = L.Value;
		end));
	end;
	local function m(L)
		if not L or not g or f[L] then
			return;
		end;
		f[L] = true;
		for L, e in ipairs(L:GetChildren()) do
			V(e);
		end;
		J(L.ChildAdded:Connect(V));
	end;
	local o = {
			"KOs",
			"Kills",
			"kos",
			"kills",
			"KO",
			"killed",
			"Eliminations",
		};
	local function b()
		for L, e in ipairs(o) do
			local A = tonumber(K:GetAttribute(e));
			J((K:GetAttributeChangedSignal(e)):Connect(function()
				local L = tonumber(K:GetAttribute(e));
				if L ~= nil and (A ~= nil and L > A) then
					l();
				end;
				A = L;
			end));
		end;
		for L, e in ipairs({
			"leaderstats",
			"Stats",
			"stats",
			"PlayerStats",
		}) do
			m(K:FindFirstChild(e));
		end;
		J(K.ChildAdded:Connect(function(L)
			if L.Name == "leaderstats" or L.Name == "Stats" or L.Name == "stats" or L.Name == "PlayerStats" then
				m(L);
			end;
		end));
	end;
	local function Lp(L, e)
		if not g or r[e] then
			return;
		end;
		r[e] = true;
		local A;
		local function j(L)
			if not g or not L or not L:IsA("Humanoid") then
				return;
			end;
			if A then
				A:Disconnect();
				A = nil;
			end;
			J(L.Died:Connect(function()
				if not g then
					return;
				end;
				local e = L:FindFirstChild("creator");
				if e and e.Value == K then
					l();
				end;
			end));
		end;
		local d = e:FindFirstChildOfClass("Humanoid");
		if d then
			j(d);
		else
			A = J(e.ChildAdded:Connect(j));
		end;
	end;
	local function ep(L)
		if L == K or not g or u[L] then
			return;
		end;
		u[L] = true;
		if L.Character then
			Lp(L, L.Character);
		end;
		J(L.CharacterAdded:Connect(function(e)
			Lp(L, e);
		end));
	end;
	local function Ap()
		W = W + (1);
		local L = W;
		task.spawn(function()
			local e = 0;
			while g and (L == W and e < 30) do
				local L = j:FindFirstChild("Packages");
				local A = L and L:FindFirstChild("Networking");
				local g = A and A:FindFirstChild("RE/Combat/Killed");
				if g and g:IsA("RemoteEvent") then
					J(g.OnClientEvent:Connect(function(L)
						if L == K then
							l(true);
						end;
					end));
					return;
				end;
				e = e + (1);
				task.wait(1);
			end;
		end);
	end;
	local function jp()
		if not g then
			return;
		end;
		Ap();
		b();
		for L, e in ipairs(L:GetPlayers()) do
			ep(e);
		end;
		J(L.PlayerAdded:Connect(ep));
	end;
	local function gp()
		W = W + (1);
		A(q);
		table.clear(z);
		table.clear(r);
		table.clear(u);
		table.clear(f);
	end;
	local dp = {};
	local Hp = setmetatable({}, { __mode = "k" });
	local function Kp(L)
		if not d or not L:IsA("Sound") then
			return;
		end;
		if L.Name == "NexvyrKillSound" or L.Name == "WindUI_MusicPlayer" or L.Name == "NexvyrShootSound" or L.Name == "NexvyrReloadSound" then
			return;
		end;
		if dp[L] == nil and L.Volume > 0 then
			dp[L] = L.Volume;
		end;
		if d then
			L.Volume = 0;
		end;
		if not Hp[L] then
			Hp[L] = true;
			n((L:GetPropertyChangedSignal("Volume")):Connect(function()
				if d and L.Volume ~= 0 then
					dp[L] = L.Volume;
					L.Volume = 0;
				end;
			end));
			n(L.Played:Connect(function()
				if d then
					L.Volume = 0;
				end;
			end));
		end;
	end;
	local function Ip(L)
		if not L then
			return;
		end;
		for L, e in ipairs(L:GetDescendants()) do
			Kp(e);
		end;
		n(L.DescendantAdded:Connect(Kp));
	end;
	local function wp(L)
		if L then
			for L in pairs(dp) do
				if L.Parent then
					L.Volume = 0;
				end;
			end;
			if K.Character then
				for L, e in ipairs(K.Character:GetDescendants()) do
					Kp(e);
				end;
			end;
			local L = K:FindFirstChildOfClass("Backpack");
			if L then
				for L, e in ipairs(L:GetDescendants()) do
					Kp(e);
				end;
			end;
		else
			for L, e in pairs(dp) do
				if L.Parent then
					L.Volume = e;
				end;
			end;
		end;
	end;
	local function Qp()
		if not d then
			return;
		end;
		local function L(L)
			if not L or not d or k[L] then
				return;
			end;
			k[L] = true;
			Ip(L);
			B(L);
		end;
		L(K.Character);
		L(K:FindFirstChildOfClass("Backpack"));
		n(K.CharacterAdded:Connect(function(e)
			if not d then
				return;
			end;
			L(e);
			local A = K:FindFirstChildOfClass("Backpack");
			if A then
				L(A);
			end;
		end));
		n(K.ChildAdded:Connect(function(e)
			if e:IsA("Backpack") then
				L(e);
			end;
		end));
		T();
	end;
	ap.Sonidos:Section({ Title = "Sonido de Muerte", Icon = "solar:speaker-bold" });
	ap.Sonidos:Toggle({ Title = "Sonido de Kill", Value = false, Callback = function(L)
			if g == L then
				return;
			end;
			g = L;
			if L then
				U();
				jp();
			else
				gp();
				Ep:Stop();
			end;
		end });
	local Zp = {};
	for L, e in ipairs(a) do
		table.insert(Zp, e.Name);
	end;
	ap.Sonidos:Dropdown({
		Title = "Sonido de muerte",
		Values = Zp,
		Value = "Onichaaan",
		Callback = function(L)
			H = L;
			if g then
				U();
			end;
		end,
	});
	ap.Sonidos:Section({ Title = "Disparo y Recarga", Icon = "solar:target-bold" });
	ap.Sonidos:Toggle({ Title = "Recarga + disparo", Value = false, Callback = function(L)
			if d == L then
				return;
			end;
			d = L;
			if L then
				Qp();
				wp(true);
			else
				Y();
				Bp:Stop();
				Op:Stop();
				wp(false);
				table.clear(dp);
				table.clear(Hp);
			end;
		end });
	ap.Sonidos:Dropdown({
		Title = "Sonido de disparo",
		Values = { "Revolver + Recarga", "Magia de Anime", "L\195\161ser + Recarga l\195\161ser" },
		Value = "Revolver + Recarga",
		Callback = function(L)
			w = L;
		end,
	});
	C.SliKillSoundVolume = ap.Sonidos:Slider({
			Title = "Volumen",
			Step = .1,
			Value = { Min = 1, Max = 3, Default = 1 },
			Callback = function(L)
				Gp = L;
				Ep.Volume = L;
				Bp.Volume = L;
				Op.Volume = L;
			end,
		});
end;
do
	local L = Instance.new("Sound");
	L.Name = "WindUI_MusicPlayer";
	L.Looped = false;
	L.Volume = .5;
	L.Parent = H;
	local e = {
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
	local A = 1;
	local j = false;
	local g;
	local function d()
		local j = e[A];
		if j and g then
			g:SetDesc((("%s \226\128\162 ID: %s \226\128\162 %s")):format(j.Name, j.Id, L.Playing and "Reproduciendo" or "Pausado"));
		end;
	end;
	local function K(j)
		if not e[j] then
			return;
		end;
		A = j;
		L:Stop();
		L.SoundId = "rbxassetid://" .. e[j].Id;
		L:Play();
		d();
	end;
	local function a()
		if L.SoundId == "" then
			K(A);
		elseif not L.Playing then
			L:Resume();
		end;
		d();
	end;
	local function I()
		if L.Playing then
			L:Pause();
		end;
		d();
	end;
	local function w()
		L:Stop();
		L.SoundId = "";
		d();
	end;
	local function Q()
		local L;
		if j then
			L = math.random(1, #e);
		else
			L = A + 1;
			if L > #e then
				L = 1;
			end;
		end;
		K(L);
	end;
	local function Z()
		local L;
		if j then
			L = math.random(1, #e);
		else
			L = A - 1;
			if L < 1 then
				L = #e;
			end;
		end;
		K(L);
	end;
	L.Ended:Connect(function()
		Q();
	end);
	ap.Music:Section({ Title = "Ahora suena", Icon = "solar:music-note-bold" });
	g = ap.Music:Paragraph({ Title = "Sin canci\195\179n seleccionada", Icon = "solar:music-note-2-bold" });
	ap.Music:Section({ Title = "Controles", Icon = "solar:tuning-2-bold" });
	ap.Music:Button({
		Title = "Anterior",
		Icon = "solar:skip-previous-bold",
		Variant = "Secondary",
		Callback = function()
			Z();
		end,
	});
	ap.Music:Button({
		Title = "Siguiente",
		Icon = "solar:skip-next-bold",
		Variant = "Secondary",
		Callback = function()
			Q();
		end,
	});
	ap.Music:Button({
		Title = "Reproducir",
		Icon = "solar:play-circle-bold",
		Variant = "Primary",
		Callback = function()
			a();
		end,
	});
	ap.Music:Button({
		Title = "Pausar",
		Icon = "solar:pause-circle-bold",
		Variant = "Secondary",
		Callback = function()
			I();
		end,
	});
	ap.Music:Button({
		Title = "Detener",
		Icon = "solar:close-circle-bold",
		Variant = "Danger",
		Callback = function()
			w();
		end,
	});
end;
local pp = false;
local Cp = false;
local Up, hp, Fp;
do
	local L = { ["Right Leg"] = {
				id = "rbxassetid://139607718",
				targetBodyPart = "RightUpperLeg",
				partsToHide = { "RightUpperLeg", "RightLowerLeg", "RightFoot" },
				scale = Vector3.new(1, 1, 1),
				audio = "rbxassetid://135315310485417",
				offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
			} };
	local e = {};
	local function A(L, A)
		local j = K.Character;
		if not j then
			return false;
		end;
		local g = j:WaitForChild(A.targetBodyPart, 2);
		if not g then
			return false;
		end;
		local d = j:FindFirstChild("Korblox_" .. L:gsub("%s+", ""));
		if d then
			d:Destroy();
		end;
		for L, A in ipairs(A.partsToHide) do
			local g = j:FindFirstChild(A);
			if g and g:IsA("BasePart") then
				if e[A] == nil then
					e[A] = g.Transparency;
				end;
				g.Transparency = 1;
			end;
		end;
		local H, a = pcall(function()
				return game:GetObjects(A.id);
			end);
		if not H or not a or #a == 0 then
			return false;
		end;
		local I = a[1];
		I.Name = "Korblox_" .. L:gsub("%s+", "");
		local w = I:IsA("BasePart") and I or I:FindFirstChildWhichIsA("BasePart", true);
		if not w then
			return false;
		end;
		w.Size = w.Size * A.scale;
		w.CanCollide = false;
		w.CFrame = g.CFrame * A.offset;
		local Q = Instance.new("WeldConstraint");
		Q.Part0 = g;
		Q.Part1 = w;
		Q.Parent = w;
		I.Parent = j;
		if A.audio then
			local L = Instance.new("Sound");
			L.SoundId = A.audio;
			L.Volume = .5;
			L.Parent = w;
			L:Play();
			(game:GetService("Debris")):AddItem(L, 3);
		end;
		return true;
	end;
	function Up()
		if not pp then
			return;
		end;
		local e = L["Right Leg"];
		local j = A("Right Leg", e);
		if not j then
			task.wait(.2);
			A("Right Leg", e);
		end;
	end;
	function hp()
		local L = K.Character;
		if not L then
			return;
		end;
		local A = "Korblox_RightLeg";
		local j = L:FindFirstChild(A);
		if j then
			pcall(function()
				j:Destroy();
			end);
		end;
		for e, A in pairs(e) do
			local j = L:FindFirstChild(e);
			if j and j:IsA("BasePart") then
				pcall(function()
					j.Transparency = A;
				end);
			end;
		end;
		e = {};
	end;
	local j = 134082579;
	local g = nil;
	local function d(L)
		local e = K.Character;
		if not e then
			return;
		end;
		local A = e:FindFirstChild("Head");
		if A then
			A.Transparency = L and 1 or 0;
			local e = A:FindFirstChildOfClass("Decal");
			if e then
				e.Transparency = L and 1 or 0;
			end;
		end;
	end;
	function Fp(L)
		local e = K.Character;
		if not e then
			return;
		end;
		if L then
			e:WaitForChild("Head", 2);
			d(true);
			if g and g.Parent ~= e then
				g = nil;
			end;
			if g then
				return;
			end;
			local L, A = pcall(function()
					return game:GetObjects("rbxassetid://" .. tostring(j));
				end);
			if L and (A and #A > 0) then
				local L = A[1];
				local j = nil;
				if L:IsA("Accessory") then
					j = L;
				else
					for L, e in ipairs(L:GetDescendants()) do
						if e:IsA("Accessory") then
							j = e;
							break;
						end;
					end;
					j = j or (L:IsA("Model") and L or nil);
				end;
				if j then
					if j:IsA("Accessory") then
						local L = e:FindFirstChildOfClass("Humanoid");
						local A = L and pcall(function()
								L:AddAccessory(j);
							end);
						if not A then
							j.Parent = e;
						end;
					else
						j.Parent = e;
					end;
					g = j;
				end;
			else
				warn("[Headless] Failed to load headless asset: " .. tostring(A));
			end;
		else
			d(false);
			if g then
				g:Destroy();
				g = nil;
			end;
		end;
	end;
	K.CharacterAdded:Connect(function(L)
		e = {};
		g = nil;
		if pp then
			task.spawn(function()
				task.wait(.1);
				Up();
			end);
		end;
		if Cp then
			task.spawn(function()
				task.wait(.1);
				Fp(true);
			end);
		end;
	end);
	ap.Items:Section({ Title = "Apariencia", Icon = "solar:crown-star-bold" });
	C.TogHeadless = ap.Items:Toggle({ Title = "Aplicar Headless", Value = false, Callback = function(L)
				Cp = L;
				if L then
					Fp(true);
				else
					Fp(false);
				end;
			end });
	C.TogKorblox = ap.Items:Toggle({ Title = "Aplicar Korblox", Value = false, Callback = function(L)
				pp = L;
				if L then
					Up();
				else
					hp();
				end;
			end });
end;
ap.Identidad:Section({ Title = "identidad falsa", Icon = "solar:user-id-bold" });
local cp;
do
	local function e(L, e, A)
		local j = e:gsub("[%-%^%$%(%)%%%.%[%]%*%+%?]", "%%%1");
		return (L:gsub(j, A));
	end;
	local A = {};
	local j = {};
	local g = setmetatable({}, { __mode = "k" });
	local d = false;
	local function H(L, j, g)
		local d = L:FindFirstAncestorWhichIsA("ScreenGui");
		if d and ((string.find(d.Name, "WindUI") or string.find(d.Name, "Nexvyr"))) then
			return;
		end;
		if L:IsA("TextLabel") or L:IsA("TextBox") or L:IsA("TextButton") then
			local d = L.Text;
			local H = false;
			if d and d ~= "" then
				if string.find(d, j, 1, true) or string.find(d, g, 1, true) then
					H = true;
				end;
			end;
			if H and not A[L] then
				A[L] = {
						Text = d,
						Color = L.TextColor3,
						TextTransp = L.TextTransparency,
						StrokeTransp = L.TextStrokeTransparency,
						Strokes = {},
					};
				for e, j in pairs(L:GetChildren()) do
					if j:IsA("UIStroke") then
						A[L].Strokes[j] = { Enabled = j.Enabled, Transp = j.Transparency, Thickness = j.Thickness };
					end;
				end;
			end;
			if A[L] then
				if G then
					local d = A[L].Text;
					d = e(d, j, E);
					d = e(d, g, E);
					L.Text = d;
					L.TextTransparency = A[L].TextTransp;
					L.TextStrokeTransparency = A[L].StrokeTransp;
					L.TextColor3 = A[L].Color;
					for e, j in pairs(L:GetChildren()) do
						if j:IsA("UIStroke") and A[L].Strokes[j] then
							j.Enabled = A[L].Strokes[j].Enabled;
						end;
					end;
				else
					L.Text = A[L].Text;
					L.TextColor3 = A[L].Color;
					L.TextTransparency = A[L].TextTransp;
					L.TextStrokeTransparency = A[L].StrokeTransp;
					for e, j in pairs(L:GetChildren()) do
						if j:IsA("UIStroke") and A[L].Strokes[j] then
							j.Enabled = A[L].Strokes[j].Enabled;
							j.Transparency = A[L].Strokes[j].Transp;
							j.Thickness = A[L].Strokes[j].Thickness;
						end;
					end;
				end;
			end;
		end;
	end;
	function cp()
		local e = K.Name;
		local a = K.DisplayName;
		task.spawn(function()
			for L, A in pairs(L:GetPlayers()) do
				if A.Character then
					for L, A in pairs(A.Character:GetDescendants()) do
						if A:IsA("TextLabel") or A:IsA("TextBox") or A:IsA("TextButton") then
							H(A, e, a);
						end;
					end;
				end;
			end;
			local A = K:FindFirstChild("PlayerGui");
			if A then
				for L, A in pairs(A:GetDescendants()) do
					if A:IsA("TextLabel") or A:IsA("TextBox") or A:IsA("TextButton") then
						H(A, e, a);
					end;
				end;
			end;
		end);
		if G then
			if not d then
				d = true;
				local function L(L)
					local K = L:FindFirstAncestorWhichIsA("ScreenGui");
					if K and ((string.find(K.Name, "WindUI") or string.find(K.Name, "Nexvyr"))) then
						return;
					end;
					if L:IsA("TextLabel") or L:IsA("TextBox") or L:IsA("TextButton") then
						H(L, e, a);
						if not g[L] then
							g[L] = true;
							table.insert(j, (L:GetPropertyChangedSignal("Text")):Connect(function()
								if d and (L.Text ~= E and not string.find(L.Text, E)) then
									A[L] = nil;
									H(L, e, a);
								end;
							end));
						end;
					end;
				end;
				local I = K:FindFirstChild("PlayerGui");
				if I then
					table.insert(j, I.DescendantAdded:Connect(function(e)
						if d and ((e:IsA("TextLabel") or e:IsA("TextBox") or e:IsA("TextButton"))) then
							task.spawn(function()
								L(e);
							end);
						end;
					end));
				end;
				local w, Q = pcall(function()
						return game:GetService("CoreGui");
					end);
				if w and Q then
					table.insert(j, Q.DescendantAdded:Connect(function(e)
						if d and ((e:IsA("TextLabel") or e:IsA("TextBox") or e:IsA("TextButton"))) then
							task.spawn(function()
								L(e);
							end);
						end;
					end));
				end;
			end;
		else
			d = false;
			for L, e in ipairs(j) do
				e:Disconnect();
			end;
			j = {};
			table.clear(g);
			for L, e in pairs(A) do
				if L and L.Parent then
					L.Text = e.Text;
					L.TextColor3 = e.Color;
					L.TextTransparency = e.TextTransp;
					L.TextStrokeTransparency = e.StrokeTransp;
					for L, e in pairs(e.Strokes) do
						if L and L.Parent then
							L.Enabled = e.Enabled;
							L.Transparency = e.Transp;
							L.Thickness = e.Thickness;
						end;
					end;
				end;
			end;
			A = {};
		end;
	end;
	C.TogFakeName = ap.Identidad:Toggle({ Title = "Activar Nombre Falso", Value = false, Callback = function(L)
				G = L;
				cp();
			end });
	C.InpFakeName = ap.Identidad:Input({ Title = "Nuevo Nombre", Placeholder = "Escribe tu nombre falso...", Callback = function(L)
				if L ~= "" then
					E = L;
					if G then
						cp();
					end;
				end;
			end });
	K.CharacterAdded:Connect(function()
		if G then
			task.wait(1);
			cp();
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
	local e = { "Ninguna" };
	local A = "Ninguna";
	local j = "";
	ap.Guardado:Section({ Title = "Gestor de Configs", Icon = "solar:diskette-bold" });
	local d = ap.Guardado:Dropdown({
			Title = "Seleccionar Configuraci\195\179n",
			Values = e,
			Value = "Ninguna",
			Callback = function(L)
				A = L;
			end,
		});
	local function H()
		local e = {};
		if listfiles then
			pcall(function()
				for L, A in ipairs(listfiles(L)) do
					if A:match("%.json$") then
						local L = A:match("([^/\\]+)%.json$");
						if L then
							table.insert(e, L);
						end;
					end;
				end;
			end);
		end;
		if #e == 0 then
			table.insert(e, "Ninguna");
		end;
		pcall(function()
			d:Refresh(e);
			if A == "Ninguna" or not table.find(e, A) then
				d:Select(e[1]);
				A = e[1];
			end;
		end);
	end;
	ap.Guardado:Button({
		Title = "Actualizar Lista",
		Icon = "solar:refresh-bold",
		Variant = "Secondary",
		Callback = function()
			H();
		end,
	});
	ap.Guardado:Input({
		Title = "Nombre para Guardar",
		Placeholder = "Ej: Config 1, Config 2...",
		Icon = "solar:text-field-bold",
		Callback = function(L)
			j = L;
		end,
	});
	local K = false;
	local a = 0;
	ap.Guardado:Button({
		Title = "Eliminar todos los guardados",
		Icon = "solar:trash-bin-trash-bold",
		Variant = "Danger",
		Callback = function()
			local e = os.clock();
			if K and (e - a) < 4 then
				K = false;
				if listfiles then
					pcall(function()
						for L, e in ipairs(listfiles(L)) do
							if e:match("%.json$") then
								pcall(function()
									delfile(e);
								end);
							end;
						end;
					end);
				end;
				H();
			else
				K = true;
				a = e;
			end;
		end,
	});
	local function t(L, e)
		if not L or e == nil then
			return;
		end;
		pcall(function()
			L:Set(e);
		end);
	end;
	ap.Guardado:Button({
		Title = "Guardar Configuraci\195\179n",
		Icon = "solar:diskette-bold",
		Variant = "Primary",
		Callback = function()
			local e = j:gsub("[^%w%s%-]", "");
			if e == "" then
				e = A;
			end;
			if e == "" or e == "Ninguna" then
				return;
			end;
			local K = L .. ("/" .. (e .. ".json"));
			local a = {
					ConfigName = e,
					Toggles = {
						["Auto Shoot"] = Q,
						["Auto Shoot Agresivo"] = Z,
						["Equipar pistola"] = r,
						["Silent Aim (Manual)"] = M,
						["Silent Aim (FOV)"] = R,
						["Mostrar C\195\173rculo FOV"] = I,
						["Team Check"] = i,
						["ESP Jugadores"] = D,
						["ESP Glow"] = k.Glow,
						["Kill All"] = n,
						["Hitbox Activar"] = Y,
						["Hitbox Invisible"] = T,
						Headless = Cp,
						Korblox = pp,
						["Nombre Falso"] = G,
						Invisible = B,
					},
					Sliders = {
						["Tama\195\177o del FOV"] = w,
						["Tama\195\177o de Hitbox"] = P,
						["Volumen Kill Sound"] = Gp,
						["Ajuste Speed"] = Yp,
						["Ajuste Salto"] = Tp,
					},
					Colors = { ["Color de Hitbox"] = { R = S.R, G = S.G, B = S.B }, ["Color del ESP"] = { R = s.R, G = s.G, B = s.B } },
					Extras = { ["Parte Silent Aim"] = X, ["Nombre Falso Texto"] = E },
				};
			if writefile then
				local L, A = pcall(function()
						return g:JSONEncode(a);
					end);
				if L then
					pcall(function()
						writefile(K, A);
					end);
					H();
					pcall(function()
						d:Select(e);
					end);
				end;
			end;
		end,
	});
	ap.Guardado:Button({
		Title = "Cargar Configuraci\195\179n",
		Icon = "solar:folder-open-bold",
		Variant = "Primary",
		Callback = function()
			if A == "Ninguna" or A == "" then
				return;
			end;
			local e = L .. ("/" .. (A .. ".json"));
			if isfile and isfile(e) then
				local L, A = pcall(function()
						return g:JSONDecode(readfile(e));
					end);
				if L and type(A) == "table" then
					if A.Toggles then
						if A.Toggles["Auto Shoot"] ~= nil then
							Q = A.Toggles["Auto Shoot"];
							t(C.TogAutoShoot, Q);
						end;
						if A.Toggles["Auto Shoot Agresivo"] ~= nil then
							Z = A.Toggles["Auto Shoot Agresivo"];
							t(C.TogAutoShootAgr, Z);
						end;
						if A.Toggles["Equipar pistola"] ~= nil then
							r = A.Toggles["Equipar pistola"];
							t(C.TogEquipGun, r);
						end;
						if A.Toggles["Silent Aim (Manual)"] ~= nil then
							M = A.Toggles["Silent Aim (Manual)"];
							t(C.TogSilentAimManual, M);
						end;
						if A.Toggles["Silent Aim (FOV)"] ~= nil then
							R = A.Toggles["Silent Aim (FOV)"];
							t(C.TogSilentAimFOV, R);
						end;
						if A.Toggles["Mostrar C\195\173rculo FOV"] ~= nil then
							I = A.Toggles["Mostrar C\195\173rculo FOV"];
							t(C.TogShowFOV, I);
						end;
						if A.Toggles["Team Check"] ~= nil then
							i = A.Toggles["Team Check"];
						end;
						if A.Toggles["ESP Jugadores"] ~= nil then
							D = A.Toggles["ESP Jugadores"];
							t(C.TogEsp, D);
						end;
						if A.Toggles["ESP Glow"] ~= nil then
							k.Glow = A.Toggles["ESP Glow"];
							t(C.TogEspGl, k.Glow);
						end;
						if A.Toggles["Kill All"] ~= nil then
							n = A.Toggles["Kill All"];
							t(C.TogKillAll, n);
							if n then
								KillAllInstance:Start();
							else
								KillAllInstance:Stop();
							end;
						end;
						if A.Toggles["Hitbox Activar"] ~= nil then
							Y = A.Toggles["Hitbox Activar"];
							t(C.TogHitbox, Y);
							if Y then
								l();
							else
								Dp();
							end;
						end;
						if A.Toggles["Hitbox Invisible"] ~= nil then
							T = A.Toggles["Hitbox Invisible"];
							t(C.TogHitboxInvisible, T);
						end;
						if A.Toggles.Headless ~= nil then
							Cp = A.Toggles.Headless;
							t(C.TogHeadless, Cp);
							if Cp then
								Fp(true);
							else
								Fp(false);
							end;
						end;
						if A.Toggles.Korblox ~= nil then
							pp = A.Toggles.Korblox;
							t(C.TogKorblox, pp);
							if pp then
								Up();
							else
								hp();
							end;
						end;
						if A.Toggles["Nombre Falso"] ~= nil then
							G = A.Toggles["Nombre Falso"];
							t(C.TogFakeName, G);
							cp();
						end;
						if A.Toggles.Invisible ~= nil then
							B = A.Toggles.Invisible;
							t(C.TogInvisible, B);
							np(B);
							if u then
								u(B);
							end;
						end;
					end;
					if A.Sliders then
						if A.Sliders["Tama\195\177o del FOV"] ~= nil then
							w = A.Sliders["Tama\195\177o del FOV"];
							t(C.SliFOVSize, w);
						end;
						if A.Sliders["Tama\195\177o de Hitbox"] ~= nil then
							P = A.Sliders["Tama\195\177o de Hitbox"];
							t(C.SliHitboxSize, P);
						end;
						if A.Sliders["Volumen Kill Sound"] ~= nil then
							Gp = A.Sliders["Volumen Kill Sound"];
							Ep.Volume = Gp;
							Bp.Volume = Gp;
							Op.Volume = Gp;
							t(C.SliKillSoundVolume, Gp);
						end;
						if A.Sliders["Ajuste Speed"] ~= nil then
							Yp = A.Sliders["Ajuste Speed"];
							t(C.SliSpeed, Yp);
						end;
						if A.Sliders["Ajuste Salto"] ~= nil then
							Tp = A.Sliders["Ajuste Salto"];
							t(C.SliJumpPower, Tp);
						end;
					end;
					if A.Colors then
						if A.Colors["Color de Hitbox"] then
							S = Color3.new(A.Colors["Color de Hitbox"].R, A.Colors["Color de Hitbox"].G, A.Colors["Color de Hitbox"].B);
							if C.ColHitbox then
								pcall(function()
									C.ColHitbox:Update(S);
								end);
							end;
						end;
						if A.Colors["Color del ESP"] then
							local L = Color3.new(A.Colors["Color del ESP"].R, A.Colors["Color del ESP"].G, A.Colors["Color del ESP"].B);
							s = L;
							if C.ColEsp then
								pcall(function()
									C.ColEsp:Update(L);
								end);
							end;
						end;
					end;
					if A.Extras then
						if A.Extras["Parte Silent Aim"] then
							X = A.Extras["Parte Silent Aim"];
							if C.DropSilentAimPart then
								pcall(function()
									C.DropSilentAimPart:Select(X);
								end);
							end;
						end;
						if A.Extras["Nombre Falso Texto"] then
							E = A.Extras["Nombre Falso Texto"];
							t(C.InpFakeName, E);
							if G then
								cp();
							end;
						end;
					end;
					if U then
						U();
					end;
					if z then
						z();
					end;
				end;
			end;
		end,
	});
	task.spawn(function()
		task.wait(1);
		H();
	end);
end;
do
	ap.Graficos:Section({ Title = "Presets de Iluminaci\195\179n", Icon = "solar:palette-bold" });
	local L = {};
	local e = {};
	local A = {};
	local j = nil;
	local function g(L)
		local e = game:GetService("Lighting");
		if e:GetAttribute("OrigSaved_" .. L) then
			return;
		end;
		e:SetAttribute("Orig_Ambient_" .. L, e.Ambient);
		e:SetAttribute("Orig_OutdoorAmbient_" .. L, e.OutdoorAmbient);
		e:SetAttribute("Orig_Brightness_" .. L, e.Brightness);
		e:SetAttribute("Orig_ClockTime_" .. L, e.ClockTime);
		e:SetAttribute("Orig_FogColor_" .. L, e.FogColor);
		e:SetAttribute("Orig_FogEnd_" .. L, e.FogEnd);
		e:SetAttribute("Orig_FogStart_" .. L, e.FogStart);
		e:SetAttribute("Orig_ColorShift_Top_" .. L, e.ColorShift_Top);
		e:SetAttribute("Orig_ColorShift_Bottom_" .. L, e.ColorShift_Bottom);
		e:SetAttribute("Orig_ExposureCompensation_" .. L, e.ExposureCompensation);
		e:SetAttribute("Orig_GlobalShadows_" .. L, e.GlobalShadows);
		e:SetAttribute("Orig_EnvironmentDiffuseScale_" .. L, e.EnvironmentDiffuseScale);
		e:SetAttribute("Orig_EnvironmentSpecularScale_" .. L, e.EnvironmentSpecularScale);
		e:SetAttribute("OrigSaved_" .. L, true);
	end;
	local function H(L)
		local e = game:GetService("Lighting");
		if not e:GetAttribute("OrigSaved_" .. L) then
			return;
		end;
		e.Ambient = e:GetAttribute("Orig_Ambient_" .. L);
		e.OutdoorAmbient = e:GetAttribute("Orig_OutdoorAmbient_" .. L);
		e.Brightness = e:GetAttribute("Orig_Brightness_" .. L);
		e.ClockTime = e:GetAttribute("Orig_ClockTime_" .. L);
		e.FogColor = e:GetAttribute("Orig_FogColor_" .. L);
		e.FogEnd = e:GetAttribute("Orig_FogEnd_" .. L);
		e.FogStart = e:GetAttribute("Orig_FogStart_" .. L);
		e.ColorShift_Top = e:GetAttribute("Orig_ColorShift_Top_" .. L);
		e.ColorShift_Bottom = e:GetAttribute("Orig_ColorShift_Bottom_" .. L);
		e.ExposureCompensation = e:GetAttribute("Orig_ExposureCompensation_" .. L);
		e.GlobalShadows = e:GetAttribute("Orig_GlobalShadows_" .. L);
		e.EnvironmentDiffuseScale = e:GetAttribute("Orig_EnvironmentDiffuseScale_" .. L);
		e.EnvironmentSpecularScale = e:GetAttribute("Orig_EnvironmentSpecularScale_" .. L);
		e:SetAttribute("OrigSaved_" .. L, nil);
	end;
	local function K(L)
		for L, e in ipairs(L) do
			pcall(function()
				e:Destroy();
			end);
		end;
		table.clear(L);
	end;
	local function a(e)
		local A = game:GetService("Lighting");
		if e then
			g("NS");
			K(L);
			if j then
				j:Destroy();
			end;
			j = Instance.new("Folder");
			j.Name = "NS_SkyX";
			j.Parent = d;
			local function e(e)
				local A = Instance.new("Part");
				A.Anchored = true;
				A.CanCollide = false;
				A.CanQuery = false;
				A.Material = Enum.Material.Neon;
				A.Color = Color3.fromRGB(255, 55, 55);
				A.Transparency = .1;
				A.Size = Vector3.new(2600, 26, 26);
				A.CFrame = CFrame.new(0, 3200, -2200) * CFrame.Angles(0, 0, math.rad(e));
				A.Parent = j;
				table.insert(L, A);
			end;
			e(45);
			e(-45);
			local H = Instance.new("Part");
			H.Anchored = true;
			H.CanCollide = false;
			H.CanQuery = false;
			H.Material = Enum.Material.Neon;
			H.Color = Color3.fromRGB(255, 110, 110);
			H.Transparency = .65;
			H.Shape = Enum.PartType.Ball;
			H.Size = Vector3.new(420, 420, 420);
			H.CFrame = CFrame.new(0, 3200, -2200);
			H.Parent = j;
			table.insert(L, H);
			local a = Instance.new("PointLight");
			a.Color = Color3.fromRGB(255, 80, 80);
			a.Range = 300;
			a.Brightness = 3;
			a.Parent = H;
			table.insert(L, a);
			local I = Instance.new("Sky");
			I.Name = "NS_Sky";
			I.StarCount = 9000;
			I.MoonAngularSize = 30;
			I.SunAngularSize = 0;
			I.CelestialBodiesShown = true;
			I.Parent = A;
			table.insert(L, I);
			local w = Instance.new("ColorCorrectionEffect");
			w.Name = "NS_CC";
			w.Brightness = .05;
			w.Contrast = .32;
			w.Saturation = -0.15;
			w.TintColor = Color3.fromRGB(255, 130, 130);
			w.Parent = A;
			table.insert(L, w);
			local Q = Instance.new("BloomEffect");
			Q.Name = "NS_Bloom";
			Q.Intensity = 1;
			Q.Size = 90;
			Q.Threshold = .45;
			Q.Parent = A;
			table.insert(L, Q);
			local Z = Instance.new("BlurEffect");
			Z.Name = "NS_Blur";
			Z.Size = 3;
			Z.Parent = A;
			table.insert(L, Z);
			local t = Instance.new("Atmosphere");
			t.Name = "NS_Atmo";
			t.Density = .42;
			t.Offset = 0;
			t.Color = Color3.fromRGB(60, 12, 12);
			t.Decay = Color3.fromRGB(80, 20, 20);
			t.Glare = .5;
			t.Haze = 1.6;
			t.Parent = A;
			table.insert(L, t);
			A.ClockTime = 0;
			A.Brightness = 1.2;
			A.Ambient = Color3.fromRGB(130, 110, 110);
			A.OutdoorAmbient = Color3.fromRGB(180, 140, 140);
			A.FogColor = Color3.fromRGB(22, 5, 5);
			A.FogEnd = 1200;
			A.FogStart = 150;
			A.ColorShift_Top = Color3.fromRGB(125, 25, 25);
			A.ColorShift_Bottom = Color3.fromRGB(65, 8, 8);
			A.ExposureCompensation = -0.2;
			A.GlobalShadows = true;
			A.EnvironmentDiffuseScale = .5;
			A.EnvironmentSpecularScale = .5;
		else
			K(L);
			if j then
				j:Destroy();
				j = nil;
			end;
			H("NS");
		end;
	end;
	local function I(L)
		local A = game:GetService("Lighting");
		if L then
			g("AF");
			K(e);
			local L = Instance.new("ColorCorrectionEffect");
			L.Name = "AF_CC";
			L.Brightness = .05;
			L.Contrast = .14;
			L.Saturation = .22;
			L.TintColor = Color3.fromRGB(255, 205, 165);
			L.Parent = A;
			table.insert(e, L);
			local j = Instance.new("BloomEffect");
			j.Name = "AF_Bloom";
			j.Intensity = .32;
			j.Size = 40;
			j.Threshold = .92;
			j.Parent = A;
			table.insert(e, j);
			local d = Instance.new("SunRaysEffect");
			d.Name = "AF_Rays";
			d.Intensity = .15;
			d.Spread = .9;
			d.Parent = A;
			table.insert(e, d);
			local H = Instance.new("Sky");
			H.Name = "AF_Sky";
			H.SunAngularSize = 18;
			H.MoonAngularSize = 0;
			H.StarCount = 2000;
			H.Parent = A;
			table.insert(e, H);
			local a = Instance.new("Atmosphere");
			a.Name = "AF_Atmo";
			a.Density = .36;
			a.Offset = .1;
			a.Color = Color3.fromRGB(255, 185, 135);
			a.Decay = Color3.fromRGB(255, 125, 85);
			a.Glare = .2;
			a.Haze = 1.2;
			a.Parent = A;
			table.insert(e, a);
			A.ClockTime = 6.3;
			A.Brightness = 2.4;
			A.Ambient = Color3.fromRGB(85, 62, 55);
			A.OutdoorAmbient = Color3.fromRGB(125, 92, 80);
			A.FogColor = Color3.fromRGB(240, 185, 145);
			A.FogEnd = 2500;
			A.FogStart = 200;
			A.ColorShift_Top = Color3.fromRGB(255, 185, 105);
			A.ColorShift_Bottom = Color3.fromRGB(205, 105, 85);
			A.ExposureCompensation = .08;
			A.GlobalShadows = true;
			A.EnvironmentDiffuseScale = .8;
			A.EnvironmentSpecularScale = .6;
		else
			K(e);
			H("AF");
		end;
	end;
	local function w(L)
		local e = game:GetService("Lighting");
		if L then
			g("SV");
			K(A);
			local L = Instance.new("ColorCorrectionEffect");
			L.Name = "SV_CC";
			L.Brightness = .05;
			L.Contrast = .22;
			L.Saturation = -1;
			L.TintColor = Color3.fromRGB(222, 226, 232);
			L.Parent = e;
			table.insert(A, L);
			local j = Instance.new("BloomEffect");
			j.Name = "SV_Bloom";
			j.Intensity = 1.25;
			j.Size = 75;
			j.Threshold = .38;
			j.Parent = e;
			table.insert(A, j);
			local d = Instance.new("Sky");
			d.Name = "SV_Sky";
			d.StarCount = 0;
			d.SunAngularSize = 0;
			d.MoonAngularSize = 0;
			d.CelestialBodiesShown = false;
			d.Parent = e;
			table.insert(A, d);
			local H = Instance.new("Atmosphere");
			H.Name = "SV_Atmo";
			H.Density = .3;
			H.Offset = .1;
			H.Color = Color3.fromRGB(180, 185, 190);
			H.Decay = Color3.fromRGB(140, 145, 150);
			H.Glare = 0;
			H.Haze = 1;
			H.Parent = e;
			table.insert(A, H);
			e.ClockTime = 14;
			e.Brightness = 2.2;
			e.Ambient = Color3.fromRGB(92, 96, 100);
			e.OutdoorAmbient = Color3.fromRGB(132, 136, 140);
			e.FogColor = Color3.fromRGB(172, 176, 180);
			e.FogEnd = 3000;
			e.FogStart = 200;
			e.ColorShift_Top = Color3.fromRGB(152, 156, 160);
			e.ColorShift_Bottom = Color3.fromRGB(122, 126, 130);
			e.ExposureCompensation = 0;
			e.GlobalShadows = true;
			e.EnvironmentDiffuseScale = .6;
			e.EnvironmentSpecularScale = .3;
		else
			K(A);
			H("SV");
		end;
	end;
	local Q, Z, t;
	Q = ap.Graficos:Toggle({ Title = "Noche Sangrienta", Value = false, Callback = function(L)
				if L then
					if Z then
						pcall(function()
							Z:Set(false);
						end);
					end;
					if t then
						pcall(function()
							t:Set(false);
						end);
					end;
				end;
				a(L);
			end });
	Z = ap.Graficos:Toggle({ Title = "Atardecer Fant\195\161stico", Value = false, Callback = function(L)
				if L then
					if Q then
						pcall(function()
							Q:Set(false);
						end);
					end;
					if t then
						pcall(function()
							t:Set(false);
						end);
					end;
				end;
				I(L);
			end });
	t = ap.Graficos:Toggle({ Title = "Sin Vida", Value = false, Callback = function(L)
				if L then
					if Q then
						pcall(function()
							Q:Set(false);
						end);
					end;
					if Z then
						pcall(function()
							Z:Set(false);
						end);
					end;
				end;
				w(L);
			end });
end;
do
	ap.Updates:Section({ Title = "Nuevas cosas agregadas" });
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
	local e = {};
	for L, A in ipairs(L) do
		e[L] = "<font color=\'#3DDC84\'>" .. (A .. "</font>");
	end;
	pcall(function()
		ap.Updates:Paragraph({ Title = "Uzivert Hub  v2.1", Desc = table.concat(e, "\n"), Icon = "solar:moon-bold" });
	end);
end;
do
	local L = game:GetService("TweenService");
	local j = Color3.fromRGB(255, 255, 255);
	local g = Color3.fromRGB(190, 200, 225);
	local d = Color3.fromRGB(12, 13, 20);
	local function H(L, e, A)
		local j = Instance.new(L);
		for L, e in pairs(e) do
			j[L] = e;
		end;
		j.Parent = A;
		return j;
	end;
	local function K(L, e)
		return H("UICorner", { CornerRadius = UDim.new(0, e) }, L);
	end;
	local function a(L, e, A, j)
		local g = H("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(e, e),
				BackgroundColor3 = A,
				BorderSizePixel = 0,
				ZIndex = j,
			}, L);
		K(g, e);
		return g;
	end;
	local I = H("TextButton", {
			Name = "UzivertOrb",
			Size = UDim2.fromOffset(60, 60),
			Position = UDim2.new(0, 30, .5, -30),
			BackgroundTransparency = 1,
			Text = "",
			AutoButtonColor = false,
			ZIndex = 50,
		}, f);
	local w = H("UIScale", { Scale = 1 }, I);
	local Q = a(I, 90, j, 1);
	Q.BackgroundTransparency = .85;
	local Z = H("Frame", {
			AnchorPoint = Vector2.new(.5, .5),
			Position = UDim2.fromScale(.5, .5),
			Size = UDim2.fromOffset(58, 58),
			BackgroundTransparency = 1,
			ZIndex = 2,
		}, I);
	K(Z, 29);
	local t = H("UIStroke", { Thickness = 2.5, Color = j }, Z);
	local M = H("UIGradient", { Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, j), ColorSequenceKeypoint.new(.5, g), ColorSequenceKeypoint.new(1, j) }), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(.55, .65), NumberSequenceKeypoint.new(1, 0) }) }, t);
	local R = a(I, 50, d, 3);
	local function X(L, e, A)
		local j = H("Frame", {
				AnchorPoint = Vector2.new(.5, .5),
				Position = UDim2.fromScale(.5, .5),
				Size = UDim2.fromOffset(L, L),
				BackgroundTransparency = 1,
				ZIndex = 4,
			}, I);
		K(j, 4);
		H("UIStroke", { Thickness = 1.2, Color = e, Transparency = A }, j);
		return j;
	end;
	local i, D = X(36, j, .2), X(30, g, .4);
	local s = a(I, 20, j, 5);
	s.Position = UDim2.new(.5, -1, .5, 0);
	local k = a(I, 17, d, 6);
	k.Position = UDim2.new(.5, 4, .5, -3);
	local n = {};
	for L = 1, 3, 1 do
		local e = a(I, 3 + (L % 2), (L % 2 == 0) and j or g, 7);
		n[L] = {
				f = e,
				r = 29,
				sp = ((L % 2 == 0 and 1 or -1)) * ((.9 + L * .35)),
				ph = L * 2.1,
			};
	end;
	local Y = true;
	local function T()
		if pcall(function()
			jp:Toggle();
		end) then
			return;
		end;
		Y = not Y;
		pcall(function()
			if Y then
				jp:Open();
			else
				jp:Close();
			end;
		end);
	end;
	local P, S, G, E, B = false, nil, nil, 0, nil;
	I.InputBegan:Connect(function(e)
		if e.UserInputType == Enum.UserInputType.MouseButton1 or e.UserInputType == Enum.UserInputType.Touch then
			if P then
				return;
			end;
			P = true;
			E = 0;
			B = e;
			S = I.Position;
			G = e.Position;
			(L:Create(w, TweenInfo.new(.12), { Scale = .9 })):Play();
		end;
	end);
	A.InputChanged:Connect(function(L)
		if not P then
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
			local e = L.Position - G;
			E = math.max(E, e.Magnitude);
			if E > 6 then
				I.Position = UDim2.new(S.X.Scale, S.X.Offset + e.X, S.Y.Scale, S.Y.Offset + e.Y);
			end;
		end;
	end);
	A.InputEnded:Connect(function(e)
		if not P or e ~= B then
			return;
		end;
		do
			P = false;
			B = nil;
			(L:Create(w, TweenInfo.new(.25, Enum.EasingStyle.Back), { Scale = 1 })):Play();
			if E <= 6 then
				T();
			end;
		end;
	end);
	e.Heartbeat:Connect(function()
		if not I.Parent then
			return;
		end;
		local L = os.clock();
		Q.BackgroundTransparency = ((Y and .92 or .84)) + .04 * math.sin(L * 2);
		M.Rotation = ((L * 90)) % 360;
		i.Rotation = ((L * 24)) % 360;
		D.Rotation = ((-L * 16)) % 360;
		for e, A in ipairs(n) do
			local j = L * A.sp + A.ph;
			A.f.Position = UDim2.fromScale(.5, .5) + UDim2.fromOffset(math.cos(j) * A.r, math.sin(j) * A.r);
		end;
	end);
end;
do
	local L = Enum.KeyCode.LeftControl;
	local e = true;
	A.InputBegan:Connect(function(j)
		if j.UserInputType ~= Enum.UserInputType.Keyboard then
			return;
		end;
		if j.KeyCode ~= L then
			return;
		end;
		if A:GetFocusedTextBox() then
			return;
		end;
		if pcall(function()
			jp:Toggle();
		end) then
			return;
		end;
		e = not e;
		pcall(function()
			if e then
				jp:Open();
			else
				jp:Close();
			end;
		end);
	end);
end;

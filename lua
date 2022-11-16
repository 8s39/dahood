local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
game:GetService("RunService").Heartbeat:Connect(
    function()
if cframespeedtoggle == true then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
        game.Players.LocalPlayer.Character.Humanoid.MoveDirection * speedvalue
end
if Spinbot then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad((positive1)), 0)
end
if Jitter then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position) *
        CFrame.Angles(0, math.rad(Angle) + math.rad((math.random(1, 2) == 1 and Jit or -Jit)), 0)
end

if AntiAim1 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * -250
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
end
if AntiAim2 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1.333, 0)
    wait(0.2)
end
if getgenv().antilock then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
        -game.Players.LocalPlayer.Character.Humanoid.MoveDirection * getgenv().antilockspeed
end
if getgenv().DesyncEnabled then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * getgenv().DesyncVelocity
        game:GetService("RunService").Heartbeat:Wait()
end
if getgenv().antistomplo then
    if game.Players.LocalPlayer.Character.Humanoid.Health <= 5 then
        for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v:Destroy()
            end
        end
    end
end
if getgenv().AutoReloadx then
    if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
        if
            game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                "Ammo"
            )
         then
            if
                game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                    "Ammo"
                ).Value <= 0
             then
                game:GetService("ReplicatedStorage").MainEvent:FireServer(
                    "Reload",
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                )
            end
        end
    end
end
if getgenv().autostomp then
    game.ReplicatedStorage.MainEvent:FireServer("Stomp")
end
if getgenv().antibag then
    game.Players.LocalPlayer.Character["Christmas_Sock"]:Destroy()
end
end)
if getgenv().Spinbot then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad((positive1)), 0)
end
if getgenv().autostomp then
    game.ReplicatedStorage.MainEvent:FireServer("Stomp")
end
getgenv().Key = Enum.KeyCode.Q
getgenv().Prediction = 1.35
getgenv().AirshotFunccc = false
getgenv().Tracer = false
getgenv().Partz = "UpperTorso"
getgenv().Notificationmode = false
getgenv().ViewMode = false
getgenv().Spinbot = false
getgenv().Jitter = false
getgenv().positive1 = 45
local Jit = math.random(30, 90)
getgenv().Angle = 60
getgenv().DesyncEnabled = false
getgenv().DesyncVelocity = 15
getgenv().BenMode = false
getgenv().TPToPlayer = false
getgenv().LookAt = false
getgenv().AntiAim1 = false
getgenv().AntiAim2 = false
getgenv().antistomplo = false
getgenv().autoreload = false
getgenv().autostomp = false
getgenv().antibag = false
getgenv().antislow = false

local LocalPlayer = game.Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse()

local RunService = game:GetService("RunService")

local workspace = game:GetService("Workspace")

local Light = game:GetService("Lighting")

local camera = workspace.CurrentCamera

local worldToViewportPoint = camera.worldToViewportPoint

-- Functions

local function fail(r) return LocalPlayer:Kick(r) end

local usedCache = shared.__urlcache and next(shared.__urlcache) ~= nil

shared.__urlcache = shared.__urlcache or {}
local function httpload(url)
    local success, result

    if shared.__urlcache[url] then
        success, result = true, shared.__urlcache[url]
    else
        success, result = pcall(game.HttpGet, game, url)
    end

    if (not success) then
        return fail(string.format('Failed to GET url %q for reason: %q', url, tostring(result)))
    end

    local fn, err = loadstring(result)
    if (type(fn) ~= 'function') then
        return fail(string.format('Failed to loadstring url %q for reason: %q', url, tostring(err)))
    end

    local results = { pcall(fn) }
    if (not results[1]) then
        return fail(string.format('Failed to initialize url %q for reason: %q', url, tostring(results[2])))
    end

    shared.__urlcache[url] = result
    return unpack(results, 2)
end

local prefix = ";"

local function log(text)
    print(prefix..text)
end

local function warn(text)
    warn(prefix..text)
end

-- Anti Cheat Bypass


local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MainEvent = ReplicatedStorage.MainEvent

local HB = RunService.Heartbeat

do 
   local oldFunc = nil

  oldFunc = hookfunction(MainEvent.FireServer, newcclosure(function(Event, ...)
     local args = {...}

     if args[1] == "CHECKER_1" or args[1] == "TeleportDetect" or args[1] == "OneMoreTime" then
        return nil
     end

     return oldFunc(Event, ...)
  end))

   HB:Connect(function()
       local root = LocalPlayer.Character and LocalPlayer.Character.PrimaryPart

       if root then
           for i,v in pairs(getconnections(root:GetPropertyChangedSignal("CFrame"))) do
               v:Disable()
           end
       end
   end)

  local function added(char)
     while true do
           if not char then return end
        HB:Wait()
        for i,v in pairs(char:GetChildren()) do
           if v:IsA("Script") and v:FindFirstChildOfClass("LocalScript") then
              v:FindFirstChildOfClass("LocalScript").Source = "cleared"
              return
           end
        end
     end
  end

  if LocalPlayer.Character then
     added(LocalPlayer.Character)
  end

  LocalPlayer.CharacterAdded:Connect(added)

end

log("Bypassed Anti-Cheat")

-- Aiming 



local guimain = Instance.new("Folder", game.CoreGui)
local CC = game:GetService "Workspace".CurrentCamera
local LocalMouse = game.Players.LocalPlayer:GetMouse()
local Locking = false
local cc = game:GetService("Workspace").CurrentCamera
local gs = game:GetService("GuiService")
local ggi = gs.GetGuiInset
local lp = game:GetService("Players").LocalPlayer
local mouse = lp:GetMouse()

local Tracer = Drawing.new("Line")
Tracer.Visible = false
Tracer.Color = Color3.fromRGB(255, 20, 88)
Tracer.Thickness = 1
Tracer.Transparency = 1

local sound = Instance.new("Sound", game.Workspace)
sound.SoundId = "rbxassetid://8819783960"

if not sound.IsLoaded then
	sound.Loaded:wait()
end

local sound1 = Instance.new("Sound", game.Workspace)
sound1.SoundId = "rbxassetid://8819782435"

if not sound1.IsLoaded then
	sound1.Loaded:wait()
end


local StepTable = {}
local function BindToSteppedold(name, num, func)
	if StepTable[name] == nil then
		StepTable[name] = game:GetService("RunService").Stepped:connect(func)
	end
end

local function UnbindFromSteppedold(name)
	if StepTable[name] then
		StepTable[name]:Disconnect()
		StepTable[name] = nil
	end
end

function x(tt, tx, cc, tc)
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = tt,
            Text = tx,
            Duration = cc,
            Icon = tc
        }
    )
end

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(
    function(keygo, ok)
        if (not ok) then
            if (keygo.KeyCode == getgenv().Key) then
                if getgenv().loltoggle then
                    Locking = not Locking
                    if Locking then
                        Plr = getClosestPlayerToCursor()
                        getgenv().targetenabledV3 = true
                        if getgenv().Notificationmode then
                            StarterGui:SetCore(
                            "SendNotification",
                            {
                                Title = "lock",
                                Text = "" ..Plr.DisplayName,
                                Duration = 3,
                                Icon = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. Plr .."&width=420&height=420&format=png"
                            })
                        end
                        if getgenv().ViewMode == true then
                            game.Workspace.CurrentCamera.CameraSubject = Plr.Character
                        end
                        if getgenv().ChatMode == true then
                            local A_3 = "locked: "..Plr.DisplayName
                            local A_4 = "All"
                            local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                            Event:FireServer(A_3, A_4)
                        end
                        if getgenv().TPToPlayer == true then
                            LocalPlayer.Character.HumanoidRootPart.CFrame = Plr.Character.HumanoidRootPart.CFrame
                        end
                        if getgenv().BenMode == true then
                            sound:Play()
                        end
                        if getgenv().TargetStrafeV3 == true then
                            getgenv().TSV3Multiplier = 5
                            getgenv().TSV3Distance = 5
                            local i = 0
                            BindToSteppedold("TargetStrafev3", nil, function(dt)
                            i = (i + dt/getgenv().TSV3Multiplier) % 1
                            local alpha = 2 * math.pi * i
                
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.Angles(0, alpha, 0)
                            * CFrame.new(0, 0, getgenv().TSV3Distance)
                            + Plr.Character.HumanoidRootPart.Position
                        end)
                        end
                    elseif not Locking then
                        UnbindFromSteppedold("TargetStrafev3")
                        if getgenv().Notificationmode then
                            x("unlocked", 3)
                        end
                        if getgenv().ViewMode == true then
                            game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
                        end
                        
                        if getgenv().ChatMode == true then
                            local A_1 = "Unlocked"
                            local A_2 = "All"
                            local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
                            Event:FireServer(A_1, A_2)
                        end
                        if getgenv().BenMode == true then
                            sound1:Play()
                        end
                    end
                end
            end
        end
    end
)
local Kiriot = httpload("https://raw.githubusercontent.com/fakecurfew/storage/main/libraries/esp/kiriot")

local Pika = httpload("https://raw.githubusercontent.com/trendyylol/roblox/main/Libraries/ESP/Pikahub")

local Lowfi = httpload("https://raw.githubusercontent.com/trendyylol/roblox/main/Libraries/ESP/Lowfi")
RunService.Heartbeat:Connect(function()
    if getgenv().LookAt == true then
        local Char = game.Players.LocalPlayer.Character
        local PrimaryPartOfChar = game.Players.LocalPlayer.Character.PrimaryPart
        local NearestChar = Plr.Character
        local NearestRoot = Plr.Character.HumanoidRootPart
        local NearestPos = CFrame.new(PrimaryPartOfChar.Position, Vector3.new(NearestRoot.Position.X, NearestRoot.Position.Y, NearestRoot.Position.Z))
        Char:SetPrimaryPartCFrame(NearestPos)
    else
        local Char = game.Players.LocalPlayer.Character
        local PrimaryPartOfChar = game.Players.LocalPlayer.Character.PrimaryPart
        local NearestChar = LocalPlayer.Character
        local NearestRoot = LocalPlayer.Character.HumanoidRootPart
        local NearestPos = CFrame.new(PrimaryPartOfChar.Position, Vector3.new(NearestRoot.Position.X, NearestRoot.Position.Y, NearestRoot.Position.Z))
        Char:SetPrimaryPartCFrame(LocalPlayer)
    end
end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = 137

    for i, v in pairs(game.Players:GetPlayers()) do
        if
            v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
                v.Character.Humanoid.Health ~= 0 and
                v.Character:FindFirstChild("LowerTorso")
         then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end




local rawmetatable = getrawmetatable(game)
local old = rawmetatable.__namecall
setreadonly(rawmetatable, false)
rawmetatable.__namecall =
    newcclosure(
    function(...)
        local args = {...}
        if Locking and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
            args[3] =
                Plr.Character[getgenv().Partz].Position + (Plr.Character[getgenv().Partz].Velocity * Prediction / 10)
            return old(unpack(args))
        end
        return old(...)
    end
)

local LocalPlayer = game.Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()

_G.TracerVisible = false
_G.TracerColor = Color3.fromRGB(255, 255, 255)
_G.TracerThickness = 3
_G.TracerTransparency = 1

_G.CircleSides = 3604
_G.CircleColor = Color3.fromRGB(255, 20, 88)
_G.CircleTransparency = 0.5
_G.CircleRadius = 80
_G.CircleFilled = false
_G.CircleVisible = false
_G.CircleThickness = 0

circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(255, 20, 88)
circle.Thickness = 0.1
circle.Transparency = 0.5
circle.NumSides = 64
circle.Radius = 64
circle.Visible = false
circle.Filled = true
getgenv().autoclick = false
game:GetService("RunService").RenderStepped:Connect(
    function()
        if getgenv().autosetup == true then
            local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            local split = string.split(pingvalue, " ")
            local ping = split[1]
            if tonumber(ping) < 30 then
                getgenv().Prediction = 1.14
            elseif tonumber(ping) <= 30 then
                if tonumber(ping) < 40 then
                    getgenv().Prediction = 1.16
                elseif tonumber(ping) <= 40 then
                    if tonumber(ping) < 50 then
                        getgenv().Prediction = 1.19
                    elseif tonumber(ping) <= 50 then
                        if tonumber(ping) < 70 then
                            getgenv().Prediction = 1.22
                        elseif tonumber(ping) <= 80 then
                            getgenv().Prediction = 1.38
                        elseif tonumber(ping) <= 80 then
                            getgenv().Prediction = 1.39
                        elseif tonumber(ping) <= 90 then
                            getgenv().Prediction = 1.42
                        elseif tonumber(ping) <= 150 then
                            getgenv().Prediction = 1.51
                        elseif tonumber(ping) >= 200 then
                            getgenv().Prediction = 1.69
                        end
                    end
                end
            end
        end

        circle.Position =
            Vector2.new(
            game:GetService("UserInputService"):GetMouseLocation().X,
            game:GetService("UserInputService"):GetMouseLocation().Y
        )
        circle.Radius = _G.CircleRadius
        circle.Filled = _G.CircleFilled
        circle.Color = _G.CircleColor
        circle.Visible = _G.CircleVisible
        circle.Radius = _G.CircleRadius
        circle.Transparency = _G.CircleTransparency
        circle.NumSides = _G.CircleSides
        circle.Thickness = _G.CircleThickness
        Tracer.Visible = _G.TracerVisible
        Tracer.Color = _G.TracerColor
        Tracer.Thickness = _G.TracerThickness
        Tracer.Transparency = _G.TracerTransparency
        if getgenv().AirshotFunccc == true then
            if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                getgenv().Partz = "RightFoot"
            else
                Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(
                    function(old, new)
                        if new == Enum.HumanoidStateType.Freefall then
                            getgenv().Partz = "RightFoot"
                        else
                            getgenv().Partz = "LowerTorso"
                        end
                    end
                )
            end
        end

        if getgenv().Tracer == true and Locking then
            local Vector, OnScreen =
                cc:worldToViewportPoint(
                Plr.Character[getgenv().Partz].Position + (Plr.Character[getgenv().Partz].Velocity * Prediction / 10)
            )
            Tracer.Visible = true
            Tracer.From = Vector2.new(mouse.X, mouse.Y + ggi(gs).Y)
            Tracer.To = Vector2.new(Vector.X, Vector.Y)
        elseif getgenv().Tracer == false then
            Tracer.Visible = false
        end
    end)
        if Spinbot then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad((positive1)), 0)
        end
        if Jitter then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position) *
                CFrame.Angles(0, math.rad(Angle) + math.rad((math.random(1, 2) == 1 and Jit or -Jit)), 0)
        end

        if AntiAim1 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * -250
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(555), 0)
        end
        if AntiAim2 then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1.333, 0)
            wait(0.2)
        end
        if getgenv().antilock then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
                -game.Players.LocalPlayer.Character.Humanoid.MoveDirection * getgenv().antilockspeed
        end
        if getgenv().DesyncEnabled then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * getgenv().DesyncVelocity
                game:GetService("RunService").Heartbeat:Wait()
        end
        if getgenv().antistomplo then
            if game.Players.LocalPlayer.Character.Humanoid.Health <= 5 then
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v:Destroy()
                    end
                end
            end
        end
        if getgenv().antislow then
            local player = game.Players.LocalPlayer
            local DeletePart =
                player.Character.BodyEffects.Movement:FindFirstChild("NoJumping") or
                player.Character.BodyEffects.Movement:FindFirstChild("ReduceWalk") or
                player.Character.BodyEffects.Movement:FindFirstChild("NoWalkSpeed")
            if DeletePart then
                DeletePart:Destroy()
            end
            if player.Character.BodyEffects.Reload.Value == true then
                player.Character.BodyEffects.Reload.Value = false
            end
        end
        if getgenv().AutoReloadx then
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                if
                    game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                        "Ammo"
                    )
                 then
                    if
                        game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild(
                            "Ammo"
                        ).Value <= 0
                     then
                        game:GetService("ReplicatedStorage").MainEvent:FireServer(
                            "Reload",
                            game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                        )
                    end
                end
            end
        end
        if getgenv().autostomp then
            game.ReplicatedStorage.MainEvent:FireServer("Stomp")
        end
        if getgenv().antibag then
            game.Players.LocalPlayer.Character["Christmas_Sock"]:Destroy()
        end


-- Visuals --

local ESPSettings = {
    SkeletonESPEnabled = false,
    RainbowsESPEnabled = false,
    TextOutlineEnabled = false,
    TeamCheckEnabled = false,
    MouseFrom = false,
    CustomColor = true,
    BottomFrom = true,
    HeadFrom = false,
    RoundedCorner = 12,
    Length = 14,
    ESPColor = Color3.fromRGB(255,255,255),
    Thickness = 1,
    TextSize = 15,
    Transparency = 1,
    HeadOff = Vector3.new(0,0.5,0),
    LegOff = Vector3.new(0,3,0)
}

-- Drawings --

Circle = Drawing.new("Circle")
Circle.Color = Color3.fromRGB(101, 90, 173)
Circle.Thickness = 2
Circle.NumSides = 120
Circle.Radius = 70
Circle.Visible = false
Circle.Filled = false
Circle.Transparency = 1

RunService.RenderStepped:Connect(function()
	Circle.Position = Vector2.new(Mouse.X, Mouse.Y + 35)
end)

local Window = Rayfield:CreateWindow({
	Name = "dahood | @eek#3345 | https://discord.gg/MQnkh5348a",
	LoadingTitle = "game detected: dahood",
	LoadingSubtitle = "by eek",
	ConfigurationSaving = {
		Enabled = false,
		FileName = "tutorial"
	},
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
		Title = "jay hub",
		Subtitle = "key system",
		Note = "enter the key that you were given",
		Key = "beta"
	}
})

local Tab = Window:CreateTab("lock")
local Section = Tab:CreateSection("main")


Rayfield:Notify("NOTICE","keybind is set to Q") -- (t,c,image)
local Toggle = Tab:CreateToggle({
	Name = "ping based",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().loltoggle = bool
	end,
})

local Toggle = Tab:CreateToggle({
	Name = "look",
	CurrentValue = false,
	Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().LookAt = bool
    end,
})

local Toggle = Tab:CreateToggle({
	Name = "notify",
	CurrentValue = false,
	Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().Notificationmode = bool
    end,
})

local Toggle = Tab:CreateToggle({
	Name = "tracer",
	CurrentValue = false,
	Flag = "Toggle4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().Tracer = bool
    end,
})

local Toggle = Tab:CreateToggle({
	Name = "airshot",
	CurrentValue = false,
	Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().AirshotFunccc = bool
    end,
})

local Toggle = Tab:CreateToggle({
	Name = "view",
	CurrentValue = false,
	Flag = "Toggle6", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().ViewMode = bool
    end,
})

local Toggle = Tab:CreateToggle({
	Name = "teleport",
	CurrentValue = false,
	Flag = "Toggle7", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().TPToPlayer = bool  
    end,
})

local Section = Tab:CreateSection("target strafe")

local Toggle = Tab:CreateToggle({
	Name = "enable strafe",
	CurrentValue = false,
	Flag = "Toggle8", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().TargetStrafeV3 = bool
    end,
})

local Slider = Tab:CreateSlider({
	Name = "strafe distance",
	Range = {1, 100},
	Increment = 1,
	Suffix = "studs",
	CurrentValue = 5,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(value)
        getgenv().TSV3Distance = value
	end,
})

local Section = Tab:CreateSection("settings")
local Dropdown = Tab:CreateDropdown({
	Name = "target part",
	Options = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg", "LeftFoot", "RightFoot"},
	CurrentOption = "HumanoidRootPart",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(part)
        getgenv().Partz = part
	end,
})

local Dropdown = Tab:CreateDropdown({
	Name = "airshot part",
	Options = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg", "LeftFoot", "RightFoot"},
	CurrentOption = "HumanoidRootPart",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(part)
        getgenv().airshotpart = part
	end,
})

local Slider = Tab:CreateSlider({
	Name = "predition",
	Range = {0.5, 6},
	Increment = 0.1,
	Suffix = "",
	CurrentValue = 1.25,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(value)
        getgenv().Prediction = value
	end,
})

local Section = Tab:CreateSection("extras")

local Button = Tab:CreateButton({
	Name = "trace lock (X)",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/s2wdEA5z", true))()
	end,
})

local Button = Tab:CreateButton({
	Name = "no recoil",
	Callback = function()
        getgenv().NoRecoil = true
        if NoRecoil == true then
            local mt = getrawmetatable(game)
            local newindex = mt.newindex
            setreadonly(mt,false)
            function isframework(scriptInstance)
                if tostring(scriptInstance) == "Framework" then
                    return true
                end
                return false
            end
            function checkArgs(instance,index)
                if tostring(instance):lower():find("camera") and tostring(index) == "CFrame" then
                    return true
                end
                return false
            end
            mt.newindex = newcclosure(function(self,index,value)
                local callingScr = getcallingscript()
                if isframework(callingScr) and checkArgs(self,index) then
                   return;
                end
                return newindex(self,index,value)
            end)
            setreadonly(mt,true)
        end  
	end,
})
local Button = Tab:CreateButton({
	Name = "legit desync",
	Callback = function()
loadstring(game:HttpGet('https://scripts.luawl.com/legitaa/PrivateLegitAA.lua'))()
end})

local Button = Tab:CreateButton({
	Name = "anti-lock",
	Callback = function()
        local Toggled = true
        local KeyCode = 'z'
        local hip = 2.80
        local val = -35
        
        
        
        
        
        function AA()
            local oldVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, val, oldVelocity.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, oldVelocity.Y, oldVelocity.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, val, oldVelocity.Z)
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = hip
        end
        
        game:GetService('UserInputService').InputBegan:Connect(function(Key)
            if Key.KeyCode == Enum.KeyCode[KeyCode:upper()] and not game:GetService('UserInputService'):GetFocusedTextBox() then
                if Toggled then
                    Toggled = false
                    game.Players.LocalPlayer.Character.Humanoid.HipHeight = hip
        
                elseif not Toggled then
                    Toggled = true
        
                    while Toggled do
                        AA()
                        task.wait()
                    end
                end
            end
        end)
	end,
})
local Toggle = Tab:CreateToggle({
	Name = "anti-lock legit",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(state)
  if state then
        getgenv().Underground = true 
getgenv().UndergroundAmount = 90

game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().Underground ~= false then 
    local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-         getgenv().UndergroundAmount,0) 
    game:GetService("RunService").RenderStepped:Wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
    end 
end)
    else
        getgenv().Underground = false 
getgenv().UndergroundAmount = 90

game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().Underground ~= false then 
    local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,-         getgenv().UndergroundAmount,0) 
    game:GetService("RunService").RenderStepped:Wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
    end 
end)
    end
end})
local Button = Tab:CreateButton({
	Name = "resolver",
	Callback = function()
        local RunService = game:GetService("RunService")
        RunService.Heartbeat:Connect(function()
            pcall(function()
                for i,v in pairs(game.Players:GetChildren()) do
                    if v.Name ~= game.Players.LocalPlayer.Name then
                        local hrp = v.Character.HumanoidRootPart
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
                        hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
                    end
                end
            end)
        end)
	end,
})
local Button = Tab:CreateButton({
	Name = "op lock",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/8s39/oplock/main/eeks%20lock.txt", true))()
end})
local Tab2 = Window:CreateTab("player")

local Section = Tab2:CreateSection("player mods")

local Toggle = Tab2:CreateToggle({
	Name = "anti-bag",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().antibag = bool
	end,
})

local Toggle = Tab2:CreateToggle({
	Name = "anti-fling",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = bool
	end,
})

local Toggle = Tab2:CreateToggle({
	Name = "anti-slow",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().antislow = bool
	end,
})

local Toggle = Tab2:CreateToggle({
	Name = "anti-stomp",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().antistomplo = bool
	end,
})

local Button = Tab2:CreateButton({
	Name = "headless (fe)",
	Callback = function()
        local L_418_ = game.Players.LocalPlayer
        L_418_.Character.Head:BreakJoints()
        L_418_.Character.Head.Position = Vector3.new(0, 999999999999, 0)
	end,
})

local Button = Tab2:CreateButton({
	Name = "korblox (fe)",
	Callback = function()
        game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
	end,
})


local Tab3 = Window:CreateTab("misc")

local Section = Tab3:CreateSection("auto")

local Toggle = Tab3:CreateToggle({
	Name = "stomp",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().autostomp = bool
	end,
})

local Toggle = Tab3:CreateToggle({
	Name = "reload",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().AutoReloadx = bool
	end,
})

local Toggle = Tab3:CreateToggle({
	Name = "armor",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        if getgenv().AutoHighArmor == true then
            getgenv().AutoHighArmor = false
        else
            getgenv().AutoHighArmor = true
        end
        
        while getgenv().AutoHighArmor == true and game:GetService("RunService").Heartbeat:Wait() do
            pcall(function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild("BodyEffects"):FindFirstChild("Armor").Value <= 0 then
                    local LS = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                    repeat
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop["[High-Medium Armor] - $2300"].Head.CFrame
                        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[High-Medium Armor] - $2300"].ClickDetector)
                        game:GetService("RunService").Heartbeat:Wait()
                    until game:GetService("Players").LocalPlayer.Character:FindFirstChild("BodyEffects"):FindFirstChild("Armor").Value >= 50
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = LS
                end
            end)
        end
	end,
})

local Section = Tab3:CreateSection("movement")


local Button = Tab3:CreateButton({
	Name = "cframe speed (z)",
	Callback = function()
    	repeat
		wait()
	until game:IsLoaded()
	local L_134_ = game:service('Players')
	local L_135_ = L_134_.LocalPlayer
	repeat
		wait()
	until L_135_.Character
	local L_136_ = game:service('UserInputService')
	local L_137_ = game:service('RunService')
	getgenv().Multiplier = 0.5
	local L_138_ = true
	local L_139_
	L_136_.InputBegan:connect(function(L_140_arg0)
		if L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket then
			Multiplier = Multiplier + 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				Multiplier = Multiplier + 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.RightBracket then
			Multiplier = Multiplier - 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				Multiplier = Multiplier - 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.Z then
			L_138_ = not L_138_
			if L_138_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
					game:GetService("RunService").Stepped:wait()
				until L_138_ == false
			end
		end
	end)
end})
local Button = Tab3:CreateButton({
	Name = "cframe guns fix",
	Callback = function()
	        for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        repeat
            wait()
        until game.Players.LocalPlayer.Character
        char.ChildAdded:Connect(function(child)
            if child:IsA("Script") then 
                wait(0.1)
                if child:FindFirstChild("LocalScript") then
                    child.LocalScript:FireServer()
                end
            end
        end)
    end)
end})
local Slider = Tab3:CreateSlider({
	Name = "cframe speed",
	Range = {1, 6},
	Increment = 1,
	Suffix = "",
	CurrentValue = 1,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
    getgenv().Multiplier = 1
	end,
})

local Toggle = Tab3:CreateToggle({
	Name = "spin bot",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().Spinbot = bool
	end,
})

local Slider = Tab3:CreateSlider({
	Name = "spinbot multiplier",
	Range = {1, 165},
	Increment = 1,
	Suffix = "",
	CurrentValue = 1,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(value)
        getgenv().positive1 = value
	end,
})

local Toggle = Tab3:CreateToggle({
	Name = "bhop",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(state)
        bhop = state
        spawn(function()
        while wait() and bhop do
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Jump = true
        end
        end)
	end,
})


local Button = Tab3:CreateButton({
	Name = "macro (X)",
	Callback = function()
        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        local SpeedGlitch = false
        local Wallet = Player.Backpack:FindFirstChild("Wallet")
    
        local UniversalAnimation = Instance.new("Animation")
    
        function stopTracks()
            for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
                if (v.Animation.AnimationId:match("rbxassetid")) then
                    v:Stop()
                end
            end
        end
    
        function loadAnimation(id)
            if UniversalAnimation.AnimationId == id then
                stopTracks()
                UniversalAnimation.AnimationId = "1"
            else
                UniversalAnimation.AnimationId = id
                local animationTrack = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(UniversalAnimation)
                animationTrack:Play()
            end
        end
    
        Mouse.KeyDown:Connect(function(Key)
            if Key == "x" then
                SpeedGlitch = not SpeedGlitch
                if SpeedGlitch == true then
                    stopTracks()
                    loadAnimation("rbxassetid://3189777795")
                    wait(1.5)
                    Wallet.Parent = Player.Character
                    wait(0.15)
                    Player.Character:FindFirstChild("Wallet").Parent = Player.Backpack
                    wait(0.05)
                    repeat game:GetService("RunService").Heartbeat:wait()
                        keypress(0x49)
                        game:GetService("RunService").Heartbeat:wait()
                        keypress(0x4F)
                        game:GetService("RunService").Heartbeat:wait()
                        keyrelease(0x49)
                        game:GetService("RunService").Heartbeat:wait()
                        keyrelease(0x4F)
                        game:GetService("RunService").Heartbeat:wait()
                    until SpeedGlitch == false
                end
            end
        end)
	end,
})

local Button = Tab3:CreateButton({
	Name = "fly (V)",
	Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/SWuch41q", true))()
	end,
})

local Tab4 = Window:CreateTab("visuals")


local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/trendyylol/roblox/main/Libraries/ESP/Pikahub"))()
local library = loadstring(game:HttpGet("https://pastebin.com/raw/U2HwmEyF"))()

local Section = Tab4:CreateSection("visuals")

local Toggle = Tab4:CreateToggle({
	Name = "boxes",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().PikaESPSettings.Box = bool
	end,
})



local Toggle = Tab4:CreateToggle({
	Name = "names",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().PikaESPSettings.Name = bool
	end,
})

local Toggle = Tab4:CreateToggle({
	Name = "tracers",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().PikaESPSettings.Tracers = bool
	end,
})
local Button = Tab4:CreateButton({
	Name = "body cham",
	Callback = function()
local run = game:GetService('RunService')

function getgun()
    for i,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
        if v and v:FindFirstChild('Default') then
            return v
        end
    end
end

function white(a,b,c)
    local time = a
    local h = tick() % time / time
    local co = Color3.fromRGB(255, 255, 255)
        for i,v in pairs(b:GetChildren()) do
            if v:IsA(c) or v:FindFirstChild(c) then
                v.Color = co
                v.Material = 'ForceField'    
        end
    end
end

run.Stepped:Connect(function()
local gun = getgun()
white(5,game:GetService('Players').LocalPlayer.Character,'BasePart')
end)
end})
	    

local Button = Tab4:CreateButton({
	Name = "gun cham",
	Callback = function()
local run = game:GetService('RunService')

function getgun()
    for i,v in pairs(game:GetService('Players').LocalPlayer.Character:GetChildren()) do
        if v and v:FindFirstChild('Default') then
            return v
        end
    end
end

function white(a,b,c)
    local time = a
    local h = tick() % time / time
    local co = Color3.fromRGB(255, 255, 255)
        for i,v in pairs(b:GetChildren()) do
            if v:IsA(c) or v:FindFirstChild(c) then
                v.Color = co
                v.Material = 'ForceField'    
        end
    end
end

run.Stepped:Connect(function()
local gun = getgun()
white(5,game:GetService('Players').LocalPlayer.Character[tostring(gun)],'BasePart')
end)
end})

local Button = Tab4:CreateButton({
	Name = "bullet color",
	Callback = function()
BulletTracers = true
bullet_tracer_color = Color3.fromRGB(255, 255, 255)
---------------------------------------------------------------------------------------------------------------------------

function GetGun()
    if game.Players.LocalPlayer.Character then
        for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:FindFirstChild 'Ammo' then
                return v
            end
        end
    end
    return nil
end

local Services = {
    Players = game:GetService("Players"),
    UserInputService = game:GetService("UserInputService"),
    RunService = game:GetService("RunService"),
}

local Local = {
    Player = Services.Players.LocalPlayer,
    Mouse = Services.Players.LocalPlayer:GetMouse(),
}
local Other = {
    Camera = workspace.CurrentCamera,
    BeamPart = Instance.new("Part", workspace)
}

Other.BeamPart.Name = "BeamPart"
Other.BeamPart.Transparency = 1
local Settings = {
    StartColor = bullet_tracer_color,
    EndColor = bullet_tracer_color,
    StartWidth = 3,
    EndWidth = 3,
    ShowImpactPoint = false,
    ImpactTransparency = 0.5,
    ImpactColor = Color3.new(1, 1, 1),
    Time = 1,
}
game:GetService "RunService".Heartbeat:Connect(function()
    if game:GetService("Workspace").Ignored:FindFirstChild 'BULLET_RAYS' and BulletTracers then
        game:GetService("Workspace").Ignored.BULLET_RAYS:Destroy()
    end
end)
local funcs = {}
Local.Mouse.TargetFilter = Other.BeamPart
function funcs:Beam(v1, v2)
    v2 = Vector3.new(v2.X - 0.1, v2.Y + 0.2, v2.Z)
    local colorSequence = ColorSequence.new({
        ColorSequenceKeypoint.new(0, bullet_tracer_color),
        ColorSequenceKeypoint.new(1, bullet_tracer_color),
    })
    local Part = Instance.new("Part", Other.BeamPart)
    Part.Size = Vector3.new(0, 0, 0)
    Part.Massless = true
    Part.Transparency = 1
    Part.CanCollide = false
    Part.Position = v1
    Part.Anchored = true
    local Attachment = Instance.new("Attachment", Part)
    local Part2 = Instance.new("Part", Other.BeamPart)
    Part2.Size = Vector3.new(0, 0, 0)
    Part2.Transparency = 0
    Part2.CanCollide = false
    Part2.Position = v2
    Part2.Anchored = true
    Part2.Material = Enum.Material.ForceField
    Part2.Color = Settings.ImpactColor
    Part2.Massless = true
    local Attachment2 = Instance.new("Attachment", Part2)
    local Beam = Instance.new("Beam", Part)
    Beam.FaceCamera = true
    Beam.Color = colorSequence
    Beam.Attachment0 = Attachment
    Beam.Attachment1 = Attachment2
    Beam.LightEmission = 6
    Beam.LightInfluence = 1
    Beam.Width0 = Settings.StartWidth
    Beam.Width1 = Settings.EndWidth
    Beam.Texture = "http://www.roblox.com/asset/?id=9150663556"
    Beam.TextureSpeed = 2
    Beam.TextureLength = 1
    delay(Settings.Time, function()
        Part:Destroy()
        Part2:Destroy()
    end)
end

spawn(function()
    while task.wait(0.5) do
        gun = GetGun()
        if gun then
            LastAmmo = gun.Ammo.Value
            gun.Ammo:GetPropertyChangedSignal("Value"):Connect(function()
                if BulletTracers and gun.Ammo.Value < LastAmmo then
                    LastAmmo = gun.Ammo.Value
                    funcs:Beam(gun.Handle.Position, Local.Mouse.hit.p)
                end
            end)
        end
    end
end)
end})






local Section = Tab4:CreateSection("world")

local Slider = Tab4:CreateSlider({
	Name = "saturation",
	Range = {0, 100},
	Increment = 1,
	Suffix = "",
	CurrentValue = 0.1,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(value)
        Light.ColorCorrection.Saturation = value
	end,
})

local Slider = Tab4:CreateSlider({
	Name = "fog",
	Range = {0, 2000},
	Increment = 1,
	Suffix = "",
	CurrentValue = 500,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(value)
        game.Lighting.FogEnd = value
	end,
})

local Slider = Tab4:CreateSlider({
	Name = "brightness",
	Range = {0, 100},
	Increment = 1,
	Suffix = "",
	CurrentValue = 1,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(value)
        Light.Brightness = value
	end,
})

local Slider = Tab4:CreateSlider({
	Name = "stars",
	Range = {0, 5000},
	Increment = 1,
	Suffix = "",
	CurrentValue = 500,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(value)
        Light.Sky.StarCount = value
	end,
})


local Tab5 = Window:CreateTab("teleports")

local Section = Tab5:CreateSection("locations")


local Button = Tab5:CreateButton({
	Name = "high armor",
	Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(-934.73651123047, -28.492471694946, 565.99884033203)
	end,
})

local Button = Tab5:CreateButton({
	Name = "double barrel",
	Callback = function()
        getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1039.59985, 18.8513641, -256.449951, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	end,
})

local Button = Tab5:CreateButton({
	Name = "revolver",
	Callback = function()
        getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-638.75, 18.8500004, -118.175011, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	end,
})

local Button = Tab5:CreateButton({
	Name = "shotgun",
	Callback = function()
        getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-578.623657, 5.47212696, -725.131531, 0, 0, 1, 0, 1, -0, -1, 0, 0)
	end,
})

local Button = Tab5:CreateButton({
	Name = "tac",
	Callback = function()
        getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(470.877533, 45.1272316, -620.630676, 0.999999821, 0.000604254019, -2.60802135e-08, -0.000604254019, 0.999999821, -8.63220048e-05, -2.60802135e-08, 8.63220048e-05, 1)
	end,
})

local Button = Tab5:CreateButton({
	Name = "smg",
	Callback = function()
        getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-577.123413, 5.47666788, -718.031433, -1, 0, 0, 0, 1, 0, 0, 0, -1)
	end,
})

local Button = Tab5:CreateButton({
	Name = "rpg",
	Callback = function()
        getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-794.814697, -42.5468521, -932.97998, 5.96046448e-08, 2.91038305e-11, 1, -0.000610388815, 0.999999821, 2.91038305e-11, -0.999999762, -0.000610388815, 5.96046448e-08)
	end,
})

local Button = Tab5:CreateButton({
	Name = "casino",
	Callback = function()
        getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-962.72345, 21.2549973, -186.814987, -0.0274876002, 2.91178949e-05, 0.999621451, -5.5798846e-06, 1, -2.92823333e-05, -0.999621451, -6.38268148e-06, -0.0274876002)
	end,
})

local Button = Tab5:CreateButton({
	Name = "bank",
	Callback = function()
        getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-402.123718, 21.75, -283.988617, 0.0159681588, -0.000121377925, -0.999872446, -2.60148026e-05, 1, -0.000121808866, 0.999872506, 2.79565484e-05, 0.0159681737)
	end,
})

local Tab6 = Window:CreateTab("autobuys")

local Section = Tab6:CreateSection("autobuy")

local Button = Tab6:CreateButton({
	Name = "revolver",
	Callback = function()
        LocalPlayer = game:GetService "Players".LocalPlayer
        local gunName = "[Revolver] - $1300"
        local k = game.Workspace.Ignored.Shop[gunName]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "double barrel",
	Callback = function()
        LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "smg",
	Callback = function()
        LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[SMG] - $750"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[SMG] - $750"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[SMG] - $750"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "ak47",
	Callback = function()
        LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[AK47] - $2250"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[AK47] - $2250"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[AK47] - $2250"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "lmg",
	Callback = function()
        LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[LMG] - $3750"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[LMG] - $3750"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[LMG] - $3750"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "rpg",
	Callback = function()
        LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[RPG] - $6000"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[RPG] - $6000"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[RPG] - $6000"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "flame",
	Callback = function()
        LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Flamethrower] - $25000"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Flamethrower] - $25000"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Flamethrower] - $25000"].ClickDetector)

        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Section = Tab6:CreateSection("autobuy ammo")

local Button = Tab6:CreateButton({
	Name = "revolver ammo",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local gunName = "12 [Revolver Ammo] - $75"
        local k = game.Workspace.Ignored.Shop[gunName]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "db ammo",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "smg ammo",
	Callback = function()
        LocalPlayer = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"]
            local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"].ClickDetector)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "ak47 ammo",
	Callback = function()
        LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "lmg ammo",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "rpg ammo",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "flame ammo",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"].ClickDetector)

        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Section = Tab6:CreateSection("autobuy food")

local Button = Tab6:CreateButton({
	Name = "pizza",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Pizza] - $5"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pizza] - $5"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pizza] - $5"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "chicken",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Chicken] - $7"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)

        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "taco",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Taco] - $2"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Taco] - $2"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Taco] - $2"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "hamburger",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Hamburger] - $5"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Hamburger] - $5"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Hamburger] - $5"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})

local Button = Tab6:CreateButton({
	Name = "popcorn",
	Callback = function()
        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Popcorn] - $7"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Popcorn] - $7"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Popcorn] - $7"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
	end,
})










    game:GetService("RunService").Heartbeat:Connect(
        function()
    if cframespeedtoggle == true then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
            game.Players.LocalPlayer.Character.Humanoid.MoveDirection * speedvalue
    end
















Rayfield:LoadConfiguration()

end)

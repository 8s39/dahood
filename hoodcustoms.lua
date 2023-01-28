
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
    end)

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
	Name = "aspect",
	LoadingTitle = "game detected - hood customs (9825515356)",
	LoadingSubtitle = "by eek#3345",
	ConfigurationSaving = {
	   Enabled = false,
	   FolderName = nil, -- Create a custom folder for your hub/game
	   FileName = "Big Hub"
	},
	Discord = {
	   Enabled = true,
	   Invite = "https://discord.gg/MQnkh5348a", -- The Discord invite code, do not include discord.gg/
	   RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
	   Title = "Sirius Hub",
	   Subtitle = "Key System",
	   Note = "Join the discord (discord.gg/sirius)",
	   FileName = "SiriusKey",
	   SaveKey = true,
	   GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
	   Key = "Hello"
	}
 })
 local Tab1 = Window:CreateTab("aimlock") -- Title, Image

 local Section1 = Tab1:CreateSection("streamables")
 

local Button = Tab1:CreateButton({
   Name = "streamable (175 fov)",
   Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/yuedVe9g'))()
   end,
})


local Button = Tab1:CreateButton({
   Name = "streamable (100 fov)",
   Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/T7RnhvYp'))()
   end,
})

local Button = Tab1:CreateButton({
   Name = "streamable (50 fov)",
   Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/yURYS37L'))()
   end,
})

 local Section1 = Tab1:CreateSection("silent aim")
 
 local Button = Tab1:CreateButton({
   Name = "silent (300 fov)",
   Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/fkdhC9b1'))()
   end,
})

 local Button = Tab1:CreateButton({
   Name = "silent (200 fov)",
   Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/huTFaLuy'))()
   end,
})

 local Button = Tab1:CreateButton({
   Name = "silent (100 fov)",
   Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/D1dn89eA'))()
   end,
})

 local Tab3 = Window:CreateTab("camlocks") -- Title, Image
   local Section1 = Tab3:CreateSection("camlocks")
  local Button = Tab3:CreateButton({
   Name = "smooth camlock (Q)",
   Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/100STKdU'))()
   end,
})

  local Button = Tab3:CreateButton({
   Name = "thusky camlock (Q)",
   Callback = function()
    loadstring(game:HttpGet('https://pastebin.com/raw/RJqSPk5h'))()
   end,
})
  local Button = Tab3:CreateButton({
   Name = "blatant camlock (C)",
   Callback = function()
getgenv().RecurringPoint = "UpperTorso"
getgenv().Hitbox = "UpperTorso"
getgenv().Keybind = "c"
getgenv().AimbotStrengthAmount = 0.09
getgenv().PredictionAmount = 111
getgenv().Radius = 35
getgenv().UsePrediction = true
getgenv().AimbotStrength = true
getgenv().FirstPerson = true
getgenv().ThirdPerson = true
getgenv().TeamCheck = false
getgenv().Enabled = true


-- // main script use with silent aim / / -- 

loadstring(game:HttpGet("https://raw.githubusercontent.com/tenaaki/GenericAimbot/main/v1.0.0"))()
   end,
})

 local Tab4 = Window:CreateTab("misc") -- Title, Image
  local Section1 = Tab4:CreateSection("un-catchable")
  
   local Button = Tab4:CreateButton({
   Name = "anti-aim viewer",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nosssa/NossLock/main/AntiAimViewer"))()
   end,
})

   local Button = Tab4:CreateButton({
   Name = "resolver",
   Callback = function()
local RunService = game:GetService("RunService")

local function zeroOutYVelocity(hrp)
    hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
    hrp.AssemblyLinearVelocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        local hrp = character:WaitForChild("HumanoidRootPart")
        zeroOutYVelocity(hrp)
    end)
end

local function onPlayerRemoving(player)
    player.CharacterAdded:Disconnect()
end

game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)

RunService.Heartbeat:Connect(function()
    pcall(function()
        for i, player in pairs(game.Players:GetChildren()) do
            if player.Name ~= game.Players.LocalPlayer.Name then
                local hrp = player.Character.HumanoidRootPart
                zeroOutYVelocity(hrp)
            end
        end
    end)
end)
   end,
})

  local Section1 = Tab4:CreateSection("anti lock")
  
     local Button = Tab4:CreateButton({
   Name = "walkable desync",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/XGjNvqrc"))()
   end,
})

     local Button = Tab4:CreateButton({
   Name = "legit aa",
   Callback = function()
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
   end,
})

     local Button = Tab4:CreateButton({
   Name = "anti lock (x)",
   Callback = function()
local Toggled = false
local KeyCode = 'x'


function AA()
    local oldVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, -70, oldVelocity.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, oldVelocity.Y, oldVelocity.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, -70, oldVelocity.Z)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = 4.14
end

game:GetService('UserInputService').InputBegan:Connect(function(Key)
    if Key.KeyCode == Enum.KeyCode[KeyCode:upper()] and not game:GetService('UserInputService'):GetFocusedTextBox() then
        if Toggled then
            Toggled = false
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = 1.85

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
 local Tab5 = Window:CreateTab("player") -- Title, Image
local Section = Tab5:CreateSection("movement")


     local Button = Tab5:CreateButton({
   Name = "cframe speed (x)",
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
		if L_140_arg0.KeyCode == Enum.KeyCode.X then
			L_138_ = not L_138_
			if L_138_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
					game:GetService("RunService").Stepped:wait()
				until L_138_ == false
			end
		end
	end)
   end,
})
local Slider = Tab5:CreateSlider({
	Name = "cframe speed",
	Range = {1, 20},
	Increment = 1,
	Suffix = "",
	CurrentValue = 1,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(s)
    getgenv().Multiplier = s
	end,
})

local Toggle = Tab5:CreateToggle({
	Name = "spin bot",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(bool)
        getgenv().Spinbot = bool
	end,
})

local Slider = Tab5:CreateSlider({
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
local Button = Tab5:CreateButton({
	Name = "speed (Z)",
	Callback = function()
        plr = game:GetService('Players').LocalPlayer
        down = true
        
        function onButton1Down(mouse)
            down = true
            while down do
                if not down then break end
                local char = plr.Character
                char.HumanoidRootPart.Velocity = char.HumanoidRootPart.CFrame.lookVector * 190
                wait()
            end
        end
        
        function onButton1Up(mouse)
            down = false
        end
        
        function onSelected(mouse)
            mouse.KeyDown:connect(function(q) if q:lower()=="z"then onButton1Down(mouse)end end)
            mouse.KeyUp:connect(function(q) if q:lower()=="z"then onButton1Up(mouse)end end)
        end
        onSelected(game.Players.LocalPlayer:GetMouse())
	end,
})

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    Rayfield:LoadConfiguration()

local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local win = DiscordLib:Window("| Azalea Hub |")
local serv = win:Server("Azalea", "A")
local Main = serv:Channel("Farm")
local Teleport = serv:Channel("Teleport")

Main:Toggle("Collect Rings", false, function(state) 
        getgenv().ring = state
        if state then
            ring()
        end
end)

Main:Toggle("Collect Orbs", false, function(state) 
        getgenv().orb = state
        if state then
            fire()
        end
end)

Main:Toggle("Auto Rebirth", false, function(state) 
        getgenv().rebirth = state
        if state then
            rebirth()
        end
    end)
 
Main:Toggle("Auto Click", false, function(state) 
        getgenv().speed = state
        if state then
            click()
        end
end)

Main:Seperator()

ad = {}
for i,v in pairs(game:GetService("Workspace").Teleports:GetChildren()) do
if v:IsA('Part') or v:IsA("SpawnLocation") then
   if not table.find(ad, v.Name) then
       table.insert(ad, v.Name)
   end 
end
end

Teleport:Dropdown("Teleports", ad, function(c)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Teleports[c].CFrame
end)

function click()
while getgenv().speed == true do
game:GetService("ReplicatedStorage").Remotes.AddSpeed:FireServer()
wait(0.2)
end
end

function rebirth()
    while getgenv().rebirth == true do
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer()
    wait(1)
    end
end

function fire()
    while getgenv().orb == true do
    for i, v in pairs(game:GetService("Workspace").OrbSpawns:GetDescendants()) do
        if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
        end
    end
    wait()
    end
end

function ring()
    while getgenv().ring == true do
        for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v.Name == "TouchInterest" and v.Parent:IsA("MeshPart") and v.Parent then
                firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            end
        end
        wait()
    end
end

function race()
    for i, v in pairs(game:GetService("Workspace").RaceEnd:GetChildren()) do
        if v.Name == "TouchInterest" and v.Parent then
            firetouchinterest(game:GetService('Players').LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
        end
    end
end
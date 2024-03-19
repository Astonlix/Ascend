getgenv().On = not getgenv().On

if not getgenv().On then return end

if (not game:IsLoaded()) then
    game.Loaded:Wait()
end

local Workspace = game:GetService("Workspace")
local replicatedStorage = game:GetService("ReplicatedStorage")
local humanoidRP = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart

if game.PlaceId == 14448662003 then
    humanoidRP.CFrame = CFrame.new(264.005615, 22.5756149, 105.391579, 0, 0, 1, 0, 1, -0, -1, 0, 0)
elseif game.PlaceId == 15520513462 then
    local eggLocations = Workspace["2 Player:"]["Level 14: The Hunt"]["Egg Locations"]["Locations"]
    local eggStorage = replicatedStorage["HUNT_TEMP"]
    local teleportFinish = Workspace["2 Player:"]["Level 14: The Hunt"].Jumps.ToLobby.Position

    local args = {[1] = "TutorialDone"}
    replicatedStorage:WaitForChild("HUNT"):WaitForChild("HUNT_EVENT"):FireServer(unpack(args))

    if eggLocations then
        repeat
            for i, egg in ipairs(eggLocations:GetChildren()) do
                repeat
                    task.wait()

                    humanoidRP.CFrame = CFrame.new(egg.Position)
                    humanoidRP.Velocity = Vector3.new(0, 0, 0)

                    proximityPrompt = egg:FindFirstChildOfClass("ProximityPrompt")
                    fireproximityprompt(proximityPrompt)
                until egg.Parent == eggStorage or not getgenv().On
            end
        until #eggLocations:GetChildren() == 0 or #eggStorage:GetChildren() == 10 or not getgenv().On
        if #eggLocations:GetChildren() == 0 then
            humanoidRP.CFrame = CFrame.new(teleportFinish)
        end
    end
end

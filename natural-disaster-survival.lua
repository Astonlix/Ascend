local localPlayer = game.Players.LocalPlayer
local clockPath = game.Workspace.Clocks
local eventPath = workspace["Event Station"]
local playerName = localPlayer.Name
local playerFolder = game.Workspace[playerName]
local Position = nil
local HRP = localPlayer.Character.HumanoidRootPart
local checkPath = eventPath["Unfinished Character"].Machine.Progress

local function teleport(Position)
    HRP.CFrame = CFrame.new(Position)
end

local function checkProgress()
    if not checkPath:FindFirstChild("Clock3") then
        return false
    else
        return true
    end
end
local function checkEquipped()
    if not playerFolder:FindFirstChild("Clock") then
        return false
    else
        return true
    end
end

--[[clockPath.ChildAdded:Connect(function(Clock)
    if not checkProgress() then   
        clockPath.Clock.ClaimEvent:FireServer()
        checkEquipped()
        if checkEquipped() then
            firetouchtransmitter(eventPath.Hitbox, localPlayer.Character.HumanoidRootPart, 0)
            firetouchtransmitter(eventPath.Hitbox, localPlayer.Character.HumanoidRootPart, 1)
        else
            checkEquipped()
        end
    end
end)]]

while not checkProgress() do task.wait()
    for _, v in pairs(clockPath:GetChildren()) do
        for _, v1 in pairs(v:GetChildren()) do
            if v1.Name == "RemoteEvent" then
                v1:FireServer()
            end
            if checkEquipped() then
                local Position = localPlayer.Character.HumanoidRootPart.Position
                teleport(eventPath.Hitbox.Position)
                teleport(Position)
                checkEquipped()
            else
                checkEquipped()
                return
            end
            checkProgress()
            print("hi")
        end
    end
end

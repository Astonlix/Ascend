local LocalPlayer = game.Players.LocalPlayer
local Easter = game.Workspace["Easter001!"]
local RobloxSign = game.Workspace["RobloxSign001!"]
local HRP = LocalPlayer.Character.HumanoidRootPart
local function activationCheck()
    if Easter:FindFirstChild("RobloxEggHunt") then
        return true
    else
        HRP.CFrame = CFrame.new(RobloxSign.Model.Roblox.Position - Vector3.new(0, 10, 0))
        fireclickdetector(RobloxSign.Model.Roblox.ClickDetector)
        task.wait(1)
        if Easter:FindFirstChild("RobloxEggHunt") then
            return true
        else
            return false
        end
    end
end

if activationCheck() then
    while activationCheck() and task.wait() do
        for i, v in ipairs(Easter.RobloxEggHunt:GetChildren()) do
            if v.Name == "Eggy" and v.Transparency == 0 then
                HRP.CFrame = CFrame.new(v.Position + Vector3.new(0, -2, 0))
            end
        end
    end
else
    print("Its not fucking activated what the fuck are you doing you retard")
    activationCheck()
end

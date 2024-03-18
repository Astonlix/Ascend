local localPlayer = game.Players.LocalPlayer
local HRP = localPlayer.Character.HumanoidRootPart
local eggFolder = workspace.EggHuntMinigame.Eggs
local nest = workspace.EggHuntMinigame.NestClickbox
local playerFolder = workspace.Astonlix


getgenv().Toggled = true

task.spawn(function()
    while getgenv().Toggled and task.wait() do
        if not playerFolder:FindFirstChild("Basket"):FindFirstChild("FakeEggs"):FindFirstChild("FakeEgg1") then
            for _, v in ipairs(eggFolder:GetChildren()) do
                for count = 0, 5, 1 do
                    HRP.CFrame = CFrame.new(v.Position + Vector3.new(0, math.random(-3, 3), 0))
                end
            end
        else
            for count = 0, 5, 1 do
                HRP.CFrame = CFrame.new(nest.Position + Vector3.new(0, math.random(-3, 3), 0))
            end
        end
    end
end)

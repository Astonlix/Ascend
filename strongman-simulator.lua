repeat task.wait() until (game:GetService("Players").LocalPlayer) and (game:GetService("Players").LocalPlayer.Character)

pcall(function()
    local Areas = { 
        workspace.Areas.HuntEvent.Collider,
        workspace.Areas.HuntEvent.Art_Workfolder.RedZone.Walls,
        workspace.Areas.HuntEvent.Area.Obby.Easy.DestroyObjects,
        workspace.Areas.HuntEvent.Art_Workfolder.RedZone.ArtLibrary,
        workspace.Areas.HuntEvent.Area.Obby.Easy.Maze,
        workspace.Areas.HuntEvent.Art_Workfolder.RedZone.Random,
        workspace.Areas.HuntEvent.Area.Obby.Easy.Wall,
        workspace.Areas.HuntEvent.Art_Workfolder.FinalZone,
        workspace.Areas.HuntEvent.Area.Obby.Hard.Folder,
        workspace.Cosmic_Obby_Parts,
        workspace.Areas.HuntEvent.Art_Workfolder.OrangeZone.Walls,
        workspace.Areas.HuntEvent.Art_Workfolder.OrangeZone.Glass_Sheet,
        workspace.Areas.HuntEvent.Area.Obby.Medium.Folder,
    }

    local function destroyAreas()
        for i, v in ipairs(Areas) do
            Areas[i]:Destroy()
        end
    end

    destroyAreas()
end)

local localPlayer = game.Players.LocalPlayer
local HRP = localPlayer.Character.HumanoidRootPart
local userId = localPlayer.UserId
local PlayerDraggables = workspace.PlayerDraggables[userId]

local function checkSize()
    if not HRP.Size == Vector3.new(2.5, 2.5, 1.25) then
        HRP.CFrame = CFrame.new(workspace.EventZones.ShrinkBig.Position)
        task.wait(2)
    else
        return true
    end
end

local function fireProximityPrompt()
    for i, v in ipairs(workspace.Areas.HuntEvent.DraggableItems:GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            fireproximityprompt(v)
        end
    end
end

local function getEgg(Difficulty)
    while not PlayerDraggables:FindFirstChildOfClass("Part") do task.wait(1)
        HRP.CFrame = CFrame.new(workspace.Areas.HuntEvent.Area:GetChildren()[Difficulty].emitter.Position)
        fireProximityPrompt()
    end
end

tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1.5, Enum.EasingStyle.Linear)

local function tweenCharacter(Coords)
    tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(Coords)}):Play()
    task.wait(2)
    for i, v in ipairs(PlayerDraggables:GetChildren()) do
        v.Position = HRP.Position
    end
end 

local function script()
    --if checkSize() then
        getEgg(3)
        tweenCharacter(workspace.Areas.HuntEvent.Area.Obby.Easy.Goal.Goal.Position + Vector3.new(0, 7, 0))
        getEgg(4)
        tweenCharacter(workspace.Areas.HuntEvent.Area.Obby.Medium.Goal.Goal.Position + Vector3.new(0, 7, 0))
        getEgg(5)
        tweenCharacter(workspace.Areas.HuntEvent.Area.Obby.Hard.Goal.Goal.Position + Vector3.new(0, 7, 0))
    --else
        --checkSize()
    --end
end
PlayerDraggables.ChildAdded:Connect(function(child)
    while task.wait(0.33) do
        for i, v in ipairs(child:GetChildren()) do
            if v:IsA("RopeConstraint") then
                v.Length = 0
            end
        end
    child.Position = HRP.Position
    end
end)

script()

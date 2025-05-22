-- @ScriptType: LocalScript
local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local blur = game.Lighting:WaitForChild("Blur")
repeat task.wait() until game:IsLoaded()
task.wait(5)
local char = game.Players.LocalPlayer.Character
local hum = char:WaitForChild("Humanoid")
local light = char.Head:WaitForChild("flashlight")
local colorCorrection = game.Lighting:WaitForChild("ColorCorrection")
local SG = game:GetService("StarterGui")
local nvParts = game.ReplicatedStorage.nightvision
SG:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
task.wait()

uis.InputBegan:Connect(function(input, gpe)
	if gpe == false then

		------------------------NIGHT-VISION--------------------------------------------
		if input.KeyCode == Enum.KeyCode.N and plr.PlayerGui:WaitForChild("nightVision").Enabled == false then
			blur.Size = 10
			blur.Enabled = true
			SG:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
			colorCorrection.Contrast = 1
			colorCorrection.Brightness = -0.2
			colorCorrection.Saturation = -1
			colorCorrection.TintColor = Color3.fromRGB(255,255,255)
			colorCorrection.Enabled = true
			plr.PlayerGui:WaitForChild("nightVision").Enabled = true
			light:WaitForChild("click"):Play()
			light.Enabled = true
			nvParts.Parent = game.Workspace
			nvParts["Green Key"].Parent = game.Workspace.ItemsInMap
			

		elseif input.KeyCode == Enum.KeyCode.N and plr.PlayerGui:WaitForChild("nightVision").Enabled == true then
			blur.Enabled = false
			nvParts.Parent = game.ReplicatedStorage
			game.Workspace.ItemsInMap["Green Key"].Parent = nvParts
			blur.Size = 0
			SG:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
			colorCorrection.Contrast = 0
			colorCorrection.Brightness = -0.2
			colorCorrection.Saturation = 0
			colorCorrection.TintColor = Color3.fromRGB(255,255,255)
			plr.PlayerGui:WaitForChild("nightVision").Enabled = false
			light:WaitForChild("click"):Play()
			light.Enabled = false
			

			------------------------CRAWL--------------------------------------------
			if input.KeyCode == Enum.KeyCode.LeftControl and hum.WalkSpeed ~= 8 then
				hum.WalkSpeed = 8
			elseif input.KeyCode == Enum.KeyCode.LeftControl and hum.WalkSpeed == 8 then
				hum.WalkSpeed = 16
			end
		end
	end
end)
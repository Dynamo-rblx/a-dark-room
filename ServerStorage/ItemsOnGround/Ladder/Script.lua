-- @ScriptType: Script

local itemname = script.Parent.Name
script.Parent.ClickDetector.MouseClick:Connect(function(player)
	local HasItem = player:WaitForChild("HasItem")
	local Item = HasItem:WaitForChild("Item")
	
	local function pickup(player)
		print("picking up"..itemname)
		Item.Value = itemname
		local thing = game.ServerStorage.Items[itemname]:Clone()
		thing.Parent = player.Backpack
		script.Parent:Destroy()
	end
	local function putdown(player)
		print("putting down old tool")
		if player.Backpack:FindFirstChild(Item.Value) then
			player.Backpack:FindFirstChild(Item.Value):Destroy()
			local groundPart = game.ServerStorage.ItemsOnGround[Item.Value]:Clone()
			groundPart.Parent = game.Workspace.ItemsInMap
			groundPart.CFrame = script.Parent.CFrame
		end
	end
	if HasItem.Value == false then
		HasItem.Value = true
		pickup(player)
	else
		putdown(player)
		pickup(player)
	end
end)


local highlight = script.Parent:WaitForChild("Highlight")
local cd = script.Parent:WaitForChild("ClickDetector")
highlight.Enabled = false

cd.MouseHoverEnter:Connect(function()
	if script.Parent.Transparency == 0 then
		highlight.Enabled = true
	end
end)

cd.MouseHoverLeave:Connect(function()
	if script.Parent.Transparency == 0 then
		highlight.Enabled = false
	end
end)
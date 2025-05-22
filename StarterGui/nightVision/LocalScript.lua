-- @ScriptType: LocalScript
script.Parent.Changed:Connect(function()
	if script.Parent.Enabled == true then
		script.Parent.frame:TweenPosition(UDim2.new(0,0,0,0), Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.5)

	elseif script.Parent.Enabled == false then
		script.Parent.frame:TweenPosition(UDim2.new(0,0,1.5,0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.5)
	end
end)
-- @ScriptType: Script
local light = script.Parent
b = light.Brightness
range = light.Range

while true do
	light.Brightness = b + math.random(-0.46, 0.46)
	light.Range = range + math.random(10, 27)
	task.wait(math.random(0.1,0.45))
end
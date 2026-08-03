--[[


 This script is detectable btw, do not use in games which detect this!


--]]

local p,uis = game.Players.LocalPlayer,game:GetService("UserInputService")
local m = p:GetMouse()
local ov = "rbxasset://textures/MouseLockedCursor.png"
local overrides = {
	"textures/MouseLockedCursor.png",
	"6001676828",
	"83095263141318",
	"104068533134408",
	"91788215415232"
}
local base = "https://raw.githubusercontent.com/ICantAffordWave/shiftlockicon/refs/heads/main/"
local get = function(v,c)
	local s, r = pcall(function() 
		if not c then
		if readfile("shiftlockicons/"..v) then 
			return getcustomasset("shiftlockicons/"..v) 
			end
		else
			if readfile("shiftlockicons/"..c) then 
				return getcustomasset("shiftlockicons/"..c) 
			end
		end
	end)
	if s then 
		return r
	else
		local s,r = pcall(function()
			 return game:HttpGet(base..v)
		end)
		if s then
			if c then
				writefile("shiftlockicons"..c, r)
				return getcustomasset("shiftlockicons/"..c)
			else
				writefile("shiftlockicons"..v, r)
				return getcustomasset("shiftlockicons/"..v)
			end
		end
	end
end
local ricon = get("s.png", "shiftlock1.png")
local c = uis.InputBegan:Connect(function(k, gpe)
	if gpe then return end
	if (k.KeyCode == Enum.KeyCode.LeftShift or k.KeyCode == Enum.KeyCode.RightShift) then
      -- may be a better way to do this
		for i,icon in pairs(overrides) do
			if string.match(m.Icon, icon) then
				m.Icon = ricon
      end
		end
	end
end)

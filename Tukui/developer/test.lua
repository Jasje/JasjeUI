local T, C, L = unpack(select(2, ...))

--[[
local function OnEvent(self, event)
	if event == "PLAYER_REGEN_DISABLED" then
		SetBinding("Q", "SPELL Wind Shear")
		SetBinding("E", "SPELL Commanding Shout")
	else
		SetBinding("Q", "STRAFELEFT")
		SetBinding("E", "STRAFERIGHT")
	end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_REGEN_DISABLED")
f:RegisterEvent("PLAYER_REGEN_ENABLED")
f:SetScript("OnEvent", OnEvent)
]]--
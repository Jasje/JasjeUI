local T, C, L = unpack(Tukui)

local UpdateActionButtonFont = function(self)
	local Name = self:GetName()
	local Count = _G[Name.."Count"]
	local Hotkey = _G[Name.."HotKey"]
	
	if Count then
		Count:SetFont(C["media"].pixelfont, 8, "MONOCHROMEOUTLINE") -- set me
	end
	
	if Hotkey then
		Hotkey:SetFont(C["media"].pixelfont, 8, "MONOCHROMEOUTLINE") -- set me
	end
end

hooksecurefunc("ActionButton_Update", UpdateActionButtonFont)

TukuiShiftBar:ClearAllPoints()
TukuiShiftBar:SetPoint('BOTTOMLEFT', ChatFrame1, "TOPLEFT", -2, 25)
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

-- whatcha gonna do when you're bored
TukuiBar2Button:SetTemplate("Transparent")
TukuiBar2Button:SetBorder()
TukuiBar3Button:SetTemplate("Transparent")
TukuiBar3Button:SetBorder()
TukuiBar5ButtonTop:SetTemplate("Transparent")
TukuiBar5ButtonTop:SetBorder()
TukuiBar5ButtonBottom:SetTemplate("Transparent")
TukuiBar5ButtonBottom:SetBorder()
TukuiExitVehicleButtonRight:SetTemplate("Transparent")
TukuiExitVehicleButtonRight:SetBorder()
TukuiExitVehicleButtonLeft:SetTemplate("Transparent")
TukuiExitVehicleButtonLeft:SetBorder()

local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
TukuiExitVehicleButtonRight:SetBackdropBorderColor(color.r,color.g,color.b)
TukuiExitVehicleButtonLeft:SetBackdropBorderColor(color.r,color.g,color.b)

local T, C, L = unpack(Tukui)

TukuiBar2Button.text:SetFont(C["media"].pixelfont, 8, "MONOCHROMEOUTLINE") 
TukuiBar3Button.text:SetFont(C["media"].pixelfont, 8, "MONOCHROMEOUTLINE") 
TukuiBar4Button.text:SetFont(C["media"].pixelfont, 16, "MONOCHROMEOUTLINE") 
TukuiBar5ButtonTop.text:SetFont(C["media"].pixelfont, 8, "MONOCHROMEOUTLINE") 
TukuiBar5ButtonBottom.text:SetFont(C["media"].pixelfont, 8, "MONOCHROMEOUTLINE") 

local UpdateActionButtonFont = function(self)
	local Name = self:GetName()
	local Count = _G[Name.."Count"]
	local Hotkey = _G[Name.."HotKey"]
	
	if Count then
		Count:SetFont(C["media"].pixelfont, 8, "MONOCHROMEOUTLINE") 
	end
	
	if Hotkey then
		Hotkey:SetFont(C["media"].pixelfont, 8, "MONOCHROMEOUTLINE")
	end
end

hooksecurefunc("ActionButton_Update", UpdateActionButtonFont)

TukuiShiftBar:ClearAllPoints()
TukuiShiftBar:SetPoint('TOP', TukuiPlayer, "BOTTOMRIGHT", 38, -45)

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

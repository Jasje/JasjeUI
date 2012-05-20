local T, C, L = unpack(Tukui)

TukuiBar2Button.text:SetFont(T.SetPixelFont())
TukuiBar3Button.text:SetFont(T.SetPixelFont())
TukuiBar4Button.text:SetFont(T.SetPixelFont())
TukuiBar5ButtonTop.text:SetFont(T.SetPixelFont())
TukuiBar5ButtonBottom.text:SetFont(T.SetPixelFont())
TukuiExitVehicleButtonLeft.text:SetFont(T.SetPixelFont())
TukuiExitVehicleButtonRight.text:SetFont(T.SetPixelFont())

local UpdateActionButtonFont = function(self)
	local Name = self:GetName()
	local Count = _G[Name.."Count"]
	local Hotkey = _G[Name.."HotKey"]
	
	if Count then
		Count:SetFont(T.SetPixelFont())
	end
	
	if Hotkey then
		Hotkey:SetFont(T.SetPixelFont())
	end
end

hooksecurefunc("ActionButton_Update", UpdateActionButtonFont)

TukuiShiftBar:ClearAllPoints()
if (T.myclass == "PALADIN") then
    TukuiShiftBar:SetPoint('TOP', TukuiPlayer, "BOTTOMRIGHT", -28, -45)
else
    TukuiShiftBar:SetPoint('TOP', TukuiPlayer, "BOTTOMRIGHT", 38, -45)
end

if C.actionbar.jasje then
    MultiBarBottomLeftButton7:Kill()
    MultiBarBottomLeftButton8:Kill()
    MultiBarBottomLeftButton9:Kill()
    MultiBarBottomLeftButton10:Kill()
    MultiBarBottomLeftButton11:Kill()
    MultiBarBottomLeftButton12:Kill()

    MultiBarBottomRightButton7:Kill()
    MultiBarBottomRightButton8:Kill()
    MultiBarBottomRightButton9:Kill()
    MultiBarBottomRightButton10:Kill()
    MultiBarBottomRightButton11:Kill()
    MultiBarBottomRightButton12:Kill()
end

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

local T, C, L = unpack(Tukui)

TukuiBar1:ClearAllPoints()
TukuiBar1:Point("BOTTOM", UIParent, "BOTTOM", 0, 7)

TukuiBar4:ClearAllPoints()
TukuiBar4:Point("BOTTOM", UIParent, "BOTTOM", 0, 7)

TukuiBar5:ClearAllPoints()
TukuiBar5:Point("RIGHT", UIParent, "RIGHT", -10, -50)

T.InfoLeftRightWidth = 370

TukuiInfoRight:ClearAllPoints()
TukuiInfoRight:Point("BOTTOMRIGHT", UIParent, -10, 7)
TukuiInfoRight:Width(T.InfoLeftRightWidth)
TukuiInfoRight:Height(20)

TukuiInfoLeft:ClearAllPoints()
TukuiInfoLeft:Point("BOTTOMLEFT", UIParent, 10, 7)
TukuiInfoLeft:Width(T.InfoLeftRightWidth)
TukuiInfoLeft:Height(20)

-- bottombar
local tbottombar = CreateFrame("Frame", "TukuiBottomBar", UIParent)
tbottombar:CreatePanel("Default", T.screenwidth+6, 20, "BOTTOM", UIParent, "BOTTOM", 0, -2)
tbottombar:SetFrameStrata("BACKGROUND")
tbottombar:SetFrameLevel(0)
tbottombar:SetAlpha(.9)
tbottombar:CreateShadow("Hydra")
	
TukuiTooltipAnchor:ClearAllPoints()
TukuiTooltipAnchor:SetPoint("BOTTOMRIGHT", TukuiInfoRight, 0,-6)


-- killing time
TukuiMinimapStatsLeft:Kill()
TukuiMinimapStatsRight:Kill()
TukuiInfoLeftLineVertical:Kill()
TukuiInfoRightLineVertical:Kill()
TukuiLineToABLeft:Kill()
TukuiLineToABRight:Kill()
TukuiCubeLeft:Kill()
TukuiCubeRight:Kill()
if C.chat.background then
    TukuiLineToABLeftAlt:Kill()
    TukuiLineToABRightAlt:Kill()
end	
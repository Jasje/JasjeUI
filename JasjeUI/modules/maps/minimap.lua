local T, C, L, G = unpack(Tukui)

TukuiMinimap:ClearAllPoints()
TukuiMinimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -10, -15)

TukuiMinimapZoneText:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
TukuiMinimapCoordText:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
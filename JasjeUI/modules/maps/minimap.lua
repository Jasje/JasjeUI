local T, C, L = unpack(Tukui)

TukuiMinimap:ClearAllPoints()
TukuiMinimap:Point("TOPRIGHT", UIParent, "TOPRIGHT", -10, -15)

TukuiMinimapZoneText:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
TukuiMinimapCoordText:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")

TukuiTicket:ClearAllPoints()
TukuiTicket:CreatePanel("Transparent", 1, 1, "CENTER", TukuiMinimap, "CENTER", 0, 0)
TukuiTicket:Size(TukuiMinimap:GetWidth() - 4, 18)
TukuiTicket:SetFrameStrata("MEDIUM")
TukuiTicket:SetFrameLevel(20)
TukuiTicket:Point("TOP", 0, -2)
TukuiTicket:FontString("Text", C.media.pixelfont2, 14, "MONOCHROMEOUTLINE")
TukuiTicket.Text:SetPoint("CENTER", 0, 2)
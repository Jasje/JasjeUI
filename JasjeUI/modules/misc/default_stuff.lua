local T, C, L, G= unpack(Tukui)

LoadAddOn("Blizzard_CombatText")

COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL"] = {var = nil, show = nil}
--COMBAT_TEXT_TYPE_INFO["HEAL_CRIT"] = {var = nil, show = nil}
--COMBAT_TEXT_TYPE_INFO["HEAL"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["PERIODIC_HEAL_ABSORB"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL_CRIT_ABSORB"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["HEAL_ABSORB"] = {var = nil, show = nil}

COMBAT_TEXT_TYPE_INFO["DAMAGE_CRIT"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["DAMAGE"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["SPELL_DAMAGE_CRIT"] = {var = nil, show = nil}
COMBAT_TEXT_TYPE_INFO["SPELL_DAMAGE"] = {var = nil, show = nil}

--Bliaazrd LossOfControlFrame font and posistioning
hooksecurefunc("LossOfControlFrame_SetUpDisplay", function(self, ...)	
	self.Icon:ClearAllPoints()
	self.Icon:SetPoint("CENTER", self, "CENTER", 0, 0)

	self.AbilityName:ClearAllPoints()
	self.AbilityName:SetPoint("BOTTOM", self, 0, -28)
	self.AbilityName.scrollTime = nil;
	self.AbilityName:SetFont(C.media.pixelfont, 14, 'MONOCHROMEOUTLINE')

	self.TimeLeft.NumberText:ClearAllPoints()
	self.TimeLeft.NumberText:SetPoint("BOTTOM", self, 4, -58)
	self.TimeLeft.NumberText.scrollTime = nil;
	self.TimeLeft.NumberText:SetFont(C.media.pixelfont, 14, 'MONOCHROMEOUTLINE')

	self.TimeLeft.SecondsText:ClearAllPoints()
	self.TimeLeft.SecondsText:SetPoint("BOTTOM", self, 0, -80)
	self.TimeLeft.SecondsText.scrollTime = nil;
	self.TimeLeft.SecondsText:SetFont(C.media.pixelfont, 14, 'MONOCHROMEOUTLINE')
end)

-- zonetext
--ZoneTextString:SetFont(C.media.pixelfont, 15, "MONOCHROMEOUTLINE")
--SubZoneTextString:SetFont(C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
--PVPInfoTextString:SetFont(C.media.pixelfont, 10, "MONOCHROMETHINOUTLINE")
--PVPArenaTextString:SetFont(C.media.pixelfont, 10, "MONOCHROMEOUTLINE")
UIErrorsFrame:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
--FramerateLabel:SetFont(C.media.pixelfont2, 12, "MONOCHROMEOUTLINE")
--FramerateText:SetFont(C.media.pixelfont2, 12, "MONOCHROMEOUTLINE")


-- changing scrolling combat font
local JasjeuiFonts = CreateFrame("Frame", "JasjeuiFonts", UIParent)

local SetFont = function(obj, font, size, style, r, g, b, sr, sg, sb, sox, soy)
	obj:SetFont(font, size, style)
	if sr and sg and sb then obj:SetShadowColor(sr, sg, sb) end
	if sox and soy then obj:SetShadowOffset(sox, soy) end
	if r and g and b then obj:SetTextColor(r, g, b)
	elseif r then obj:SetAlpha(r) end
end

JasjeuiFonts:RegisterEvent("ADDON_LOADED")
JasjeuiFonts:SetScript("OnEvent", function(self, event, addon)
	if addon ~= "JasjeUI" then return end

	local COMBAT     = "Fonts\\FRIZQT__.ttf"
    local PIXEL     = C.media.pixelfont 

	UNIT_NAME_FONT     = "Fonts\\FRIZQT__.ttf"
	DAMAGE_TEXT_FONT   = "Fonts\\FRIZQT__.ttf"
	
	-- Base fonts
	-- /run ZoneTextString: SetText("TestTextHere!"); FadingFrame_Show(ZoneTextFrame)
	SetFont(CombatTextFont,                     COMBAT, 100, "") 
	SetFont(ZoneTextString,                     PIXEL, 12, "MONOCHROMEOUTLINE")
	SetFont(SubZoneTextString,                  PIXEL, 10, "MONOCHROMEOUTLINE")
	SetFont(PVPInfoTextString,                  PIXEL, 8, "MONOCHROMEOUTLINE")
	SetFont(PVPArenaTextString,                 PIXEL, 8, "MONOCHROMEOUTLINE")

	SetFont = nil
	self:SetScript("OnEvent", nil)
	self:UnregisterAllEvents()
	self = nil
end)

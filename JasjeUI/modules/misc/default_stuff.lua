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

if G.Misc.Fonts then
    UNIT_NAME_FONT = "Fonts\\FRIZQT__.TTF"
	DAMAGE_TEXT_FONT = "Fonts\\FRIZQT__.TTF", 100
end	
--[[
	local JasjeUI = CreateFrame('Frame')
        JasjeUI:RegisterEvent('ADDON_LOADED')
        JasjeUI:SetScript(OnEvent, function(self, event, addon)
	if addon ~= 'JasjeUI' then return end

	UNIT_NAME_FONT = "Fonts\\FRIZQT__.TTF"
	DAMAGE_TEXT_FONT = "Fonts\\FRIZQT__.TTF"

	SetFont(CombatTextFont,                     DAMAGE_TEXT_FONT, 100) -- number here just increase the font quality.
	
	SetFont = nil
	self:SetScript("OnEvent", nil)
	self:UnregisterAllEvents()
	self = nil
    end)]]
local T, C, L = unpack(select(2, ...))
if not C["datatext"].regen and not C["datatext"].regen > 0 then return end

local regen

local Stat = CreateFrame("Frame")
Stat:SetFrameStrata("BACKGROUND")
Stat:SetFrameLevel(3)

local Text = TukuiInfoLeft:CreateFontString(nil, "OVERLAY")
Text:SetFont(C.media.pixelfont2, C["datatext"].fontsize,C["datatext"].fontflag)
T.PP(C["datatext"].regen, Text)

Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
Stat:RegisterEvent("PLAYER_REGEN_DISABLED")
Stat:RegisterEvent("PLAYER_REGEN_ENABLED")
Stat:RegisterEvent("UNIT_STATS")
Stat:RegisterEvent("UNIT_AURA")
Stat:SetScript("OnEvent", function(self)
	local base, casting = GetManaRegen()

	if InCombatLockdown() then
		regen = floor(casting*5)
	else
		regen = floor(base*5)		
	end
	
	Text:SetText(regen.." "..hexa.."MP5"..hexb)
end)
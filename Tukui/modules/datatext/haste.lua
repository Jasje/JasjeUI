local T, C, L = unpack(select(2, ...)) 

--------------------------------------------------------------------
-- player haste
--------------------------------------------------------------------

if C["datatext"].haste and C["datatext"].haste > 0 then
	local Stat = CreateFrame("Frame")
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = TukuiInfoLeft:CreateFontString(nil, "OVERLAY")
	Text:SetFont(C["datatext"].font, C["datatext"].fontsize,C["datatext"].fontflag)
	T.PP(C["datatext"].haste, Text)

	local int = 1

	local function Update(self, t)
		spellhaste = UnitSpellHaste("player");
		rangedhaste = GetRangedHaste();
		attackhaste = GetMeleeHaste();

		if attackhaste > spellhaste and select(2, UnitClass("Player")) ~= "HUNTER" then
			haste = attackhaste
		elseif select(2, UnitClass("Player")) == "HUNTER" then
			haste = rangedhaste
		else
			haste = spellhaste
		end

		int = int - t
		if int < 0 then
			Text:SetText(format("%.2f", haste).."% "..hexa..L.datatext_playerhaste..hexb)
			int = 1
		end
	end

	Stat:SetScript("OnUpdate", Update)
	Update(Stat, 10)
end
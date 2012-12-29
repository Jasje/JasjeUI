local T, C, L, G = unpack(Tukui)

-- interrupt announce to channel /y
local interrupt_announce = CreateFrame("Frame")
interrupt_announce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
interrupt_announce:SetScript("OnEvent", function(self, _, ...)
	local _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID = ...
	if not (event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID("player")) then return end

	SendChatMessage(INTERRUPTED.." "..destName..": "..GetSpellLink(spellID), "YELL")
end)

-- drink announce for arena	
local drinking_announce = CreateFrame("Frame")
drinking_announce:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
drinking_announce:SetScript("OnEvent", function(self, event, ...)
	if not (event == "UNIT_SPELLCAST_SUCCEEDED" and GetZonePVPInfo() == "arena") then return end

	local unit, _, _, _, spellID = ...
	if UnitIsEnemy("player", unit) and (spellID == 80167 or spellID == 94468 or spellID == 43183 or spellID == 57073) then
		SendChatMessage(UnitName(unit).."  is drinking.", "PARTY")
		PlaySoundFile("Interface\\Addons\\Tukui_SpellAlert\\sounds\\81923.mp3", "Master")
	end
end)

-- announce Devotion Aura - credit wrufu
local f = CreateFrame("Frame")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:SetScript("OnEvent", function(self, event, ...)
local event, destGUID, id = select(2, ...), select(8, ...)
	if (event == "SPELL_AURA_APPLIED" and destGUID == UnitGUID("player")) then
		id = select(12, ...)
		if id == 31821 then 
			local msg = format("%s %s", GetSpellLink(id), "is up.")
			SendChatMessage(msg, "SAY")
		end
	end
	if (event == "SPELL_AURA_REMOVED" and destGUID == UnitGUID("player")) then
		id = select(12, ...)
		if id == 31821 then 
			local msg = format("%s %s", GetSpellLink(id), "has faded.")
			SendChatMessage(msg, "SAY")
		end
	end
end)
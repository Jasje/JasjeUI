local T, C, L = unpack(Tukui)

local interrupt_announce = CreateFrame("Frame")
interrupt_announce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
interrupt_announce:SetScript("OnEvent", function(self, _, _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID, spellName)
	if not (event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID('player')) then return end

    SendChatMessage(INTERRUPTED.." "..destName..": \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "YELL", nil, nil) 
    end)

local drinking_announce = CreateFrame("Frame")
drinking_announce:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
drinking_announce:SetScript("OnEvent", function(self, event, ...)
	if not (event == "UNIT_SPELLCAST_SUCCEEDED" and GetZonePVPInfo() == "arena") then return end

	local unit, spellName, spellrank, spelline, spellID = ...
	if UnitIsEnemy("player", unit) and (spellID == 81923 or spellName == "Drinking") then
		if GetRealNumRaidMembers() > 0 then
			SendChatMessage(UnitName(unit).." is drinking.", "RAID")
			PlaySoundFile("Interface\\Addons\\Tukui_SpellAlert\\sounds\\81923.mp3", "Master")
		elseif GetRealNumPartyMembers() > 0 and not UnitInRaid("player") then
			SendChatMessage(UnitName(unit).." is drinking.", "PARTY")
			PlaySoundFile("Interface\\Addons\\Tukui_SpellAlert\\sounds\\81923.mp3", "Master")
		else
			SendChatMessage(UnitName(unit).." is drinking.", "SAY")
			PlaySoundFile("Interface\\Addons\\Tukui_SpellAlert\\sounds\\81923.mp3", "Master")
		end
	end
end)
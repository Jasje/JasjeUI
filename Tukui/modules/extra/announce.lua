local T, C, L = unpack(select(2, ...)) 
-----------------------------------------------
--	announce your interrupts(by Elv22) 
-----------------------------------------------
if C["interruptanncounce"].enable == true then

local interrupt_announce = CreateFrame("Frame")
interrupt_announce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
interrupt_announce:SetScript("OnEvent", function(self, _, _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID, spellName)
	if not (event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID('player')) then return end

    SendChatMessage(INTERRUPTED.." "..destName..": \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "YELL", nil, nil) -- change "YELL" to whatever channel you like
    end)
end
-----------------------------------------------
-- enemy drinking(by Duffed)
-----------------------------------------------
local drinking_announce = CreateFrame("Frame")
drinking_announce:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
drinking_announce:SetScript("OnEvent", function(self, event, ...)
	if not (event == "UNIT_SPELLCAST_SUCCEEDED" and GetZonePVPInfo() == "arena") then return end

	local unit, spellName, spellrank, spelline, spellID = ...
	if UnitIsEnemy("player", unit) and (spellID == 80167 or spellID == 94468 or spellID == 43183 or spellID == 57073 or spellName == "Drinking") then
		if GetRealNumRaidMembers() > 0 then
			SendChatMessage(UnitName(unit).." is drinking.", "RAID")
		elseif GetRealNumPartyMembers() > 0 and not UnitInRaid("player") then
			SendChatMessage(UnitName(unit).." is drinking.", "PARTY")
		else
			SendChatMessage(UnitName(unit).." is drinking.", "SAY")
		end
	end
end)
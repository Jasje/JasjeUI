local T, C, L = unpack(select(2, ...)) 
-----------------------------------------------
--	announce your interrupts(by Elv22) 
-----------------------------------------------
if not C["interruptanncounce"].enable == true then
local interrupt_announce = CreateFrame("Frame")
interrupt_announce:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
interrupt_announce:SetScript("OnEvent", function(self, _, ...)
	local _, event, _, sourceGUID, _, _, _, _, destName, _, _, _, _, _, spellID, spellName = ...
	if not (event == "SPELL_INTERRUPT" and sourceGUID == UnitGUID("player")) then return end

	if GetRealNumRaidMembers() > 0 then
		SendChatMessage(INTERRUPTED.." "..destName..": \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "RAID", nil, nil)
	elseif GetRealNumPartyMembers() > 0 and not UnitInRaid("player") then
		SendChatMessage(INTERRUPTED.." "..destName..": \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "PARTY", nil, nil)
	else
		SendChatMessage(INTERRUPTED.." "..destName..": \124cff71d5ff\124Hspell:"..spellID.."\124h["..spellName.."]\124h\124r!", "SAY", nil, nil)
	end
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
--------------------------------------------------
-- announce your buff/debuff(by Duffed)
--------------------------------------------------
local f = CreateFrame("Frame")
local function Update(self, event, ...)

	local pvpType = GetZonePVPInfo()
		if pvpType ~= "arena" then return end
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		if UnitInRaid("player") and GetNumRaidMembers() > 5 then channel = "RAID" elseif GetNumPartyMembers() > 0 then channel = "PARTY" else return end
		-- local channel = "SAY"
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...
		local spellName = select(13, ...)
		for spell, check in pairs(SpellsAN.aura) do
			if (eventType == "SPELL_AURA_APPLIED") and destName == UnitName("player") then
				if spellName == spell and check == true then
					SendChatMessage("+ "..spell.."!", channel)
				elseif spellName == spell and check ~= true then
					SendChatMessage(spell.."!", channel)
				end
			elseif eventType == "SPELL_AURA_REMOVED" and destName == UnitName("player") then
				if spellName == spell and check ~= false then
					SendChatMessage("- "..spell.."!", channel) 
				end
			end
		end
		for spell, check in pairs(SpellsAN.cast) do
			if eventType == "SPELL_CAST_SUCCESS" and sourceName == UnitName("player") and spellName == spell then
				SendChatMessage(spell.."!", channel)
			end
		end
	end
end
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
f:RegisterEvent("ZONE_CHANGED_NEW_AREA")
f:SetScript("OnEvent", Update)
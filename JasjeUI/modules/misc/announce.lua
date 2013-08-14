local T, C, L, G = unpack(Tukui)

local function OnEvent(self, event, ...)
	if ( event == "PLAYER_LOGIN" ) then
		self:UnregisterEvent("PLAYER_LOGIN");
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	elseif ( event == "COMBAT_LOG_EVENT_UNFILTERED" ) then
		local numParty = GetNumGroupMembers();
		
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, _, extraskillID, extraskillname = ...; 
		if (eventType == "SPELL_INTERRUPT") and sourceName == UnitName("player") then
			intmsg = ("INTERRUPTED");
				intmsg = (intmsg.." "..destName..": "..GetSpellLink(extraskillID))
			if UnitInRaid("player") then
				SendChatMessage(intmsg, "PARTY")
			elseif IsInGroup("player") then
				SendChatMessage(intmsg, "PARTY")
			if IsInGroup("player") and (numParty > 0) then
				SendChatMessage(intmsg, "PARTY")
			end
				SendChatMessage(intmsg, "YELL")
				--print(intmsg)
		end
	end
end 
end
local SuccessfulInterruptAnnouncer = CreateFrame("Frame")
SuccessfulInterruptAnnouncer:RegisterEvent("PLAYER_LOGIN")
SuccessfulInterruptAnnouncer:SetScript("OnEvent", OnEvent)


----------------------------------------------------------------------------------------
--	Announce enemy drinking in arena(by Duffed)
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
frame:SetScript("OnEvent", function(self, event, ...)
	if not (event == "UNIT_SPELLCAST_SUCCEEDED" and GetZonePVPInfo() == "arena") then return end

	local unit, _, _, _, spellID = ...
	if UnitIsEnemy("player", unit) and (spellID == 118358 or spellID == 104270) then
			SendChatMessage(UnitName(unit).." is drinking.", "PARTY")
			PlaySoundFile("Interface\\Addons\\Tukui_SpellAlert\\sounds\\81923.mp3", "MASTER")
	end
end)

----------------------------------------------------------------------------------------
--	Announce some spells by Shestak
----------------------------------------------------------------------------------------

T.CheckChat = function(warning)
	if (not IsInGroup(LE_PARTY_CATEGORY_HOME) or not IsInRaid(LE_PARTY_CATEGORY_HOME)) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
		return "INSTANCE_CHAT"
	elseif IsInRaid(LE_PARTY_CATEGORY_HOME) then
		if warning and (UnitIsGroupLeader("player") or UnitIsGroupAssistant("player") or IsEveryoneAssistant()) then
			return "RAID_WARNING"
		else
			return "RAID"
		end
	elseif IsInGroup(LE_PARTY_CATEGORY_HOME) then
		return "PARTY"
	end
	return "SAY"
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
frame:SetScript("OnEvent", function(self, _, ...)
	local _, event, _, sourceGUID, sourceName, _, _, _, destName, _, _, spellID = ...
	local spells = {
		48792,	
		108200,	
		55233,	
		120668,	
		108280,	
		--30823,	--test
	}
	
	local inInstance, instanceType = IsInInstance()
	if not (inInstance and (instanceType == "raid" or instanceType == "party")) then return end

	if event == "SPELL_CAST_SUCCESS" then
		if (sourceGUID == UnitGUID("player") and sourceName == UnitName("player")) then
			if not sourceName then return end

			for i, spells in pairs(spells) do
				if spellID == spells then
					if destName == nil then
						SendChatMessage(string.format("%s used %s.", sourceName, GetSpellLink(spellID)), T.CheckChat())
					else
						SendChatMessage(string.format("%s used %s.", sourceName, GetSpellLink(spellID).." -> "..destName), T.CheckChat())
					end
				end
			end
		else
			if not (sourceGUID == UnitGUID("player") and sourceName == UnitName("player")) then return end

			for i, spells in pairs(spells) do
				if spellID == spells then
					if destName == nil then
						SendChatMessage(string.format("%s used %s.", sourceName, GetSpellLink(spellID)), T.CheckChat())
					else
						SendChatMessage(GetSpellLink(spellID).." -> "..destName, T.CheckChat())
					end
				end
			end
		end
	end
end)
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

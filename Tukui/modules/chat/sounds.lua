local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
if C["chat"].enable ~= true then return end

------------------------------------------------------------------------
--	Play sound files system
------------------------------------------------------------------------

if C.chat.whispersound then
	local SoundSys = CreateFrame("Frame")
	SoundSys:RegisterEvent("CHAT_MSG_WHISPER")
	SoundSys:RegisterEvent("CHAT_MSG_BN_WHISPER")
	SoundSys:HookScript("OnEvent", function(self, event, ...)
		if event == "CHAT_MSG_WHISPER" or "CHAT_MSG_BN_WHISPER" then
			PlaySoundFile(C["media"].whisper)
		end
	end)
end

--------------------------------------------------------------------------------
--	Play sound when your name is called in chat -- credit Hydra
--------------------------------------------------------------------------------

local chatFind = CreateFrame("Frame")
chatFind:RegisterEvent("CHAT_MSG_GUILD")
chatFind:RegisterEvent("CHAT_MSG_BATTLEGROUND")
chatFind:RegisterEvent("CHAT_MSG_BATTLEGROUND_LEADER")
chatFind:RegisterEvent("CHAT_MSG_OFFICER")
chatFind:RegisterEvent("CHAT_MSG_PARTY")
chatFind:RegisterEvent("CHAT_MSG_PARTY_LEADER")
chatFind:RegisterEvent("CHAT_MSG_RAID")
chatFind:RegisterEvent("CHAT_MSG_RAID_LEADER")
chatFind:RegisterEvent("CHAT_MSG_BN_WHISPER")
chatFind:RegisterEvent("CHAT_MSG_WHISPER")
chatFind:RegisterEvent("CHAT_MSG_SAY")

chatFind:SetScript("OnEvent", function(event, msg, sender)
	sender = strlower(sender)

	for _, v in pairs(C["chat"].names) do
		if strfind(sender, strlower(UnitName("player"))) or strfind(sender, strlower(v)) then
			PlaySoundFile("Sound\\Event Sounds\\Wisp\\WispPissed1.wav")
			return
		end
	end
end)
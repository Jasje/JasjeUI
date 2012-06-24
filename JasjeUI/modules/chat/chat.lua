local T, C, L = unpack(Tukui)

local function chatsetup()
	-- setting chat frames if using Tukui chats.					
	FCF_ResetChatWindows()
	FCF_SetLocked(ChatFrame1, 1)
	FCF_DockFrame(ChatFrame2)
	FCF_SetLocked(ChatFrame2, 1)
	FCF_OpenNewWindow(L.chat_general)
	FCF_SetLocked(ChatFrame3, 1)
	FCF_DockFrame(ChatFrame3)

	FCF_OpenNewWindow(LOOT)
	FCF_UnDockFrame(ChatFrame4)
	FCF_SetLocked(ChatFrame4, 1)
	ChatFrame4:Show()

	for i = 1, NUM_CHAT_WINDOWS do
		local frame = _G[format("ChatFrame%s", i)]
		local chatFrameId = frame:GetID()
		local chatName = FCF_GetChatWindowInfo(chatFrameId)

		-- set default tukui font size
		FCF_SetChatWindowFontSize(nil, frame, 12)
		
		-- save new default position and dimension
		FCF_SavePositionAndDimensions(frame)
		
		-- rename windows general and combat log
		if i == 1 then FCF_SetWindowName(frame, "G, S & W") end
		if i == 2 then FCF_SetWindowName(frame, "Log") end
	end
	
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_trade) -- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_general) -- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_defense) -- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_recrutment) -- erf, it seem we need to localize this now
	ChatFrame_RemoveChannel(ChatFrame1, L.chat_lfg) -- erf, it seem we need to localize this now
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND")
	ChatFrame_AddMessageGroup(ChatFrame1, "BATTLEGROUND_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
	
	-- Setup the spam chat frame
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame3, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame3, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame3, "MONEY")
	
	-- Setup the right chat
	ChatFrame_RemoveAllMessageGroups(ChatFrame4)
	ChatFrame_AddChannel(ChatFrame4, L.chat_trade) -- erf, it seem we need to localize this now
	ChatFrame_AddChannel(ChatFrame4, L.chat_general) -- erf, it seem we need to localize this now
	ChatFrame_AddChannel(ChatFrame4, L.chat_defense) -- erf, it seem we need to localize this now
	ChatFrame_AddChannel(ChatFrame4, L.chat_recrutment) -- erf, it seem we need to localize this now
	ChatFrame_AddChannel(ChatFrame4, L.chat_lfg) -- erf, it seem we need to localize this now
	ChatFrame_AddMessageGroup(ChatFrame4, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame4, "SKILL")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_GUILD_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame4, "COMBAT_FACTION_CHANGE")

	-- enable classcolor automatically on login and on each character without doing /configure each time.
	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")	
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
end

local function SetTabStyle(frame)
	local id = frame:GetID()
	local chat = frame:GetName()
	local tab = _G[chat.."Tab"]

	_G[chat.."TabText"]:SetTextColor(unpack(C.media.datatextcolor1))
	_G[chat.."TabText"]:SetFont(T.SetPixelFont())
	_G[chat.."TabText"].SetTextColor = T.dummy
	
	_G[chat.."Tab"].glow:ClearAllPoints()
	_G[chat.."Tab"].glow:Point("CENTER", _G[chat.."TabText"], 0, 10)
	_G[chat.."Tab"].glow:Width(_G[chat.."TabText"]:GetWidth() + 40)
	_G[chat.."Tab"].glow:Height(30)
end

TukuiChat:HookScript( "OnEvent", function( self, event, ... )
	for i = 1, NUM_CHAT_WINDOWS do
		local chat = _G[format( "ChatFrame%s", i )]
		SetTabStyle( chat )
	end
end )

-- play a sound when your name is called in chat
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
			PlaySoundFile("Sound\\Event Sounds\\Wisp\\WispPissed1.wav", 'MASTER')
			return
		end
	end
end)

-- highlight words/names in chat by Hydra
local pairs = pairs
local string = string
local gsub = string.gsub
local strsub = string.sub
local strfind = string.find
local format = string.format
local strlower = string.lower

local Wrapper = "|cff%s[%s]|r"
local WordList = {
	["jasje"] = "D38D01",
	["jas"] = "D38D01",
	["tom"] = "D38D01",
	["difrnc"] = "D38D01",
	["diffrnc"] = "D38D01",
}

-- Finding the word in a URL breaks the hyperlink, so check & exclude them
local FindURL = function(msg)
	local String, Found = gsub(msg, "(%a+)://(%S+)%s?", "%1://%2")
	if Found > 0 then return String end

	String, Found = gsub(msg, "www%.([_A-Za-z0-9-]+)%.(%S+)%s?", "www.%1.%2")
	if Found > 0 then return String end

	String, Found = gsub(msg, "([_A-Za-z0-9-%.]+)@([_A-Za-z0-9-]+)(%.+)([_A-Za-z0-9-%.]+)%s?", "%1@%2%3%4")
	if Found > 0 then return String end
end

local WordFilter = function(self, event, message, author, ...)
	local msg = strlower(message)

	for key, value in pairs(WordList) do
		if strfind(msg, key) then
			local Word = strsub(message, strfind(msg, key))
			local Link = FindURL(message)

			if (not Link) or (Link and not strfind(Link, Word)) then
				return false, gsub(message, Word, format(Wrapper, value, Word)), author, ...
			end
		end
	end
end

ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_GUILD", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BATTLEGROUND_LEADER", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_OFFICER", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY_LEADER", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_RAID_LEADER", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_BN_WHISPER", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_WHISPER", WordFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", WordFilter)
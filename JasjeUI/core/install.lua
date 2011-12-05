local T, C, L = unpack(Tukui)

T.release = GetAddOnMetadata("JasjeUI", "Version")

T.ChatSetup = function()
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
end

local function JasjeCVar()
	SetCVar("autoLootDefault", 1) 
end
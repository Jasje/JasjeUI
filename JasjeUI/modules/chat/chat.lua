local T, C, L = unpack(Tukui)

local function Skin(frame)
	local chat = frame:GetName()
	local tab = _G[chat.."Tab"]

	-- recolor the tab
	local classcolortab = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2,UnitClass("player"))]
	Ctabcolor = C.chat.tabcolor
	if C.chat.classcolortab == true then
		Ctabcolor = {classcolortab.r,classcolortab.g,classcolortab.b,1}
	end
	hooksecurefunc("FCFTab_UpdateColors", function(chatTab, isSelected) 
		chatTab:GetFontString():SetTextColor(unpack(Ctabcolor))
		if ( chatTab.conversationIcon ) then
			chatTab.conversationIcon:SetVertexColor(1, 1, 1)
		end
		if isSelected then 
			FCFTab_UpdateColors(chatTab, false) 
		end
	end)

	for i = 1, NUM_CHAT_WINDOWS do
		if i == 4 then
			tab:GetFontString():SetTextColor(unpack(Ctabcolor))
		end
	end

	frame.isJasjeSkinned = true

	_G[chat.."TabText"]:SetFont(C.chat.font, C.chat.fontsize, C.chat.fontflag)
	
	_G[chat.."Tab"].glow:ClearAllPoints()
	_G[chat.."Tab"].glow:Point("CENTER", _G[chat.."TabText"], 0, 10)
	_G[chat.."Tab"].glow:Width(_G[chat.."TabText"]:GetWidth() + 40)
	_G[chat.."Tab"].glow:Height(30)
end

TukuiChat:HookScript("OnEvent", function(self, event, addon)
	if addon == "Blizzard_CombatLog" then
		for i = 1, NUM_CHAT_WINDOWS do
			local frame = _G[format("ChatFrame%s", i)]
			Skin(frame)
		end
	end
end)

local function SkinTempChat()
	local frame = FCF_GetCurrentChatFrame()

	-- do a check if we already did a skinning earlier for this temp chat frame
	if frame.isJasjeSkinned then return end

	SkinAndPosition(frame)
end
local C, F = unpack(select(2, ...))

-- Locals
local dockedWindows = {}
local checkMessage = CreateFrame("Frame")
local checkStatus = CreateFrame("Frame")
local numlines = 2
local BNet_GetPresenceID = BNet_GetPresenceID
local AddMessage = AddMessage
local ActiveChatBox
local movable = false
local _G = _G
local ipairs = ipairs
local table = table
local type = type
local gsub = gsub
local strfind = strfind

F.ActiveChatBox = ActiveChatBox
F.chats = {}

-- Redo left-click on player
ChatFrame_SendTell = function(name, chatFrame)
	if (chatFrame) and (strfind(chatFrame:GetName(), "HydraChat_")) then
		--ActiveChatBox:SetAutoFocus(true)
	else
		local editBox = ChatEdit_ChooseBoxForSend(chatFrame)
		
		if ( editBox ~= ChatEdit_GetActiveWindow() ) then
			ChatFrame_OpenChat(SLASH_WHISPER1.." "..name.." ", chatFrame)
		else
			editBox:SetText(SLASH_WHISPER1.." "..name.." ")
		end
		ChatEdit_ParseText(editBox, 0)
	end
end

local UpdateDockedWindows = function()
	for key, chat in ipairs(dockedWindows) do
		local pos = select(1, HydraChatDock:GetPoint())
		chat:ClearAllPoints()

		if (pos:match("LEFT")) or (pos:match("TOPLEFT")) or (pos:match("BOTTOMLEFT")) then
			chat.title:ClearAllPoints()
			chat.title:SetPoint("BOTTOMLEFT", chat, "TOPLEFT", 0, F.Scale(1))
			if key == 1 then
				chat:SetPoint("BOTTOMLEFT", HydraChatDock, "BOTTOMRIGHT", F.Scale(3), 0)
			else
				chat:SetPoint("BOTTOM", dockedWindows[key-1], "TOP", 0, F.Scale(13))
			end
		end
		
		if (pos:match("RIGHT")) or (pos:match("TOPRIGHT")) or (pos:match("BOTTOMRIGHT")) then
			chat.title:ClearAllPoints()
			chat.title:SetPoint("BOTTOMRIGHT", chat, "TOPRIGHT", 0, F.Scale(1))
			if key == 1 then
				chat:SetPoint("BOTTOMRIGHT", HydraChatDock, "BOTTOMLEFT", F.Scale(-3), 0)
			else
				chat:SetPoint("BOTTOM", dockedWindows[key-1], "TOP", 0, F.Scale(13))
			end
		end
	end
end

local StartFlash = function(self, duration)
	if not self.anim then
		self.anim = self:CreateAnimationGroup("Flash")
		
		self.anim.fadein = self.anim:CreateAnimation("ALPHA", "FadeIn")
		self.anim.fadein:SetChange(1)
		self.anim.fadein:SetOrder(2)

		self.anim.fadeout = self.anim:CreateAnimation("ALPHA", "FadeOut")
		self.anim.fadeout:SetChange(-1)
		self.anim.fadeout:SetOrder(1)
	end

	self.anim.fadein:SetDuration(duration)
	self.anim.fadeout:SetDuration(duration)
	self.anim:Play()
end

local StopFlash = function(self)
	if self.anim then
		self.anim:Finish()
	end
end

F.SetMinimized = function(self)	
	self:Size(F.Scale(4), F.Scale(1))
	self:SetAlpha(0)
	self.title:Show()
	self.title:SetAlpha(1)
	self.hideBG:Hide()
	self.miniBG:SetAlpha(0)
	self.miniBG:SetAllPoints(self.title)
	self.Editbox:Hide()
	
	local point, relativeTo, relativePoint, xOfs, yOfs = self:GetPoint()
	self.point = {point, relativeTo, relativePoint, xOfs, yOfs}
	self.minimized = true
	
	table.insert(dockedWindows, self)
	
	UpdateDockedWindows()
end

F.SetMaximized = function(self)
	self.flash:SetScript("OnUpdate", nil)
	StopFlash(self.title)

	self:Size(F.Scale(C["ChatWindows"].Width), F.Scale(C["ChatWindows"].Height))
	self:SetAlpha(1)
	self.hideBG:Show()
	self.miniBG:SetAlpha(1)
	self.miniBG:ClearAllPoints()
	self.miniBG:Size(F.Scale(14), F.Scale(14))
	self.miniBG:SetPoint("BOTTOMRIGHT", self.hideBG, "BOTTOMLEFT", F.Scale(-3), 0)
	self.miniBG:SetPoint("CENTER", F.Scale(1), F.Scale(2))
	self.Editbox:Show()
	self.title:ClearAllPoints()
	self.title:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 0, F.Scale(1))
	
	if not C["ChatWindows"].ShowTitle then
		self.title:SetAlpha(0)
	end
	
	self.minimized = false
	
	for i, v in ipairs(dockedWindows) do
		if v:GetName() == self:GetName() then
			table.remove(dockedWindows, i)
		end
	end

	UpdateDockedWindows()
	
	self:ClearAllPoints()
	self:SetPoint(unpack(self.point))
end

local OnMouseWheel = function(self, delta) -- Blizzard/Tukui credit
	if delta < 0 then
		if IsShiftKeyDown() then
			self.text:ScrollToBottom()
		else
			for i = 1, numlines do
				self.text:ScrollDown()
			end
		end
	elseif delta > 0 then
		if IsShiftKeyDown() then
			self.text:ScrollToTop()
		else
			for i = 1, numlines do
				self.text:ScrollUp()
			end
		end
	end
end

local OnEnter = function(self)
	if (not C["ChatWindows"].AutoFade) then 
		if (self.faded and self:GetAlpha() ~= 1) then
			UIFrameFadeIn(self, 0.4, 0.4, 1)
		else
			self:SetAlpha(1)
		end
	else
		if (self.faded and self:GetAlpha() ~= 1) then
			UIFrameFadeIn(self, 0.4, 0.4, 1)
		end
	end
	
	self.faded = false
end

local OnLeave = function(self)
	if (not C["ChatWindows"].AutoFade) then return end

	if not self.faded then
		F.Delay(3, function()
			UIFrameFadeIn(self, 0.4, 1, 0.4)
			self.faded = true
		end)
	end
end

local OnEnterPressed = function(self, chatType, sendTo) -- Add messages to the frame
	local str = self:GetText()
	local frame = _G["HydraChat_"..sendTo.."Text"]
	self:ClearFocus()
	self:SetAutoFocus(false)

	if str == "" or str == " " then return end

	if chatType == "WHISPER" then -- Whisper
		SendChatMessage(str, "WHISPER", nil, sendTo)
		self:SetText("")
		return
	elseif chatType == "BN_WHISPER" then -- BNet
		local id = BNet_GetPresenceID(sendTo)
		
		if id then
			BNSendWhisper(id, str)
			self:SetText("")
			return
		end
	end
end

local AddIncoming = function(self, event, msg, sender, guid) -- Add messages to the frame
	local frame = _G["HydraChat_"..sender.."Text"]
	local chat = _G["HydraChat_"..sender]
	if (not frame) or (strfind(msg, "<DBM>")) then return end -- Blocking dumb DBM messages
	
	local color, str

	if event == "CHAT_MSG_BN_WHISPER" or event == "CHAT_MSG_BN_WHISPER_INFORM" then
		color = ChatTypeInfo["BN_WHISPER"]
	elseif event == "CHAT_MSG_WHISPER" or event == "CHAT_MSG_WHISPER_INFORM" then
		color = ChatTypeInfo["WHISPER"]
	end
	
	if event == "CHAT_MSG_WHISPER_INFORM" then -- Whisper
		str = "To |Hplayer:"..sender.."|h["..chat.hex..sender.."|r]|h"..": "..msg
	elseif event == "CHAT_MSG_WHISPER" then
		str = "From |Hplayer:"..sender.."|h["..chat.hex..sender.."|r]|h"..": "..msg
	elseif event == "CHAT_MSG_BN_WHISPER_INFORM" then -- BNet
		str = "To ["..sender.."]: "..msg
	else
		str = "From ["..sender.."]: "..msg
	end
	
	if chat.minimized then
		chat.flash:SetScript("OnUpdate", function()
			StartFlash(chat.title, 0.6)
		end)
	end
	
	--Hook all the AddMessage funcs
	local addmessage = frame.AddMessage
	frame.AddMessage = function(self, text, ...) addmessage(self, F.AddLinkSyntax(text), ...) end
	
	frame:AddMessage(str, color.r, color.g, color.b, nil, false)
end

local AddStatus = function(self, event, toast, author) -- Add messages to the frame
	local frame = _G["HydraChat_"..author.."Text"]
	if not frame then return end

	local status
	
	if toast == "FRIEND_ONLINE" then
		status = format(ERR_FRIEND_ONLINE_SS, author, author)
	else
		status = format(ERR_FRIEND_OFFLINE_S, "["..author.."]")
	end
	
	frame:AddMessage(status, ChatTypeInfo["BN_WHISPER"].r, ChatTypeInfo["BN_WHISPER"].g, ChatTypeInfo["BN_WHISPER"].b, nil, false)
end

local InitNewFrame = function(self, event, msg, sender, guid) -- Create the new frame
	if _G["HydraChat_"..sender] then return end
	
	local sendTo = sender
	local chatType
	
	if (event == "CHAT_MSG_BN_WHISPER" or event == "CHAT_MSG_BN_WHISPER_INFORM") then
		chatType = "BN_WHISPER"
		
		local chatColor = ChatTypeInfo[chatType]
		hex = string.format("|c%02x%02x%02x%02x", 255, chatColor.r * 255, chatColor.g * 255, chatColor.b * 255)
	elseif (event == "CHAT_MSG_WHISPER" or event == "CHAT_MSG_WHISPER_INFORM") then
		chatType = "WHISPER"
		
		local locClass, engClass, locRace, engRace, gender = GetPlayerInfoByGUID(guid)
	
		if engClass then
			local classColor = RAID_CLASS_COLORS[engClass]
			hex = string.format("|c%02x%02x%02x%02x", 255, classColor.r * 255, classColor.g * 255, classColor.b * 255)
		end
	end

	local Chatbox = CreateFrame("Frame", "HydraChat_"..sender, UIParent)
	F.CreatePanel(Chatbox, C["ChatWindows"].Width, C["ChatWindows"].Height, "CENTER", UIParent, "CENTER", -400, -200)
	Chatbox:EnableMouse(true)
	Chatbox:SetMovable(true)
	Chatbox:RegisterForDrag("LeftButton")
	Chatbox:EnableMouseWheel(true)
	Chatbox:SetScript("OnMouseWheel", OnMouseWheel)
	Chatbox:SetScript("OnDragStart", function(self) self:SetUserPlaced(true) self:StartMoving() end)
	Chatbox:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	Chatbox:SetScript("OnEnter", OnEnter)
	Chatbox:SetScript("OnLeave", OnLeave)
	Chatbox:SetClampedToScreen(true)
	F.SetBorder(Chatbox)
	
	Chatbox.sender = sendTo
	Chatbox.hex = hex
	Chatbox.flash = CreateFrame("Frame")

	Chatbox.title = UIParent:CreateFontString("HydraChat_"..sender.."Title", "OVERLAY")
	Chatbox.title:SetFont(C.pixelfont, 8, "OUTLINEMONOCHROME")
	Chatbox.title:SetPoint("BOTTOMLEFT", Chatbox, "TOPLEFT", 0, F.Scale(2))
	Chatbox.title:SetText(hex..sender.."|r")
	
	Chatbox.text = CreateFrame("ScrollingMessageFrame", "HydraChat_"..sender.."Text", Chatbox)
	Chatbox.text:SetFont(C.font, C["ChatWindows"].FontSize)
	Chatbox.text:SetShadowColor(0, 0, 0)
	Chatbox.text:SetShadowOffset(1.25, -1.25)
	Chatbox.text:SetPoint("TOPLEFT", F.Scale(2), F.Scale(-2))
	Chatbox.text:SetPoint("BOTTOMRIGHT", F.Scale(-2), F.Scale(2))
	Chatbox.text:SetJustifyH("LEFT")
	Chatbox.text:SetFading(false)
	Chatbox.text:SetMaxLines(60)
	Chatbox.text:SetHyperlinksEnabled(true)
	Chatbox.text:SetScript("OnHyperlinkEnter", MessageWindow_Hyperlink_OnEnter)
	Chatbox.text:SetScript("OnHyperlinkLeave", MessageWindow_Hyperlink_OnLeave)
	Chatbox.text:SetScript("OnHyperlinkClick", function(self, link, text, button)
		F.ActiveChatBox = _G["HydraChat_"..sender.."EditBox"]
		F.URLSetItemRef(link, text, button, self)
	end)

	Chatbox.Editbox = CreateFrame("Frame", "HydraChat_"..sender.."Edit", Chatbox)
	F.CreatePanel(Chatbox.Editbox, Chatbox:GetWidth(), 20, "TOP", Chatbox, "BOTTOM", 0, -3)
	Chatbox.Editbox:EnableMouse(true)

	Chatbox.edit = CreateFrame("EditBox", "HydraChat_"..sender.."EditBox", Chatbox.Editbox)
	Chatbox.edit:SetFont(C.font, 12)
	Chatbox.edit:SetPoint("TOPLEFT", F.Scale(4), F.Scale(-2))
	Chatbox.edit:SetPoint("BOTTOMRIGHT", F.Scale(-4), F.Scale(2))
	Chatbox.edit:SetMaxLetters(200)
	Chatbox.edit:SetAutoFocus(false)
	Chatbox.edit:EnableKeyboard(true)
	Chatbox.edit:EnableMouse(true)
	Chatbox.edit:SetScript("OnEditFocusGained", function(self) ActiveChatBox = _G[self:GetName()] end)
	Chatbox.edit:SetScript("OnMouseDown", function(self) self:SetAutoFocus(true) end)
	Chatbox.edit:SetScript("OnEscapePressed", function(self) self:SetAutoFocus(false) self:ClearFocus() end)
	Chatbox.edit:SetScript("OnEnterPressed", function(self)
		OnEnterPressed(self, chatType, sendTo)
	end)
	
	Chatbox.hideBG = CreateFrame("Frame", nil, Chatbox)
	F.CreatePanel(Chatbox.hideBG, 15, 15, "TOPRIGHT", Chatbox, "TOPRIGHT", -4, -4)
	Chatbox.hideBG:EnableMouse(true)
	Chatbox.hideBG:SetFrameStrata("HIGH")
	Chatbox.hideBG:SetScript("OnMouseDown", function()
		for i, v in ipairs(F.chats) do
			if v:GetName() == _G["HydraChat_"..sender]:GetName() then
				table.remove(F.chats, i)
			end
		end
	
		F.Kill(Chatbox.title)
		F.Kill(_G["HydraChat_"..sender])
		F.Kill(_G["HydraChat_"..sender.."Text"])
		_G["HydraChat_"..sender] = nil
		_G["HydraChat_"..sender.."Text"] = nil
	end)
	
	Chatbox.hideBG:SetScript("OnEnter", function() Chatbox.close:SetTextColor(1,0,0) end)
	Chatbox.hideBG:SetScript("OnLeave", function() Chatbox.close:SetTextColor(1,1,1) end)
	
	Chatbox.close = Chatbox.hideBG:CreateFontString(nil, "OVERLAY")
	Chatbox.close:SetFont(C.font, 12, "THINOUTLINE")
	Chatbox.close:SetPoint("CENTER", 2, F.Scale(-1))
	Chatbox.close:SetText("X")
	
	Chatbox.miniBG = CreateFrame("Frame", nil, Chatbox)
	F.CreatePanel(Chatbox.miniBG, 15, 15, "RIGHT", Chatbox.hideBG, "LEFT", -2, 0)
	Chatbox.miniBG:EnableMouse(true)
	Chatbox.miniBG:SetFrameStrata("HIGH")
	Chatbox.miniBG:SetScript("OnMouseDown", function()
		if not Chatbox.minimized then
			F.SetMinimized(Chatbox)
		else
			F.SetMaximized(Chatbox)
		end
	end)
	
	Chatbox.miniBG:SetScript("OnEnter", function() Chatbox.mini:SetTextColor(0,0.8,1) end)
	Chatbox.miniBG:SetScript("OnLeave", function() Chatbox.mini:SetTextColor(1,1,1) end)
	
	Chatbox.mini = Chatbox.miniBG:CreateFontString(nil, "OVERLAY")
	Chatbox.mini:SetFont(C.font, 12, "THINOUTLINE")
	Chatbox.mini:SetPoint("CENTER", F.Scale(1), F.Scale(2))
	Chatbox.mini:SetText("_")
	
	if (InCombatLockdown()) or (C["ChatWindows"].AutoHide) then -- Auto minimize incoming msg if in combat
		F.SetMinimized(Chatbox)
	end
	
	tinsert(F.chats, Chatbox)
end

-- Check for new whispers
checkMessage:RegisterEvent("CHAT_MSG_BN_WHISPER")
checkMessage:RegisterEvent("CHAT_MSG_BN_WHISPER_INFORM")
checkMessage:RegisterEvent("CHAT_MSG_WHISPER")
checkMessage:RegisterEvent("CHAT_MSG_WHISPER_INFORM")
checkMessage:SetScript("OnEvent", function(self, event, ...)
	local msg, sender, _, _, _, _, _, _, _, _, _, guid = ...

	InitNewFrame(self, event, msg, sender, guid)
	AddIncoming(self, event, msg, sender, guid)
end)

-- When a player goes online/offline
checkStatus:RegisterEvent("CHAT_MSG_BN_INLINE_TOAST_ALERT")
checkStatus:SetScript("OnEvent", AddStatus)

-- Remove whispers from chat frame
local removeWhispers = function()
	SetCVar("chatStyle", "im")
	SetCVar("ConversationMode", "inline")
	
	for i = 1, 4 do -- Make sure whispers don't exist in chatframe 1-4
		local frame = _G[format("ChatFrame%s", i)]
		ChatFrame_RemoveMessageGroup(frame, "WHISPER")
		ChatFrame_RemoveMessageGroup(frame, "BN_WHISPER")
	end
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
end

local killWhispers = CreateFrame("Frame")
killWhispers:RegisterEvent("PLAYER_ENTERING_WORLD")
killWhispers:SetScript("OnEvent", removeWhispers)

local chatDock = CreateFrame("Frame", "HydraChatDock", UIParent)
F.CreatePanel(chatDock, 8, 160, "LEFT", UIParent, "LEFT", 0, 0)
chatDock:SetAlpha(0)
chatDock:SetMovable(true)
chatDock:EnableMouse(true)
chatDock:SetClampedToScreen(true)

local enable = true
local origa1, origf, origa2, origx, origy

local MoveChatDock = function()
	if HydraChatDock then
		if enable then	
			HydraChatDock:EnableMouse(true)
			HydraChatDock:SetAlpha(1)
			HydraChatDock:RegisterForDrag("LeftButton", "RightButton")
			HydraChatDock:SetScript("OnDragStart", function(self)
				origa1, origf, origa2, origx, origy = HydraChatDock:GetPoint()
				self.moving = true
				self:SetUserPlaced(true)
				self:StartMoving()
			end)
			HydraChatDock:SetScript("OnDragStop", function(self)
				self.moving = false
				self:StopMovingOrSizing()
				UpdateDockedWindows()
			end)		
		else
			HydraChatDock:SetAlpha(0)
			HydraChatDock:EnableMouse(false)
			if HydraChatDock.moving == true then
				HydraChatDock:StopMovingOrSizing()
				HydraChatDock:ClearAllPoints()
				HydraChatDock:SetPoint(origa1, origf, origa2, origx, origy)
			end
			HydraChatDock.moving = false
		end
	end

	if enable then enable = false else enable = true end
end

SLASH_HYDRAMOVE1 = "/hcmove"
SlashCmdList["HYDRAMOVE"] = MoveChatDock
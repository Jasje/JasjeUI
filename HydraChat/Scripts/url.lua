local C, F = unpack(select(2, ...))

-- Tukui Credit below
local strfind = strfind
local gsub = gsub
local strsub = strsub

local urlColor = "00AAFF"
local urlBrackets = false
local urlCustomColor = true
local SetItemRef_orig = SetItemRef

F.URLSetItemRef = function(link, text, button, chatFrame)
	if (strsub(link, 1, 3) == "url") then
		local ChatFrameEditBox = F.ActiveChatBox or _G["ChatFrame1EditBox"]
		local url = strsub(link, 5)
		if (not ChatFrameEditBox:IsShown()) then
			ChatEdit_ActivateChat(ChatFrameEditBox)
		end
		ChatFrameEditBox:Insert(url)
		ChatFrameEditBox:HighlightText()

	else
		SetItemRef_orig(link, text, button, chatFrame)
	end
end

F.URL_Link = function(url)
	if (urlCustomColor) then
		if (urlBrackets) then
			url = " |cff"..urlColor.."|Hurl:"..url.."|h["..url.."]|h|r "
		else
			url = " |cff"..urlColor.."|Hurl:"..url.."|h"..url.."|h|r "
		end
	else
		if (urlBrackets) then
			url = " |Hurl:"..url.."|h["..url.."]|h "
		else
			url = " |Hurl:"..url.."|h"..url.."|h "
		end
	end
	
	return url
end

F.AddLinkSyntax = function(chatstring)
	if (type(chatstring) == "string") then
		local extraspace
		
		if (not strfind(chatstring, "^ ")) then
			extraspace = true
			chatstring = " "..chatstring
		end
		
		chatstring = gsub(chatstring, " www%.([_A-Za-z0-9-]+)%.(%S+)%s?", F.URL_Link("www.%1.%2"))
		chatstring = gsub(chatstring, " (%a+)://(%S+)%s?", F.URL_Link("%1://%2"))
		chatstring = gsub(chatstring, " ([_A-Za-z0-9-%.]+)@([_A-Za-z0-9-]+)(%.+)([_A-Za-z0-9-%.]+)%s?", F.URL_Link("%1@%2%3%4"))
		chatstring = gsub(chatstring, " (%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?):(%d%d?%d?%d?%d?)%s?", F.URL_Link("%1.%2.%3.%4:%5"))
		chatstring = gsub(chatstring, " (%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%.(%d%d?%d?)%s?", F.URL_Link("%1.%2.%3.%4"))
		
		if (extraspace) then
			chatstring = strsub(chatstring, 2)
		end
	end
	
	return chatstring
end
local T, C, L = unpack(Tukui)

local hexa = T.StatColor
local hexb = T.StatColorEnd
-- zonetext
ZoneTextString:SetFont(C.media.pixelfont, 15, "MONOCHROMEOUTLINE")
SubZoneTextString:SetFont(C.media.pixelfont, 12, "MONOCHROMEOUTLINE")
PVPInfoTextString:SetFont(C.media.pixelfont, 10, "MONOCHROMETHINOUTLINE")
PVPArenaTextString:SetFont(C.media.pixelfont, 10, "MONOCHROMEOUTLINE")

RaidWarningFrame:ClearAllPoints() 
RaidWarningFrame:SetPoint("CENTER", UIParent, "CENTER",0, 290)

-- mis clicks
StaticPopupDialogs.RESURRECT.hideOnEscape = nil
StaticPopupDialogs.PARTY_INVITE.hideOnEscape = nil
StaticPopupDialogs.PARTY_INVITE_XREALM.hideOnEscape = nil
StaticPopupDialogs.CONFIRM_SUMMON.hideOnEscape = nil
StaticPopupDialogs.PET_BATTLE_QUEUE_PROPOSE_MATCH.hideOnEscape = nil
StaticPopupDialogs.CONFIRM_BATTLEFIELD_ENTRY.button2 = nil
StaticPopupDialogs.ADDON_ACTION_FORBIDDEN.button1 = nil
StaticPopupDialogs.TOO_MANY_LUA_ERRORS.button1 = nil

----------------------------------------------------------------------------------------
--	Force readycheck warning
----------------------------------------------------------------------------------------
local ShowReadyCheckHook = function(self, initiator, timeLeft)
	if initiator ~= "player" then
		PlaySound("LEVELUPSOUND", "master")
	end
end
hooksecurefunc("ShowReadyCheck", ShowReadyCheckHook)

----------------------------------------------------------------------------------------
--	Force other warning
----------------------------------------------------------------------------------------
local ForceWarning = CreateFrame("Frame")
ForceWarning:RegisterEvent("UPDATE_BATTLEFIELD_STATUS")
ForceWarning:RegisterEvent("LFG_PROPOSAL_SHOW")
ForceWarning:RegisterEvent("PARTY_INVITE_REQUEST")
ForceWarning:SetScript("OnEvent", function(self, event)
	if event == "UPDATE_BATTLEFIELD_STATUS" and StaticPopup_Visible("CONFIRM_BATTLEFIELD_ENTRY") then
		PlaySound("LEVELUPSOUND", "master")
	elseif event == "LFG_PROPOSAL_SHOW" or event == "PARTY_INVITE_REQUEST" then
		PlaySound("LEVELUPSOUND", "master")
	end
end)

----------------------------------------------------------------------------------------
-- WorldStateAlwaysUpFrame font
----------------------------------------------------------------------------------------
local UpdateWorldFrame = function()
	for i = 1, GetNumWorldStateUI() do
		local Name = "AlwaysUpFrame" .. i
		local Hidden = select(3, GetWorldStateUIInfo(i))
		
		if _G[Name] and not (Hidden or _G[Name].TextSet) then
			local Frame = _G[Name]
			local Text = _G[Name .. "Text"]
			Text:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE") 
			
			Frame.TextSet = true
		end
	end
end

local WorldFrameFont = CreateFrame("Frame")
WorldFrameFont:RegisterEvent("PLAYER_ENTERING_WORLD")
WorldFrameFont:RegisterEvent("ZONE_CHANGED")
WorldFrameFont:SetScript("OnEvent", UpdateWorldFrame)

-------------------------------------------------------------------------------------
-- Credit Alleykat 
-- Entering combat and allertrun function (can be used in anther ways)
------------------------------------------------------------------------------------
local speed = .057799924 -- how fast the text appears
local font = C.media.pixelfont -- HOOG0555.ttf 
local fontflag = "OUTLINEMONOCHROME" -- for pixelfont stick to this else OUTLINE or THINOUTLINE
local fontsize = 16 -- font size
 
local GetNextChar = function(word,num)
	local c = word:byte(num)
	local shift
	if not c then return "",num end
		if (c > 0 and c <= 127) then
			shift = 1
		elseif (c >= 192 and c <= 223) then
			shift = 2
		elseif (c >= 224 and c <= 239) then
			shift = 3
		elseif (c >= 240 and c <= 247) then
			shift = 4
		end
	return word:sub(num,num+shift-1),(num+shift)
end
 
local updaterun = CreateFrame("Frame")
 
local flowingframe = CreateFrame("Frame",nil,UIParent)
	flowingframe:SetFrameStrata("HIGH")
	flowingframe:SetPoint("CENTER",UIParent,0, 170) -- where we want the textframe
	flowingframe:SetHeight(64)
 
local flowingtext = flowingframe:CreateFontString(nil,"OVERLAY")
	flowingtext:SetFont(font,fontsize, fontflag)
	flowingtext:SetShadowOffset(1,-1)
 
local rightchar = flowingframe:CreateFontString(nil,"OVERLAY")
	rightchar:SetFont(font,60, fontflag)
	rightchar:SetShadowOffset(1,-1)
	rightchar:SetJustifyH("LEFT") -- left or right
 
local count,len,step,word,stringE,a,backstep
 
local nextstep = function()
	a,step = GetNextChar (word,step)
	flowingtext:SetText(stringE)
	stringE = stringE..a
	a = string.upper(a)
	rightchar:SetText(a)
end
 
local backrun = CreateFrame("Frame")
backrun:Hide()
 
local updatestring = function(self,t)
	count = count - t
		if count < 0 then
			count = speed
			if step > len then
				self:Hide()
				flowingtext:SetText(stringE)
				rightchar:SetText()
				flowingtext:ClearAllPoints()
				flowingtext:SetPoint("RIGHT")
				flowingtext:SetJustifyH("RIGHT")
				rightchar:ClearAllPoints()
				rightchar:SetPoint("RIGHT",flowingtext,"LEFT")
				rightchar:SetJustifyH("RIGHT")
				self:Hide()
				count = 1.456789
				backrun:Show()
			else
				nextstep()
			end
		end
end
 
updaterun:SetScript("OnUpdate",updatestring)
updaterun:Hide()
 
local backstepf = function()
	local a = backstep
	local firstchar
		local texttemp = ""
		local flagon = true
		while a <= len do
			local u
			u,a = GetNextChar(word,a)
			if flagon == true then
				backstep = a
				flagon = false
				firstchar = u
			else
				texttemp = texttemp..u
			end
		end
	flowingtext:SetText(texttemp)
	firstchar = string.upper(firstchar)
	rightchar:SetText(firstchar)
end
 
local rollback = function(self,t)
	count = count - t
		if count < 0 then
			count = speed
			if backstep > len then
				self:Hide()
				flowingtext:SetText()
				rightchar:SetText()
			else
				backstepf()
			end
		end
end
 
backrun:SetScript("OnUpdate",rollback)
 
local allertrun = function(f,r,g,b)
	flowingframe:Hide()
	updaterun:Hide()
	backrun:Hide()
 
	flowingtext:SetText(f)
	local l = flowingtext:GetWidth()
 
	local color1 = r or 1
	local color2 = g or 1
	local color3 = b or 1
 
	flowingtext:SetTextColor(color1*.95,color2*.95,color3*.95) -- color in RGB(red green blue)(alpha)
	rightchar:SetTextColor(color1,color2,color3)
 
	word = f
	len = f:len()
	step,backstep = 1,1
	count = speed
	stringE = ""
	a = ""
 
	flowingtext:SetText("")
	flowingframe:SetWidth(l)
	flowingtext:ClearAllPoints()
	flowingtext:SetPoint("LEFT")
	flowingtext:SetJustifyH("LEFT")
	rightchar:ClearAllPoints()
	rightchar:SetPoint("LEFT",flowingtext,"RIGHT")
	rightchar:SetJustifyH("LEFT")
 
	rightchar:SetText("")
	updaterun:Show()
	flowingframe:Show()
end
 
SlashCmdList.ALLEYRUN = function(lol) allertrun(lol) end
SLASH_ALLEYRUN1 = "/arn" -- /command to test the text
 
local a = CreateFrame ("Frame")
	a:RegisterEvent("PLAYER_REGEN_ENABLED")
	a:RegisterEvent("PLAYER_REGEN_DISABLED")
	a:SetScript("OnEvent", function (self,event)
		if (UnitIsDead("player")) then return end
		if event == "PLAYER_REGEN_ENABLED" then
			allertrun("LEAVING COMBAT",0.1,1,0.1)
		else
			allertrun("ENTERING COMBAT",1,0.1,0.1)
		end
	end)

-----------------------------------------
-- fDispelAnnounce made by Foof
-----------------------------------------

local fDispelAnnounce = CreateFrame("Frame", fDispelAnnounce)
local band = bit.band
local font = C.media.pixelfont -- HOOG0555.ttf 
local fontflag = "OUTLINEMONOCHROME" -- for pixelfont stick to this else OUTLINE or THINOUTLINE
local fontsize = 18 -- font size
local COMBATLOG_OBJECT_AFFILIATION_MINE = COMBATLOG_OBJECT_AFFILIATION_MINE
 
-- Registered events
local events = {
	["SPELL_STOLEN"] = {
		["enabled"] = true,
		["msg"] = "Removed",
		["color"] = "69CCF0",
	},
	["SPELL_DISPEL"] = {
		["enabled"] = true,
		["msg"] = "Removed",
		["color"] = "3BFF33",
	},
	["SPELL_DISPEL_FAILED"] = {
		["enabled"] = true,
		["msg"] = "FAILED",
		["color"] = "C41F3B",
	},
	["SPELL_HEAL"] = {
		["enabled"] = false,
		["msg"] = "Healed",
		["color"] = "3BFF33",
	},
}
 
-- Frame function
local function CreateMessageFrame(name)
	local f = CreateFrame("ScrollingMessageFrame", name, UIParent)
	f:SetHeight(80)
	f:SetWidth(500)
	f:SetPoint("CENTER", 0, 150)
	f:SetFrameStrata("HIGH")
	f:SetTimeVisible(1.5)
	f:SetFadeDuration(3)
	f:SetMaxLines(3)
	f:SetFont(font, fontsize, fontflag)
	return f
end
 
-- Create messageframe
local dispelMessages = CreateMessageFrame("fDispelFrame")
 
local function OnEvent(self, event, timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, ...)
	if(not events[eventType] or not events[eventType].enabled or band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) ~= COMBATLOG_OBJECT_AFFILIATION_MINE or sourceGUID ~= UnitGUID("player")) then
		return
	end
	-- Print to partychat
	local numparty = GetNumGroupMembers()
	if (numparty > 0 and numparty < 6) then
		SendChatMessage(events[eventType].msg .. ": " .. select(5, ...), "PARTY")
	end
	-- Add to messageframe
	dispelMessages:AddMessage("|cff" .. events[eventType].color .. events[eventType].msg .. ":|r " .. select(5, ...))
end
 
-- finally
fDispelAnnounce:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
fDispelAnnounce:SetScript('OnEvent', OnEvent)

------------------------------------------------------------------------------------
-- OpenAll By Kemayo
-- http://www.wowinterface.com/downloads/info7762-OpenAll.html
------------------------------------------------------------------------------------
local deletedelay, t = 0.5, 0
local takingOnlyCash = false
local button, button2, waitForMail, doNothing, openAll, openAllCash, openMail, lastopened, stopOpening, onEvent, needsToWait, copper_to_pretty_money, total_cash
local _G = _G
local baseInboxFrame_OnClick
function doNothing() end

function openAll()
	if GetInboxNumItems() == 0 then return end
	button:SetScript("OnClick", nil)
	button2:SetScript("OnClick", nil)
	baseInboxFrame_OnClick = InboxFrame_OnClick
	InboxFrame_OnClick = doNothing
	button:RegisterEvent("UI_ERROR_MESSAGE")
	openMail(GetInboxNumItems())
end
function openAllCash()
	takingOnlyCash = true
	openAll()
end
function openMail(index)
	if not InboxFrame:IsVisible() then return stopOpening(hexa.."Need a mailbox.") end
	if index == 0 then MiniMapMailFrame:Hide() return stopOpening(hexa.."Reached the end."..hexb) end
	local _, _, _, _, money, COD, _, numItems = GetInboxHeaderInfo(index)
	if not takingOnlyCash then
		if money > 0 or (numItems and numItems > 0) and COD <= 0 then
			AutoLootMailItem(index)
			needsToWait = true
		end
	elseif money > 0 then
		TakeInboxMoney(index)
		needsToWait = true
		if total_cash then total_cash = total_cash - money end
	end
	local items = GetInboxNumItems()
	if (numItems and numItems > 0) or (items > 1 and index <= items) then
		lastopened = index
		button:SetScript("OnUpdate", waitForMail)
	else
		MiniMapMailFrame:Hide()
		stopOpening(hexa.."All done."..hexb)
	end
end
function waitForMail(this, arg1)
	t = t + arg1
	if (not needsToWait) or (t > deletedelay) then
		if not InboxFrame:IsVisible() then return stopOpening(hexa.."Need a mailbox."..hexb) end
		t = 0
		needsToWait = false
		button:SetScript("OnUpdate", nil)
		
		local _, _, _, _, money, COD, _, numItems = GetInboxHeaderInfo(lastopened)
		if money > 0 or ((not takingOnlyCash) and COD <= 0 and numItems and (numItems > 0)) then
			--The lastopened index inbox item still contains stuff we want
			openMail(lastopened)
		else
			openMail(lastopened - 1)
		end
	end
end
function stopOpening(msg, ...)
	button:SetScript("OnUpdate", nil)
	button:SetScript("OnClick", openAll)
	button2:SetScript("OnClick", openAllCash)
	if baseInboxFrame_OnClick then
		InboxFrame_OnClick = baseInboxFrame_OnClick
	end
	button:UnregisterEvent("UI_ERROR_MESSAGE")
	takingOnlyCash = false
	total_cash = nil
	needsToWait = false
	if msg then DEFAULT_CHAT_FRAME:AddMessage(hexa.."OpenAll: "..hexb..msg, ...) end
end
function onEvent(frame, event, arg1, arg2, arg3, arg4)
	if event == "UI_ERROR_MESSAGE" then
		if arg1 == ERR_INV_FULL then
			stopOpening(hexa.."Stopped, inventory is full."..hexb)
		end
	end
end
local function makeButton(id, text, w, h, x, y)
	local button = CreateFrame("Button", id, InboxFrame, "UIPanelButtonTemplate")
	button:SetWidth(w)
	button:SetHeight(h)
	button:SetPoint("CENTER", InboxFrame, "TOP", x, y)
	button:SetText(text)
	return button
end
button = makeButton("OpenAllButton", "All", 70, 20, -50, -410)
button:SetScript("OnClick", openAll)
button:SetScript("OnEvent", onEvent)
button2 = makeButton("OpenAllButton2", "Golds", 70, 20, 30, -410)
button2:SetScript("OnClick", openAllCash)

button:SetScript("OnEnter", function()
	GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
	GameTooltip:AddLine(string.format("%d messages", GetInboxNumItems()), 1, 1, 1)
	GameTooltip:Show()
end)
button:SetScript("OnLeave", function() GameTooltip:Hide() end)

function copper_to_pretty_money(c)
	if c > 10000 then
		return ("%d|cffffd700g|r%d|cffc7c7cfs|r%d|cffeda55fc|r"):format(c/10000, (c/100)%100, c%100)
	elseif c > 100 then
		return ("%d|cffc7c7cfs|r%d|cffeda55fc|r"):format((c/100)%100, c%100)
	else
		return ("%d|cffeda55fc|r"):format(c%100)
	end
end
button2:SetScript("OnEnter", function()
	if not total_cash then
		total_cash = 0
		for index=0, GetInboxNumItems() do
			total_cash = total_cash + select(5, GetInboxHeaderInfo(index))
		end
	end
	GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
	GameTooltip:AddLine(copper_to_pretty_money(total_cash), 1, 1, 1)
	GameTooltip:Show()
end)
button2:SetScript("OnLeave", function() GameTooltip:Hide() end)

OpenAllButton:SkinButton()
OpenAllButton2:SkinButton()
---------------------------------------------------------------------------------------------------------------------------------
-- tekKompare by Tekkub found at http://www.wowinterface.com/downloads/info6837-tekKompare.html
-- only used Hoverlinks
---------------------------------------------------------------------------------------------------------------------------------

local orig1, orig2 = {}, {}
local GameTooltip = GameTooltip

local linktypes = {item = true, enchant = true, spell = true, quest = true, unit = true, talent = true, achievement = true, glyph = true, instancelock = true, currency = true}

local function OnHyperlinkEnter(frame, link, ...)
	local linktype = link:match("^([^:]+)")
	if linktype and linktypes[linktype] then
		GameTooltip:SetOwner(frame, "ANCHOR_TOPLEFT")
		GameTooltip:SetHyperlink(link)
		GameTooltip:Show()
	end

	if orig1[frame] then return orig1[frame](frame, link, ...) end
end

local function OnHyperlinkLeave(frame, ...)
	GameTooltip:Hide()
	if orig2[frame] then return orig2[frame](frame, ...) end
end


local _G = getfenv(0)
for i=1, NUM_CHAT_WINDOWS do
	local frame = _G["ChatFrame"..i]
	orig1[frame] = frame:GetScript("OnHyperlinkEnter")
	frame:SetScript("OnHyperlinkEnter", OnHyperlinkEnter)

	orig2[frame] = frame:GetScript("OnHyperlinkLeave")
	frame:SetScript("OnHyperlinkLeave", OnHyperlinkLeave)
end	
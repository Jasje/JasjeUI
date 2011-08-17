local T, C, L = unpack(select(2, ...)) 

--
StaticPopupDialogs.PARTY_INVITE.hideOnEscape = 0
StaticPopupDialogs.CONFIRM_SUMMON.hideOnEscape = 0

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
	local numraid = GetNumRaidMembers()
	if (numraid > 0 and numraid < 6) then
		SendChatMessage(events[eventType].msg .. ": " .. select(5, ...), "PARTY")
	end
	-- Add to messageframe
	dispelMessages:AddMessage("|cff" .. events[eventType].color .. events[eventType].msg .. ":|r " .. select(5, ...))
end
 
-- finally
fDispelAnnounce:RegisterEvent('COMBAT_LOG_EVENT_UNFILTERED')
fDispelAnnounce:SetScript('OnEvent', OnEvent)

----------------------------------------------------------------------------------------------------------------
-- saftExperienceBar by Safturento
--	DL link http://www.wowinterface.com/downloads/info17672-saftExperienceBar.html#info
--	have fun
----------------------------------------------------------------------------------------------------------------

--Bar Height and Width
local barHeight, barWidth = 5, 370

--Where you want the fame to be anchored
--------AnchorPoint, AnchorTo, RelativePoint, xOffset, yOffset
local Anchor = { "BOTTOM", TukuiInfoRight, "BOTTOM", 0, -6}
--local Anchor = { "TOP", Minimap, "BOTTOM", 0, -7 }

--Fonts
local showText = false -- Set to false to hide text
local mouseoverText = true -- Set to true to only show text on mouseover
local font = C.media.pixelfont -- HOOG0555.ttf 
local flags = "OUTLINEMONOCHROME" -- for pixelfont stick to this else OUTLINE or THINOUTLINE
local fontsize = 8 -- font size

--Texture used for bar
local barTex = C.media.flat
local flatTex = C.media.flat

-- Tables ----------------
--------------------------
st = {}

st.FactionInfo = {
	[1] = {{ 170/255, 70/255,  70/255 }, "Hated", "FFaa4646"},
	[2] = {{ 170/255, 70/255,  70/255 }, "Hostile", "FFaa4646"},
	[3] = {{ 170/255, 70/255,  70/255 }, "Unfriendly", "FFaa4646"},
	[4] = {{ 200/255, 180/255, 100/255 }, "Neutral", "FFc8b464"},
	[5] = {{ 75/255,  175/255, 75/255 }, "Friendly", "FF4baf4b"},
	[6] = {{ 75/255,  175/255, 75/255 }, "Honored", "FF4baf4b"},
	[7] = {{ 75/255,  175/255, 75/255 }, "Revered", "FF4baf4b"},
	[8] = {{ 155/255,  255/255, 155/255 }, "Exalted","FF9bff9b"},
}

-- Functions -------------
--------------------------
function st.ShortValue(value)
	if value >= 1e6 then
		return ("%.2fm"):format(value / 1e6):gsub("%.?0+([km])$", "%1")
	elseif value >= 1e3 or value <= -1e3 then
		return ("%.1fk"):format(value / 1e3):gsub("%.?+([km])$", "%1")
	else
		return value
	end
end

function st.CommaValue(amount)
	local formatted = amount
	while true do  
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
			break
		end
	end
	return formatted
end

function st.Colorize(r)
	return st.FactionInfo[r][3]
end

function st.IsMaxLevel()
	if UnitLevel("player") == MAX_PLAYER_LEVEL then
		return true
	end
end

function st.GuildIsMaxLevel()
	if GetGuildLevel() == MAX_GUILD_LEVEL then
		return true
	end
end

-----------------------------------------------------------
-- Don't edit past here unless you know what your doing! --
-----------------------------------------------------------

--Prefix for naming frames
local aName = "stExperienceBar_"

--Create Background and Border
local Frame = CreateFrame("frame", aName.."Frame", UIParent)
Frame:SetHeight(barHeight)
Frame:SetWidth(barWidth)
Frame:SetPoint(unpack(Anchor))

local xpBorder = CreateFrame("frame", aName.."xpBorder", Frame)
xpBorder:SetHeight(barHeight)
xpBorder:SetWidth(barWidth)
xpBorder:SetPoint("TOP", Frame, "TOP", 0, 0)
xpBorder:SetBackdrop({
	bgFile = barTex, 
	edgeFile = barTex, 
	tile = false, tileSize = 0, edgeSize = 1, 
	insets = { left = -1, right = -1, top = -1, bottom = -1}
})
xpBorder:SetBackdropColor(0, 0, 0)
xpBorder:SetBackdropBorderColor(.2, .2, .2, 1)

local xpOverlay = xpBorder:CreateTexture(nil, "BORDER", xpBorder)
xpOverlay:ClearAllPoints()
xpOverlay:SetPoint("TOPLEFT", xpBorder, "TOPLEFT", 2, -2)
xpOverlay:SetPoint("BOTTOMRIGHT", xpBorder, "BOTTOMRIGHT", -2, 2)
xpOverlay:SetTexture(barTex)
xpOverlay:SetVertexColor(.1,.1,.1)

--Create xp status bar
local xpBar = CreateFrame("StatusBar",  aName.."xpBar", xpBorder, "TextStatusBar")
xpBar:SetPoint("TOPRIGHT", xpBorder, "TOPRIGHT", -2, -2)
xpBar:SetPoint("BOTTOMLEFT", xpBorder, "BOTTOMLEFT", 2, 2)
xpBar:SetStatusBarTexture(barTex)
xpBar:SetStatusBarColor(.5, 0, .75)

--Create Rested XP Status Bar
local restedxpBar = CreateFrame("StatusBar", aName.."restedxpBar", xpBorder, "TextStatusBar")
restedxpBar:SetPoint("TOPRIGHT", xpBorder, "TOPRIGHT", -2, -2)
restedxpBar:SetPoint("BOTTOMLEFT", xpBorder, "BOTTOMLEFT", 2, 2)
restedxpBar:SetStatusBarTexture(barTex)
restedxpBar:Hide()

--Create reputation status bar
local repBorder = CreateFrame("frame", aName.."repBorder", Frame)
repBorder:SetHeight(5)
repBorder:SetWidth(Frame:GetWidth())
repBorder:SetPoint("BOTTOM", Frame, "BOTTOM", 0, 0)
repBorder:SetBackdrop({
	bgFile = barTex, 
	edgeFile = barTex, 
	tile = false, tileSize = 0, edgeSize = 1, 
	insets = { left = -1, right = -1, top = -1, bottom = -1}
})
repBorder:SetBackdropColor(0, 0, 0)
repBorder:SetBackdropBorderColor(.2, .2, .2, 1)

local repOverlay = repBorder:CreateTexture(nil, "BORDER", Frame)
repOverlay:ClearAllPoints()
repOverlay:SetPoint("TOPLEFT", repBorder, "TOPLEFT", 2, -2)
repOverlay:SetPoint("BOTTOMRIGHT", repBorder, "BOTTOMRIGHT", -2, 2)
repOverlay:SetTexture(barTex)
repOverlay:SetVertexColor(.1,.1,.1)

local repBar = CreateFrame("StatusBar", aName.."repBar", repBorder, "TextStatusBar")
repBar:SetPoint("TOPRIGHT", repBorder, "TOPRIGHT", -2, -2)
repBar:SetPoint("BOTTOMLEFT", repBorder, "BOTTOMLEFT", 2, 2)
repBar:SetStatusBarTexture(barTex)

--Create frame used for mouseover, clicks, and text
local mouseFrame = CreateFrame("Frame", aName.."mouseFrame", Frame)
mouseFrame:SetAllPoints(Frame)
mouseFrame:EnableMouse(true)
	
--Create XP Text
local Text = mouseFrame:CreateFontString(aName.."Text", "OVERLAY")
Text:SetFont(font, fontsize, flags)
Text:SetPoint("CENTER", xpBorder, "CENTER", 0, 1)
if mouseoverText == true then
	Text:SetAlpha(0)
end

--Set all frame levels (easier to see if organized this way)
Frame:SetFrameLevel(0)
xpBorder:SetFrameLevel(0)
repBorder:SetFrameLevel(0)
restedxpBar:SetFrameLevel(1)
repBar:SetFrameLevel(2)
xpBar:SetFrameLevel(2)
mouseFrame:SetFrameLevel(3)

local function updateStatus()
	local XP, maxXP = UnitXP("player"), UnitXPMax("player")
	local restXP = GetXPExhaustion()
	local percXP = floor(XP/maxXP*100)
	
	if st.IsMaxLevel() then
		xpBorder:Hide()
		repBorder:SetHeight(barHeight)
		if not GetWatchedFactionInfo() then
			Frame:Hide()
		else
			Frame:Show()
		end
		
		local name, rank, minRep, maxRep, value = GetWatchedFactionInfo()
		Text:SetText(format("%d / %d (%d%%)", value-minRep, maxRep-minRep, (value-minRep)/(maxRep-minRep)*100))
	else		
		xpBar:SetMinMaxValues(min(0, XP), maxXP)
		xpBar:SetValue(XP)
			
		if restXP then
			Text:SetText(format("%s/%s (%s%%|cffb3e1ff+%d%%|r)", st.ShortValue(XP), st.ShortValue(maxXP), percXP, restXP/maxXP*100))
			restedxpBar:Show()
			restedxpBar:SetStatusBarColor(0, .4, .8)
			restedxpBar:SetMinMaxValues(min(0, XP), maxXP)
			restedxpBar:SetValue(XP+restXP)
		else
			restedxpBar:Hide()
			Text:SetText(format("%s/%s (%s%%)", st.ShortValue(XP), st.ShortValue(maxXP), percXP))
		end
		
		if GetWatchedFactionInfo() then
			xpBorder:SetHeight(barHeight-(repBorder:GetHeight()-1))
			repBorder:Show()
		else
			xpBorder:SetHeight(barHeight)
			repBorder:Hide()
		end
	end
	
	if GetWatchedFactionInfo() then
		local name, rank, minRep, maxRep, value = GetWatchedFactionInfo()
		repBar:SetMinMaxValues(minRep, maxRep)
		repBar:SetValue(value)
		repBar:SetStatusBarColor(unpack(st.FactionInfo[rank][1]))
	end
	
	--Setup Exp Tooltip
	mouseFrame:SetScript("OnEnter", function()
		if mouseoverText == true then
			Text:SetAlpha(1)
		end
		GameTooltip:SetOwner(mouseFrame, "ANCHOR_BOTTOMLEFT", -3, barHeight)
		GameTooltip:ClearLines()
		if not st.IsMaxLevel() then
			GameTooltip:AddLine(hexa.."Experience:"..hexb)
			GameTooltip:AddLine(string.format(hexa..'XP:'..hexb..' %s/%s (%d%%)', st.ShortValue(XP), st.ShortValue(maxXP), (XP/maxXP)*100))
			GameTooltip:AddLine(string.format(hexa..'Remaining:'..hexb..' %s', st.ShortValue(maxXP-XP)))
			if restXP then
				GameTooltip:AddLine(string.format(hexa..'Rested:'..hexb..' %s (%d%%)', st.ShortValue(restXP), restXP/maxXP*100))
			end
		end
		if GetWatchedFactionInfo() then
			local name, rank, min, max, value = GetWatchedFactionInfo()
			if not st.IsMaxLevel() then GameTooltip:AddLine(" ") end
			GameTooltip:AddLine(string.format(hexa..'Reputation:'..hexb..' %s', name))
			GameTooltip:AddLine(string.format(hexa..'Standing:'..hexb..' |c'..st.Colorize(rank)..'%s|r', st.FactionInfo[rank][2]))
			GameTooltip:AddLine(string.format(hexa..'Rep:'..hexb..' %s/%s (%d%%)', st.CommaValue(value-min), st.CommaValue(max-min), (value-min)/(max-min)*100))
			GameTooltip:AddLine(string.format(hexa..'Remaining:'..hexb..' %s', st.CommaValue(max-value)))
		end
		GameTooltip:Show()
	end)
	mouseFrame:SetScript("OnLeave", function()
		GameTooltip:Hide()
		if mouseoverText == true then
			Text:SetAlpha(0)
		end
	end)
	
	-- Right click menu
	local function sendReport(dest, rep)--Destination, if Reputation rep = true
		if rep == true then 
			local name, rank, min, max, value = GetWatchedFactionInfo()
			SendChatMessage("I'm currently "..st.FactionInfo[rank][2].." with "..name.." "..(value-min).."/"..(max-min).." ("..floor((((value-min)/(max-min))*100)).."%).",dest)
		else
			local XP, maxXP = UnitXP("player"), UnitXPMax("player")
			SendChatMessage("I'm currently at "..st.CommaValue(XP).."/"..st.CommaValue(maxXP).." ("..floor((XP/maxXP)*100).."%) experience.",dest)
		end
	end
			
	local reportFrame = CreateFrame("Frame", "stExperienceReportMenu", UIParent)
	if UnitLevel("player") ~= MAX_PLAYER_LEVEL then
		local reportList = {
			{text = hexa.."Sent Experience to:"..hexb,
				isTitle = true, notCheckable = true, notClickable = true,
				func = function()  end},
			{text = hexa.."Party"..hexb,
				func = function() 
					if GetNumPartyMembers() > 0 then
						sendReport("PARTY")
					else
						print(hexa.."[stExp] Must be in a group to report to party."..hexb)
					end
				end},
			{text = hexa.."Guild"..hexb,
				func = function()
					if IsInGuild() then
						sendReport("GUILD")
					else
						print(hexa.."[stExp] Must be in a guild to report to guild."..hexb)
					end
				end},
			{text = hexa.."Raid"..hexb,
				func = function() 
					if GetNumRaidMembers() > 0 then
						sendReport("RAID")
					elseif GetNumPartyMembers() > 0 then
						sendReport("PARTY")
					else
						print(hexa.."[stExp] Must be in a group to report to party/raid."..hexb)
					end
				end},
			{text = hexa.."Target"..hexb,
				func = function()
					if UnitName("target") then 
						local XP, maxXP = UnitXP("player"), UnitXPMax("player")
						SendChatMessage("I'm currently at "..st.CommaValue(XP).."/"..st.CommaValue(maxXP).." ("..floor((XP/maxXP)*100).."%) experience.","WHISPER",nil,UnitName("target"))
					end
				end},
			{text = "Sent Reputation to:",
				isTitle = true, notCheckable = true, notClickable = true,
				func = function()  end},
			{text = hexa.."Party"..hexb,
				func = function() 
					if GetNumPartyMembers() > 0 then
						sendReport("PARTY", true)
					else
						print(hexa.."[stExp] Must be in a group to report to party."..hexb)
					end
				end},
			{text = hexa.."Guild"..hexb,
				func = function()
					if IsInGuild() then
						sendReport("GUILD", true)
					else
						print(hexa.."[stExp] Must be in a guild to report to guild."..hexb)
					end
				end},
			{text = hexa.."Raid"..hexb,
				func = function() 
					if GetNumRaidMembers() > 0 then
						sendReport("RAID", true)
					elseif GetNumPartyMembers() > 0 then
						sendReport("PARTY", true)
					else
						print(hexa.."[stExp] Must be in a group to report to party/raid."..hexb)
					end
				end},
			{text = hexa.."Target"..hexb,
				func = function() 
					if UnitName("target") then 
						local name, rank, min, max, value = GetWatchedFactionInfo()
						SendChatMessage("I'm currently "..st.FactionInfo[rank][2].." with "..name.." "..(value-min).."/"..(max-min).." ("..floor((((value-min)/(max-min))*100)).."%).","WHISPER",nil,UnitName("target"))
					end
				end},
			}
			mouseFrame:SetScript("OnMouseUp", function(self, btn)
			if btn == "RightButton" then
				EasyMenu(reportList, reportFrame, self, 0, 0, "menu", 2)
			end
		end)
	else
		local reportList = {
			{text = "Sent Reputation to:",
				isTitle = true, notCheckable = true, notClickable = true,
				func = function()  end},
			{text = hexa.."Party"..hexb,
				func = function() 
					if GetNumPartyMembers() > 0 then
						sendReport("PARTY", true)
					else
						print(hexa.."[stExp] Must be in a group to report to party."..hexb)
					end
				end},
			{text = hexa.."Guild"..hexb,
				func = function()
					if IsInGuild() then
						sendReport("GUILD", true)
					else
						print(hexa.."[stExp] Must be in a guild to report to guild."..hexb)
					end
				end},
			{text = hexa.."Raid"..hexb,
				func = function() 
					if GetNumRaidMembers() > 0 then
						sendReport("RAID", true)
					elseif GetNumPartyMembers() > 0 then
						sendReport("PARTY", true)
					else
						print(hexa.."[stExp] Must be in a group to report to party/raid."..hexb)
					end
				end},
			{text = hexa.."Target"..hexb,
				func = function() 
					if UnitName("target") then 
						local name, rank, min, max, value = GetWatchedFactionInfo()
						SendChatMessage("I'm currently "..st.FactionInfo[rank][2].." with "..name.." "..(value-min).."/"..(max-min).." ("..floor((((value-min)/(max-min))*100)).."%).","WHISPER",nil,UnitName("target"))
					end
				end},
			}
			mouseFrame:SetScript("OnMouseUp", function(self, btn)
			if btn == "RightButton" then
				EasyMenu(reportList, reportFrame, self, 0, 0, "menu", 2)
			end
		end)
	end
end

-- Event Stuff -----------
--------------------------
local frame = CreateFrame("Frame",nil,UIParent)
--Event handling
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("PLAYER_XP_UPDATE")
frame:RegisterEvent("UPDATE_EXHAUSTION")
frame:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
frame:RegisterEvent("UPDATE_FACTION")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", updateStatus)

------------------------------------------------------------------------------------
-- OpenAll By Kemayo
-- http://www.wowinterface.com/downloads/info7762-OpenAll.html
------------------------------------------------------------------------------------
local deletedelay, t = 0.5, 0
local takingOnlyCash = false
local button, button2, waitForMail, openAll, openAllCash, openMail, lastopened, stopOpening, onEvent, needsToWait, copper_to_pretty_money, total_cash
local _G = _G
local baseInboxFrame_OnClick

function openAll()
	if GetInboxNumItems() == 0 then return end
	button:SetScript("OnClick", nil)
	button2:SetScript("OnClick", nil)
	baseInboxFrame_OnClick = InboxFrame_OnClick
	InboxFrame_OnClick = function() end
	button:RegisterEvent("UI_ERROR_MESSAGE")
	openMail(GetInboxNumItems())
end

function openAllCash()
	takingOnlyCash = true
	openAll()
end

function openMail(index)
	if not InboxFrame:IsVisible() then return stopOpening(hexa.."Need a mailbox."..hexb) end
	if index == 0 then MiniMapMailFrame:Hide() stopOpening(hexa.."Reached the end."..hexb) return end
	local _, _, _, _, money, COD, _, numItems = GetInboxHeaderInfo(index)
	if money > 0 then
		TakeInboxMoney(index)
		needsToWait = true
		if total_cash then total_cash = total_cash - money end
	elseif (not takingOnlyCash) and numItems and (numItems > 0) and COD <= 0 then
		TakeInboxItem(index)
		needsToWait = true
	end
	local items = GetInboxNumItems()
	if (numItems and numItems > 1) or (items > 1 and index <= items) then
		lastopened = index
		t = 0
		button:SetScript("OnUpdate", waitForMail)
	else
		stopOpening(hexa.."All done."..hexb)
		MiniMapMailFrame:Hide()
	end
end

function waitForMail(self, elapsed)
	t = t + elapsed
	if (not needsToWait) or (t > deletedelay) then
		needsToWait = false
		button:SetScript("OnUpdate", nil)
		local _, _, _, _, money, COD, _, numItems = GetInboxHeaderInfo(lastopened)
		if money > 0 or ((not takingOnlyCash) and COD <= 0 and numItems and (numItems > 0)) then
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
button = makeButton("OpenAllButton", ALL, 70, 25, -45, -408)
button:SetScript("OnClick", openAll)
button:SetScript("OnEvent", onEvent)
button2 = makeButton("OpenAllButton2", MONEY, 70, 25, 28, -408)
button2:SetScript("OnClick", openAllCash)

button:SetScript("OnEnter", function()
	GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
	GameTooltip:AddLine(string.format("%d messages", GetInboxNumItems()), 1, 1, 1)
	GameTooltip:Show()
end)
button:SetScript("OnLeave", function() GameTooltip:Hide() end)

function copper_to_pretty_money(c)
	if c > 10000 then
		return ("%d|cffffd700"..GOLD_AMOUNT_SYMBOL.."|r %d|cffc7c7cf"..SILVER_AMOUNT_SYMBOL.."|r %d|cffeda55f"..COPPER_AMOUNT_SYMBOL.."|r"):format(c/10000, (c/100)%100, c%100)
	elseif c > 100 then
		return ("%d|cffc7c7cf"..SILVER_AMOUNT_SYMBOL.."|r %d|cffeda55f"..COPPER_AMOUNT_SYMBOL.."|r"):format((c/100)%100, c%100)
	else
		return ("%d|cffeda55f"..COPPER_AMOUNT_SYMBOL.."|r"):format(c%100)
	end
end

button2:SetScript("OnEnter", function()
	if not total_cash then
		total_cash = 0
		for index = 0, GetInboxNumItems() do
			total_cash = total_cash + select(5, GetInboxHeaderInfo(index))
		end
	end
	GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
	GameTooltip:AddLine(copper_to_pretty_money(total_cash), 1, 1, 1)
	GameTooltip:Show()
end)

button2:SetScript("OnLeave", function()	GameTooltip:Hide() end)

---------------------------------------------------------------------------------------------------------------------------------
-- tekKompare by Tekkub found at http://www.wowinterface.com/downloads/info6837-tekKompare.html
-- only used Hoverlinks
---------------------------------------------------------------------------------------------------------------------------------

local orig1, orig2 = {}, {}
local GameTooltip = GameTooltip

local linktypes = {item = true, enchant = true, spell = true, quest = true, unit = true, talent = true, achievement = true, glyph = true, instancelock = true}


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

----------------------------------------------------------------------------------------
--	GuildTab in FriendsFrame by Shestak
----------------------------------------------------------------------------------------
local n = FriendsFrame.numTabs + 1
local gtframe = CreateFrame("Button", "FriendsFrameTab"..n, FriendsFrame, "FriendsFrameTabTemplate")
    gtframe:SetID(n)
    gtframe:SetText(hexa..GUILD)
    gtframe:SetPoint("LEFT", getglobal("FriendsFrameTab"..n-1), "RIGHT", -15, 0)
    gtframe:RegisterForClicks("AnyUp")
    gtframe:SetScript("OnClick", function() ToggleGuildFrame() end)
    PanelTemplates_SetNumTabs(FriendsFrame, n)
    PanelTemplates_EnableTab(FriendsFrame, n)
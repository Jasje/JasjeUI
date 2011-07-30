local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales

-- on Tukui 13.13 or less, T.toc doesn't exist
if not T.toc then T.patch, T.build, T.releasedate, T.toc = GetBuildInfo() end

tInterruptIcons = CreateFrame("frame")
tInterruptIcons:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
tInterruptIcons:RegisterEvent("ZONE_CHANGED_NEW_AREA")
tInterruptIcons:RegisterEvent("PLAYER_ENTERING_WORLD")
tInterruptIcons:SetScript("OnUpdate", function(self, elapsed) tInterruptIcons.OnUpdate(elapsed) end)

local anchor = CreateFrame("Frame", "TukuiInterruptIconsAnchor", UIParent)
anchor:SetPoint("CENTER")
anchor:SetSize(30, 30)
anchor:SetFrameStrata("HIGH")
anchor:SetFrameLevel(19)
anchor:SetMovable(true)

tInterruptIcons.Orientations = { 
	["HORIZONTALRIGHT"] = { ["point"] = "LEFT", ["rpoint"] = "LEFT", ["x"] = 32, ["y"] = 0 },
	["HORIZONTALLEFT"] = { ["point"] = "RIGHT", ["rpoint"] = "RIGHT", ["x"] = -32, ["y"] = 0 }, 
	["VERTICALDOWN"] = { ["point"] = "TOP", ["rpoint"] = "TOP", ["x"] = 0, ["y"] = -32 },
	["VERTICALUP"] = { ["point"] = "BOTTOM", ["rpoint"] = "BOTTOM", ["x"] = 0, ["y"] = 32 }, 
}

------------------------------------------------------------
-- spell configuration
------------------------------------------------------------

tInterruptIcons.Spells = T.interrupt

------------------------------------------------------------
-- end of spell configuration
------------------------------------------------------------

SlashCmdList["tInterruptIcons"] = function(msg) tInterruptIcons.SlashHandler(msg) end
SLASH_tInterruptIcons1 = "/ii"
tInterruptIcons:SetScript("OnEvent", function(self, event, ...) tInterruptIcons[event](...) end)
tInterruptIcons.Icons = { }

local pvpType
local needupdate = false

function tInterruptIcons.CreateIcon()
	local i = (#tInterruptIcons.Icons)+1
   
	tInterruptIcons.Icons[i] = CreateFrame("frame","tInterruptIconsIcon"..i,anchor)
	tInterruptIcons.Icons[i]:Height(40)
	tInterruptIcons.Icons[i]:Width(40)
	tInterruptIcons.Icons[i]:SetFrameStrata("HIGH")
	tInterruptIcons.Icons[i]:SetFrameLevel(20)

	tInterruptIcons.Icons[i]:Hide()

	tInterruptIcons.Icons[i].Texture = tInterruptIcons.Icons[i]:CreateTexture(nil,"LOW")
	tInterruptIcons.Icons[i].Texture:SetTexture("Interface\\Icons\\ability_kick.blp")
	tInterruptIcons.Icons[i].Texture:Point("TOPLEFT", tInterruptIcons.Icons[i], 2, -2)
	tInterruptIcons.Icons[i].Texture:Point("BOTTOMRIGHT", tInterruptIcons.Icons[i], -2, 2)
	tInterruptIcons.Icons[i].Texture:SetTexCoord(.08, .92, .08, .92)

	tInterruptIcons.Icons[i]:SetTemplate("Default")

	tInterruptIcons.Icons[i].TimerText = tInterruptIcons.Icons[i]:CreateFontString("tInterruptIconsTimerText","OVERLAY")
	tInterruptIcons.Icons[i].TimerText:SetFont(C.media.pixelfont,16, "OUTLINEMONOCHROME")
	tInterruptIcons.Icons[i].TimerText:SetTextColor(1,0,0)
	tInterruptIcons.Icons[i].TimerText:Point("CENTER", tInterruptIcons.Icons[i], "CENTER",1,0)
	tInterruptIcons.Icons[i].TimerText:SetText(999)
   
	return i
end

tInterruptIcons.CreateIcon()
tInterruptIcons.Icons[1]:SetPoint("CENTER", anchor, "CENTER", 0, 0)
tInterruptIcons.Icons[1].moving = false

function tInterruptIcons.SlashHandler(msg)
	local arg = string.upper(msg)
	if (tInterruptIcons[arg]) then
		tInterruptIcons[arg]()
	else
		tInterruptIcons.Print(":")
		DEFAULT_CHAT_FRAME:AddMessage(" - /ii unlock")
		DEFAULT_CHAT_FRAME:AddMessage(" - /ii lock")
		DEFAULT_CHAT_FRAME:AddMessage(" - /ii reset")
		DEFAULT_CHAT_FRAME:AddMessage(" - /ii horizontalright")
		DEFAULT_CHAT_FRAME:AddMessage(" - /ii horizontalleft")
		DEFAULT_CHAT_FRAME:AddMessage(" - /ii verticaldown")
		DEFAULT_CHAT_FRAME:AddMessage(" - /ii verticalup")
	end
end

function tInterruptIcons.UNLOCK()
	if not tInterruptIcons.Icons[1].moving then
		tInterruptIcons.StopAllTimers()		
		anchor:EnableMouse(true)
		anchor:RegisterForDrag("LeftButton", "RightButton")
		anchor:SetScript("OnDragStart", function(self) self:SetUserPlaced(true) self:StartMoving() end)			
		anchor:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
		tInterruptIcons.StartTimer(1, 999, nil)
		tInterruptIcons.Icons[1].moving = true
	end
end

function tInterruptIcons.LOCK()
	if tInterruptIcons.Icons[1].moving then
		tInterruptIcons.StopTimer(1)		
		anchor:EnableMouse(false)
		anchor:StopMovingOrSizing()		
		tInterruptIcons.Icons[1].moving = false
	end
end

function tInterruptIcons.RESET()
	anchor:SetUserPlaced(false)
	anchor:ClearAllPoints()
	anchor:SetPoint("CENTER", 0, 0)
	tInterruptIcons.Print("Position reset successfully.")
end

function tInterruptIcons.HORIZONTALRIGHT()
	TukuiInterruptIcons.orientation = "HORIZONTALRIGHT"
	tInterruptIcons.Print("Icons will now stack horizontally to the right.")
end

function tInterruptIcons.HORIZONTALLEFT()
	TukuiInterruptIcons.orientation = "HORIZONTALLEFT"
	tInterruptIcons.Print("Icons will now stack horizontally to the left.")
end

function tInterruptIcons.VERTICALDOWN()
	TukuiInterruptIcons.orientation = "VERTICALDOWN"
	tInterruptIcons.Print("Icons will now stack vertically downwards.")
end

function tInterruptIcons.VERTICALUP()
	TukuiInterruptIcons.orientation = "VERTICALUP"
	tInterruptIcons.Print("Icons will now stack vertically upwards.")
end

function tInterruptIcons.Print(msg, ...)
	DEFAULT_CHAT_FRAME:AddMessage("|cFFFFFF33[Tukui Interrupt Icons]|r "..format(msg, ...))
end

function tInterruptIcons.COMBAT_LOG_EVENT_UNFILTERED(...)
	local timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID

	if T.toc < 40200 then
		timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID = ...
	else
		timestamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID = ...
	end

	if (event == "SPELL_CAST_SUCCESS" and not tInterruptIcons.Icons[1]:IsMouseEnabled() and (bit.band(sourceFlags,COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE)) then			
		if (sourceName ~= UnitName("player")) then
			if (tInterruptIcons.Spells[spellID]) then
				needupdate = true
				local _,_,texture = GetSpellInfo(spellID)
				tInterruptIcons.StartTimer(tInterruptIcons.NextAvailable(),tInterruptIcons.Spells[spellID],texture,spellID)
			end
		end
	end
end

function tInterruptIcons.NextAvailable()
	for i=1,#tInterruptIcons.Icons do
		if (not tInterruptIcons.Timers[i]) then
			return i
		end
	end
	return tInterruptIcons.CreateIcon()
end

tInterruptIcons.Timers = { }
function tInterruptIcons.StartTimer(icon, duration, texture, spellID)
	tInterruptIcons.Timers[(icon)] = {
		["Start"] = GetTime(),
		["Duration"] = duration,
		["SpellID"] = spellID,
	}
	UIFrameFadeIn(tInterruptIcons.Icons[icon],1,0,1)
	if (texture) then
		tInterruptIcons.Icons[(active or icon)].Texture:SetTexture(texture)
		tInterruptIcons.Icons[(active or icon)].Texture:Point("TOPLEFT", tInterruptIcons.Icons[(active or icon)], 2, -2)
		tInterruptIcons.Icons[(active or icon)].Texture:Point("BOTTOMRIGHT", tInterruptIcons.Icons[(active or icon)], -2, 2)
		tInterruptIcons.Icons[(active or icon)].Texture:SetTexCoord(.08, .92, .08, .92)
		tInterruptIcons.Icons[(active or icon)]:SetTemplate("Default")
	end
end

function tInterruptIcons.StopTimer(icon)
	if (tInterruptIcons.Icons[icon]:IsMouseEnabled()) then
		tInterruptIcons.LOCK()
	end
	UIFrameFadeOut(tInterruptIcons.Icons[icon],1,1,0)
	tInterruptIcons.Timers[icon] = nil
end

function tInterruptIcons.StopAllTimers()
	for i in pairs(tInterruptIcons.Timers) do
		tInterruptIcons.StopTimer(i)
	end
end

function tInterruptIcons.Reposition()
	local sorttable = { }
	local indexes = { }

	for i in pairs(tInterruptIcons.Timers) do
		tinsert(sorttable, tInterruptIcons.Timers[i].Start)
		indexes[tInterruptIcons.Timers[i].Start] = i
	end

	table.sort(sorttable)

	local currentactive = 0

	for k=1,#sorttable do
		local v = sorttable[k]
		local i = indexes[v]
		tInterruptIcons.Icons[i]:ClearAllPoints()
		if (currentactive == 0) then
			tInterruptIcons.Icons[i]:SetPoint("CENTER", anchor, "CENTER", 0, 0)
		else
			tInterruptIcons.Icons[i]:SetPoint(
				tInterruptIcons.Orientations[TukuiInterruptIcons.orientation].point,
				anchor, 
				tInterruptIcons.Orientations[TukuiInterruptIcons.orientation].rpoint, 
				tInterruptIcons.Orientations[TukuiInterruptIcons.orientation].x * currentactive, 
				tInterruptIcons.Orientations[TukuiInterruptIcons.orientation].y * currentactive
			)
		end
		currentactive = i
	end
end

local interval = 0.1
function tInterruptIcons.OnUpdate(elapsed)	
	if interval > 0 then
		interval = interval - elapsed
	else
		for i in pairs(tInterruptIcons.Timers) do
			local timeleft = tInterruptIcons.Timers[i].Duration+1-(GetTime()-tInterruptIcons.Timers[i].Start)
			if (timeleft < 0) then
				needupdate = true
				tInterruptIcons.StopTimer(i)
			else
				tInterruptIcons.Icons[i].TimerText:SetText(math.floor(timeleft))
			end
		end

		if needupdate then
			tInterruptIcons.Reposition()
			needupdate = false
		end

		interval = 0.1
	end
end

function tInterruptIcons:PLAYER_ENTERING_WORLD()
	if not TukuiInterruptIcons then 
		TukuiInterruptIcons = {["orientation"] = "VERTICALUP",} 
	end
	pvpType = GetZonePVPInfo()
end

function tInterruptIcons:ZONE_CHANGED_NEW_AREA()
	pvpType = GetZonePVPInfo()

	if not pvpType or pvpType == "arena" then
		for i in pairs(tInterruptIcons.Timers) do
			tInterruptIcons.StopTimer(i)
		end
	end
end
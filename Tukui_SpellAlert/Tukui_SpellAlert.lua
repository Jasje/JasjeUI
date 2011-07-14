local T, C, L = unpack(Tukui)

--------------------------------------------------------
-- config
--------------------------------------------------------

local FONTSIZE = 30
local POINT = "TOP"
local X = 0
local Y = -300
local sound = true

local spells = {
	[118] = true, -- sheep
	[61305] = true, -- cat
	[28272] = true, -- pig
	[61721] = true, -- rabbit
	[61780] = true, -- turkey
	[28271] = true, -- turtle
	[5782] = true, -- fear
	[33786] = true, -- cyclone
	[51514] = true, -- hex
	[49203] = true, -- hungering cold
	[29166] = true, -- innervate
	[1719] = true, -- Recklessness
	[54428] = true, -- Divine Plea
	[8129] = true, -- Mana Burn
}

--------------------------------------------------------
-- the addon
--------------------------------------------------------

-- the main frame
local frame = CreateFrame("MessageFrame", nil, UIParent)
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:SetPoint("LEFT")
frame:SetPoint("RIGHT")
frame:SetHeight(36)
frame:SetInsertMode("TOP")
frame:SetFrameStrata("HIGH")
frame:SetTimeVisible(1)
frame:SetFadeDuration(3)
frame:SetFont(C.media.font, FONTSIZE, "OUTLINE")
frame:SetPoint(POINT, X, Y)

local band, bor = bit.band, bit.bor
local enemy = bor(COMBATLOG_OBJECT_REACTION_HOSTILE, COMBATLOG_OBJECT_TYPE_PLAYER)

local function isEnemy(flags) 
	return band(flags, enemy) == enemy 
end

local function Message(caster, spell, target, msg)
	local text = frame
	
	if target then
		text:AddMessage("|cffff0000"..caster.."|r"..msg.."|cffD7DC23"..spell.."|r on |cff00ff00"..target.."|r")
	else
		text:AddMessage("|cffff0000"..caster.."|r"..msg.."|cffD7DC23"..spell.."|r")
	end
	
	if sound then
		if spell == "Polymorph" then
			PlaySoundFile("Sound\\Creature\\Sheep\\SheepDeath.ogg")
		else
			PlaySoundFile("Sound\\Doodad\\BellTollHorde.wav")
		end
	end
	
	if sound then
		if spell == "Hex" then
			PlaySoundFile("Sound\\Character\\Gnome\\GnomeVocalFemale\\GnomeFemaleIncoming01.wav")
		else
			PlaySoundFile("Sound\\Doodad\\BellTollHorde.wav")
		end
	end
	
	if sound then
		if spell == "Mana Burn" then
			PlaySoundFile("Sound\\Spells\\ManaBurnImpact.wav")
		else
			PlaySoundFile("Sound\\Doodad\\BellTollHorde.wav")
		end
	end
end

local Update = function(self, event, ...)
	if event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local timestamp, eventType, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName
		
		timestamp, eventType, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName = ...
		
		if eventType == "SPELL_CAST_SUCCESS" or eventType == "SPELL_CAST_START" then
			if isEnemy(sourceFlags) then
				local guid = sourceGUID
				local class, classFilename, race, raceFilename, sex, name, unknown = GetPlayerInfoByGUID(guid)
				local check = spells[spellID]
				if check then
					local msg
					
					-- define a msg to print according to which event
					if eventType == "SPELL_CAST_SUCCESS" then
						msg = " casted "
					else
						msg = " is casting "
					end
					
					-- sent screen msg
					Message(name, spellName, destName, msg)
				end
			end
		end
	else
		local instanceType = select(2, IsInInstance())
		if instanceType == "pvp" or instanceType == "arena" then
			self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		else
			self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		end
	end
end

-- look, activate if bg/arena and print on screen
frame:SetScript("OnEvent", Update)
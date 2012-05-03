--[[
        Addon by Oomp on http://www.wowinterface.com/downloads/info18004-Flump.html
]]--
local Flump = CreateFrame("Frame")

local bot	 = "%s used a %s!"
local used	 = "%s used %s!"
local sw	 = "%s faded from %s!"
local cast	 = "%s cast %s on %s!"
local fade	 = "%s's %s faded from %s!"
local feast  = "%s prepares a %s!"
local gs	 = "%s's %s consumed: %s heal!"
local res	 = "%s's %s resurrected %s!"
local portal = "%s opened a %s!"
local create = "%s is creating a %s!"
local dispel = "%s's %s failed to dispel %s's %s!"
local ss	 = "%s died with a %s!"

local on_off = { [true] = "|cff00ff00on|r", [false] = "|cffff0000off|r" }
local option = "|cff3399ff%s|r set to |cff99ffcc%s|r"

local _, instance
local channel_id, party_channel_id
local sacrifice, soulstones, reincarnations = {}, {}, {}

-- Upvalues
local UnitAffectingCombat, UnitName, UnitHealthMax, UnitManaMax, UnitExists = UnitAffectingCombat, UnitName, UnitHealthMax, UnitManaMax, UnitExists
local GetSpellLink, format, match = GetSpellLink, string.format, string.match

-- http://www.wowhead.com/?search=portal#abilities
local portals = {
	-- Mage
	[53142] = true, -- Portal: Dalaran			(Alliance/Horde)
	[11419] = true, -- Portal: Darnassus		(Alliance)
	[32266] = true, -- Portal: Exodar			(Alliance)
	[11416] = true, -- Portal: Ironforge		(Alliance)
	[11417] = true, -- Portal: Orgrimmar		(Horde)
	[33691] = true, -- Portal: Shattrath		(Alliance)
	[35717] = true, -- Portal: Shattrath		(Horde)
	[32267] = true, -- Portal: Silvermoon		(Horde)
	[49361] = true, -- Portal: Stonard			(Horde)
	[10059] = true, -- Portal: Stormwind		(Alliance)
	[49360] = true, -- Portal: Theramore		(Alliance)
	[11420] = true, -- Portal: Thunder Bluff	(Horde)
	[88345] = true, -- Portal: Tol Barad		(Alliance)
	[88346] = true, -- Portal: Tol Barad		(Horde)
	[11418] = true, -- Portal: Undercity		(Horde)
}

local rituals = {
	-- Mage
	[43987] = true, -- Ritual of Refreshment
	-- Warlock
	[29893] = true, -- Ritual of Souls
	[698]	= true,	-- Ritual of Summoning
}

local healers = {
	-- Paladin
	[6940] 	= true,	-- Hand of Sacrifice
	[633] 	= true, -- Lay on Hands
	-- Priest
	[47788] = true, -- Guardian Spirit
	[33206] = true, -- Pain Suppression
}

local bots = {
	-- Engineering
	[22700] = true,	-- Field Repair Bot 74A
	[44389] = true,	-- Field Repair Bot 110G
	[67826] = true,	-- Jeeves
	[54710] = true,	-- MOLL-E
	[54711] = true,	-- Scrapbot
}

local tanks = {
	-- Death Knight
	[48707] = true,	-- Anti-Magic Shell
	[48792] = true,	-- Icebound Fortitude
	[55233] = true,	-- Vampiric Blood
	-- Druid
	[22812] = true,	-- Barkskin
	[22842] = true,	-- Frenzied Regeneration
	[61336] = true,	-- Survival Instincts
	-- Paladin
	[31850] = true, -- Ardent Defender
	[498] 	= true, -- Divine Protection
	[86150] = true, -- Guardian of Ancient Kings
	-- Warrior
	[12975] = true,	-- Last Stand [SPELL_CAST_SUCCESS]
	[12975] = true,	-- Last Stand [SPELL_AURA_REMOVED]
	[871] 	= true,	-- Shield Wall
	-- Items
	[92222] = true, -- Mirror of Broken Images
	-- Encounter: Madness of Deathwing
	[106466] = true, -- Dream
}

local raidwide_1 = {
	-- Paladin
	[70940] = true, -- Divine Guardian
	-- Warrior
	[97462] = true, -- Rallying Cry [SPELL_CAST_SUCCESS]
	[97463] = true, -- Rallying Cry [SPELL_AURA_REMOVED]
}

local raidwide_2 = {
	-- Death Knight
	[51052] = true, -- Anti-Magic Zone
	-- Druid
	[740] = true, 	-- Tranquility
	-- Paladin
	[31821] = true, -- Aura Mastery
	-- Priest
	[64843] = true, -- Divine Hymn
	[62618] = true, -- Power Word: Barrier
	-- Shaman
	[98008] = true, -- Spirit Link Totem
}

local summons = {
	-- Priest
	[724] = true,	-- Lightwell
}

local other = {
	-- Abilities which don't have a SPELL_CAST_SUCCESS event should go here
}

local cauldrons = {
	-- Alchemy
	[92712] = true, -- Big Cauldron of Battle	
	[92649] = true, -- Cauldron of Battle
}

local feasts = {
	-- Cooking
	[87643] = true, -- Broiled Dragon Feast
	[57426] = true, -- Fish Feast
	[57301] = true, -- Great Feast
	[87644] = true, -- Seafood Magnifique Feast
	-- Engineering
	[87915] = true, -- Goblin Barbecue Feast
	-- World Event
	[66476] = true, -- Bountiful Feast
}

local toys = {
	[61031] = true, -- Toy Train Set
}

local haste = {
	-- Hunter (Pet)
	[90355] = true,	-- Ancient Hysteria
	-- Mage
	[80353] = true,	-- Time Warp
	-- Shaman
	[2825]	= true,	-- Bloodlust
	[32182] = true,	-- Heroism
}

local mana = {
	-- Druid
	[29166] = true, -- Innervate
	-- Paladin
	[54428] = true, -- Divine Plea
	-- Priest
	[64901] = true, -- Hymn of Hope
	-- Shaman
	[16190] = true, -- Mana Tide Totem
}

local resurrections = {
	-- Death Knight
	[61999] = true, -- Raise Ally
	-- Druid
	[20484] = true, -- Rebirth
	-- Warlock
	[95750] = true,	-- Soulstone Resurrection
	-- Engineering
	[54732] = true,	-- Gnomish Army Knife
	[8342]	= true,	-- Goblin Jumper Cables
	[22999] = true, -- Goblin Jumper Cables XL
}

Flump:SetScript("OnEvent", function(self, event, ...)
	self[event](self, ...)
end)

local function printf(s,...)
	print("|cff39d7e5Flump:|r " .. s:format(...))
end

local function send(message)
	if instance == "raid" then
		if FlumpDB.output1 == "SELF" then
			print(message)
		else
			SendChatMessage(message, FlumpDB.output1, nil, channel_id)
		end
	elseif instance == "party" and FlumpDB.party then
		if FlumpDB.output2 == "SELF" then
			print(message)
		else
			SendChatMessage(message, FlumpDB.output2, nil, party_channel_id)
		end
	end
end

local function colour(name)
	if not UnitExists(name) then return name end
	local character = match(name ,"[^-]*")
	local icon_number = GetRaidTargetIndex(name)
	if FlumpDB.output1 == "SELF" or (instance == "party" and FlumpDB.output2 == "SELF") then
		local icon = icon_number and format("|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_%d.blp:0|t", icon_number) or ""
		local c = _G["RAID_CLASS_COLORS"][select(2, UnitClass(name))]
		return format("%s|cff%02x%02x%02x%s|r", icon, c.r*255, c.g*255, c.b*255, character)
	else
		local icon = icon_number and format("{rt%d}", icon_number) or ""
		return icon..character
	end
end

local function shorten(n)
	if type(n) ~= "number" then return n end
	if n >= 10000000 then
		return format("%.1fM", n/1000000)
	elseif n >= 1000000 then
		return format("%.2fM", n/1000000)
	elseif n >= 100000 then
		return format("%.fk", n/1000)
	elseif n >= 1000 then
		return format("%.1fk", n/1000)
	else
		return n
	end
end

local function is_tank(name)
	return GetPartyAssignment("MAINTANK", name, 1) or UnitGroupRolesAssigned(name) == "TANK"
end

local function get_owner(guid, source)
	if GetNumRaidMembers() > 0 then
		for i=1,40 do
			if UnitExists("raid"..i.."pet") and UnitGUID("raid"..i.."pet") == guid then
				return UnitName("raid"..i)
			end
		end
	elseif GetNumPartyMembers() > 0 then
		for i=1,5 do
			local unit = i < 5 and "party"..i or "player"
			if UnitExists(unit.."pet") and UnitGUID(unit.."pet") == guid then
				return UnitName(unit)
			end
		end
	end
	return source
end

function Flump:COMBAT_LOG_EVENT_UNFILTERED(timestamp, event, hideCaster, srcGUID, srcName, srcFlags, srcRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, school, ...)

	-- [X] died with a Soulstone!
	if UnitExists(destName) then -- If the target is in the raid/party
		if spellID == 20707 and event == "SPELL_AURA_REMOVED" then
			if not soulstones[destName] then soulstones[destName] = {} end
			soulstones[destName].time = GetTime()
		elseif spellID == 27827 and event == "SPELL_AURA_APPLIED" then
			soulstones[destName] = {}
			soulstones[destName].SoR = true -- Workaround for Spirit of Redemption issue
		elseif event == "UNIT_DIED" then
			if soulstones[destName] and not UnitIsFeignDeath(destName) then
				if not soulstones[destName].SoR and (GetTime() - soulstones[destName].time) < 2 then
					send(ss:format(colour(destName), GetSpellLink(6203)))
					SendChatMessage(ss:format(colour(destName), GetSpellLink(6203)), "RAID_WARNING")
				end
				soulstones[destName] = nil
			elseif select(2, UnitClass(destName)) == "SHAMAN" then
				reincarnations[destName] = true
				self:RegisterEvent("UNIT_HEALTH")
			end
		end
	end

	if not UnitExists(srcName) then return end -- If the source isn't in the raid/party

	if UnitAffectingCombat(srcName) then -- If the caster is in combat

		if event == "SPELL_CAST_SUCCESS" then
			if healers[spellID] or (spellID == 1022 and is_tank(destName)) then
				send(cast:format(colour(srcName), GetSpellLink(spellID), colour(destName))) -- [X] cast [Y] on [Z]
			elseif tanks[spellID] and is_tank(srcName) then
				send(used:format(colour(srcName), GetSpellLink(spellID))) -- [X] used [Y]
			elseif raidwide_1[spellID] then
				send(used:format(colour(srcName), GetSpellLink(spellID))) -- [X] used [Y]
				sacrifice[srcGUID] = spellName
			elseif raidwide_2[spellID] then -- Spells which aren't tanking spells
				send(used:format(colour(srcName), GetSpellLink(spellID))) -- [X] used Aura Mastery
			elseif self.db.manacd and mana[spellID] then
				if spellID == 29166 then
					send(cast:format(colour(srcName), GetSpellLink(spellID), colour(destName))) -- [X] cast Innervate on [Y]
				elseif spellID == 54428 and UnitManaMax(srcName) >= self.db.mana then
					send(used:format(colour(srcName), GetSpellLink(spellID))) -- [X] used Divine Plea
				elseif spellID == 16190 or spellID == 64901 then
					send(used:format(colour(srcName), GetSpellLink(spellID))) -- [X] used [Y]
					if spellID == 64901 then sacrifice[srcGUID] = spellName end
				end
			end
		

		elseif event == "SPELL_AURA_APPLIED" then
			if other[spellID] then
				send(used:format(colour(srcName), GetSpellLink(spellID))) -- [X] used [Z] (bonus)
			end
		
		elseif event == "SPELL_HEAL" then
			if spellID == 48153 or spellID == 66235 then -- Guardian Spirit / Ardent Defender
				local amount = ...
				send(gs:format(colour(srcName), GetSpellLink(spellID), shorten(amount))) -- [X]'s [Y] consumed: [Z] heal
			end
			
		elseif event == "SPELL_AURA_REMOVED" and self.db.fade then
			if healers[spellID] or (spellID == 1022 and is_tank(destName)) then
				send(fade:format(colour(srcName), GetSpellLink(spellID), colour(destName))) -- [X]'s [Y] faded from [Z]
			elseif tanks[spellID] and is_tank(srcName) then
				send(sw:format(GetSpellLink(spellID), colour(srcName))) -- [X] faded from [Y]
			elseif other[spellID] then
				send(sw:format(GetSpellLink(spellID), colour(srcName))) -- [X] faded from [Y]
			elseif raidwide_1[spellID] and sacrifice[srcGUID] == spellName then
				send(sw:format(GetSpellLink(spellID), colour(srcName))) -- [X] faded from [Y]
				sacrifice[srcGUID] = nil
			elseif raidwide_2[spellID] then -- Spells which aren't tanking spells
				send(sw:format(GetSpellLink(spellID), colour(srcName))) -- [X] faded from [Y]
			elseif self.db.manacd and mana[spellID] then
				if spellID == 64901 and sacrifice[srcGUID] == spellName then
					send(sw:format(GetSpellLink(spellID), colour(srcName))) -- [X] faded from [Y]
					sacrifice[srcGUID] = nil
				elseif spellID == 54428 and UnitManaMax(srcName) >= self.db.mana then
					send(sw:format(GetSpellLink(spellID), colour(srcName))) -- [X] faded from [Y]
				end
			end
		end
		
	end
	
	if event == "SPELL_CAST_SUCCESS" then
		if haste[spellID] then
			if spellID == 90355 then srcName = get_owner(srcName, srcGUID) end -- Get the Hunter's name, not the pet's
			send(used:format(colour(srcName), GetSpellLink(spellID))) -- [X] used [Y] -- Heroism/Bloodlust/Ancient Hysteria/Time Warp			
		elseif bots[spellID] then
			send(bot:format(colour(srcName), GetSpellLink(spellID))) -- [X] used a [Y] -- Bots
		elseif rituals[spellID] then
			send(create:format(colour(srcName), GetSpellLink(spellID))) -- [X] is creating a [Z] -- Rituals
		elseif self.db.tricks and (spellID == 34477 or spellID == 57934) and is_tank(destName) then -- [X] cast [Y] on [Z] -- Misdirection/Tricks of the Trade
			send(cast:format(colour(srcName), GetSpellLink(spellID), colour(destName)))
		end
		
	elseif event == "SPELL_AURA_APPLIED" then
		if spellID == 20707 then
			local _, class = UnitClass(srcName)
			if class == "WARLOCK" then -- Workaround for Spirit of Redemption issue
				send(cast:format(colour(srcName), GetSpellLink(6203), colour(destName))) -- [X] cast [Y] on [Z] -- Soulstone
			end
		end
		
	elseif event == "SPELL_CREATE" then
		if portals[spellID] then
			send(portal:format(colour(srcName), GetSpellLink(spellID))) -- [X] opened a [Z] -- Portals
		elseif toys[spellID] then
			send(bot:format(colour(srcName), GetSpellLink(spellID))) -- [X] used a [Z]
		end
	
	elseif event == "SPELL_CAST_START" then
		if feasts[spellID] then
			send(feast:format(colour(srcName), GetSpellLink(spellID))) -- [X] prepares a [Z] -- Feasts
		elseif cauldrons[spellID] then
			send(create:format(colour(srcName), GetSpellLink(spellID))) -- [X] is creating a [Z] -- Cauldrons
		end
	elseif event == "SPELL_SUMMON" then
		if summons[spellID] then
			send(bot:format(colour(srcName), GetSpellLink(spellID))) -- [X] used a [Y] -- Lightwell
		end
		
	elseif event == "SPELL_RESURRECT" then
		if resurrections[spellID] then
			if spellID == 95750 then spellID = 6203 end
			send(cast:format(colour(srcName), GetSpellLink(spellID), colour(destName))) -- [X] cast [Y] on [Z] -- Resurrections
		end
		reincarnations[destName] = nil
	end
	
end

-- If the player is within 100 yards, online, not dead, and has less than 25% health/mana, assume they are resurrecting using Reincarnation
function Flump:UNIT_HEALTH(unit)
	local name = UnitName(unit)
	if not reincarnations[name] then return end
	if UnitIsVisible(unit) and UnitIsConnected(unit) and not UnitIsDeadOrGhost(unit) and UnitHealth(unit) / UnitHealthMax(unit) < 0.25 and UnitPower(unit) / UnitPowerMax(unit) < 0.25 then
		send(used:format(colour(name), GetSpellLink(20608)))
		reincarnations[name] = nil
		if #reincarnations == 0 then self:UnregisterEvent("UNIT_HEALTH") end
	end
end

function Flump:PLAYER_REGEN_DISABLED()
	wipe(reincarnations)
	self:UnregisterEvent("UNIT_HEALTH")
end

function Flump:CheckEnable(isEnteringWorld)
	_, instance = IsInInstance()
	if FlumpStatusDB.enabled and (instance == "raid" or (self.db.party and instance == "party")) then
		if not self.db.lfr and instance == "raid" and IsPartyLFG() and IsInLFGDungeon() then
			self:UnregisterEvents()
			return
		end
		if isEnteringWorld then
			local tank_found = false
			local max_group = 5 - (GetInstanceDifficulty() % 2) * 3
			if instance == "raid" then
				for i=1,40 do
					local name, _, group = GetRaidRosterInfo(i)
					if name and group <= max_group and is_tank(name) then
						tank_found = true
						break
					end
				end
			elseif instance == "party" then
				for i=1,5 do
					local name = UnitName(i < 5 and format("party%d", i) or "player")
					if name and is_tank(name) then
						tank_found = true
						break
					end
				end
			end
			if not tank_found then
				if instance == "party" then
					printf("It is required that the tank is assigned |TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:14:14:0:0:64:64:0:17:22:41|t in order for his/her cooldowns to be announced.")
				elseif max_group == 5 then
					printf("It is required that tanks (in groups 1 to 5) are assigned |TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:14:14:0:0:64:64:0:17:22:41|t or promoted |TInterface\\GroupFrame\\UI-Group-MainTankIcon:16:10:0:1:16:16:1:13:0:16|t in order for their cooldowns to be announced.")
				elseif max_group == 2 then
					printf("It is required that tanks (in groups 1 and 2) are assigned |TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:14:14:0:0:64:64:0:17:22:41|t or promoted |TInterface\\GroupFrame\\UI-Group-MainTankIcon:16:10:0:1:16:16:1:13:0:16|t in order for their cooldowns to be announced.")
				else
					printf("It is required that tanks are assigned |TInterface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES:14:14:0:0:64:64:0:17:22:41|t or promoted |TInterface\\GroupFrame\\UI-Group-MainTankIcon:16:10:0:1:16:16:1:13:0:16|t in order for their cooldowns to be announced.")
				end
			end
		end
		self:RegisterEvents()
	else
		self:UnregisterEvents()
	end
end

function Flump:PLAYER_ENTERING_WORLD()
	self:CheckEnable(true)
end

function Flump:RegisterEvents()
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:RegisterEvent("PLAYER_REGEN_DISABLED")
	channel_id = GetChannelName(self.db.channel1)
	party_channel_id = GetChannelName(self.db.channel2)
end

function Flump:UnregisterEvents()
	self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	self:UnregisterEvent("PLAYER_REGEN_DISABLED")
	self:UnregisterEvent("UNIT_HEALTH")
	wipe(reincarnations)
end

function Flump:PrintCommands()
	printf("%s", "Command List")
	print("     |cff3399FFlist|r displays this list")
	print("  |cffFFFF99e.g. |cffFF9933/flump party|r |cffFFFF99to toggle...|r")
	print("     |cff3399FFparty|r [|cff99FFCC" .. on_off[self.db.party] .. "|r] Should announcements be sent in Party instances?")
	print("     |cff3399FFlfr|r [|cff99FFCC" .. on_off[self.db.lfr] .. "|r] Should announcements be sent in Raid Finder instances?")
	print("     |cff3399FFfade|r [|cff99FFCC" .. on_off[self.db.fade] .. "|r] Should spells fading be announced?")
	print("     |cff3399FFmanacd|r [|cff99FFCC" .. on_off[self.db.manacd] .. "|r] Should announcements be sent for mana cooldowns?")
	print("     |cff3399FFtricks|r [|cff99FFCC" .. on_off[self.db.tricks] .. "|r] Should Tricks/Misdirection be announced for tanks?")
	print("  |cffFFFF99e.g.|r |cffFF9933/flump mana 50000|r |cffFFFF99to set...|r")
	print("     |cff3399FFmana|r [|cff99FFCC" .. self.db.mana .. "|r] How much mana must a player have to be considered a healer?")
	print("     |cff3399FFoutput1|r [|cff99FFCC" .. self.db.output1 .. "|r] Where should Raid instance announcements be sent?")
	print("     |cff3399FFchannel1|r [|cff99FFCC" .. self.db.channel1 .. "|r] For private channels (Raid), set |cff3399FFoutput1|r to |cff99FFCCCHANNEL|r")
	print("     |cff3399FFoutput2|r [|cff99FFCC" .. self.db.output2 .. "|r] Where should Party instance announcements be sent?")
	print("     |cff3399FFchannel2|r [|cff99FFCC" .. self.db.channel2 .. "|r] For private channels (Party), set |cff3399FFoutput2|r to |cff99FFCCCHANNEL|r")
end

function Flump:CreateSlashCommands()

	SLASH_FLUMP1 = "/flump"
	SlashCmdList.FLUMP = function(msg)
	
		local cmd, arg = string.split(" ", msg, 2)
		cmd = string.lower(cmd or "")
		arg = arg or ""
		
		if cmd == "" then
			if FlumpStatusDB.enabled then
				FlumpStatusDB.enabled = false
				self:UnregisterEvents()
				printf("%s - type |cffFF9933/flump list|r for more options.", on_off[FlumpStatusDB.enabled])
			else
				FlumpStatusDB.enabled = true
				self:RegisterEvents()
				printf("%s - type |cffFF9933/flump list|r for more options.", on_off[FlumpStatusDB.enabled])
			end
			self:CheckEnable(true)
		elseif cmd == "party" then
			self.db.party = not self.db.party
			printf(option, "Party Instances", on_off[self.db.party])
		elseif cmd == "fade" then
			self.db.fade = not self.db.fade
			printf(option, "Fade Announcements", on_off[self.db.fade])
		elseif cmd == "tricks" then
			self.db.tricks = not self.db.tricks
			printf(option, "Tricks of the Trade/Misdirection", on_off[self.db.tricks])
		elseif cmd == "manacd" then
			self.db.manacd = not self.db.manacd
			printf(option, "Mana Cooldowns", on_off[self.db.manacd])
		elseif cmd == "lfr" then
			self.db.lfr = not self.db.lfr
			printf(option, "LFR Announcements", on_off[self.db.lfr])
			self:CheckEnable()
		else
			if arg ~= "" then
				if cmd == "mana" then
					self.db.mana = tonumber(arg)
					printf(option, "Healer Mana Threshold", arg)
				elseif cmd == "output1" then
					self.db.output1 = arg:upper()
					printf(option, "Output [Raid Instances]", arg)
				elseif cmd == "channel1" then
					self.db.channel1 = arg
					printf(option, "Channel [Raid Instances]", arg)
				elseif cmd == "output2" then
					self.db.output2 = arg:upper()
					printf(option, "Output [Party Instances]", arg)
				elseif cmd == "channel2" then
					self.db.channel2 = arg
					printf(option, "Channel [Party Instances]", arg)
				else
					self:PrintCommands()
				end
			else
				if self.db[cmd] then
					printf(option, cmd, self.db[cmd])
				else
					self:PrintCommands()
				end
			end
		end
	end
end

function Flump:ADDON_LOADED(addon)

	--if addon ~= "Flump" then return end
	
	local defaults = {
		lfr = true,
		party = true,
		fade = true,
		tricks = false,
		manacd = true,
		mana = 80000,
		output1 = "RAID",
		channel1 = "FlumpReports",
		output2 = "PARTY",		
		channel2 = "FlumpReports",
	}
	
	local global_defaults = {
		enabled = true,
	}
	
	FlumpDB = FlumpDB or {}
	for k,v in pairs(defaults) do
		if FlumpDB[k] == nil then
			FlumpDB[k] = v
		end
	end
	
	FlumpStatusDB = FlumpStatusDB or {}
	for k,v in pairs(global_defaults) do
		if FlumpStatusDB[k] == nil then
			FlumpStatusDB[k] = v
		end
	end
	
	self.db = FlumpDB
	
	self:CreateSlashCommands()
	self:CheckEnable()
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	
end

Flump:RegisterEvent("ADDON_LOADED")
local T, C, L, G = unpack(Tukui)

local function OnEvent(self, event, ...)
	if ( event == "PLAYER_LOGIN" ) then
		self:UnregisterEvent("PLAYER_LOGIN");
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	elseif ( event == "COMBAT_LOG_EVENT_UNFILTERED" ) then
		local numParty = GetNumGroupMembers();
		
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellID, spellName, _, extraskillID, extraskillname = ...; 
		if (eventType == "SPELL_INTERRUPT") and sourceName == UnitName("player") then
			intmsg = ("INTERRUPTED");
				intmsg = (intmsg.." "..destName..": "..GetSpellLink(extraskillID))
			if UnitInRaid("player") then
				SendChatMessage(intmsg, "PARTY")
			elseif IsInGroup("player") then
				SendChatMessage(intmsg, "PARTY")
			if IsInGroup("player") and (numParty > 0) then
				SendChatMessage(intmsg, "PARTY")
			end
				SendChatMessage(intmsg, "YELL")
				--print(intmsg)
		end
	end
end 
end
local SuccessfulInterruptAnnouncer = CreateFrame("Frame")
SuccessfulInterruptAnnouncer:RegisterEvent("PLAYER_LOGIN")
SuccessfulInterruptAnnouncer:SetScript("OnEvent", OnEvent)

-- drink announce for arenaby duffed
local function Update(self, event, ...)
	if event == "UNIT_SPELLCAST_SUCCEEDED" then
		local unit, spellName, spellrank, spelline, spellID = ...
		if GetZonePVPInfo() == "arena" then
			if UnitIsEnemy("player", unit) and (spellID == 80167 or spellID == 94468 or spellID == 43183 or spellID == 57073 or spellName == "Drinking") then
				SendChatMessage(UnitName(unit).." is drinking.", "PARTY")
				PlaySoundFile("Interface\\Addons\\Tukui_SpellAlert\\sounds\\81923.mp3", "MASTER")
			end
		end
	end
end

local drinking_announce = CreateFrame("Frame")
drinking_announce:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
drinking_announce:SetScript("OnEvent", Update)

----------------------------------------------------------------------------------------
--	Announce some spells  Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
----------------------------------------------------------------------------------------
T.AnnounceSpells = {
	108200,	-- Remorseless Winter
	55233,	-- Vampiric Blood
	48792,	-- Icebound Fortitude
	48707,	-- Anti-Magic Shell
	61999,	-- Raise Ally
		
	115178,	-- Resuscitate
	
	20707,	-- SoulStone
	109773, -- Soulwell
}

local AnnounceTo = PARTY
local Announce = T.AnnounceSpells

local Name = UnitName( "player" )
local GUID = UnitGUID( "player" )
local format = string.format
local tremove = tremove
local tinsert = tinsert
local unpack = unpack
local select = select
local UnitAura = UnitAura
local SendChatMessage = SendChatMessage
local WaitTable = {}

local OnUpdate = function( self, elapsed )
	local Count = #WaitTable
	local i = 1

	while ( i <= Count ) do
		local Table = tremove( WaitTable, i )
		local Delay = tremove( Table, 1 )
		local Func = tremove( Table, 1 )
		local Args = tremove( Table, 1 )

		if( Delay > elapsed ) then
			tinsert( WaitTable, i, {
				Delay - elapsed, Func, Args
			} )
			i = i + 1
		else
			Count = Count - 1
			Func( unpack( Args ) )
		end
	end
end

local Delay = function( delay, func, ... )
	if( type( delay ) ~= "number" or type( func ) ~= "function" ) then
		return false
	end

	if( not AutoAnnounceWaitFrame ) then
		local WaitFrame = CreateFrame( "Frame", "AutoAnnounceWaitFrame", UIParent )
		WaitFrame:SetScript( "OnUpdate", OnUpdate )
	end

	tinsert( WaitTable, {
		delay, func, { ... } 
	} )
	return true
end

local OnEvent = function( self, event, ... )
	local Time, Type, HideCaster, SourceGUID, SourceName, SourceFlags, SourceRaidFlags, DestGUID, DestName, DestFlags, DestRaidFlags, SpellID, SpellName = ...

	if( SourceGUID ~= GUID ) then
		return
	end

	if(Announce[SpellID] and Type == "SPELL_CAST_SUCCESS") then
		if( not DestName ) then
			DestName = SourceName
		end

		local Duration = select( 6, UnitAura( DestName, SpellName ) )
		local SpellString = "\124cff71d5ff\124Hspell:" .. SpellID .. "\124h[" .. SpellName .. "]\124h\124r"

		if( DestName ~= Name ) then
			if( Duration == nil ) then
				SendChatMessage( SpellString .. " is up on " .. DestName .. "!", AnnounceTo )
			else
				SendChatMessage( SpellString .. " is up on " .. DestName .. " for " .. Duration .. " seconds!", AnnounceTo )
			end
		else
			SendChatMessage( SpellString .. " is up for " .. Duration .. " seconds!", AnnounceTo )
		end

		Delay( Duration, SendChatMessage, SpellString .. " is down.", AnnounceTo )
	end
end

local AnnounceFrame = CreateFrame( "Frame" )
AnnounceFrame:RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED" )
AnnounceFrame:SetScript( "OnEvent", OnEvent )

local ValidTypes = {
	["SAY"] = true,
	["YELL"] = true,
	["RAID"] = true,
	["PARTY"] = true,
	["BATTLEGROUND"] = true,
}

local SetAnnounceTo = function( msg )
	local ChatType = msg:upper()

	if( not ValidTypes[ChatType] ) then
		print( msg .. " |cff00AAFFis not a valid option|r." )
		print( "|cff00AAFFPlease choose|r SAY/RAID/PARTY/BATTLEGROUND." )
	else
		AnnounceTo = ChatType
		print( "|cff00AAFFAutoAnnounce set to|r " .. msg )
	end
end

SLASH_AUTOANNOUNCE1 = "/Announce"
SlashCmdList["AUTOANNOUNCE"] = SetAnnounceTo
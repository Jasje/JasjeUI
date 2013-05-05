local T, C, L, G = unpack( Tukui )
	
---------------------------------------------------------------------------------------------
-- AddOn Name: AsphyxiaUI 6.0.0
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: AsphyxiaUI, Editied Tukui Layout
---------------------------------------------------------------------------------------------
local width, height, showParty, showRaid, showPlayer, xOffset, yOffset, point, columnSpacing, columnAnchorPoint

	if C.unitframes.gridvertical then
		point = "TOP"
		columnAnchorPoint = "LEFT"
		pa1, pa2, px, py = "TOPLEFT", "TOPRIGHT", 3, 0
	else
		point = "LEFT"
		columnAnchorPoint = "TOP"
		pa1, pa2, px, py = "TOPLEFT", "BOTTOMLEFT", 0, -3
	end
	
	width = T.Scale(68)
	height = T.Scale(30)	

	T.RaidFrameAttributes = function()
		return
		"TukuiRaid",
		nil,
		"custom [petbattle] hide;show",
		"oUF-initialConfigFunction", [[
			local header = self:GetParent()
			self:SetWidth( header:GetAttribute( "initial-width" ) )
			self:SetHeight( header:GetAttribute( "initial-height" ) )
		]],
		"initial-width", T.Scale(width),
		"initial-height", T.Scale(height),
		"showParty", false,
		"showRaid", true,
		"showPlayer", true,
		"showSolo", false,
		"xoffset", T.Scale(7),
		"yOffset", T.Scale(-7),
		"point", point,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"maxColumns", 8,
		"unitsPerColumn", 5,
		"columnSpacing", T.Scale(7),
		"columnAnchorPoint", columnAnchorPoint
	end

T.PostUpdateRaidUnit = function( self )
	------------------------------
	-- misc
	------------------------------
	self.panel:Kill()
	self:SetBackdropColor( 0.0, 0.0, 0.0, 0.0 )

	local panel = CreateFrame( "Frame", nil, self )
	panel:SetTemplate( "Transparent" )
	panel:Point( "TOPRIGHT", self, "TOPRIGHT", 2, 2 )
	panel:Point( "BOTTOMLEFT", self, "BOTTOMLEFT", -2, -2 )
	panel:SetFrameLevel( 1 )
	self.panel = panel

	------------------------------
	-- health
	------------------------------
	self.Health:ClearAllPoints()
	self.Health:SetAllPoints( self )
	self.Health:SetStatusBarTexture( C["media"]["Glamour"] )
	self.Health:SetFrameLevel( 2 )
	self.Health.colorDisconnected = false
	self.Health.colorClass = false
	self.Health:SetStatusBarColor( 0.2, 0.2, 0.2, 1 )
	self.Health.bg:SetTexture( 0.6, 0.6, 0.6 )
	self.Health.bg:SetVertexColor( 0, 0, 0 )

	self.Health.value:Point( "CENTER", self.Health, 1, -1 )
	self.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")

	self.Health.PostUpdate = T.PostUpdateHealthRaid
	self.Health.frequentUpdates = true

	if C["unitframes"].unicolor == true then
		self.Health.colorTapping = false
		self.Health.colorDisconnected = false
		self.Health.colorClass = false
		self.Health:SetStatusBarColor(.3, .3, .3, 1)
		self.Health.bg:SetVertexColor(.1, .1, .1, 1)		
	else
		self.Health.colorDisconnected = true
		self.Health.colorTapping = true	
		self.Health.colorClass = true
		self.Health.colorReaction = true			
	end
	--[[
	if(C["unitframes"].gradienthealth == true and C["unitframes"].unicolor == true) then
		self:HookScript( "OnEnter", function( self )
			if(not UnitIsConnected(self.unit) or UnitIsDead(self.unit) or UnitIsGhost(self.unit)) then return end
			local hover = RAID_CLASS_COLORS[select(2, UnitClass(self.unit))]
			-- if( not hover ) then return end
			self.Health:SetStatusBarColor(hover.r, hover.g, hover.b)
			self.Health.classcolored = true
		end)

		self:HookScript( "OnLeave", function(self)
			if(not UnitIsConnected(self.unit) or UnitIsDead(self.unit) or UnitIsGhost(self.unit)) then return end
			local r, g, b = oUFTukui.ColorGradient(UnitHealth(self.unit), UnitHealthMax(self.unit), unpack(C["unitframes"].gradient))
			self.Health:SetStatusBarColor(r, g, b)
			self.Health.classcolored = false
		end)
	end
]]--
	------------------------------
	-- name
	------------------------------
	self.Name:SetParent( self.Health )
	self.Name:ClearAllPoints()
	self.Name:SetPoint( "TOP", 0, 18 )
	self.Name:SetPoint( "BOTTOM" )
	self.Name:SetPoint( "LEFT", 4, 0 )
	self.Name:SetPoint( "RIGHT" )
	self.Name:SetShadowOffset( 1.25, -1.25 )
	self.Name:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")

	-----------------------------
	-- power
	------------------------------
	self.Power:ClearAllPoints()
	self.Power:SetPoint( "CENTER", self.Health, "CENTER", 0, -10 )
	self.Power:SetHeight(2)
	self.Power:SetWidth(55)
	self.Power:SetFrameLevel( self.Health:GetFrameLevel() + 2 )
    self.Power:SetBorder()
--	------------------------------
	-- debuffs
	------------------------------
	if( C["unitframes"]["raidunitdebuffwatch"] == true ) then
		self.RaidDebuffs:Height(24)
		self.RaidDebuffs:Width(24)
		self.RaidDebuffs:Point( "CENTER", self.Health, 1, 0)

		self.RaidDebuffs.count:ClearAllPoints()
		self.RaidDebuffs.count:SetPoint( "CENTER", self.RaidDebuffs, 0,2)
		self.RaidDebuffs.count:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")

		self.RaidDebuffs.time:ClearAllPoints()
		self.RaidDebuffs.time:SetPoint( "CENTER", self.RaidDebuffs, 0, 0 )
		self.RaidDebuffs.time:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
	end

	------------------------------
	-- icons
	------------------------------
	local leader = self.Health:CreateTexture( nil, "OVERLAY" )
	leader:Height( 12 * T.raidscale )
	leader:Width( 12 * T.raidscale )
	leader:SetPoint( "TOPLEFT", 0, 6 )
	self.Leader = leader

	local MasterLooter = self.Health:CreateTexture( nil, "OVERLAY" )
	MasterLooter:Height( 12 * T.raidscale )
	MasterLooter:Width( 12 * T.raidscale )
	self.MasterLooter = MasterLooter
	self:RegisterEvent( "PARTY_LEADER_CHANGED", T.MLAnchorUpdate )
	self:RegisterEvent( "PARTY_MEMBERS_CHANGED", T.MLAnchorUpdate )

	local Resurrect = CreateFrame( "Frame", nil, self.Health )
	Resurrect:SetFrameLevel( self.Health:GetFrameLevel() + 1 )
	Resurrect:Size( 20 )
	Resurrect:SetPoint( "CENTER" )

	local ResurrectIcon = Resurrect:CreateTexture( nil, "OVERLAY" )
	ResurrectIcon:SetAllPoints()
	ResurrectIcon:SetDrawLayer( "OVERLAY", 7 )
	self.ResurrectIcon = ResurrectIcon
end

local JasjeUIRaidPosition = CreateFrame( "Frame" )
JasjeUIRaidPosition:RegisterEvent( "PLAYER_LOGIN" )
JasjeUIRaidPosition:SetScript( "OnEvent", function( self, event )
	local raid = G.UnitFrames.RaidUnits
	raid:ClearAllPoints()

	if( C["unitframes"]["showraidpets"] == true ) then
		local pets = G.UnitFrames.RaidPets
		pets:ClearAllPoints()
	end

	raid:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 18, -18)
end )

local MaxGroup = CreateFrame( "Frame" )
MaxGroup:RegisterEvent( "PLAYER_ENTERING_WORLD" )
MaxGroup:RegisterEvent( "ZONE_CHANGED_NEW_AREA" )
MaxGroup:SetScript( "OnEvent", function( self )
	local inInstance, instanceType = IsInInstance()
	local _, _, _, _, maxPlayers, _, _ = GetInstanceInfo()

	if( inInstance and instanceType == "raid" and maxPlayers ~= 40 ) then
		G.UnitFrames.RaidUnits:SetAttribute( "groupFilter", "1,2,3,4,5" )
	else
		G.UnitFrames.RaidUnits:SetAttribute( "groupFilter", "1,2,3,4,5,6,7,8" )
	end
end )
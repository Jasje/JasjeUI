local ADDON_NAME, ns = ...
local oUF = oUFTukui or oUF
assert(oUF, "Tukui was unable to locate oUF install.")

ns._Objects = {}
ns._Headers = {}

local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["unitframes"].enable == true then return end

local font2 = C["media"].uffont
local font1 = C["media"].font
local pixelfont = C["media"].pixelfont

local function Shared(self, unit)
	self.colors = T.oUF_colors
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)

	self.menu = T.SpawnMenu

	self:SetBackdrop({bgFile = C["media"].blank, insets = {top = -T.mult, left = -T.mult, bottom = -T.mult, right = -T.mult}})
	self:SetBackdropColor(0.1, 0.1, 0.1)

	local health = CreateFrame('StatusBar', nil, self)
    health:SetAllPoints(self)
	health:SetStatusBarTexture(C["media"].normTex)
	self.Health = health

	health.bg = self.Health:CreateTexture(nil, 'BORDER')
	health.bg:SetAllPoints(self.Health)
	health.bg:SetTexture(C["media"].blank)
	health.bg:SetTexture(0.3, 0.3, 0.3)
	health.bg.multiplier = (0.3)

	self.Health.bg = health.bg

	health.PostUpdate = T.PostUpdatePetColor
	health.frequentUpdates = true

	if C.unitframes.unicolor == true then
		health.colorDisconnected = false
		health.colorClass = false
		health:SetStatusBarColor(.3, .3, .3, 1)
		health.bg:SetVertexColor(.1, .1, .1, 1)		
	else
		health.colorDisconnected = true
		health.colorClass = true
		health.colorReaction = true			
	end
	
	-- border
	local Healthbg = CreateFrame("Frame", nil, self)
	Healthbg:Point("TOPLEFT", self, "TOPLEFT", T.Scale(-2), T.Scale(2))
	Healthbg:Point("BOTTOMRIGHT", self, "BOTTOMRIGHT", T.Scale(2), T.Scale(-2))
	Healthbg:SetTemplate("Hydra")
	Healthbg:CreateShadow("Hydra")
	Healthbg:SetBackdropBorderColor(unpack(C["media"].altbordercolor))
	Healthbg:SetFrameLevel(2)
	self.Healthbg = Healthbg
	-- end border	
	
	-- hydra glow
	if C.unitframes.gradienthealth and C.unitframes.unicolor then
		self:HookScript("OnEnter", function(self) -- Mouseover coloring
			if not UnitIsConnected(self.unit) or UnitIsDead(self.unit) or UnitIsGhost(self.unit) then return end
			local hover = RAID_CLASS_COLORS[select(2, UnitClass(self.unit))]
			if not hover then return end
			health:SetStatusBarColor(hover.r, hover.g, hover.b)
		end)
		
		self:HookScript("OnLeave", function(self)
			if not UnitIsConnected(self.unit) or UnitIsDead(self.unit) or UnitIsGhost(self.unit) then return end
			local r, g, b = oUF.ColorGradient(UnitHealth(self.unit)/UnitHealthMax(self.unit), unpack(C["unitframes"].gradient))
			health:SetStatusBarColor(r, g, b)
		end)
	end
	-- end hydra glow

	local name = health:CreateFontString(nil, 'OVERLAY')
	name:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
	name:Point("LEFT", self, "RIGHT", 5, 0)
	self:Tag(name, '[Tukui:namemedium] [Tukui:dead][Tukui:afk]')
	self.Name = name

	if C["unitframes"].showsymbols == true then
		RaidIcon = health:CreateTexture(nil, 'OVERLAY')
		RaidIcon:Height(14*T.raidscale)
		RaidIcon:Width(14*T.raidscale)
		RaidIcon:SetPoint("CENTER", self, "CENTER")
		RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\raidicons.blp") -- thx hankthetank for texture
		self.RaidIcon = RaidIcon
	end

	if C["unitframes"].aggro == true then
		table.insert(self.__elements, T.UpdateThreat)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
    end

	local ReadyCheck = health:CreateTexture(nil, "OVERLAY")
	ReadyCheck:Height(12*T.raidscale)
	ReadyCheck:Width(12*T.raidscale)
	ReadyCheck:SetPoint('CENTER')
	self.ReadyCheck = ReadyCheck

	--local picon = self.Health:CreateTexture(nil, 'OVERLAY')
	--picon:SetPoint('CENTER', self.Health)
	--picon:SetSize(16, 16)
	--picon:SetTexture[[Interface\AddOns\Tukui\medias\textures\picon]]
	--picon.Override = T.Phasing
	--self.PhaseIcon = picon

	self.DebuffHighlightAlpha = 1
	self.DebuffHighlightBackdrop = true
	self.DebuffHighlightFilter = true

	if C["unitframes"].showsmooth == true then
		health.Smooth = true
	end
	
	------------------------------------------------------------------------
	--      Debuff Highlight
	------------------------------------------------------------------------
		local dbh = self.Health:CreateTexture(nil, "OVERLAY", Healthbg)
		dbh:SetAllPoints(self)
		dbh:SetTexture(C["media"].normTex)
		dbh:SetBlendMode("ADD")
		dbh:SetVertexColor(0,0,0,0)
		self.DebuffHighlight = dbh
		self.DebuffHighlightFilter = true
		self.DebuffHighlightAlpha = 0.2
	-- end		

	if C["unitframes"].showrange == true then
		local range = {insideAlpha = 1, outsideAlpha = C["unitframes"].raidalphaoor}
		self.Range = range
	end

	return self
end
    -- switch layout
	local swlicon = CreateFrame("Frame", "TukuiSwitchLayoutIcon", UIParent)
	swlicon:CreatePanel("Default", 20, 20, "LEFT", TukuiInfoLeft, "RIGHT", 3, 0)
	swlicon:SetFrameStrata("BACKGROUND")
	swlicon:SetFrameLevel(2)
	swlicon:CreateShadow("Hydra")

	local tex = swlicon:CreateTexture(nil, "OVERLAY")
	tex:SetTexture(C.media.switchlayoutdd)
	tex:SetPoint("TOPLEFT", swlicon, "TOPLEFT",  2, -2)
	tex:SetPoint("BOTTOMRIGHT", swlicon, "BOTTOMRIGHT", -2, 2)

oUF:RegisterStyle('TukuiDpsRaid', Shared)
oUF:Factory(function(self)
	oUF:SetActiveStyle("TukuiDpsRaid")

	local raid = self:SpawnHeader("TukuiDpsRaid", nil, "raid,party,solo", 
		'oUF-initialConfigFunction', [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute('initial-width'))
			self:SetHeight(header:GetAttribute('initial-height'))
		]],
		'initial-width', T.Scale(145),
		'initial-height', T.Scale(16),	
		"showSolo", C.unitframes.showplayersolo and true or false,
		"showParty", true,
		"showPlayer", C["unitframes"].showplayerinparty,
		"showRaid", true,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"yOffset", T.Scale(-6),
		"point", "TOP"
	)
	raid:SetPoint('BOTTOMLEFT', ChatFrame1, "TOPLEFT", 0, 75)
end)
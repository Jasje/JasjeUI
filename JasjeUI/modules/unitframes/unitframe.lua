local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end

---------------------------------------------------------------
-- UnitFrames
---------------------------------------------------------------
local units = {
	"Player",
	"Target",
	"TargetTarget",
	"Pet",
	"Focus",
}

for _, frame in pairs(units) do
	local t = "Tukui"
	local self = _G[t..frame]
	local unit = string.lower(frame)

	self:SetBackdrop(nil)
	self:SetBackdropColor(0, 0, 0)
	
    if self.shadow then
		self.shadow:Kill()
	end

	if unit == "player" then	
        self.panel:ClearAllPoints()
		self.panel:SetPoint("TOP", self, "BOTTOM", 0, 16)
		self.panel:SetHeight(12)
		self.panel:SetWidth(224)

        self:Size(220, 50)

		self.Health:Size(220, 19)
		self.Power:Size(220, 3)	
		self.Health:SetStatusBarTexture(C["media"].Glamour)
		
		self.Power:ClearAllPoints()
		self.Power:Point("LEFT", self.Health, "BOTTOMLEFT", 0, -9)
		self.Power:SetFrameLevel(3)
		self.Health:SetFrameLevel(5)
	
        self.Health:CreateBorder(true)
        self.Power:CreateBorder(true)
		
		self:ClearAllPoints()
		self:SetPoint("BOTTOMRIGHT", TukuiBar1, "TOPLEFT", 60, 160)

		self.Power.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		self.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		
		self.Health.colorTapping = false
	    self.Health.colorDisconnected = false
	    self.Health.colorClass = false
	    self.Health:SetStatusBarColor(.2, .2, .2, 1)
	    self.Health.bg:SetTexture(.6, .6, .6)
	    self.Health.bg:SetVertexColor(0, 0, 0)
		
		self.CombatFeedbackText:Kill()
		self.Status:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		self.FlashInfo.ManaLevel:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		
		self.Castbar:ClearAllPoints()
        self.Castbar:SetHeight(T.Scale(25))
        self.Castbar:Width(TukuiBar1:GetWidth() -34)
		
	    local Spark = self.Castbar:CreateTexture(nil, "OVERLAY")
        Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
        Spark:SetVertexColor(1, 1, 1)
        Spark:SetBlendMode("ADD")
        Spark:Width(14) 
        Spark:Height(self.Castbar:GetHeight() * 2)
        Spark:Point("LEFT", self.Castbar:GetStatusBarTexture(), "RIGHT", -6, 0)

        self.Castbar.Spark = Spark
		
	if C.actionbar.jasje then
		self.Castbar:Point("BOTTOM", TukuiBar4, "TOP", 15, 4)
	else
        self.Castbar:Point("BOTTOM", InvTukuiActionBarBackground, "TOP", 15, 4)
	end
		self.Castbar:SetStatusBarTexture(C["media"].Glamour)
		
        self.Castbar:CreateBackdrop()
        self.Castbar:SetBorder()
		self.Castbar.bg:SetVertexColor(.1, .1, .1)

		self.Castbar.button:ClearAllPoints()		
		self.Castbar.button:SetPoint("LEFT", -32, T.Scale(0))
		self.Castbar.button:Size(29)
		self.Castbar.button.shadow:Kill()

		self.Castbar.CustomTimeText = T.CustomCastTimeText
	    self.Castbar.CustomDelayText = T.CustomCastDelayText
        self.Castbar.PostCastStart = T.PostCastStart
        self.Castbar.PostChannelStart = T.PostCastStart
		
        self.Castbar.Time = T.SetFontString(self.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)
		
        self.Castbar.Text = T.SetFontString(self.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)
		
		-- experience bar on player via mouseover for player currently levelling a character
    if T.level ~= MAX_PLAYER_LEVEL then
        self.Experience:Width(T.InfoLeftRightWidth-4)
	    self.Experience:Height(1)
	    self.Experience:ClearAllPoints()
	    self.Experience:Point("BOTTOM", TukuiInfoRight, "BOTTOM", 0, -4)
	    self.Experience:SetFrameLevel(12)
	    self.Experience:SetAlpha(1)
	    self.Experience:SetStatusBarTexture(C["media"].Glamour)
	    self.Experience:HookScript("OnLeave", function(self) self:SetAlpha(1) end)

	    local xpBG = CreateFrame("Frame", nil, self.Experience)
	    xpBG:CreatePanel("Transparent", self.Experience:GetWidth(), self.Experience:GetHeight(), "TOPLEFT", self.Experience, "TOPLEFT", -2, 2)
	    xpBG:Point("BOTTOMRIGHT", self.Experience, "BOTTOMRIGHT", 2, -2)	

		self.Resting:Kill()
    end

-- reputation bar for max level character
    if T.level == MAX_PLAYER_LEVEL then
	    self.Reputation:Width(T.InfoLeftRightWidth-4)
	    self.Reputation:Height(1)
	    self.Reputation:ClearAllPoints()
	    self.Reputation:Point("BOTTOM", TukuiInfoRight, "BOTTOM", 0, -4)
	    self.Reputation:SetFrameLevel(10)
	    self.Reputation:SetAlpha(1)
	    self.Reputation:SetStatusBarTexture(C["media"].Glamour)
	    self.Reputation:HookScript("OnLeave", function(self) self:SetAlpha(1) end)

	    local repBG = CreateFrame("Frame", nil, self.Reputation)
	    repBG:CreatePanel("Transparent", self.Reputation:GetWidth(), self.Reputation:GetHeight(), "TOPLEFT", self.Reputation, "TOPLEFT", -2, 2)
	    repBG:Point("BOTTOMRIGHT", self.Reputation, "BOTTOMRIGHT", 2, -2)
    end
end
	
	if unit == "target" then
	    self.panel:ClearAllPoints()
        self.panel:SetPoint("TOP", self, "BOTTOM", 0, 16)
		self.panel:SetHeight(12)
		self.panel:SetWidth(224)

        self:Size(220, 50)

		self.Health:Size(220, 19)
		self.Power:Size(220, 3)	
		self.Health:SetStatusBarTexture(C["media"].Glamour)
		
		self.Power:ClearAllPoints()
		self.Power:Point("LEFT", self.Health, "BOTTOMLEFT", 0, -9)
		self.Power:SetFrameLevel(3)
		self.Health:SetFrameLevel(5)
	
        self.Health:CreateBorder(true)
        self.Power:CreateBorder(true)
		
		self.Debuffs:SetHeight(26)
		self.Debuffs:SetWidth(220)
		self.Debuffs.size = 26
		self.Debuffs.num = 8
		self.Debuffs.spacing = 2
		
		self.Buffs:SetHeight(26)
		self.Buffs:SetWidth(220)
		self.Buffs.size = 26
		self.Buffs.num = 8
		self.Buffs.spacing = 2
		
		self:ClearAllPoints()
		self:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPRIGHT", -60, 160)

		self.Name:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		self.Power.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		self.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		
		self.Health.colorTapping = false
	    self.Health.colorDisconnected = false
	    self.Health.colorClass = false
	    self.Health:SetStatusBarColor(.2, .2, .2, 1)
	    self.Health.bg:SetTexture(.6, .6, .6)
	    self.Health.bg:SetVertexColor(0, 0, 0)
		
		self.CombatFeedbackText:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		
		self.Castbar:ClearAllPoints()
        self.Castbar:Size(220, 18)
        self.Castbar:Point("BOTTOM", TukuiTarget, "TOP", 0, 70)
		self.Castbar:SetStatusBarTexture(C["media"].Glamour)

		self.Castbar:CreateBackdrop()
		self.Castbar:SetBorder()

		self.Castbar.button:ClearAllPoints()		
		self.Castbar.button:Point("CENTER", 0, 25)
		self.Castbar.button:Size(26)

		self.Castbar.CustomTimeText = T.CustomCastTimeText
	    self.Castbar.CustomDelayText = T.CustomCastDelayText
        self.Castbar.PostCastStart = T.PostCastStart
        self.Castbar.PostChannelStart = T.PostCastStart
		
		self.Castbar.Time = T.SetFontString(self.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)
		
        self.Castbar.Text = T.SetFontString(self.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)
		
		local buffs = self.Buffs
		local debuffs = self.Debuffs
		    buffs:ClearAllPoints()
		    buffs:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 4)

		    debuffs:ClearAllPoints()
		    debuffs:Point("BOTTOMLEFT", buffs, "TOPLEFT", -30, 2)

		    if buffs or debuffs then
			    for _, f in pairs({buffs, debuffs}) do
			    	if not f then return end
				    f:Size(252, 26)
				    f.size = 26
				    f.num = 8
				    hooksecurefunc(f, "PostCreateIcon", T.SkinAura)
			    end
		    end
	end
	
	if unit == "targettarget" then
		self.panel:ClearAllPoints()
        self.panel:SetPoint("TOP", self, "BOTTOM", 0, 26)
		self.panel:SetHeight(12)
		self.panel:SetWidth(104)

        self:Size(100, 50)

		self.Health:Size(220, 19)
		self.Health:SetStatusBarTexture(C["media"].Glamour)

        self.Health:CreateBorder(true)

		self:ClearAllPoints()
		self:SetPoint("TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -7)

		self.Name:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")

		self.Health.colorTapping = false
	    self.Health.colorDisconnected = false
	    self.Health.colorClass = false
	    self.Health:SetStatusBarColor(.2, .2, .2, 1)
	    self.Health.bg:SetTexture(.6, .6, .6)
	    self.Health.bg:SetVertexColor(0, 0, 0)
	end
	
	if unit == "pet" then
		self.panel:ClearAllPoints()
        self.panel:SetPoint("TOP", self, "BOTTOM", 0, 26)
		self.panel:SetHeight(12)
		self.panel:SetWidth(104)

		self.Power:Kill()
		
        self:Size(100, 50)

		self.Health:Size(220, 19)
		self.Health:SetStatusBarTexture(C["media"].Glamour)

        self.Health:CreateBorder(true)

		self:ClearAllPoints()
		self:SetPoint("TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -7)

		self.Name:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")

		self.Health.colorTapping = false
	    self.Health.colorDisconnected = false
	    self.Health.colorClass = false
	    self.Health:SetStatusBarColor(.2, .2, .2, 1)
	    self.Health.bg:SetTexture(.6, .6, .6)
	    self.Health.bg:SetVertexColor(0, 0, 0)
	end
	
	if unit == "focus" then
        local panel = CreateFrame("Frame", nil, self)
		panel:Size(224,13)
		panel:Point("TOP", self, "BOTTOM", 0,18)
		panel:SetTemplate("")
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		self.panel = panel
	
        self:Size(220, 40)

		self.Health:Size(220, 19)
		self.Health:SetStatusBarTexture(C["media"].Glamour)
		
		self.Power:Hide()
		self.Health:SetFrameLevel(5)
	
        self.Health:CreateBorder(true)
		
		self:ClearAllPoints()
		self:SetPoint("BOTTOMLEFT", TukuiPlayer, "TOPLEFT", 0, 12)

		self.Name:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		self.Name:ClearAllPoints()
		self.Name:Point("CENTER", panel, 0, 0)
		
		self.Power.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		self.Power.value:ClearAllPoints()
		self.Power.value:Point("LEFT", panel, "LEFT", 4, -0)
		
		self.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		self.Health.value:ClearAllPoints()
		self.Health.value:Point("RIGHT", panel, "RIGHT", -4, -0)	
		
		self.Health.colorTapping = false
	    self.Health.colorDisconnected = false
	    self.Health.colorClass = false
	    self.Health:SetStatusBarColor(.2, .2, .2, 1)
	    self.Health.bg:SetTexture(.6, .6, .6)
	    self.Health.bg:SetVertexColor(0, 0, 0)
		-- castbar
		self.Castbar:ClearAllPoints()
        self.Castbar:Size(380, 25)
        self.Castbar:Point("CENTER", UIParent, 0,160)
		self.Castbar:SetStatusBarTexture(C["media"].Glamour)

		self.Castbar:CreateBackdrop()
		self.Castbar:SetBorder()
	
		self.Castbar.button:ClearAllPoints()		
		self.Castbar.button:Point("CENTER", 0, 38)
		self.Castbar.button:Size(40)

		self.Castbar.CustomTimeText = T.CustomCastTimeText
	    self.Castbar.CustomDelayText = T.CustomCastDelayText
        self.Castbar.PostCastStart = T.PostCastStart
        self.Castbar.PostChannelStart = T.PostCastStart
		
		self.Castbar.Time = T.SetFontString(self.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)
		
        self.Castbar.Text = T.SetFontString(self.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)
		
		local debuffs = self.Debuffs
			debuffs:ClearAllPoints()
			debuffs:Point('RIGHT', self, 'LEFT', -4, 3)

			if debuffs then
				for _, f in pairs({debuffs}) do
					if not f then return end
					f:Size(300,37)
					f.size = 37
					f.num = 5
					hooksecurefunc(f, "PostCreateIcon", T.SkinAura)
				end
			end
	end
end
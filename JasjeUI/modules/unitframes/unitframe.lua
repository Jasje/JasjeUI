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
		self:SetPoint("BOTTOMRIGHT", TukuiBar1, "TOPLEFT", -8, 200)

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
        self.Castbar:SetHeight(T.Scale(25))
        self.Castbar:Width(TukuiBar1:GetWidth() -34)
        self.Castbar:Point("BOTTOM", InvTukuiActionBarBackground, "TOP", 15, 4)
		self.Castbar:SetStatusBarTexture(C["media"].Glamour)
		
        self.Castbar:CreateBorder(true)

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

		self:ClearAllPoints()
		self:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPRIGHT", 8, 200)

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
        self.Castbar:SetHeight(T.Scale(25))
        self.Castbar:Size(220, 18)
        self.Castbar:Point("BOTTOM", TukuiTarget, "TOP", 0, 70)
		self.Castbar:SetStatusBarTexture(C["media"].Glamour)
		
        self.Castbar:CreateBorder(true)

		self.Castbar.button:ClearAllPoints()		
		self.Castbar.button:SetPoint("CENTER", 0, T.Scale(28))
		self.Castbar.button:Size(26)
		self.Castbar.button.shadow:Kill()

		self.Castbar.CustomTimeText = T.CustomCastTimeText
	    self.Castbar.CustomDelayText = T.CustomCastDelayText
        self.Castbar.PostCastStart = T.PostCastStart
        self.Castbar.PostChannelStart = T.PostCastStart
		
        self.Castbar.Time = T.SetFontString(self.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        self.Castbar.Time:Point("RIGHT", self.Castbar, "RIGHT", -4, 0)
		
        self.Castbar.Text = T.SetFontString(self.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        self.Castbar.Text:Point("LEFT", self.Castbar, "LEFT", 4, 0)
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
		panel:Point("TOP", self, "BOTTOM", 0,16)
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
		self:SetPoint("BOTTOMLEFT", TukuiPlayer, "TOPLEFT", 0, 5)

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
	end
end
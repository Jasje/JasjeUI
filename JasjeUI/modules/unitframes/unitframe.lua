local T, C, L, G = unpack(Tukui) 
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
        G.UnitFrames.Player.panel:ClearAllPoints()
		G.UnitFrames.Player.panel:SetPoint("TOP", G.UnitFrames.Player, "BOTTOM", 0, 16)
		G.UnitFrames.Player.panel:SetHeight(12)
		G.UnitFrames.Player.panel:SetWidth(224)

        G.UnitFrames.Player:Size(220, 50)

		G.UnitFrames.Player.Health:Size(220, 19)
		G.UnitFrames.Player.Power:Size(220, 3)	
		G.UnitFrames.Player.Health:SetStatusBarTexture(C["media"].Glamour)
		
		G.UnitFrames.Player.Power:ClearAllPoints()
		G.UnitFrames.Player.Power:Point("LEFT", G.UnitFrames.Player.Health, "BOTTOMLEFT", 0, -9)
		G.UnitFrames.Player.Power:SetFrameLevel(3)
		G.UnitFrames.Player.Health:SetFrameLevel(5)
	
        G.UnitFrames.Player.Health:CreateBorder(true)
        G.UnitFrames.Player.Power:CreateBorder(true)
		
		G.UnitFrames.Player:ClearAllPoints()
		G.UnitFrames.Player:SetPoint("BOTTOMRIGHT", TukuiBar1, "TOPLEFT", 60, 160)

		G.UnitFrames.Player.Power.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		G.UnitFrames.Player.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		
		G.UnitFrames.Player.Health.colorTapping = false
	    G.UnitFrames.Player.Health.colorDisconnected = false
	    G.UnitFrames.Player.Health.colorClass = false
	    G.UnitFrames.Player.Health:SetStatusBarColor(.2, .2, .2, 1)
	    G.UnitFrames.Player.Health.bg:SetTexture(.6, .6, .6)
	    G.UnitFrames.Player.Health.bg:SetVertexColor(0, 0, 0)
		
		G.UnitFrames.Player.CombatFeedbackText:Kill()
		G.UnitFrames.Player.Status:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		G.UnitFrames.Player.FlashInfo.ManaLevel:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		
		G.UnitFrames.Player.Castbar:ClearAllPoints()
        G.UnitFrames.Player.Castbar:SetHeight(T.Scale(25))
        G.UnitFrames.Player.Castbar:Width(TukuiBar1:GetWidth() -34)
		
	    local Spark = G.UnitFrames.Player.Castbar:CreateTexture(nil, "OVERLAY")
        Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
        Spark:SetVertexColor(1, 1, 1)
        Spark:SetBlendMode("ADD")
        Spark:Width(14) 
        Spark:Height(G.UnitFrames.Player.Castbar:GetHeight() * 2)
        Spark:Point("LEFT", G.UnitFrames.Player.Castbar:GetStatusBarTexture(), "RIGHT", -6, 0)

        G.UnitFrames.Player.Castbar.Spark = Spark
		
	if C.actionbar.jasje then
		G.UnitFrames.Player.Castbar:Point("BOTTOM", TukuiBar4, "TOP", 15, 4)
	else
        G.UnitFrames.Player.Castbar:Point("BOTTOM", InvTukuiActionBarBackground, "TOP", 15, 4)
	end
		G.UnitFrames.Player.Castbar:SetStatusBarTexture(C["media"].Glamour)
		
        G.UnitFrames.Player.Castbar:CreateBackdrop()
        G.UnitFrames.Player.Castbar:SetBorder()
		G.UnitFrames.Player.Castbar.bg:SetVertexColor(.1, .1, .1)

		G.UnitFrames.Player.Castbar.button:ClearAllPoints()		
		G.UnitFrames.Player.Castbar.button:SetPoint("LEFT", -32, T.Scale(0))
		G.UnitFrames.Player.Castbar.button:Size(29)
		G.UnitFrames.Player.Castbar.button.shadow:Kill()

		G.UnitFrames.Player.Castbar.CustomTimeText = T.CustomCastTimeText
	    G.UnitFrames.Player.Castbar.CustomDelayText = T.CustomCastDelayText
        G.UnitFrames.Player.Castbar.PostCastStart = T.PostCastStart
        G.UnitFrames.Player.Castbar.PostChannelStart = T.PostCastStart
		
        G.UnitFrames.Player.Castbar.Time = T.SetFontString(G.UnitFrames.Player.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        G.UnitFrames.Player.Castbar.Time:Point("RIGHT", G.UnitFrames.Player.Castbar, "RIGHT", -4, 0)
		
        G.UnitFrames.Player.Castbar.Text = T.SetFontString(G.UnitFrames.Player.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        G.UnitFrames.Player.Castbar.Text:Point("LEFT", G.UnitFrames.Player.Castbar, "LEFT", 4, 0)
		
		-- experience bar on player via mouseover for player currently levelling a character
    if T.level ~= MAX_PLAYER_LEVEL then
        G.UnitFrames.Player.Experience:Width(T.InfoLeftRightWidth-4)
	    G.UnitFrames.Player.Experience:Height(1)
	    G.UnitFrames.Player.Experience:ClearAllPoints()
	    G.UnitFrames.Player.Experience:Point("BOTTOM", TukuiInfoRight, "BOTTOM", 0, -4)
	    G.UnitFrames.Player.Experience:SetFrameLevel(12)
	    G.UnitFrames.Player.Experience:SetAlpha(1)
	    G.UnitFrames.Player.Experience:SetStatusBarTexture(C["media"].Glamour)
	    G.UnitFrames.Player.Experience:HookScript("OnLeave", function(self) G.UnitFrames.Player:SetAlpha(1) end)

	    local xpBG = CreateFrame("Frame", nil, G.UnitFrames.Player.Experience)
		xpBG:Point("TOPLEFT", G.UnitFrames.Player.Experience, "TOPLEFT", -2, 2)
		xpBG:SetTemplate("Transparent")
		xpBG:Size(G.UnitFrames.Player.Experience:GetWidth(), G.UnitFrames.Player.Experience:GetHeight())
	    xpBG:Point("BOTTOMRIGHT", G.UnitFrames.Player.Experience, "BOTTOMRIGHT", 2, -2)	

		G.UnitFrames.Player.Resting:Kill()
    end

-- reputation bar for max level character
    if T.level == MAX_PLAYER_LEVEL then
	    G.UnitFrames.Player.Reputation:Width(T.InfoLeftRightWidth-4)
	    G.UnitFrames.Player.Reputation:Height(1)
	    G.UnitFrames.Player.Reputation:ClearAllPoints()
	    G.UnitFrames.Player.Reputation:Point("BOTTOM", TukuiInfoRight, "BOTTOM", 0, -4)
	    G.UnitFrames.Player.Reputation:SetFrameLevel(10)
	    G.UnitFrames.Player.Reputation:SetAlpha(1)
	    G.UnitFrames.Player.Reputation:SetStatusBarTexture(C["media"].Glamour)
	    G.UnitFrames.Player.Reputation:HookScript("OnLeave", function(self) G.UnitFrames.Player:SetAlpha(1) end)

	    local repBG = CreateFrame("Frame", nil, G.UnitFrames.Player.Reputation)
		repBG:Point("TOPLEFT", G.UnitFrames.Player.Reputation, "TOPLEFT", -2, 2)
		repBG:SetTemplate("Transparent")
		repBG:Size(G.UnitFrames.Player.Reputation:GetWidth(), G.UnitFrames.Player.Reputation:GetHeight())
	    repBG:Point("BOTTOMRIGHT", G.UnitFrames.Player.Reputation, "BOTTOMRIGHT", 2, -2)
    end
end
	
	if unit == "target" then
	    G.UnitFrames.Target.panel:ClearAllPoints()
        G.UnitFrames.Target.panel:SetPoint("TOP", G.UnitFrames.Target, "BOTTOM", 0, 16)
		G.UnitFrames.Target.panel:SetHeight(12)
		G.UnitFrames.Target.panel:SetWidth(224)

        G.UnitFrames.Target:Size(220, 50)

		G.UnitFrames.Target.Health:Size(220, 19)
		G.UnitFrames.Target.Power:Size(220, 3)	
		G.UnitFrames.Target.Health:SetStatusBarTexture(C["media"].Glamour)
		
		G.UnitFrames.Target.Power:ClearAllPoints()
		G.UnitFrames.Target.Power:Point("LEFT", G.UnitFrames.Target.Health, "BOTTOMLEFT", 0, -9)
		G.UnitFrames.Target.Power:SetFrameLevel(3)
		G.UnitFrames.Target.Health:SetFrameLevel(5)
	
        G.UnitFrames.Target.Health:CreateBorder(true)
        G.UnitFrames.Target.Power:CreateBorder(true)
		
		G.UnitFrames.Target.Debuffs:SetHeight(26)
		G.UnitFrames.Target.Debuffs:SetWidth(220)
		G.UnitFrames.Target.Debuffs.size = 26
		G.UnitFrames.Target.Debuffs.num = 8
		G.UnitFrames.Target.Debuffs.spacing = 2

		G.UnitFrames.Target.Buffs:SetHeight(26)
		G.UnitFrames.Target.Buffs:SetWidth(220)
		G.UnitFrames.Target.Buffs.size = 26
		G.UnitFrames.Target.Buffs.num = 8
		G.UnitFrames.Target.Buffs.spacing = 2

		G.UnitFrames.Target.Buffs:ClearAllPoints()
		G.UnitFrames.Target.Buffs:Point("BOTTOMLEFT", G.UnitFrames.Target.Health, "TOPLEFT", 0, 4)
		G.UnitFrames.Target.Buffs.ClearAllPoints = T.dummy
		G.UnitFrames.Target.Buffs.SetPoint = T.dummy

		G.UnitFrames.Target.Debuffs:ClearAllPoints()
		G.UnitFrames.Target.Debuffs:Point("BOTTOMRIGHT", G.UnitFrames.Target.Buffs, "TOPRIGHT", -30, 2)
		G.UnitFrames.Target.Debuffs.ClearAllPoints = T.dummy
		G.UnitFrames.Target.Debuffs.SetPoint = T.dummy

		for _, f in pairs({G.UnitFrames.Target.Buffs, G.UnitFrames.Target.Debuffs}) do
			if not f then return end
				f:Size(252,26)
				f.size = 26
				f.num = 8
				hooksecurefunc(f, "PostCreateIcon", T.SkinAura)
		end
		
		G.UnitFrames.Target:ClearAllPoints()
		G.UnitFrames.Target:SetPoint("BOTTOMLEFT", TukuiBar1, "TOPRIGHT", -60, 160)

		G.UnitFrames.Target.Name:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		G.UnitFrames.Target.Power.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		G.UnitFrames.Target.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		
		G.UnitFrames.Target.Health.colorTapping = false
	    G.UnitFrames.Target.Health.colorDisconnected = false
	    G.UnitFrames.Target.Health.colorClass = false
	    G.UnitFrames.Target.Health:SetStatusBarColor(.2, .2, .2, 1)
	    G.UnitFrames.Target.Health.bg:SetTexture(.6, .6, .6)
	    G.UnitFrames.Target.Health.bg:SetVertexColor(0, 0, 0)
		
		G.UnitFrames.Target.CombatFeedbackText:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		
		G.UnitFrames.Target.Castbar:ClearAllPoints()
        G.UnitFrames.Target.Castbar:Size(220, 18)
        G.UnitFrames.Target.Castbar:Point("BOTTOM", TukuiTarget, "TOP", 0, 70)
		G.UnitFrames.Target.Castbar:SetStatusBarTexture(C["media"].Glamour)

		G.UnitFrames.Target.Castbar:CreateBackdrop()
		G.UnitFrames.Target.Castbar:SetBorder()

		G.UnitFrames.Target.Castbar.button:ClearAllPoints()		
		G.UnitFrames.Target.Castbar.button:Point("CENTER", 0, 25)
		G.UnitFrames.Target.Castbar.button:Size(26)

		G.UnitFrames.Target.Castbar.CustomTimeText = T.CustomCastTimeText
	    G.UnitFrames.Target.Castbar.CustomDelayText = T.CustomCastDelayText
        G.UnitFrames.Target.Castbar.PostCastStart = T.PostCastStart
        G.UnitFrames.Target.Castbar.PostChannelStart = T.PostCastStart
		
		G.UnitFrames.Target.Castbar.Time = T.SetFontString(G.UnitFrames.Target.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        G.UnitFrames.Target.Castbar.Time:Point("RIGHT", G.UnitFrames.Target.Castbar, "RIGHT", -4, 0)
		
        G.UnitFrames.Target.Castbar.Text = T.SetFontString(G.UnitFrames.Target.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        G.UnitFrames.Target.Castbar.Text:Point("LEFT", G.UnitFrames.Target.Castbar, "LEFT", 4, 0)
    end
		
	if unit == "targettarget" then
		G.UnitFrames.TargetTarget.panel:ClearAllPoints()
        G.UnitFrames.TargetTarget.panel:SetPoint("TOP", G.UnitFrames.TargetTarget, "BOTTOM", 0, 26)
		G.UnitFrames.TargetTarget.panel:SetHeight(12)
		G.UnitFrames.TargetTarget.panel:SetWidth(104)

        G.UnitFrames.TargetTarget:Size(100, 50)

		G.UnitFrames.TargetTarget.Health:Size(220, 19)
		G.UnitFrames.TargetTarget.Health:SetStatusBarTexture(C["media"].Glamour)

        G.UnitFrames.TargetTarget.Health:CreateBorder(true)

		G.UnitFrames.TargetTarget:ClearAllPoints()
		G.UnitFrames.TargetTarget:SetPoint("TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -7)

		G.UnitFrames.TargetTarget.Name:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")

		G.UnitFrames.TargetTarget.Health.colorTapping = false
	    G.UnitFrames.TargetTarget.Health.colorDisconnected = false
	    G.UnitFrames.TargetTarget.Health.colorClass = false
	    G.UnitFrames.TargetTarget.Health:SetStatusBarColor(.2, .2, .2, 1)
	    G.UnitFrames.TargetTarget.Health.bg:SetTexture(.6, .6, .6)
	    G.UnitFrames.TargetTarget.Health.bg:SetVertexColor(0, 0, 0)
	end
	
	if unit == "pet" then
		G.UnitFrames.Pet.panel:ClearAllPoints()
        G.UnitFrames.Pet.panel:SetPoint("TOP", G.UnitFrames.Pet, "BOTTOM", 0, 26)
		G.UnitFrames.Pet.panel:SetHeight(12)
		G.UnitFrames.Pet.panel:SetWidth(104)

		G.UnitFrames.Pet.Power:Kill()
		
        G.UnitFrames.Pet:Size(100, 50)

		G.UnitFrames.Pet.Health:Size(220, 19)
		G.UnitFrames.Pet.Health:SetStatusBarTexture(C["media"].Glamour)

        G.UnitFrames.Pet.Health:CreateBorder(true)

		G.UnitFrames.Pet:ClearAllPoints()
		G.UnitFrames.Pet:SetPoint("TOPLEFT", TukuiPlayer, "BOTTOMLEFT", 0, -7)

		G.UnitFrames.Pet.Name:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		G.UnitFrames.Pet.Castbar.Time:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")		
        G.UnitFrames.Pet.Castbar.Text:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		
		G.UnitFrames.Pet.Health.colorTapping = false
	    G.UnitFrames.Pet.Health.colorDisconnected = false
	    G.UnitFrames.Pet.Health.colorClass = false
	    G.UnitFrames.Pet.Health:SetStatusBarColor(.2, .2, .2, 1)
	    G.UnitFrames.Pet.Health.bg:SetTexture(.6, .6, .6)
	    G.UnitFrames.Pet.Health.bg:SetVertexColor(0, 0, 0)
	end
	
	if unit == "focus" then
        local panel = CreateFrame("Frame", nil, G.UnitFrames.Focus)
		panel:Size(224,13)
		panel:Point("TOP", G.UnitFrames.Focus, "BOTTOM", 0,18)
		panel:SetTemplate("")
		panel:SetFrameLevel(2)
		panel:SetFrameStrata("MEDIUM")
		G.UnitFrames.Focus.panel = panel
	
        G.UnitFrames.Focus:Size(220, 40)

		G.UnitFrames.Focus.Health:Size(220, 19)
		G.UnitFrames.Focus.Health:SetStatusBarTexture(C["media"].Glamour)
		
		G.UnitFrames.Focus.Power:Hide()
		G.UnitFrames.Focus.Health:SetFrameLevel(5)
	
        G.UnitFrames.Focus.Health:CreateBorder(true)
		
		G.UnitFrames.Focus:ClearAllPoints()
		G.UnitFrames.Focus:SetPoint("BOTTOMLEFT", TukuiPlayer, "TOPLEFT", 0, 12)

		G.UnitFrames.Focus.Name:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		G.UnitFrames.Focus.Name:ClearAllPoints()
		G.UnitFrames.Focus.Name:Point("CENTER", panel, 0, 0)
		
		G.UnitFrames.Focus.Power.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		G.UnitFrames.Focus.Power.value:ClearAllPoints()
		G.UnitFrames.Focus.Power.value:Point("LEFT", panel, "LEFT", 4, -0)
		
		G.UnitFrames.Focus.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		G.UnitFrames.Focus.Health.value:ClearAllPoints()
		G.UnitFrames.Focus.Health.value:Point("RIGHT", panel, "RIGHT", -4, -0)	
		
		G.UnitFrames.Focus.Health.colorTapping = false
	    G.UnitFrames.Focus.Health.colorDisconnected = false
	    G.UnitFrames.Focus.Health.colorClass = false
	    G.UnitFrames.Focus.Health:SetStatusBarColor(.2, .2, .2, 1)
	    G.UnitFrames.Focus.Health.bg:SetTexture(.6, .6, .6)
	    G.UnitFrames.Focus.Health.bg:SetVertexColor(0, 0, 0)

		G.UnitFrames.Focus.Castbar:ClearAllPoints()
        G.UnitFrames.Focus.Castbar:Size(380, 25)
        G.UnitFrames.Focus.Castbar:Point("CENTER", UIParent, 0,160)
		G.UnitFrames.Focus.Castbar:SetStatusBarTexture(C["media"].Glamour)

		G.UnitFrames.Focus.Castbar:CreateBackdrop()
		G.UnitFrames.Focus.Castbar:SetBorder()
	
		G.UnitFrames.Focus.Castbar.button:ClearAllPoints()		
		G.UnitFrames.Focus.Castbar.button:Point("CENTER", 0, 38)
		G.UnitFrames.Focus.Castbar.button:Size(40)

		G.UnitFrames.Focus.Castbar.CustomTimeText = T.CustomCastTimeText
	    G.UnitFrames.Focus.Castbar.CustomDelayText = T.CustomCastDelayText
        G.UnitFrames.Focus.Castbar.PostCastStart = T.PostCastStart
        G.UnitFrames.Focus.Castbar.PostChannelStart = T.PostCastStart
		
		G.UnitFrames.Focus.Castbar.Time = T.SetFontString(G.UnitFrames.Focus.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        G.UnitFrames.Focus.Castbar.Time:Point("RIGHT", G.UnitFrames.Focus.Castbar, "RIGHT", -4, 0)
		
        G.UnitFrames.Focus.Castbar.Text = T.SetFontString(G.UnitFrames.Focus.Castbar, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
        G.UnitFrames.Focus.Castbar.Text:Point("LEFT", G.UnitFrames.Focus.Castbar, "LEFT", 4, 0)

		for _, f in pairs({G.UnitFrames.Focus.Debuffs}) do
			if not f then return end
				f:Size(300, 37)
				f.size = 37
				f.num = 5
				hooksecurefunc(f, "PostCreateIcon", T.SkinAura)
			end
		end
	end

local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if C.unitframes.enable ~= true then return end

-- Boss and Arena
for i = 1, 4 do
	self = _G["TukuiBoss"..i]

	local health = self.Health
	local power = self.Power
	local castbar = self.Castbar

	-- power
	power:ClearAllPoints()
	power:SetAllPoints()
	power.bg.multiplier = 0.3

	health:ClearAllPoints()
	health:SetPoint("TOPLEFT", power, "TOPLEFT", 2, -2)
	health:SetPoint("BOTTOMRIGHT", power, "BOTTOMRIGHT", -2, 2)
	health:CreateBorder(false, true)
	health:SetStatusBarColor(.2, .2, .2)
	health:SetFrameLevel(4)
	health:CreateShadow()

	health:SetStatusBarColor(.2, .2, .2, 1)
	health.bg:SetTexture(.6, .6, .6)
	health.bg:SetVertexColor(0, 0, 0)

	power.value = T.SetFontString(health, C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
	power.value:Point("BOTTOMLEFT", health, "BOTTOMLEFT", 2, 2)
	power.value:SetShadowColor(0,0,0,0)
	power.PreUpdate = T.PreUpdatePower
	power.PostUpdate = T.PostUpdatePower

	health.value = T.SetFontString(health, C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
	health.value:Point("BOTTOMRIGHT", health, "BOTTOMRIGHT", 0, 2)
	health.value:SetShadowColor(0,0,0,0)
	health.PostUpdate = T.PostUpdateHealth
--[[
	local percHP = T.SetFontString(self.Health, C.media.pixelfont, 8, "OUTLINEMONOCHROME")
	percHP:SetPoint("LEFT", self.Health, "LEFT", 5, -0)
	self:Tag(percHP, "[Tukui:perchp]")
    self.percHP = percHP
]]--	
	-- Unit name on target
	local Name = self.Name
	Name:ClearAllPoints()
	Name:Point("TOPLEFT", health, "TOPLEFT", 2, 0)
	Name:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
	
	castbar:ClearAllPoints()
	castbar:Point("TOP", self, "BOTTOM", 13, -5)
	
	castbar:SetHeight(20)
	castbar:SetWidth(171)
	castbar:SetStatusBarTexture(C["media"].Glamour)

	castbar.bg:SetTemplate("Transparent")
	castbar.bg:SetBorder()
	
	castbar.button:ClearAllPoints()
	castbar.button:Height(castbar:GetHeight()+3)
	castbar.button:Width(castbar:GetHeight()+3)
    castbar.button:Point("RIGHT", castbar, "LEFT",-4, 0)
	castbar.button:SetTemplate("Hydra")

	castbar.Text:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
	castbar.Text:SetParent(castbar)
	castbar.Text:ClearAllPoints()
	castbar.Text:SetPoint( "LEFT", castbar, "LEFT", 5, 0 )
	castbar.Text.ClearAllPoints = T.dummy
	castbar.Text.SetPoint = T.dummy

	castbar.CustomTimeText = T.CustomCastTimeText
	castbar.CustomDelayText = T.CustomCastDelayText
    castbar.PostCastStart = T.PostCastStart
    castbar.PostChannelStart = T.PostCastStart

	castbar.time:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
	castbar.time:SetParent(castbar)
	castbar.time:ClearAllPoints()
	castbar.time:SetPoint( "RIGHT", castbar, "RIGHT", -5, 0 )
	castbar.time.ClearAllPoints = T.dummy
	castbar.time.SetPoint = T.dummy
end
TukuiBoss1:ClearAllPoints()
TukuiBoss1:Point("BOTTOM", TukuiTarget, "TOP", 150, 150)
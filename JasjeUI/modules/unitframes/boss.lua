local T, C, L, G = unpack(Tukui) 
if C.unitframes.enable ~= true then return end

    for i = 1, 4 do
	    local self = _G["TukuiBoss"..i]

		    self:SetBackdrop(nil)
	        self:SetBackdropColor(0, 0, 0)

			self.Health:Size(205, 30)
			self.Health:CreateBorder(true)
			self.Health:SetStatusBarTexture(C["media"].Glamour)
			self.Health:SetStatusBarColor(.2, .2, .2, 1)
			self.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
	
		    self.shadow:Kill()
			self.Debuffs:Hide()

			self.Name:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")

		    self.Power:ClearAllPoints()
		    self.Power:Size(205, 2)
		    self.Power:Point("TOP", self.Health, "BOTTOM", 0, -7)
			self.Power:SetFrameLevel(4)
			self.Power:CreateBorder(true)

			self.Power.colorTapping = true
			self.Power.colorClass = false
			self.Power.bg.multiplier = 0.1				
			self.Power.colorPower = true
			self.Power.value:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")

		    self.Buffs:ClearAllPoints()
            self.Buffs:Point("TOPRIGHT", self, "TOPLEFT", -5, 2)

		    self.Debuffs:ClearAllPoints()
		    self.Debuffs:Point('TOPLEFT', self, 'TOPRIGHT', 5, 2)

		    if self.Buffs or self.Debuffs then
			    for _, f in pairs({self.Buffs, self.Debuffs}) do
				    if not f then return end
				    f:Size(102, 41)
				    f.size = 41
				    f.num = 3
				    hooksecurefunc(f, "PostCreateIcon", T.SkinAura)
			    end
		    end

		    self.Castbar:SetPoint("LEFT", 23, -1)
		    self.Castbar:SetPoint("RIGHT", 0, -1)
		    self.Castbar:SetPoint("BOTTOM", 0, -17)

		    self.Castbar.time:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
		    self.Castbar.time:SetTextColor(1, 1, 1)

		    self.Castbar.Text:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
		    self.Castbar.Text:SetTextColor(1, 1, 1)

		    self.Castbar.button:ClearAllPoints()
		    self.Castbar.button:Point("RIGHT", self.Castbar, "LEFT",-5, 0)

		    self.Castbar.bg:SetTemplate("Transparent")
		    self.Castbar.bg:SetBorder()
		    self.Castbar.button:SetTemplate("Hydra")

			self.Castbar.CustomTimeText = T.CustomCastTimeText
	        self.Castbar.CustomDelayText = T.CustomCastDelayText
            self.Castbar.PostCastStart = T.PostCastStart
            self.Castbar.PostChannelStart = T.PostCastStart

			self:Size(205, 41)
			self:ClearAllPoints()
			
		if( i == 1 ) then
		    self:Point("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", 250,350)
	    else
		    self:SetPoint("BOTTOM", _G["TukuiBoss"..i-1], "TOP", 0, 25)
		end	
    end
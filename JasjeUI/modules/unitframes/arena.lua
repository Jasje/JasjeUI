local T, C, L, G = unpack(Tukui) 
if C.unitframes.enable ~= true then return end

    for i = 1, 5 do
		local self = _G["TukuiArena" .. i]

		-- we dont need too see this
		    self:SetBackdrop(nil)
	        self:SetBackdropColor(0, 0, 0)
        -- health
			self.Health:Size(205, 18)
			self.Health:CreateBorder(true)
			self.Health:SetStatusBarTexture(C["media"].Glamour)
			self.Health:SetStatusBarColor(.2, .2, .2, 1)
			self.Health.value:SetFont(C.media.pixelfont, 8, "OUTLINEMONOCHROME")
		-- killing stuff		
		    self.shadow:Kill()
			self.Debuffs:Hide()
        -- name
			self.Name:SetFont(C.media.pixelfont, 8, "MONOCHROMEOUTLINE")
		-- power
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
        -- castbar
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
	    --[[trinket
		    self.Trinketbg:ClearAllPoints()
		    self.Trinketbg:Size(31)
		    self.Trinketbg:Point("TOPLEFT", self, "TOPRIGHT", 5, 2)
    		self.Trinket.trinketUseAnnounce = false			]]--
		-- Auratracker Frame
		    local AuraTracker = CreateFrame("Frame", nil, self)
		    AuraTracker:Size(31)
	        AuraTracker:Point("TOPRIGHT", self, "TOPLEFT", -5, 2)
	        AuraTracker:SetTemplate("Default")

	        AuraTracker.icon = AuraTracker:CreateTexture(nil, "OVERLAY")
	        AuraTracker.icon:SetAllPoints(AuraTracker)
		    AuraTracker.icon:Point("TOPLEFT", AuraTracker, 2, -2)
		    AuraTracker.icon:Point("BOTTOMRIGHT", AuraTracker, -2, 2)
		    AuraTracker.icon:SetTexCoord(0.07,0.93,0.07,0.93)

		    AuraTracker.text = T.SetFontString(AuraTracker,  C.media.pixelfont, 16, "OUTLINEMONOCHROME")
		    AuraTracker.text:SetPoint("CENTER", AuraTracker, 0, 0)
		    AuraTracker:SetScript("OnUpdate", updateAuraTrackerTime)
		    self.AuraTracker = AuraTracker
		-- ClassIcon			
		    local class = AuraTracker:CreateTexture(nil, "ARTWORK")
		    class:SetAllPoints(AuraTracker.icon)
		    self.ClassIcon = class

		    self:EnableElement('ClassIcon')
		    self:EnableElement('AuraTracker')
		-- size
			self:Size(205, 31)
			self:ClearAllPoints()

    	if( i == 1 ) then
		    self:Point("BOTTOMRIGHT", InvTukuiActionBarBackground, "TOPRIGHT", 250,350)
	    else
		    self:SetPoint("BOTTOM", _G["TukuiArena"..i-1], "TOP", 0, 25)
		end	
	end